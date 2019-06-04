package;

import networking.Network;
import networking.sessions.Session;
import networking.utils.NetworkEvent;
import networking.utils.NetworkMode;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.Lib;
import openfl.events.MouseEvent;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.input.keyboard.FlxKey;

class Multiplayer extends FlxSprite{
    // Ind 0 = OP
    public static inline var IP_SERVIDOR:String = "172.20.83.155"; // 172.20.83.155
    public static inline var OP_NEW_PLAYER = 'n';
    public static inline var OP_MOVE = 'm';  // [op, p id, p x, p y, p velocity x, p velocity y, p acceleration x, p acceleartion y]
    public static inline var OP_SHOOT = 't';  // [op, player id, player x, player y]
    public static inline var OP_MORREU = 'o';  // [op, player id, player x, player y]

    var _cont: Float = 0;
    var _overflowTimer:Float = 0;
    var _overflowInterval:Float = 0.5; // tempo mínimo, em segundos, entre mensagens passiveis de overflow
    var _overflowLastOp:String = "";
    var _playerID:String;
    var _client:Session;
    // 12

    public function new(){
        super();
        _playerID = "12";
        criaCliente();
    }

    private function criaCliente():Void{
        _client = Network.registerSession(NetworkMode.CLIENT, {
            ip: IP_SERVIDOR,
            port: 8888,
            flash_policy_file_url: 'http://' + IP_SERVIDOR + ':9999/crossdomain.xml'
        });

        _client.addEventListener(NetworkEvent.MESSAGE_RECEIVED, quandoMensagemRecebida);

        _client.addEventListener(NetworkEvent.INIT_SUCCESS, quandoConectouSucesso);

        _client.start();
        /*
        // Fetch the current session (first one)
        var session = Network.sessions[0];
        session.send({ x: event.localX - cube.width * 0.5, y: event.localY - cube.height * 0.5 });
        */
    }

    function quandoConectouSucesso(event: NetworkEvent):Void{
        FlxG.log.add("FEITOOO!");
    }

    function quandoMensagemRecebida(event: NetworkEvent):Void{
        //FlxG.log.add(event.data);
        onMessage(event.data);
    }

    public function sendMove(p:Player):Void{
        sendNoOverflow([
            Multiplayer.OP_MOVE,
            getMyIdMultiplayer(),
            p.x,
            p.y,
            p.velocity.x,
            p.velocity.y,
            p.acceleration.x,
            p.acceleration.y
        ]);
    }

    public function getMyIdMultiplayer():String{
        return _playerID;
    }

    public function sendNoOverflow(msg:Array<Any>):Void{
        var op = msg[0];
        
        if(op == _overflowLastOp){
            return;
        }

        _overflowLastOp = op;
        send(msg);
        //FlxG.log.add("sendNoOverflow()");
    }

    public function send(msg: Array<Any>):Void{
        //onMessage(msg);
        //var session = Network.sessions[0];
        _client.send({
            msg;    
        });
    }

    function verifySender(inID: String): Bool{
        if(inID == _playerID)
            return false;

        var p = getPlayer(inID);

        if(p == null){
            cast(FlxG.state, MultiplayerState).players.add(new Player(inID));
        }

        return true;
    }

    public function move(inID: String, inX: Float, inY: Float, inVelX: Float, inVelY: Float, inAccX: Float, inAccY: Float):Void{
        if(!verifySender(inID))
            return;

        var p = getPlayer(inID);

        if(p == null)
            return;

        p.x = inX;
        p.y = inY;
        p.velocity.x = inVelX;
        p.velocity.y = inVelY;
        p.acceleration.x = inAccX;
        p.acceleration.y = inAccY;
        
    }

    public function shoot(inID: String, inX: Float, inY: Float){
        if(!verifySender(inID))
            return;

        var state:MultiplayerState = getState();
        var p = getPlayer(inID);

        if(p == null)    
            null;

        p.x = inX;
        p.y = inY;
        state.shooting(inX, inY);
    }

    public function getState():MultiplayerState{
        var state: MultiplayerState = 
            cast(FlxG.state, MultiplayerState);

        return state;
    }

    public function getPlayer(id:String):Player{
        var state = getState();
        var p = cast(FlxG.state, MultiplayerState).getPlayerByID(id);
        return p;
    }

    public function trataMorreu(inID: String, inX: Float, inY: Float){
        if(!verifySender(inID))
            return;

        var p = getPlayer(inID);
        if(p == null)    
            return;

        p.x = inX;
        p.y = inY;
        p.kill();
    }

    public function onMessage(msg: Array<Any>):Void{
        if(msg == null || msg.length == 0){
            FlxG.log.error("ERROR: EMPTY MESSAGE");
            return;
        }
        var op: String = msg[0];
    
        var senderID: String = cast(msg[1], String);
        if(!verifySender(senderID))
            return;
        
        switch(op){
            case OP_MOVE:
                if(msg.length != 6){
                    FlxG.log.error("ERROR: MESSAGE LENGTH");                    
                }

                move(cast(msg[1], String),     // Sender ID
                     cast(msg[2], Float),   // Sender X
                     cast(msg[3], Float),   // Sender Y
                     cast(msg[4], Float),   // Sender Velocity X
                     cast(msg[5], Float),  // Sender Velocity Y
                     cast(msg[6], Float),   // Sender ACELERACAO X
                     cast(msg[7], Float)   // Sender ACELERACAO Y
                     );
            case OP_SHOOT:
                if(msg.length != 4){
                    FlxG.log.error("ERROR: MESSAGE LENGTH");                    
                }

                shoot(cast(msg[1], String),     // Sender ID
                      cast(msg[2], Float),   // Sender X
                      cast(msg[3], Float));  // Sender Y);
            case OP_MORREU:
                if(msg.length != 4){
                    FlxG.log.error("ERROR: MESSAGE LENGTH");                    
                }

                trataMorreu(cast(msg[1], String),     // Sender ID
                      cast(msg[2], Float),   // Sender X
                      cast(msg[3], Float));  // Sender Y);
            default: 
                FlxG.log.error("ERROR: INVALID OP " + op + "\n");
        }
    }

    override public function update(e:Float):Void{
        super.update(e);

        _cont += e;
        _overflowTimer += e;

        if(_overflowTimer >= _overflowInterval){
            _overflowTimer = 0;
            _overflowLastOp = "";
        }

        if(_cont >= 3){
            _cont = 0;
            /*
            send([OP_MOVE, 1, 
            FlxG.random.int(0, Std.int(FlxG.width / 2)), FlxG.random.int(0, Std.int(FlxG.height / 2)), 
            FlxG.random.float(-100, 100), FlxG.random.float(-100, 100)]);
            
            send([OP_MOVE, 2, 
            FlxG.random.int(0, Std.int(FlxG.width / 2)), FlxG.random.int(0, Std.int(FlxG.height / 2)), 
            FlxG.random.float(-100, 100), FlxG.random.float(-100, 100)]);
            
            send([OP_MOVE, 3, 
            FlxG.random.int(0, Std.int(FlxG.width / 2)), FlxG.random.int(0, Std.int(FlxG.height / 2)), 
            FlxG.random.float(-200, -100), FlxG.random.float(-200, -100)]);

            send([OP_MOVE, 4, 
            FlxG.random.int(0, Std.int(FlxG.width / 2)), FlxG.random.int(0, Std.int(FlxG.height / 2)), 
            FlxG.random.float(-200, -100), FlxG.random.float(-200, -100)]);

            send([OP_SHOOT, 3, 
            FlxG.random.int(0, Std.int(FlxG.width / 2)), FlxG.random.int(0, Std.int(FlxG.height / 2))]);

            send([OP_MORREU, 2, 100, 150]);
            send([OP_MORREU, 3, 200, 150]);
            send([OP_MORREU, 4, 150, 150]);
            */
        }
    }
}
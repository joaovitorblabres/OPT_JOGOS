package;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.input.keyboard.FlxKey;

class Player extends FlxSprite{
    static inline var speed = 35;

    public var pID: String;
    public var simulated: Bool;
    public var lastTimeActive: Float;

    var _upKey: FlxKey;
    var _downKey: FlxKey;
    var _leftKey: FlxKey;
    var _rightKey: FlxKey;
    var _fireKey: FlxKey;

    public function new(id:String, keys:Array<FlxKey> = null){
        super();
        pID = id;

        if(keys == null){
            simulated = true;
            // lastTimeActive = Date.now();
            return;
        }

        velocity.set(0,0);
        maxVelocity.set(50, 50);

        _upKey = keys[0];
        _downKey = keys[1]; 
        _leftKey = keys[2]; 
        _rightKey = keys[3];
        _fireKey = keys[4];
    }

    override public function update(e:Float):Void{
        super.update(e);

        var mandar = false;

        if(this.x <= 0 || this.x + this.width >= FlxG.width){
            this.velocity.x *= -1;
            this.acceleration.x *= -1;
        }
            
        if(this.y <= 0 || this.y + this.height >= FlxG.height){
            this.velocity.y *= -1;
            this.acceleration.y *= -1;
        }
        if(FlxG.keys.anyPressed([_upKey]) && this.y > 0){
            this.acceleration.y -= speed;
            mandar = true;
        }

        if(FlxG.keys.anyPressed([_downKey]) && this.y + this.height < FlxG.height){
            this.acceleration.y += speed;
            mandar = true;
        }

        if(FlxG.keys.anyPressed([_leftKey]) && this.x > 0){
            this.acceleration.x -= speed;
            mandar = true;
        }

        if(FlxG.keys.anyPressed([_rightKey]) && this.x + this.width < FlxG.width) {
            this.acceleration.x += speed;
            mandar = true;
        }
        var mplayer = cast(FlxG.state, MultiplayerState).mp;
        if(mandar){            
            mplayer.sendMove(this);
        }
        
        if(FlxG.keys.anyJustPressed([_fireKey])){
            cast(FlxG.state, MultiplayerState).shooting(this.x, this.y);
            mplayer.send([
                Multiplayer.OP_SHOOT,
                mplayer.getMyIdMultiplayer(),
                x,
                y
            ]);

        }
    }
}
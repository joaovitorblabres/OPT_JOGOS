package;

import flixel.*;
import flixel.group.*;
import flixel.input.keyboard.*;

class MultiplayerState extends FlxState{
    var _players:FlxGroup;
    var _multiplayer:Multiplayer;
    override public function create():Void{
        _players = new FlxGroup();

        _players.add(new Player(0, FlxKey.UP, FlxKey.DOWN, FlxKey.LEFT, FlxKey.RIGHT));
        
        _players.add(new Player(1, FlxKey.W, FlxKey.S, FlxKey.A, FlxKey.D));

        add(_multiplayer = new Multiplayer());
        
        add(_players);
        super.create();
    }

    override public function update(elapsed:Float):Void{
        super.update(elapsed);
    }

    public function getPlayerById(id:Int):Player{
        for(p in _players){
            if(cast(p, Player).id == id){
                return cast(p, Player);
            }
        }
        return null;
    }
}
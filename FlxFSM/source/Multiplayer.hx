package;

import flixel.*;

class Multiplayer extends FlxSprite{
    var _count:Float = 0;
    public function new(){
        super();
    }

    override public function update(elapsed:Float):Void{
        super.update(elapsed);
        _count += elapsed;

        if(_count >= 2){
            _count = 0;
            var p = cast(FlxG.state, MultiplayerState).getPlayerById(1);

            if(p != null){
                p.x += 10;
            }
        }
    }
}
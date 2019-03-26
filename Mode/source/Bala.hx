package;

import flixel.*;

class Bala extends FlxSprite{

    override public function update(elapsed:Float):Void{
        if(!this.isOnScreen()){
            this.kill();
        }
        super.update(elapsed);
    }
}
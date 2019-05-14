package;

import flixel.FlxState;
import flixel.FlxG;

class SteeringState extends FlxState{
    override public function create():Void{
        add(new Boid());
        super.create();
    }

    override public function update(elapsed:Float):Void{
        super.update(elapsed);
    }
}
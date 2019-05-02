package;

import flixel.*;
import flixel.group.*;
import flixel.FlxG;

class FSMState extends FlxState{
    var _boids:FlxGroup;

    override public function create():Void{
        _boids = new FlxGroup();
        _boids.add(new Boid2());
        add(_boids);
        super.create();
    }

    override public function update(elapsed:Float):Void{
        super.update(elapsed);
    }
}
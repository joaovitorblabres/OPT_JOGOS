package;

import flixel.*;
import flixel.math.*;

class SteeringState extends FlxState{

    public var _sprite:Boid3;
    public var _sprite2:Boid3;
    public var _sprite3:Boid3;
    public var _sprite4:Boid3;

    override public function create():Void{
        _sprite = new Boid3(FlxG.random.int(0, 320), FlxG.random.int(0, 320));
        _sprite2 = new Boid3(FlxG.random.int(0, 320), FlxG.random.int(0, 320));
        _sprite3 = new Boid3(FlxG.random.int(0, 320), FlxG.random.int(0, 320));
        _sprite4 = new Boid3(FlxG.random.int(0, 320), FlxG.random.int(0, 320));
        
        add(_sprite);
        add(_sprite2);
        add(_sprite3);
        add(_sprite4);
        
        super.create();
    }

    override public function update(elapsed:Float):Void{

        super.update(elapsed);
    }


}
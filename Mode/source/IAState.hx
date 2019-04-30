package;

import flixel.*;
import flixel.math.*;

class IAState extends FlxState{

    public var _sprite:Boid;
    public var _sprite2:Boid;
    public var _sprite3:Boid;
    public var _sprite4:Boid;

    override public function create():Void{
        _sprite = new Boid();
        _sprite2 = new Boid(50, 60);
        _sprite3 = new Boid(200, 80);
        _sprite4 = new Boid(100, 90);

        add(_sprite2);
        add(_sprite3);
        add(_sprite4);
        add(_sprite);
        super.create();
    }

    override public function update(elapsed:Float):Void{

        super.update(elapsed);
    }


}
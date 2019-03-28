package;

import flixel.*;
import flixel.math.*;

class MatematicaState extends FlxState{
    var _player:FlxSprite;
    var _cannon:FlxSprite;
    var _velocity:FlxVector = new FlxVector();

    override public function create():Void{
        public var tiros:Int = 0;
        _player = new FlxSprite(150, 50);
        _cannon = new FlxSprite(FlxG.width/2, FlxG.height - 20);
        _cannon.makeGraphic(50, 20, 0xffff0000);
        add(_cannon);
        add(_player);
        super.create();
        _velocity.x = 0;
        _velocity.y = 0;
    }

    override public function update(elapsed:Float):Void{
        if(FlxG.mouse.pressed){
            var b = new FlxSprite(_cannon.x, _cannon.y);
            b.makeGraphic(10, 10, 0xff00ffff);
            b.angularVelocity = 30000;
            _velocity.x = FlxG.mouse.x - _cannon.x;
            _velocity.y = FlxG.mouse.y - _cannon.y;
            _velocity.normalize();
            _velocity.scale(150);
            b.velocity.x = _velocity.x;
            b.velocity.y = _velocity.y;
            tiros++;
            add(b);
        }
        super.update(elapsed);
    }
}
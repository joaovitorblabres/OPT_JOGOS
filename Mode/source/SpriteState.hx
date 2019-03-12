package;

import flixel.*;
import flixel.group.FlxGroup;

class SpriteState extends FlxState {
    var _sprite:FlxSprite;

    override public function create():Void {
        _sprite = new FlxSprite(0, 0);
        _sprite.velocity.x = 10;
        _sprite.acceleration.x = 30;
        _sprite.maxVelocity.x = 50;
        _sprite.health = 10;
        //_sprite.hurt(11);
        //_sprite.kill();
        _sprite.scale.x = 1.5;
        _sprite.scale.y = 0.5;
        _sprite.angularVelocity = 600;
        _sprite.angularAcceleration = 600000;
        _sprite.antialiasing = true;
        add(_sprite);
        super.create();
    }
}
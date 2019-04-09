package;

import flixel.*;
import flixel.FlxG;

class ArteState extends FlxState{
    var _sprite:FlxSprite;

    override public function create():Void{
        _sprite = new FlxSprite();
        _sprite.loadGraphic(AssetPaths.carinha__png, true, 16, 18);
        _sprite.setFacingFlip(FlxObject.LEFT, true, false);
        _sprite.setFacingFlip(FlxObject.RIGHT, false, false);

        _sprite.animation.add("walkR", [9, 10, 11, 10], 8);
        _sprite.animation.add("walkU", [3, 4, 5, 4], 8);
        _sprite.animation.add("walkD", [0, 1, 2, 1], 8);
        _sprite.facing = FlxObject.RIGHT;
        add(_sprite);
        super.create();
    }

    override public function update(elapsed:Float):Void{
        if(FlxG.keys.pressed.RIGHT){
            _sprite.facing = FlxObject.RIGHT;
            _sprite.x += 1;
            _sprite.animation.play("walkR");
        }
        if(FlxG.keys.pressed.LEFT){
            _sprite.facing = FlxObject.LEFT;
            _sprite.animation.play("walkR");
            _sprite.x -= 1;
        }
        if(FlxG.keys.pressed.UP){
            _sprite.y -= 1;
            _sprite.animation.play("walkU");
        }
        if(FlxG.keys.pressed.DOWN){
            _sprite.y += 1;
            _sprite.animation.play("walkD");
        }
        if(FlxG.keys.anyJustReleased([LEFT, UP, RIGHT, DOWN])){
            _sprite.animation.stop();
        }
        super.update(elapsed);
    }
}
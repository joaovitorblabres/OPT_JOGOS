package;

import flixel.*;
import flixel.util.*;
import flixel.text.*;
import flixel.math.*;
import flixel.FlxG;

class CaminhoState extends FlxState{
    var _sprite:FlxSprite;
    var _patrol:Array<FlxPoint> = [];
    var counter:Int = 0;
    override public function create():Void{
        _sprite = new FlxSprite();
        /*_patrol = [
            new FlxPoint(10, 10),
            new FlxPoint(10, 230),
            new FlxPoint(310, 230),
            new FlxPoint(310, 10)
        ];
        _xis = [
            new FlxPoint(10, 10),
            new FlxPoint(310, 230),
            new FlxPoint(310, 10),
            new FlxPoint(10, 230)
        ];*/
        //_sprite.path = new FlxPath().start(_patrol, 200, FlxPath.LOOP_FORWARD);
        add(_sprite);
        super.create();
    }

    override public function update(elapsed:Float):Void{
        /*if(FlxG.keys.justPressed.A){
            _sprite.path = new FlxPath().start(_xis, 200, FlxPath.LOOP_FORWARD);
        }
        if(FlxG.keys.justPressed.P){
            _sprite.path = new FlxPath().start(_patrol, 200, FlxPath.LOOP_FORWARD);
        }*/
        if(FlxG.mouse.justPressed){
            if(_patrol.length < 10){
                var _flxS:FlxSprite;
                _flxS = new FlxSprite();
                var _pt:FlxPoint = new FlxPoint(FlxG.mouse.x, FlxG.mouse.y);
                _flxS.makeGraphic(2, 2, 0xffff0000);
                _flxS.setPosition(_pt.x, _pt.y);
                _patrol.push(_pt);
                var length:FlxText;
                length = new FlxText(_pt.x, _pt.y + 2, 0, " " + _patrol.length);
                add(length);
                add(_flxS);
                if(_patrol.length == 10)
                    _sprite.path = new FlxPath().start(_patrol, 200, FlxPath.LOOP_FORWARD);
            }
        }
        super.update(elapsed);
    }

}
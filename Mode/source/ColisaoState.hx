package;

import flixel.*;
import flixel.FlxG;

class ColisaoState extends FlxState
{
    var _jogador:FlxSprite;
    var _tiro:FlxSprite;
    
    override public function create():Void
    {
        _jogador = new FlxSprite(50, 50);
        _tiro = new FlxSprite(100, 70);
        _jogador.angularVelocity = 45;
        _tiro.mass = 10000;
        _tiro.drag.x = 10000;
        add(_jogador);
        add(_tiro);
        super.create();
    }

    function onOverlap(a:FlxSprite, b:FlxSprite):Void{
        b.kill();
        a.angularVelocity = 100;
    }

    override public function update(elapsed:Float):Void
    {
        if(FlxG.keys.pressed.RIGHT) _jogador.x += 1;
        if(FlxG.keys.pressed.LEFT) _jogador.x -= 1;
        if(FlxG.keys.pressed.UP) _jogador.y -= 1;
        if(FlxG.keys.pressed.DOWN) _jogador.y += 1;

        //FlxG.overlap(_jogador, _tiro, onOverlap);
        FlxG.collide(_jogador, _tiro);
        /*var overlapping = FlxG.pixelPerfectOverlap(_jogador, _tiro);
        if(overlapping){
            onOverlap(_jogador, _tiro);
        }*/
        super.update(elapsed);
    }
}
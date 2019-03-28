package;

import flixel.*;
import flixel.group.FlxGroup;
import flixel.text.*;

class HUD extends FlxGroup{
    var _score:FlxText;
    var _municao:FlxText;
    var _contador:FlxText;
    public function new(){
        super();
        _score = new FlxText(5, 5, 0, "Tiros: 000");
        _municao = new FlxText(50, 5, 0, "Municao: 000");
        _contador = new FlxText(110, 5, 0, "Recarga em: 10.0");
        add(_score);
        add(_contador);
        add(_municao);
    }
    override public function update(elapsed:Float):Void{
        var s:MatematicaState = cast FlxG.state;
        _score.text = "Tiros: " + s.tiros;
        _municao.text = "Municao: " + s.municao;
        _contador.text = "Recarga em: " + s.contador;
    }
}
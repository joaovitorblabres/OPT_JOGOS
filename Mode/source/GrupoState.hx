package;

import flixel.math.FlxRandom;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.group.FlxGroup;

class GrupoState extends FlxState {
    //var _logos:FlxGroup;
    var _amarelos:FlxGroup; // 30 sprites amarelos
    var _azuis:FlxGroup; // 10 sprites azuis
    var _verdes:FlxGroup; // 15 sprites verdes
    var _txt:FlxText;
    var _rd:FlxRandom;
    override public function create():Void {
        _amarelos = new FlxGroup();
        _azuis = new FlxGroup();
        _verdes = new FlxGroup();
        _rd = new FlxRandom();
        var i;
        
        for(i in 0...55) {
            if(i < 30){
                var s:FlxSprite = new FlxSprite();
                s.makeGraphic(8, 8, 0xffffff00);
                s.x = i * 9;
                s.y = FlxG.height - s.height-60;
                s.angularVelocity = 50;
                _amarelos.add(s);
                //FlxG.log.add("amarelo: ");
                //FlxG.log.add(i);
            }else if(i >= 30 && i < 40){
                var s:FlxSprite = new FlxSprite();
                s.makeGraphic(8, 8, 0xff00ffff);
                s.x = i%30 * 9;
                s.y = FlxG.height - s.height*5-62;
                s.angularVelocity = -50;
                _azuis.add(s);
                //FlxG.log.add("azul: ");
                //FlxG.log.add(i%30);
            }else{
                var s:FlxSprite = new FlxSprite();
                s.makeGraphic(8, 8, 0xff00ff00);
                s.x = i%40 * 9;
                s.y = FlxG.height - s.height*3-61;
                s.angularVelocity = _rd.int(50, 100);
                _verdes.add(s);
                //FlxG.log.add("verde: ");
                //FlxG.log.add(i%40);
            }
        }
        add(_amarelos);
        add(_azuis);
        add(_verdes);
        super.create();
    }
}
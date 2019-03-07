import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;

class TesteState extends FlxState {
    var _sol:FlxSprite;
    var _sol2:FlxSprite;
    var _chao:FlxSprite;
    var _txt:FlxText;
    var _cloud:FlxSprite;
    var _arvoreTronco:FlxSprite;
    var _arvoreCopa:FlxSprite;

    override public function create():Void {
        _sol = new FlxSprite();
        add(_sol);
        _sol.makeGraphic(30, 30, 0xfff4ee41);
        _sol2 = new FlxSprite();
        add(_sol2);
        _sol2.makeGraphic(30, 30, 0xfff4ee41);
        _sol2.angle = 30;

        _chao = new FlxSprite();
        add(_chao);
        _chao.makeGraphic(320,20, 0xff45f442);
        _chao.y = 220;

        _txt = new FlxText();
        add(_txt);
        _txt.makeGraphic(100, 100, 0xff000000);
        _txt.y = 100;
        _txt.x = 100;
        _txt.angle = 60;
        _txt.text = "Joguinhos legais";

        _cloud = new FlxSprite();
        add(_cloud);
        _cloud.makeGraphic(80, 20, 0xffffffff);
        _cloud.y = 20;
        _cloud.x = 80;

        _arvoreTronco = new FlxSprite();
        add(_arvoreTronco);
        _arvoreTronco.makeGraphic(10, 80, 0xff602d0d);
        _arvoreTronco.y = 145;
        _arvoreTronco.x = 240;


        _arvoreCopa = new FlxSprite();
        add(_arvoreCopa);
        _arvoreCopa.makeGraphic(50, 40, 0xff1d600c);
        _arvoreCopa.y = 110;
        _arvoreCopa.x = 220;

        FlxG.cameras.bgColor = 0xff41f4ee;
        super.create();
    }
    override public function update(elapsed:Float):Void{
        _txt.angle += 5;
        _sol.angle += 800;
        _sol2.angle += 800;
    }
}
package;

import flixel.*;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class CreditsState extends FlxState{

    var _prog:FlxText;
    var _credito:FlxText;
    var _agradecimentos:FlxText;
    var _arte:FlxText;
    var _btnVoltar:FlxButton;
    var _sprite:FlxSprite;
    var _flixel:FlxText;

    override public function create():Void{
        _credito = new FlxText(0, 0, 0, "Créditos\n\n", 20);
        _credito.x = (FlxG.width/2)-(_credito.width / 2);
        _credito.y = FlxG.height;
        _credito.moves = true;
        _credito.velocity.y = -20;
        _credito.angularVelocity = 100;
        _credito.alignment = CENTER;

        _prog = new FlxText(0, 0, 0, "[PROGRAMAÇÃO]\nJoão Vitor Bruniera Labres\nFernando Bevilacqua\n\n", 10);
        _prog.x = (FlxG.width/2)-(_prog.width / 2);
        _prog.y = _credito.y + _credito.height + 10;
        _prog.moves = true;
        _prog.velocity.y = -20;
        _prog.alignment = CENTER;
        _prog.color = 0xffff0000;

        _arte = new FlxText(0, 0, 0, "[ARTE]\nJoão Vitor Bruniera Labres\nO Cara que fez o jogo\n\n", 10);
        _arte.x = (FlxG.width/2)-(_arte.width / 2);
        _arte.y = _prog.y + _prog.height + 10;
        _arte.moves = true;
        _arte.velocity.y = -20;
        _arte.alignment = CENTER;
        _arte.color = 0xffffff00;

        _agradecimentos = new FlxText(0, 0, 0, "[AGRADECIMENTOS]\nUniversidade Federal da Fronteira Sul\nCampus Chapecó\nFernando Belivacqua\nGabriel Vassoler\nGabriel Moro\nGabril Chittolina\nMeu pai\nMinha mãe\nMeus vizinhos\nQualquer pessoa\nVocê ainda está lendo isso?\nMeus avós\n\n", 10);
        _agradecimentos.x = (FlxG.width/2)-(_agradecimentos.width / 2);
        _agradecimentos.y = _arte.y + _arte.height + 10;
        _agradecimentos.moves = true;
        _agradecimentos.velocity.y = -20;
        _agradecimentos.alignment = CENTER;
        _agradecimentos.color = 0xff0000ff;

        _sprite = new FlxSprite(0, 0);
        _sprite.x = (FlxG.width/2)-(_sprite.width / 2);
        _sprite.y = _agradecimentos.y + _agradecimentos.height + 10;
        _sprite.velocity.y = -20;

        _flixel = new FlxText(0, 0, 0, "Powered by HaxeFlixel", 10);
        _flixel.x = (FlxG.width/2)-(_flixel.width / 2);
        _flixel.y = _sprite.y + _sprite.height + 10;
        _flixel.moves = true;
        _flixel.velocity.y = -20;
        _flixel.alignment = CENTER;

        _btnVoltar = new FlxButton(0, 0, "Voltar", goBack);
        _btnVoltar.x = (FlxG.width)-(_btnVoltar.width)-5;
        _btnVoltar.y = FlxG.height - _btnVoltar.height - 10;

        add(_prog);
        add(_credito);
        add(_arte);
        add(_agradecimentos);
        add(_sprite);
        add(_flixel);
        add(_btnVoltar);
    }

    function goBack():Void{
        FlxG.switchState(new MeuMenuState());
    }

    override public function update(elapsed:Float):Void{
        _credito.color = FlxG.random.color();
        FlxG.cameras.bgColor = FlxG.random.color();

        super.update(elapsed);
    }
}
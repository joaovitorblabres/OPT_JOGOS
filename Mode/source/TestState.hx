package;

import flixel.*;
import flixel.FlxG;

class TestState extends FlxState{
    var _correio:Correio; // fica preso em Curitiba
    var _personagem:Personagem;
    var _inimigo:Inimigo;

    override public function create():Void{
        _correio = new Correio();
        _personagem = new Personagem();
        _inimigo = new Inimigo(50, 50);
        
        _personagem.makeGraphic(10, 10, 0xff00ff00);
        _personagem.x = 10;
        _personagem.y = 10;
        _inimigo.makeGraphic(10, 10, 0xffff0000);

        add(_personagem);
        add(_inimigo);
        add(_correio);

        super.create();
    }

    override public function update(elapsed:Float):Void{
        if(FlxG.keys.justPressed.SPACE){
            var m:Mensagem = new Mensagem();
            m.from = _inimigo;
            m.to = _personagem;
            m.op = Mensagem.OP_DANO;
            m.data = 3.14; // = pi = 3 = e
            _correio.send(m);
        }
        if(FlxG.keys.justPressed.H){
            var m:Mensagem = new Mensagem();
            m.from = _inimigo;
            m.to = _personagem;
            m.op = Mensagem.OP_CURA;
            m.data = 1.57; // = pi = 3 = e
            _correio.send(m);
        }
        super.update(elapsed);
    }
}
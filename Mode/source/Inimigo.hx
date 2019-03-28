package;

import flixel.*;

class Inimigo extends Entidade{
    override function onMessage(m:Mensagem):Void{
        FlxG.log.add("Inimigo msg. Op = " + m.op);
    }
}
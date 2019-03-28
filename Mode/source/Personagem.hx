package;

import flixel.*;

class Personagem extends Entidade{
    public function new(){
        super();
        health = 10;
    }

    override function onMessage(m:Mensagem):Void{
        FlxG.log.add("Personagem msg. Op = " + m.op);
        if (m.op == Mensagem.OP_DANO){
            hurt(m.data);
            FlxG.log.add("HP = " + this.health);
        }
        if (m.op == Mensagem.OP_CURA){
            if(this.health + m.data <= 10.1){
                hurt(-m.data);
                FlxG.log.add("HP = " + this.health);
            }
        }
    }
}
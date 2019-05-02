package;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.math.*;

class Boid2 extends FlxSprite{
    var _contador:Float;
    var _pilhaIA:Array<String>;

    public function new(){
        super();
        _contador = 0;
        this.x = FlxG.width/2;
        this.y = FlxG.height/2;
        _pilhaIA = ["fuga"];
    }

    override public function update(elapsed:Float):Void{
        var estado = getEstadoAtual();

        if(estado == "vagando"){
            vagar(elapsed);
        } else if(estado == "fuga"){
            fugir();
        } else if(estado == "corre"){
            correr();
        }

        if(this.x < 0 || this.x + this.width >= FlxG.width){
            this.velocity.x *= -1;
        }

        if(this.y < 0 || this.y + this.height >= FlxG.height){
            this.velocity.y *= -1;
        }
        super.update(elapsed);
    }

    function trocaDirecao():Void{
        this.velocity.x = FlxG.random.int(-50, 50);
        this.velocity.y = FlxG.random.int(-50, 50);
    }

    function getEstadoAtual():String{
        if(_pilhaIA.length <= 0){
            return "vagando";
        }

        return _pilhaIA[_pilhaIA.length - 1];
    }

    function empilhaEstado(e:String):Void{
        if(getEstadoAtual() != e){
            _pilhaIA.push(e);
        }
    }

    function vagar(elapsed:Float):Void{
        if (FlxMath.distanceToMouse(this) < 50){
            empilhaEstado("fuga");
            return;
        }
        
        _contador += elapsed;
        if(_contador >= 5){
           _contador = 0;
           trocaDirecao();
        }
    }

    function fugir():Void{
        var v:FlxVector = new FlxVector();
        v.x = this.x - FlxG.mouse.x;
        v.y = this.y - FlxG.mouse.y;
        v.normalize().scale(100);
        this.velocity.x = v.x;
        this.velocity.y = v.y;

        if(FlxMath.distanceToMouse(this) >= 100){
            _pilhaIA.pop();
            _contador = 0;
        } else if(FlxMath.distanceToMouse(this) <= 10){
            empilhaEstado("corre");
        }
    }

    function correr():Void{
        var v:FlxVector = new FlxVector();
        v.x = this.x - FlxG.mouse.x;
        v.y = this.y - FlxG.mouse.y;
        v.normalize().scale(500);
        this.velocity.x = v.x;
        this.velocity.y = v.y;

        if(FlxMath.distanceToMouse(this) >= 50){
            _pilhaIA.pop();
        }
    }
}
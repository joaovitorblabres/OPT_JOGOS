package;

import flixel.*;
import flixel.text.FlxText;
import flixel.FlxG;

class UpdateState extends FlxState{
    var _sprite:FlxSprite;
    var _bullet:FlxSprite;
    var _hud:HUD;

    override public function create():Void{
        _sprite = new FlxSprite();
        _bullet = new FlxSprite();
        _bullet.makeGraphic(5, 5, 0xffff0000);
        _bullet.kill();
        _hud = new HUD();

        
        add(_sprite);
        add(_bullet);
        add(_hud);
        super.create();
    }

    override public function update(elapsed:Float):Void{
        /*_sprite.x += FlxG.random.int(-5,5);
        _sprite.y += FlxG.random.int(-5,5);*/
        //SAIDA PELA DIREITA
        if(_sprite.x >= FlxG.width){
            _sprite.x = -_sprite.width;
        }
        //SAIDA POR BAIXO
        if(_sprite.y >= FlxG.height){
            _sprite.y = -_sprite.height;
        }
        //SAIDA POR CIMA
        if(_sprite.y < 0-_sprite.height){
            _sprite.y = FlxG.height;
        }
        //SAIDA PELA ESQUERDA
        if(_sprite.x < 0-_sprite.width){
            _sprite.x = FlxG.width;
        }

        if(FlxG.keys.pressed.UP){
            _sprite.y -= 5;
        }
        if(FlxG.keys.pressed.DOWN){
            _sprite.y += 5;
        }
        if(FlxG.keys.pressed.LEFT){
            _sprite.x -= 5;
        }
        if(FlxG.keys.pressed.RIGHT){
            _sprite.x += 5;
        }

        if(FlxG.keys.justPressed.SPACE){
            _bullet.reset(_sprite.x, _sprite.y);
        }

        if(_bullet.alive){
            _bullet.y -= 10;
            if(_bullet.isOnScreen() == false){
                _bullet.kill();
            }
        }
        super.update(elapsed);
    }
}
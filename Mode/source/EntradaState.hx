package;

import flixel.*;
import flixel.group.FlxGroup;

class EntradaState extends FlxState{
    var _balas:FlxTypedGroup<Bala>;
    var _retUP:FlxSprite;
    var _retDOWN:FlxSprite;

    override public function create():Void{
        _balas = new FlxTypedGroup<Bala>();
        _retUP = new FlxSprite();
        _retDOWN = new FlxSprite();

        _retUP.makeGraphic(50, 10, 0xffff0000);
        _retDOWN.makeGraphic(50, 10, 0xff00ff00);

        _retUP.x = (FlxG.width/2)-(_retUP.width / 2);
        _retUP.y = 0;

        _retDOWN.x = (FlxG.width/2)-(_retDOWN.width / 2);
        _retDOWN.y = FlxG.height - _retDOWN.height;

        add(_retDOWN);
        add(_retUP);
        add(_balas);
        for(i in 0...200){
            var s = new Bala();
            s.makeGraphic(5, 5, 0xffffffff);
            s.kill();
            _balas.add(s);
        }
       
        super.create();
    }
    
    override public function update(elapsed:Float):Void{
        super.update(elapsed);
        if(FlxG.keys.pressed.A && _retUP.x > 0){
            _retUP.x -= 5;
        }
        if(FlxG.keys.pressed.D && _retUP.x+_retUP.width < FlxG.width){
            _retUP.x += 5;
        }
        
        if(FlxG.keys.pressed.LEFT && _retDOWN.x > 0){
            _retDOWN.x -= 5;
        }
        if(FlxG.keys.pressed.RIGHT && _retDOWN.x+_retDOWN.width < FlxG.width){
            _retDOWN.x += 5;
        }

        if(FlxG.keys.justPressed.ENTER){
            var s = _balas.getFirstAvailable();
            if(s != null){
                s.reset(_retDOWN.x + _retDOWN.width/2, _retDOWN.y-s.height);
                s.velocity.y = -100;
            }
        }

        if(FlxG.keys.justPressed.SPACE){
            var s = _balas.getFirstAvailable();
            if(s != null){
                s.reset(_retUP.x + _retUP.width/2, _retUP.y+s.height);
                s.velocity.y = 100;
            }
        }
        /*if(FlxG.mouse.justPressed){
            var s = _balas.getFirstAvailable();
            if(s != null){
                s.reset(FlxG.mouse.x, FlxG.mouse.y);
            }else{
                FlxG.log.add("C TA SIN CURASAUM");
            }
//            FlxG.log.add(FlxG.mouse.x + " " + FlxG.mouse.y);
        }*/
    }
}
package;

import flixel.*;
import flixel.math.*;
import flixel.group.FlxGroup;

class MatematicaState extends FlxState{
    var _player:FlxSprite;
    var _cannon:FlxSprite;
    var _velocity:FlxVector = new FlxVector();
    var _balas:FlxTypedGroup<Bala>;
    var _hud:HUD;
    public var contador:Float = 10;
    public var tiros:Int = 0;
    public var municao:Int = 10;
    override public function create():Void{
        _balas = new FlxTypedGroup<Bala>();
        //_player = new FlxSprite(150, 50);
        _cannon = new FlxSprite(FlxG.width/2, FlxG.height - 20);
        _hud = new HUD();
        _cannon.makeGraphic(50, 20, 0xffff0000);

        add(_cannon);
        //add(_player);
        add(_balas);
        add(_hud);

        for(i in 0...10){
            var s = new Bala();
            s.makeGraphic(10, 10, 0xffff0000);
            s.kill();
            _balas.add(s);
        }
        
        super.create();
        _velocity.x = 0;
        _velocity.y = 0;
    }

    override public function update(elapsed:Float):Void{
        if(FlxG.mouse.justPressed && municao > 0){
            var b = _balas.getFirstAvailable();
            //b.makeGraphic(10, 10, 0xff00ffff);
            if(b != null){
                b.reset(_cannon.x + _cannon.width/2, _cannon.y);
                _velocity.x = FlxG.mouse.x - _cannon.x;
                _velocity.y = FlxG.mouse.y - _cannon.y;
                _velocity.normalize();
                _velocity.scale(300);
                b.velocity.x = _velocity.x;
                b.velocity.y = _velocity.y;
                tiros++;
                municao--;
            }
        }
        if(municao == 0){
            contador -= elapsed;
        }

        if(contador <= 0){
            municao = 10;
            contador = 10;
        }
        super.update(elapsed);
    }
}
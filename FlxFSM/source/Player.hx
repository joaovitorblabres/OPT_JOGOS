package;

import flixel.*;
import flixel.FlxG;
import flixel.input.keyboard.*;

class Player extends FlxSprite{
    var _vel:Int = 5;
    var _ku:FlxKey;
    var _kd:FlxKey;
    var _kl:FlxKey;
    var _kr:FlxKey;
    public var id:Int;

    public function new(id:Int, ku:FlxKey, kd:FlxKey, kl:FlxKey, kr:FlxKey){
        this.id = id;
        this._ku = ku;
        this._kd = kd;
        this._kl = kl;
        this._kr = kr;

        super();
    }

    override public function update(elapsed:Float):Void{
        super.update(elapsed);

        if(FlxG.keys.anyPressed([_ku])) this.y -= _vel;
        if(FlxG.keys.anyPressed([_kd])) this.y += _vel;
        if(FlxG.keys.anyPressed([_kl])) this.x -= _vel;
        if(FlxG.keys.anyPressed([_kr])) this.x += _vel;
    }
}
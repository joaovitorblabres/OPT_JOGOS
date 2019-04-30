package;

import flixel.*;
import flixel.math.*;
import flixel.util.*;

class Boid extends FlxSprite{
    public static inline var VAGANDO:Int = 1;
    public static inline var CORRER:Int = 2;
    public static inline var PARADO:Int = 3;

    public var state:Int;
    var _patrol:Array<FlxPoint> = [];
    var _counter:Float = 5;
    var _patrulha:FlxPath;
    var _origem:FlxPath;

    public function new(X:Int = 40, Y:Int = 40){
        super();
        this.loadGraphic(AssetPaths.carinha__png, true, 16, 18);
        this.setFacingFlip(FlxObject.LEFT, true, false);
        this.setFacingFlip(FlxObject.RIGHT, false, false);
        this.setPosition(X, Y);
        this.animation.add("walk", [9, 10, 11, 10], 8);
        this.animation.add("stop", [0], 8);
        _patrol = [
            new FlxPoint(40, 40),
            new FlxPoint(40, 230),
            new FlxPoint(310, 230),
            new FlxPoint(310, 40)
        ];
        this.state = VAGANDO;
        _patrulha = new FlxPath().start(_patrol, 100, FlxPath.LOOP_FORWARD);
        _origem = new FlxPath().start([new FlxPoint(0,0)], 200, FlxPath.LOOP_BACKWARD);
    }

    override public function update(elapsed:Float):Void{
        if (this.state == VAGANDO){
            this.andar();
        } else if(this.state == CORRER){
            this.correr();
        } else if(this.state == PARADO){
            this.parar();
            this._counter -= elapsed;
        }

        if(FlxMath.distanceToMouse(this) < 10){
            this.state = CORRER;
        }
        if(FlxMath.distanceToPoint(this, new FlxPoint(0,0)) <= 10){
            this.state = PARADO;
        }
        if(this._counter <= 0){
            //this.setPosition(20,20);
            this.state = VAGANDO;
            this._counter = 5;
        }
        super.update(elapsed);
    }

    function andar(){
        this.path = _patrulha;
        this.animation.play("walk");
    }

    function correr(){
        this.path = _origem;
        this.animation.play("walk");
    }

    function parar(){
        this.animation.play("stop");
    }
}
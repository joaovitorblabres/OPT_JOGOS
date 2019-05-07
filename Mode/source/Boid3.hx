package;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.math.*;

class Boid3 extends FlxSprite{
    public static var MAX_AC:Int = 100;
    public function new(X:Int = 10, Y:Int = 10){
        super();
        this.x = X;
        this.y = Y;
        this.maxVelocity = new FlxPoint(200,200);
    }

    override public function update(elapsed:Float):Void{
        var seek:FlxVector = this.seek();
        seek = new FlxPoint(seek.x - this.acceleration.x, seek.y - this.acceleration.y);
        this.acceleration.x += seek.x;
        this.acceleration.y += seek.y;

        if(this.x < 0 || this.x + this.width > FlxG.width)
            this.velocity.x *= -1;
        if(this.y < 0 || this.y + this.height > FlxG.height)
            this.velocity.y *= -1;

        super.update(elapsed);
    }

    function seek():FlxVector{
        var dv:FlxVector = new FlxVector(FlxG.mouse.x - this.x, FlxG.mouse.y - this.y);
        dv.normalize();
        dv.scale(MAX_AC);
        return (dv);
    }


}
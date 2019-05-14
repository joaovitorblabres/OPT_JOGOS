package;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.math.*;

class Boid extends FlxSprite{
    public function new(){
        super(FlxG.width/2, FlxG.height/2);
        velocity.x = 10;
        velocity.y = 10;
    }

    override public function update(elapsed:Float):Void{

        if(this.x < 0 || this.x + this.width > FlxG.width){
            this.velocity.x *= -1;
            this.acceleration.x *= -1;
        }
        if(this.y < 0 || this.y + this.height > FlxG.height){
            this.velocity.y *= -1;
            this.acceleration.y *= -1;
        }
        super.update(elapsed);
        
        var steering = new FlxVector();
        //var seek = seek();
        //steering.addPoint(flee(FlxG.mouse.x, FlxG.mouse.y));
        //steering.addPoint(seek(FlxG.width, FlxG.height));
        
        steering.addPoint(arrive(FlxG.mouse.x, FlxG.mouse.x, 50));
        steering.addPoint(seek(FlxG.mouse.x, FlxG.mouse.y));
        acceleration.set(steering.x, steering.y);
    }

    public function flee(x:Int, y:Int):FlxVector{
        return seek(x, y).scale(-1);
    }

    public function arrive(x:Int, y:Int, raio:Float):FlxVector{
        //Da família Rhaio: Sir. Kah Rhaio
        var target = new FlxVector(x, y);
        var direto = target.subtractPoint(new FlxVector(this.x, this.y));
        if(direto.length <= raio){
            //FlxG.log.add("Da família Rhaio: Sir. Kah Rhaio");
            return new FlxVector(velocity.x, velocity.y).normalize().scale(-10);
        } else {
            return new FlxVector();
        }
    }
    
    public function seek(x:Int, y:Int):FlxVector{
        var target = new FlxVector(x, y);
        var seek = target.subtractPoint(new FlxVector(this.x, this.y));
        seek.normalize().scale(10);
        return seek;
    }
}
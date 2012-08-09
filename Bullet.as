package {
	import org.flixel.*; //Allows you to refer to flixel objects in your code
	public class Bullet extends FlxSprite
	{
        public var touchCount:int = 0;

        public function Bullet(X:Number=0, Y:Number=0):void
        {
        	super(X, Y);
            makeGraphic(5,3);
            elasticity = 0.2;
            acceleration.y = 550;
        }
        override public function revive():void
        {
            touchCount = 0;
            super.revive();
        }
        override public function update():void
        {
            // kill self on the second bounce
            if(justTouched(ANY)){
                touchCount++;
            }
            if(touchCount>2){
                kill();
            }
        }
	}
}
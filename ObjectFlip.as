package {
	import org.flixel.*; //Allows you to refer to flixel objects in your code
	public class ObjectFlip extends FlxSprite implements LevelObject
	{
		private var flipCoolDown:Number = 30;
		private var flipCoolCounter:Number = 30;
		private var canFlip:Boolean = true;
        public function ObjectFlip(X:Number=0, Y:Number=0):void
        {
        	super(X, Y);
            makeGraphic(16,16, 0xffff00ff);
        }
 		public function processGun(gun:Gun, playstate:PlayState):void
		{
			if(canFlip){
				// should put in a test to make sure that this object is disabled until it stops touching the gun
				gun.setFlip();				
			}
			canFlip = false;
			flipCoolCounter = flipCoolDown;
		}
		public function processBullet(bullet:Bullet, playstate:PlayState):void
		{
		}
		override public function update():void
		{
			flipCoolCounter--;
			if(flipCoolCounter<=0){
				canFlip = true;
			}
		}
	}
}
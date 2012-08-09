package {
	import org.flixel.*; //Allows you to refer to flixel objects in your code
	public class ObjectSpike extends FlxTileblock implements LevelObject
	{
        public function ObjectSpike(X:Number=0, Y:Number=0, Width:Number=16, Height:Number=16):void
        {
        	super(X, Y, Width, Height);
        }
 		public function processBullet(bullet:Bullet, playstate:PlayState):void
		{
			playstate.remove(this);
			playstate._items.remove(this);
			playstate.remove(bullet);
			playstate._bullets.remove(bullet);
		}
 		public function processGun(gun:Gun, playstate:PlayState):void
		{
			// the spike just kills the gun
			playstate.endGame()
		}
	}
}
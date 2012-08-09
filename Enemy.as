package {
	import org.flixel.*; //Allows you to refer to flixel objects in your code
	public class Enemy extends FlxSprite implements LevelObject
	{
        public function Enemy(X:Number=0, Y:Number=0):void
        {
        	super(X, Y);
        }
        public function processBullet(bullet:Bullet, playstate:PlayState):void
		{
			playstate.remove(this);
			playstate._items.remove(this);
			playstate.remove(bullet);
			playstate._bullets.remove(bullet);
		}
		// a function that callsback when the object is touched by the gun
		public function processGun(gun:Gun, playstate:PlayState):void
		{
			playstate.endGame()
		}
	}
}
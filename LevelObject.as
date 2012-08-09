package {
	import org.flixel.*; //Allows you to refer to flixel objects in your code
	public interface LevelObject
	{
        // a function that callsback when the object is touched by the gun
		function processGun(gun:Gun, playstate:PlayState):void;
        // a function that callsback when the object is touched by a bullet
		function processBullet(bullet:Bullet, playstate:PlayState):void;
	}
}
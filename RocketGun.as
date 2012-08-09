package {
	import org.flixel.*; //Allows you to refer to flixel objects in your code
	[SWF(width="640", height="480", backgroundColor="#FFFFFF")] //Set the size and color of the Flash file
	[Frame(factoryClass="Preloader")]

	public class RocketGun extends FlxGame
	{
		public function RocketGun()
		{	
			super(640,480,MenuState,1); //Create a new FlxGame object at 320x240 with 2x pixels, then load PlayState
		}
	}
}
package
{
	import org.flixel.*;
	import org.flixel.system.*;
	import org.flixel.plugin.photonstorm.*;
	import org.flixel.plugin.photonstorm.FX.SineWaveFX;
	import flash.geom.Rectangle;

	public class WinState extends FlxGroup
	{
		[Embed(source = 'data/levels/win_screen.oel', mimeType = 'application/octet-stream')]
            private var overlaylevel:Class;
		
		[Embed(source = 'data/geebeeyay_8x16.png')] private var BubbleFont:Class;


		private var map:FlxTilemap;
		private var map2:FlxTilemap;
		private var font:FlxBitmapFont;
		
		private var scroller:FlxSprite;
		private var sinewaveV:SineWaveFX;
		private var sinewaveH:SineWaveFX;
		private var output:FlxSprite;

		public function WinState()
		{
			if (FlxG.getPlugin(FlxScrollingText) == null)
			{
				FlxG.addPlugin(new FlxScrollingText);
			}
			if (FlxG.getPlugin(FlxSpecialFX) == null)
			{
				FlxG.addPlugin(new FlxSpecialFX);
			}
			
			var level:OgmoLevel = new OgmoLevel(new overlaylevel());
			map = level.loadTilemap("stage", PlayState.ImgTiles);
			add(map);
			map2 = level.loadTilemap("stage2", PlayState.ImgTiles);
			add(map2);

			font = new FlxBitmapFont(BubbleFont, 8, 16, FlxBitmapFont.TEXT_SET2, 77);
			//font.setText("you lose", false, 0, 8, FlxBitmapFont.ALIGN_CENTER);
			//FlxDisplay.screenCenter(font);
			scroller = FlxScrollingText.add(font, new Rectangle(0, 200, (640+16)*0.75, 64), 4, 0, "YOU LOSE!   ANY BUTTON TO RESTART."); 			
			sinewaveV = FlxSpecialFX.sineWave();
			sinewaveH = FlxSpecialFX.sineWave();
			//	Finally the first sine wave is created from the constantly updating scroller FlxSprite
			output = sinewaveV.createFromFlxSprite(scroller, SineWaveFX.WAVETYPE_VERTICAL_SINE, 8, scroller.width, 2, 1, true);
			
			//	And then fed back into itself for a horizontal distortion!
			output = sinewaveH.createFromFlxSprite(output, SineWaveFX.WAVETYPE_HORIZONTAL_SINE, 8, scroller.height, 2, 1, true);
			output.scale = new FlxPoint(2, 2);
			sinewaveV.start();
			sinewaveH.start();

			
			add(output);
		}
	}
}
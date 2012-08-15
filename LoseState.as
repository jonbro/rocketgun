package
{
	import org.flixel.*;
	import org.flixel.system.*;
	import org.flixel.plugin.photonstorm.*;
	import org.flixel.plugin.photonstorm.FX.SineWaveFX;
	import flash.geom.Rectangle;

	public class LoseState extends FlxGroup
	{
		[Embed(source = 'data/levels/lose_screen.oel', mimeType = 'application/octet-stream')]
            private var overlaylevel:Class;
		

		private var map:FlxTilemap;
		private var map2:FlxTilemap;
		private var font:FlxBitmapFont;
		
		private var scroller:FlxSprite;
		private var sinewaveV:SineWaveFX;
		private var sinewaveH:SineWaveFX;
		private var output:FlxSprite;

		public function LoseState()
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
		}
	}
}
package
{
	import org.flixel.*;

	public class MenuState extends FlxState
	{
        [Embed(source = 'data/levels/Level1.oel', mimeType = 'application/octet-stream')]
            private var Level1:Class;

        [Embed(source = 'data/levels/Level2.oel', mimeType = 'application/octet-stream')]
            private var Level2:Class;

        [Embed(source = 'data/levels/Level3.oel', mimeType = 'application/octet-stream')]
            private var Level3:Class;

        [Embed(source = 'data/levels/Level4.oel', mimeType = 'application/octet-stream')]
            private var Level4:Class;

        [Embed(source = 'data/levels/Level5.oel', mimeType = 'application/octet-stream')]
            private var Level5:Class;

        [Embed(source = 'data/levels/Level6.oel', mimeType = 'application/octet-stream')]
            private var Level6:Class;

        [Embed(source = 'data/levels/Level7.oel', mimeType = 'application/octet-stream')]
            private var Level7:Class;

        [Embed(source = 'data/levels/2Player.oel', mimeType = 'application/octet-stream')]
            private var TwoPlayer:Class;

        [Embed(source = 'data/levels/Level8.oel', mimeType = 'application/octet-stream')]
            private var Level8:Class;

		override public function create():void
		{
			var t:FlxText;
			t = new FlxText(0,FlxG.height/2-10,FlxG.width,"Rocket Gun");
			t.size = 16;
			t.alignment = "center";
			add(t);
			t = new FlxText(FlxG.width/2-50,FlxG.height-20,100,"click to play");
			t.alignment = "center";
			add(t);
			

			// guessing at difficulty
			// 2, 6, 4, 5, 3, 1, 7

			// add the buttons for the levels

			var b:FlxButton;
			var p:PlayState = new PlayState();
			b = new FlxButton(10, 20,"1",function():void{
				p.loadLevel(new OgmoLevel(new Level2));
				FlxG.switchState(p);
			});
			add(b);

			b = new FlxButton(10, 40,"2",function():void{
				p.loadLevel(new OgmoLevel(new Level6));
				FlxG.switchState(p);
			});
			add(b);

			b = new FlxButton(10, 60,"3",function():void{
				p.loadLevel(new OgmoLevel(new Level4));
				FlxG.switchState(p);
			});
			add(b);

			b = new FlxButton(10, 80,"4",function():void{
				p.loadLevel(new OgmoLevel(new Level5));
				FlxG.switchState(p);
			});
			add(b);

			b = new FlxButton(10, 100,"5",function():void{
				p.loadLevel(new OgmoLevel(new Level3));
				FlxG.switchState(p);
			});
			add(b);

			b = new FlxButton(10, 120,"6",function():void{
				p.loadLevel(new OgmoLevel(new Level1));
				FlxG.switchState(p);
			});
			add(b);
			b = new FlxButton(10, 140,"7",function():void{
				p.loadLevel(new OgmoLevel(new Level7));
				FlxG.switchState(p);
			});
			add(b);
			b = new FlxButton(10, 160,"8",function():void{
				p.loadLevel(new OgmoLevel(new Level8));
				FlxG.switchState(p);
			});
			add(b);
			/*
			b = new FlxButton(10, 160,"2P",function():void{
				p.loadLevel(new OgmoLevel(new TwoPlayer));
				FlxG.switchState(p);
			});
			add(b);
			*/
			
			FlxG.mouse.show();
		}

		override public function update():void
		{
			super.update();

		}
	}
}

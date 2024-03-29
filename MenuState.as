package
{
	import org.flixel.*;
	import org.flixel.system.*;
	import org.flixel.plugin.photonstorm.*;
	import flash.utils.getDefinitionByName;

	public class MenuState extends FlxState
	{
        [Embed(source = 'data/levels/Level1.oel', mimeType = 'application/octet-stream')]
            private var Level1:Class;

        [Embed(source = 'data/levels/Level1_2.oel', mimeType = 'application/octet-stream')]
            private var Level1_2:Class;

        [Embed(source = 'data/levels/Level1_3.oel', mimeType = 'application/octet-stream')]
            private var Level1_3:Class;

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

        [Embed(source = 'data/levels/Level9.oel', mimeType = 'application/octet-stream')]
            private var Level9:Class;

        [Embed(source = 'data/levels/Level10.oel', mimeType = 'application/octet-stream')]
            private var Level10:Class;

        [Embed(source = 'data/levels/Level11.oel', mimeType = 'application/octet-stream')]
            private var Level11:Class;

        [Embed(source = 'data/levels/Level12.oel', mimeType = 'application/octet-stream')]
            private var Level12:Class;
        [Embed(source = 'data/levels/Level13.oel', mimeType = 'application/octet-stream')]
            private var Level13:Class;
        [Embed(source = 'data/levels/Level14.oel', mimeType = 'application/octet-stream')]
            private var Level14:Class;
        [Embed(source = 'data/levels/Level15.oel', mimeType = 'application/octet-stream')]
            private var Level15:Class;
		[Embed(source = 'data/levels/title_screen.oel', mimeType = 'application/octet-stream')]
            private var titleScreen:Class;

		private var map:FlxTilemap;
		private var map2:FlxTilemap;

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
			
			var level:OgmoLevel = new OgmoLevel(new titleScreen());
			map = level.loadTilemap("stage", PlayState.ImgTiles);
			add(map);
			map2 = level.loadTilemap("stage2", PlayState.ImgTiles);
			add(map2);

			for each(var g:XML in level.xml.actors[0].textObj)
			{
				var font:FlxBitmapFont = new FlxBitmapFont(AssetsRegistry.BubbleFont, 8, 16, FlxBitmapFont.TEXT_SET2, 77);
				font.setText(g.@string, false, 0, 8, FlxBitmapFont.ALIGN_CENTER);
				font.x = g.@x;
				font.y = g.@y;
				font.scale = new FlxPoint(g.@scale, g.@scale);
				// if align 0 then center
				if (g.@align == "0"){
					font.x = g.@x - font.width/2;
				}
				add(font)
			}

			var LevelOrder:Array = [
				{
					'level':Level1,
					lname: "1"
				}, 
				{
					'level':Level1_2,
					lname: "2"
				}, 
				{
					'level':Level1_3,
					lname: "3"
				}, 
				{
					'level':Level6,
					lname: "4"
				}, 
				{
					'level':Level4,
					lname: "5"
				}, 
				{
					'level':Level5,
					lname: "6"
				}, 
				{
					'level':Level3,
					lname: "5"
				}, 
				{
					'level':Level1,
					lname: "6"
				}, 
				{
					'level':Level7,
					lname: "7"
				}, 
				{
					'level':Level8,
					lname: "8"
				}, 
				{
					'level':Level9,
					lname: "9"
				}, 
				{
					'level':Level10,
					lname: "10"
				}, 
				{
					'level':Level11,
					lname: "11"
				}, 
				{
					'level':Level12,
					lname: "11"
				}, 
				{
					'level':Level13,
					lname: "11"
				}, 
				{
					'level':Level14,
					lname: "11"
				}, 
				{
					'level':Level15,
					lname: "11"
				}, 
			];
			var i:int = 1;
			var b:FlxButton;
			var makeCallback:Function = function(l) { return function():void{
					var p:PlayState = new PlayState();
					p.loadLevel(new OgmoLevel(l));
					FlxG.switchState(p);
				};
			};
			for each(var obj:Object in LevelOrder)
			{
				b = new FlxButton(10, i*20, ""+i, makeCallback(new obj['level']()));
				add(b);
				i++;
			}

			FlxG.mouse.show();
			FlxG.bgColor = 	0xFF2c4e4e;
		}

		override public function update():void
		{
			super.update();

		}
	}
}

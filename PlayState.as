package
{
	import org.flixel.*;
	import org.flixel.system.*;

	import Box2D.Dynamics.*;
	import Box2D.Collision.*;
	import Box2D.Collision.Shapes.*;
	import Box2D.Common.Math.*;

	public class PlayState extends FlxState
	{
	    public var _world:b2World;
	    public var _walls:FlxGroup;
		public var _items:FlxGroup;
		public var _bullets:FlxGroup;

	    public var gun:Gun;
	    public var gameOver:Boolean;
	    public var playback:Boolean;

		private var map:FlxTilemap;
		private var map2:FlxTilemap;
		private var gunStart:FlxPoint;

		[Embed(source = 'data/box.png')] private var ImgCube:Class;
		[Embed(source = 'data/gun.png')] private var ImgGun:Class;

		[Embed(source = 'data/spikes.png')] private var ImgSpikes:Class;
		[Embed(source = 'data/spikes_left.png')] private var ImgSpikesLeft:Class;
		[Embed(source = 'data/spikes_right.png')] private var ImgSpikesRight:Class;
		[Embed(source = 'data/spikes_top.png')] private var ImgSpikesTop:Class;

		[Embed(source = 'data/spike_ball.png')] private var ImgSpikeBall:Class;

		[Embed(source = 'data/trinket.png')] private var ImgTrinket:Class;
		[Embed(source = 'data/ObjectFlip.png')] private var ImgFlip:Class;

        [Embed(source="data/tiles.png")]
            private var ImgTiles:Class;

		protected var _rocketSmoke:FlxEmitter;
		protected var _guns:FlxGroup;
		private var currentLevel:OgmoLevel;
		
		protected var replays:Array;

		private var currentReplay:FlxReplay;

		[Embed(source = 'data/rocketSmoke.png')] private var ImgRocketSmoke:Class;

		override public function create():void
		{
		}
		public function loadLevel(level:OgmoLevel):void
		{
			replays = new Array();
			currentLevel = level;
			//Load each layers
			map = level.loadTilemap("stage", ImgTiles);
			map2 = level.loadTilemap("stage2", ImgTiles);
			//add the layers to the state
			add(map);
			add(map2);
			 
            // setup the rocket engine
            _rocketSmoke = new FlxEmitter(0,0);
            /**/
			_rocketSmoke.setXSpeed(-200,200);
			_rocketSmoke.setYSpeed(-300,0);
			_rocketSmoke.setRotation(0,0);
			
			_rocketSmoke.makeParticles(ImgRocketSmoke,50,0,false);
			add(_rocketSmoke);

			_bullets = new FlxGroup();
			add(_bullets);
			_guns = new FlxGroup();
			add(_guns);
			// load the gun from the ogmo file
			for each(var g:XML in level.xml.actors[0].gun)
			{
				gunStart = new FlxPoint(g.@x, g.@y);
				gun = new Gun(gunStart.x, gunStart.y, 32, 32, _world, _rocketSmoke, _bullets);
				gun.loadGraphic(ImgGun, false, false, 32, 32);
				// flip the the guns and change controls based on the settings in the file
				if(g.@flip == 1){
					gun.setFlip();
				}
				if(g.@gun != "" && g.@gun != null){
					FlxG.log(g.@gun == " ");
					FlxG.log(g.@gun == false);
					FlxG.log("test");
					//gun._gunKey = g.@gun;
				}
				if(g.@rocket != ""){
					//gun._rocketKey = g.@rocket;
				}
				_guns.add(gun);
				FlxG.mouse.show();
			}

			FlxG.debug = true;

			_items = new FlxGroup();
			
			//Add a little patrolling box to demo FlxPath
			for each(var p:XML in level.xml.actors[0].patrol)
			{
				//Create a simple FlxSprite
				var patrol:Enemy = new Enemy(p.@x, p.@y);
				patrol.loadGraphic(ImgSpikeBall);
				add(patrol);
				_items.add(patrol);
				patrol.path = new FlxPath();

				//add each node to the FlxPath
				for each(var n:XML in p.node)
				{
					patrol.path.add(n.@x, n.@y);
				}
				// And, finaly, follow the path
				patrol.followPath(patrol.path, 100, FlxObject.PATH_LOOP_FORWARD);
			}
			//add in the spike dangers
			var spikeTypes:Array = ["spikes", "spikes_top", "spikes_left", "spikes_right"];
			var spikeImg:Object = {"spikes":ImgSpikes, "spikes_top":ImgSpikesTop, "spikes_left":ImgSpikesLeft, "spikes_right":ImgSpikesRight};
			for each(var st:String in spikeTypes)
			{
				for each(var s:XML in level.xml.actors[0][st])
				{
					var xsize = (Number(s.@width) || 16)/16;
					var ysize = (Number(s.@height) || 16)/16;
					// need to break this down into x, y so that we can destroy each tile individually
					for(var x=0;x<xsize;x++){
						for(var y=0;y<ysize;y++){
							var spikes:FlxTileblock = new ObjectSpike(Number(s.@x)+x*16, Number(s.@y)+y*16, 16, 16);
							spikes.loadTiles(spikeImg[st]);
							add(spikes);
							_items.add(spikes);							
						}
					}
				}				
			}
			var objTypes:Array = ["ObjectFlip"];
			var objObjects:Object = {"ObjectFlip":ObjectFlip};
			for each(var obj:String in objTypes)
			{
				for each(var eo:XML in level.xml.actors[0][obj])
				{
					//Create a simple FlxSprite
					var o:FlxSprite = new objObjects[obj](eo.@x, eo.@y);
					o.loadGraphic(ImgFlip, true, false, 16);
					add(o);
					_items.add(o);
				}				
			}

			for each(var t:XML in level.xml.actors[0].trinket)
			{
				//Create a simple FlxSprite
				var trinket:Trinket = new Trinket(t.@x, t.@y);
				trinket.loadGraphic(ImgTrinket, true, false, 16);
				trinket.addAnimation("ani", [0, 1, 2, 3], 15);
				trinket.play("ani");
				add(trinket);
				_items.add(trinket);
			}
			// add a button to go back to the menu in the upper right corner
			var b:FlxButton;
			b = new FlxButton(560, 0,"menu",function():void{
				FlxG.switchState(new MenuState());
			});
			add(b);

			// push a new replay into the set of replays
			currentReplay = new FlxReplay();
			currentReplay.create(0);
			replays.push(currentReplay);

			gameOver = false;
			playback = false;
		}
		public function winGame():void
		{
			var t:FlxText;
			t = new FlxText(0,FlxG.height/2-10,FlxG.width,"Game Won! Click or Z to Restart.");
			t.size = 16;
			t.alignment = "center";
			gameOver = true;
			add(t);
			// spawn off a number of guns equal to the number of replays
			// and start playing back the replays
			for(var i:int = 0; i<replays.length; i++){

			}
		}
		public function endGame():void
		{
			var t:FlxText;
			t = new FlxText(0,FlxG.height/2-10,FlxG.width,"Game Over. Click or Z to Restart.");
			t.size = 16;
			t.alignment = "center";
			gameOver = true;
			add(t);
		}
		override public function update():void
		{
			if(!playback){
				currentReplay.recordFrame();
			}
			var ps:PlayState = this;
			FlxG.overlap(_items, _guns, function(Object1:LevelObject,Object2:Gun){
				Object1.processGun(Object2, ps);
			});
			FlxG.overlap(_items, _bullets, function(Object1:LevelObject,Object2:Bullet){
				Object1.processBullet(Object2, ps);
			});
			FlxG.collide(_bullets, map2);
			FlxG.collide(_guns, map2);
			if(gameOver){
				if((FlxG.mouse.justPressed() || FlxG.keys.justPressed("Z")) && gameOver)
				{
					FlxG.mouse.hide();
					var p:PlayState = new PlayState();
					p.loadLevel(currentLevel);
					FlxG.switchState(p);
				}
			}else{
				super.update();
			}
		}
	}
}
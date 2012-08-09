package {
	import org.flixel.*; //Allows you to refer to flixel objects in your code

    import Box2D.Dynamics.*;
    import Box2D.Collision.*;
    import Box2D.Collision.Shapes.*;
    import Box2D.Common.Math.*;

	public class Gun extends FlxSprite
	{
		
		private var ratio:Number = 30;
 
        public var _fixDef:b2FixtureDef;
        public var _bodyDef:b2BodyDef
        public var _obj:b2Body;
 
        private var _world:b2World;
 
        //Physics params default value
        public var _friction:Number = 0.8;
        public var _restitution:Number = 0.3;
        public var _density:Number = 0.7;
 
        //Default angle
        public var _angle:Number = 0;
        //Default body type
        public var _type:uint = b2Body.b2_dynamicBody;
		public var _rocketKey:String = "Z";
        public var _gunKey:String = "X";
		// rocket particles
		protected var _rocketSmoke:FlxEmitter;
		
		// bullets
		protected var _bullets:FlxGroup;
				[Embed(source = 'data/box.png')] private var ImgCube:Class;

        public function Gun(X:Number, Y:Number, Width:Number, Height:Number, w:b2World, _smoke:FlxEmitter, _b:FlxGroup):void
        {
            super(X,Y);

            width = Width;
            height = Height;
            _world = w;
            drag.x = 50;
			_rocketSmoke = _smoke;
			_bullets = _b;
            _rocketSmoke.start(false, 0, 0.05);
            _rocketSmoke.gravity = 350;
            _rocketKey = "Z";
            _gunKey = "X";
        }
 
        override public function update():void
        {
            acceleration.x = 0;
            acceleration.y = 0;
            drag.x = 0;
        	// apply forces based on pressed keys to the body
        	
        	// this is the rocket
        	if(FlxG.keys[_rocketKey])
			{
				// get the vector that the rocket is facing in
				// tweak the y component below to change the rocket power
                var power = new FlxPoint(150*scale.x, -700);
                acceleration = power;
                _rocketSmoke.on = true;

			}else{
				_rocketSmoke.on = false;
			}
			
            acceleration.y += 550;

            // add horizontal drag if the gun is touching the ground
            if(touching == DOWN){
                drag.x = 300;
            }
            
            _rocketSmoke.at(this);
			
			// copy the angle to the emitter             
            var v:FlxPoint = FlxU.rotatePoint(10, 0,0,0, angle);
            _rocketSmoke.setXSpeed(v.x-20, v.x+20);
            _rocketSmoke.setYSpeed(v.y-20, v.y+20);
            super.update();
            // this is the shooting
            if(FlxG.keys.justPressed(_gunKey))
            {

                velocity.x -= 200*scale.x;
                // redo this with the non box2d stuff
                
                // add a bullet to the world
                // var _b:FlxSprite = new Bullet(x,y);
                var _b:Bullet = _bullets.recycle(Bullet) as Bullet;
                if(scale.x>0){
                    _b.x = x+width;
                }else{
                    _b.x = x-_b.width;
                }
                _b.y = y;
                _b.revive();
                _b.velocity.x = 1000*scale.x;
                _bullets.add(_b);
            }
        }
        public function setFlip():void
        {
            scale.x *= -1;
        }
	}
}
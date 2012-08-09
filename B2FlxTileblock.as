package
{
    import org.flixel.*;
 
    import Box2D.Dynamics.*;
    import Box2D.Collision.*;
    import Box2D.Collision.Shapes.*;
    import Box2D.Common.Math.*;
 
    public class B2FlxTileblock extends FlxTileblock
    {
		private var ratio:Number = 30;
 
		public var _fixDef:b2FixtureDef;
		public var _bodyDef:b2BodyDef
		public var _obj:b2Body;
		 
		//References			
		private var _world:b2World;
		 
		//Physics params default value
		public var _friction:Number = 0.8;
		public var _restitution:Number = 0.3;
		public var _density:Number = 0.7;
		 
		//Default angle
		public var _angle:Number = 0;
		//Default body type
		public var _type:uint = b2Body.b2_staticBody;
		 
        public function B2FlxTileblock(X:Number, Y:Number, Width:Number, Height:Number, w:b2World):void
        {        
            super(X,Y, Width, Height);            
            _world = w;
            solid = true;
            elasticity = 0.5;
        }		
    }
}
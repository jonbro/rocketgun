package 
{
    import flash.display.*;
    import flash.events.Event;
 
    [SWF(width="640", height="480", backgroundColor="#af84b2")]
 
    [Frame(factoryClass = "Main")]
 
    public class Main extends MovieClip
    {
        public function Main():void
        {        
            if (stage) {
                init();
            } else {
                addEventListener(Event.ADDED_TO_STAGE, init);
            }
        }
 
        private function init(event:Event=null):void {
            removeEventListener(Event.ADDED_TO_STAGE, init);
            var game:RocketGun = new RocketGun;
            addChild(game);
        }
    }
 
}
 
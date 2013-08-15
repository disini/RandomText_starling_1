package 
{
	
	import flash.display.Sprite;
	
	import net.hires.debug.Stats;
	
	import starling.core.Starling;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author liusheng QQ:532230294
	 */
	[SWF(backgroundColor = "#cccc00", frameRate="24", width="900", height="600")]
	public class Main extends Sprite 
	{
		/**性能检测工具*/
		private var _stats:Stats;
		private var myStarling:Starling;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			_stats = new Stats();// 性能检测工具
			addChild(_stats);
			_stats.x = stage.stageWidth - (_stats.width+50);
			_stats.y = 50;
			
			myStarling = new Starling(Game, stage);
			myStarling.antiAliasing = 4;
			myStarling.start();
		}
		
	}
	
}
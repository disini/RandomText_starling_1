package
{
	import starling.display.Sprite;
	
	public class Game extends Sprite
	{
		public function Game()
		{
			var str:String = "我和小伙伴们都惊呆了我和小伙我和小伙伴们都惊呆了伴们都惊呆了我和小伙伴们都惊呆了";
			
			for(var i:int=0; i < 30;i++)
			{
				var tfColor:uint = (Math.random() * 0xffffff);
				var tfSize:uint = 12 + Math.random() * 20;
				var myRanTf:RandomTf = new RandomTf(str, tfSize, tfColor, 29000);
				addChild(myRanTf);
				myRanTf.x = 50+Math.random() * 800;
				myRanTf.y = 50+Math.random() * 500;
			}
		}
	}
}
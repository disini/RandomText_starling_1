package{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.geom.Matrix;
	import flash.text.TextField;
	
	[SWF(width="400",height="300")]
	public class DrawText extends Sprite
	{
		public var tf:TextField = new TextField();
		//作为幕布在使用，大小和舞台一样，文本转好位图之后，随机位置画在这上面。
		public var bitmapDataSource:BitmapData = new BitmapData(400,300,false);
		public var bitmap:Bitmap = new Bitmap();
		public function DrawText()
		{
			for(var i:int = 0; i<30 ; ++i)
			{
				tf.text = "看我变成图片!";
				//设置转换矩阵
				var matrix:Matrix = new Matrix();
				matrix.tx = Math.random()*400;
				matrix.ty = Math.random()*300;
				//转位图
				bitmapDataSource.draw(tf,matrix);
				//显示到舞台上
				bitmap.bitmapData = bitmapDataSource;
				addChild(bitmap);
			}
		}
	}
}
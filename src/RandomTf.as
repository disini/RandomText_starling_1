package  
{
	import flash.events.TimerEvent;
	import flash.utils.ByteArray;
	import flash.utils.Timer;
	
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.text.TextFieldAutoSize;
	
	/**
	 * ...
	 * @author liusheng QQ:532230294
	 */
	public class RandomTf extends Sprite 
	{
		private var mytf:TextField;
		private var myTimer:Timer;
		private var textStr:String;
		private var textArr:Array;
		private var randomArr:Array;
		private var randomStr:String;
		private var startImmediate:Boolean = true;
		private var onStage:Boolean = false;
		private var changingTime:uint = 3000;
		private var startTime:Number;
		
		/**
		 * 随机变化文字
		 * @param str:String 内容
		 * @param changingTime:uint 单位毫秒，变化时间
		 * */
		public function RandomTf(str:String, _size:uint = 18, _color:uint = 0x000000, _changingTime:uint = 3000, _startImmediate:Boolean = true):void
		{
			mytf = new TextField(200,300,"");
//			mytf.autoSize = TextFieldAutoSize.BOTH_DIRECTIONS;
//			mytf.autoScale = true;
//			mytf.width = 200;
//			mytf.wordWrap = true;
//			mytf.multiline = true;
//			var tfFormat:TextFormat = new TextFormat();
//			tfFormat.size = _size;
//			tfFormat.color = _color;
//			mytf.defaultTextFormat = tfFormat;
			mytf.color = _color;
			mytf.fontSize = _size;
			addChild(mytf);
			textStr = str;
			
			textArr = str.split("");
			
			startImmediate = _startImmediate;
			
			changingTime = _changingTime;
			
			addEventListener(Event.ADDED_TO_STAGE, init);
			
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			onStage = true;
			if (startImmediate)
			{
				startEffects();
			}
		}
		
		public function startEffects():void {
			if (!onStage) 
			return;
			
			addEventListener(Event.ENTER_FRAME, showRandomText);
			
			myTimer = new Timer(changingTime);
			myTimer.addEventListener(TimerEvent.TIMER, setFinalContent);
			myTimer.start();
			startTime = new Date().time;
			trace(startTime);
		}
		
		private function showRandomText(e:Event):void 
		{
			var tempArr:Array = [];
			randomArr = [];
			// 深拷贝，原数组不要破坏
			/*for (var t:int = 0; t <  textArr.length;t++ )
			{
				tempArr.push(textArr[t]);
			}*/
			
			//tempArr = textArr;
			
			var byteArray:ByteArray = new ByteArray();
			byteArray.writeObject(textArr);
			byteArray.position = 0;
			tempArr = byteArray.readObject() as Array;
//			tempArr.sort(function(a:*,b:*):int{return (Math.random()>.5)?-1:1;});
			
			/*Array.sort():
			此方法使用语法和参数顺序 Array.sort(compareFunction, sortOptions)，其参数定义如下：
			compareFunction - 一个用来确定数组元素排序顺序的比较函数。此参数是可选的。比较函数应该用两个参数进行比较。给定元素 A 和 B，compareFunction 的结果可以具有负值、0 或正值： 
			若返回值为负，则表示 A 在排序后的序列中出现在 B 之前。
			若返回值为 0，则表示 A 和 B 具有相同的排序顺序。
			若返回值为正，则表示 A 在排序后的序列中出现在 B 之后。
*/
			tempArr.sort(disorganize);
			mytf.text = tempArr.join("");
			
			// 打乱顺序
		/*	for (var i:int = tempArr.length - 1; i >= 0; i-- )
			{
				var index:int = Math.random() * tempArr.length;
				var arr:Array = tempArr.splice(index, 1);
				
				randomArr.push(arr[0]);
			}
			
			randomStr = randomArr.join("");
			mytf.text = randomStr;*/
			
			var curTime:Number = new Date().time;
			var timePassed:Number = curTime - startTime;
//			trace(timePassed);
		}
		
		private function disorganize(a:*, b:*):int{
			return (Math.random() > 0.5)? -1:1;
		}
		
		private function setFinalContent(evt:TimerEvent):void {
			removeEventListener(Event.ENTER_FRAME, showRandomText);
			mytf.text = textStr;
		}
		
	}
}
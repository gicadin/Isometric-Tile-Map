package Widgets 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Dragoola
	 */
	public class ScrollBar extends Sprite 
	{
		[Embed(source="../../assets/ScrollBarAsset.png")]
		public static var ScrollBarAsset:Class;
		
		private var _isVertical:Boolean;
		public function ScrollBar(vertical:Boolean = true) 
		{
			super();
			initialize();
			this._isVertical = vertical;
		}
		
		private function initialize():void
		{
			var barBitmap:Bitmap = new ScrollBarAsset() as Bitmap;
			if(_isVertical)
				this.addChild(barBitmap);
			else
			{
				barBitmap.rotation = 90;
				this.addChild(barBitmap);
			}
		}
		
	}

}
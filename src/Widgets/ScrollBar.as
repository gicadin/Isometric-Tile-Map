package Widgets 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import com.greensock.TweenLite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	/**
	 * ...
	 * @author Dragoola
	 */
	public class ScrollBar extends Sprite 
	{
		[Embed(source="../../assets/ScrollBarAssetV.png")]
		public static var ScrollBarAssetV:Class;
		
		[Embed(source="../../assets/ScrollBarAssetH.png")]
		public static var ScrollBarAssetH:Class;
		
		private static var FADE_IN_DURATION:Number = 0.3;
		private static var FADE_OUT_DURATION:Number = 0.5; // in seconds
		private static var VISIBLE_DURATION:Number = 1000; // in miliseconds
		private var _isVertical:Boolean;
		private var _alphaTimer:Timer;
		private var _alphaTween:TweenLite;
		public function ScrollBar(vertical:Boolean = true) 
		{
			super();
			this._isVertical = vertical;
			initialize();
		}
		
		private function initialize():void
		{
			var barBitmap:Bitmap;
			if(_isVertical)
				barBitmap = new ScrollBarAssetV() as Bitmap;
			else
				barBitmap = new ScrollBarAssetH() as Bitmap;
			addChild(barBitmap);
		}
		
		override public function set x(newX:Number):void
		{
			if (Utils.NearEquals(super.x,newX))
				return;
			fadeIn();
			super.x = newX;
		}
		
		override public function set y(newY:Number):void
		{
			if (Utils.NearEquals(super.y,newY))
				return;
				
			fadeIn();
			super.y = newY;
		}
		
		private function fadeIn():void
		{
			// set fadeout timer
			if ((_alphaTimer) && (_alphaTimer.running))
			{
				_alphaTimer.reset();
				_alphaTimer.start();
			}
			else
			{
				_alphaTimer = new Timer(VISIBLE_DURATION, 1);
				_alphaTimer.addEventListener(TimerEvent.TIMER, fadeOut);
				_alphaTimer.start();
			}
			if (alpha == 1)
				return;
			if ((_alphaTween) && (_alphaTween.isActive()))
			{
				// if we are already fading in, do nothing
				if (_alphaTween.vars.alpha == 1 )
				{
					return;
				}
				// if we are fading out, revert it to fade back in
				if (_alphaTween.vars.alpha == 0 )
				{
					_alphaTween.kill();
					_alphaTween = new TweenLite(this,(FADE_IN_DURATION  * (1 - this.alpha)),{ alpha:1 });
				}
			}
			else
			{
				_alphaTween = new TweenLite(this, FADE_IN_DURATION ,{ alpha:1 });
			}
		}
		
		private function fadeOut(e:Event = null):void
		{
			_alphaTween = new TweenLite(this, FADE_OUT_DURATION ,{ alpha:0 });
		}
		
		
		
	}

}
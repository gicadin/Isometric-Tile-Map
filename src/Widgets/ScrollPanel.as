package Widgets 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TouchEvent;
	
	/**
	 * ...
	 * @author Dragoola
	 */
	public class ScrollPanel extends Sprite 
	{
		protected var mask:DisplayObject;
		protected var panel:Sprite;
		private var VScrollBar:ScrollBar;
		private var HScrollBar:ScrollBar;
		public function ScrollPanel(panel:Sprite) 
		{
			super();
			this.panel = panel;
			panel.addEventListener(TouchEvent.TOUCH_MOVE, onPanelMove);
		}
		
		
		public function updateScroll():void
		{
			if (mask == null)
				throw new Error("Trying to update scroll that has no mask");
				
			if (panel.height > mask.height)
			{
				// add vertical scroll bar
				VScrollBar = new ScrollBar(true);
				this.addChild(VScrollBar);
				
				
			}
		}
		
		private function onPanelMove(e:TouchEvent):void
		{
			// update the scroll bar(s) location
			
		}
		
		private function getScrollBarPos(vertical:Boolean = true):Number
		{
			var pos:Number;
			if (vertical)
			{
				var topExcess:Number = Math.abs(panel.y - mask.y);
				var botExcess:Number = Math.abs((panel.y + panel.height) - (mask.y + mask.height));
				if (botExcess == 0)
					return mask.height - VScrollBar.height;
				pos = Math.min((topExcess / botExcess * mask.height) - VScrollBar.height / 2, mask.height - VScrollBar.height);
				return Math.max(pos, 0);
			}
			else
			{
				var leftExcess:Number = Math.abs(panel.x - mask.x);
				var rightExcess:Number = Math.abs((panel.x + panel.width) - (mask.x + mask.width));
				if (rightExcess == 0)
					return mask.width - HScrollBar.width;
				pos = Math.min((leftExcess / rightExcess * mask.width) - HScrollBar.width / 2, mask.width - HScrollBar.width);
				return Math.max(pos, 0);
			}
		}
		
	}

}
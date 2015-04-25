package Widgets 
{
	//import com.greensock.TweenLite;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TouchEvent;
	import flash.utils.getTimer;
	
	/**
	 * ...
	 * @author Dragoola
	 */
	public class ScrollPanel extends Sprite 
	{
		protected var panelMask:Bitmap;
		public var panel:Sprite;
		private var VScrollBar:ScrollBar;
		private var HScrollBar:ScrollBar;
		public function ScrollPanel(panel:Sprite, width:Number, height:Number) 
		{
			super();
			this.panel = panel;
			this.addChild(panel);
			panel.addEventListener(MouseEvent.MOUSE_DOWN, onPanelMouseDown);
			
			var bmd:BitmapData = new BitmapData(width, height);
			panelMask = new Bitmap(bmd);
			this.addChild(panelMask);
			panel.mask = panelMask;
			panel.cacheAsBitmap = false;
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		
		public function updateScroll():void
		{
			if (panelMask == null)
				throw new Error("Trying to update scroll that has no panelMask");
				
			if (panel.height > panelMask.height)
			{
				// add vertical scroll bar
				VScrollBar = new ScrollBar(true);
				this.addChild(VScrollBar);
				VScrollBar.x = panelMask.width - VScrollBar.width;
			}
			
			if ((panel.width > panelMask.width) && (false))
			{
				// add horizontal scroll bar
				HScrollBar = new ScrollBar(false);
				this.addChild(HScrollBar);
			}
		}
		
		private var lastTime:int = 0;
		private function onEnterFrame(e:Event):void
		{
			//trace("fps= " + (getTimer() - lastTime));
			lastTime = getTimer();
			// set the panel position according to the target

			if (VScrollBar)
				panel.y = panelTargetY;
			if (HScrollBar)
				panel.x = panelTargetX;

			// update the scroll bar(s) location
			if (VScrollBar) 
			{
				VScrollBar.y = getScrollBarPos(true);
				//trace("scroll bar position: " + VScrollBar.y);
				this.setChildIndex(VScrollBar, this.numChildren - 1);
			}
			if (HScrollBar)
			{
				HScrollBar.x = getScrollBarPos(false);
				this.setChildIndex(HScrollBar, this.numChildren - 1);
			}
		}
		
		private var eventStartX:Number;
		private var eventStartY:Number;
		private var panelStartX:Number;
		private var panelStartY:Number;
		private function onPanelMouseDown(e:MouseEvent):void
		{
			trace("scroll pane mouze down");
			eventStartX = e.stageX;
			eventStartY = e.stageY;
			panelStartX = panel.x;
			panelStartY = panel.y;
			panel.addEventListener(MouseEvent.MOUSE_MOVE, onPanelMove);
			panel.addEventListener(MouseEvent.MOUSE_UP, onPanelMouseUp);
		}
		
		private function onPanelMouseUp(e:MouseEvent):void
		{
			trace("scroll pane mouze up");
			panel.removeEventListener(MouseEvent.MOUSE_MOVE, onPanelMove);
			panel.removeEventListener(MouseEvent.MOUSE_UP, onPanelMouseUp);
		}
		
		private var panelTargetX:Number;
		private var panelTargetY:Number;
		private function onPanelMove(e:MouseEvent):void
		{
			// update the panel's position by the delta
			if (VScrollBar)
				panelTargetY = Math.min(panelStartY + (e.stageY - eventStartY), 0);
				panelTargetY = Math.max(panelTargetY, panelMask.height - panel.height);
			if (HScrollBar)
				panelTargetX = Math.min(panelStartX + (e.stageX - eventStartX), 0);
		}
		
		private function getScrollBarPos(vertical:Boolean = true):Number
		{
			var pos:Number;
			if (vertical)
			{
				var topExcess:Number = Math.abs(panel.y - panelMask.y);
				var botExcess:Number = Math.abs((panel.y + panel.height) - (panelMask.y + panelMask.height));
				if (botExcess == 0)
					return panelMask.height - VScrollBar.height;
				pos = Math.min((topExcess / botExcess * panelMask.height) - VScrollBar.height / 2, panelMask.height - VScrollBar.height);
				return Math.max(pos, 0);
			}
			else
			{
				var leftExcess:Number = Math.abs(panel.x - panelMask.x);
				var rightExcess:Number = Math.abs((panel.x + panel.width) - (panelMask.x + panelMask.width));
				if (rightExcess == 0)
					return panelMask.width - HScrollBar.width;
				pos = Math.min((leftExcess / rightExcess * panelMask.width) - HScrollBar.width / 2, panelMask.width - HScrollBar.width);
				return Math.max(pos, 0);
			}
		}
		
	}

}
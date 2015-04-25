package Widgets 
{
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
		private var _panelMask:Bitmap;
		public var panel:Sprite;
		private var _vScrollBar:ScrollBar;
		private var _hScrollBar:ScrollBar;
		
		private static var MAX_SPEED:Number = 5;
		
		private static var DRAG:Number = 0.1;
		
		public function ScrollPanel(panel:Sprite, width:Number, height:Number, showVScrollBar:Boolean = true, showHScrollBar = true) 
		{
			super();
			this.panel = panel;
			this.addChild(panel);
			panel.addEventListener(MouseEvent.MOUSE_DOWN, onPanelMouseDown);
			
			var bmd:BitmapData = new BitmapData(width, height);
			_panelMask = new Bitmap(bmd);
			this.addChild(_panelMask);
			panel.mask = _panelMask;
			panel.cacheAsBitmap = false;
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		
		public function updateScroll():void
		{
			if (_panelMask == null)
				throw new Error("Trying to update scroll that has no panelMask");
				
			if (panel.height > _panelMask.height)
			{
				// add vertical scroll bar
				_vScrollBar = new ScrollBar(true);
				this.addChild(_vScrollBar);
				_vScrollBar.x = _panelMask.width - _vScrollBar.width;
			}
			
			if (panel.width > _panelMask.width)
			{
				// add horizontal scroll bar
				_hScrollBar = new ScrollBar(false);
				_hScrollBar.y = _panelMask.height - _hScrollBar.height;
				this.addChild(_hScrollBar);
			}
		}
		
		private var _previousYPos:Number;
		private var _previousXPos:Number;
		private var _previousFrameTimer:int;
		private var _currentSpeedY:Number = 0;
		private var _currentSpeedX:Number = 0;
		private function onEnterFrame(e:Event):void
		{
			var frameTime:int = getTimer() - _previousFrameTimer;
			_previousFrameTimer = getTimer();
			
			// if the user is currently scrolling, update by mouse movement
			if (_isMouseDown)
			{
				trace(" Mouse Down current speed is: " + _currentSpeedY);
				trace("panelTargetY: " + panelTargetY);
				trace("previousYPos: " + _previousYPos);
				trace("frameTime: " + frameTime);
				if (_vScrollBar)
				{
					if(frameTime > 0)
						_currentSpeedY = (panelTargetY - _previousYPos) / frameTime;
					_currentSpeedY = Utils.BoundByInterval(_currentSpeedY, -MAX_SPEED, MAX_SPEED);
					_previousYPos = panelTargetY;
					panel.y = panelTargetY;
				}
				if (_hScrollBar)
				{
					if(frameTime > 0)
						_currentSpeedX = (panelTargetX - _previousXPos) / frameTime;
					_currentSpeedX = Utils.BoundByInterval(_currentSpeedX, -MAX_SPEED, MAX_SPEED);
					_previousXPos = panelTargetX;
					panel.x = panelTargetX;
				}
			}
			
			// otherwise update by remaining speed and apply drag to the speed
			else
			{
				if ( _currentSpeedY != 0)
					trace("current speed is: " + _currentSpeedY);
				if (_vScrollBar && (_currentSpeedY != 0))
				{	
					panelTargetY = panel.y + _currentSpeedY * frameTime;
					panelTargetY = Utils.BoundByInterval(panelTargetY, (_panelMask.height - panel.height), 0);
					panel.y = panelTargetY;
					if ((panel.y == (_panelMask.height - panel.height)) || (panel.y == 0 ))
						_currentSpeedY = 0;
					
					if (_currentSpeedY > 0)
						_currentSpeedY = Math.max(_currentSpeedY - DRAG, 0);
					else
						_currentSpeedY = Math.min(_currentSpeedY + DRAG, 0);
				}
				if (_hScrollBar && (_currentSpeedX != 0))
				{	
					panelTargetX = panel.x + _currentSpeedX * frameTime;
					panelTargetX = Utils.BoundByInterval(panelTargetX, (_panelMask.width - panel.width), 0);
					panel.x = panelTargetX;
					if ((panel.x == (_panelMask.width - panel.width)) || (panel.x == 0 ))
						_currentSpeedX = 0;
					
					if (_currentSpeedX > 0)
						_currentSpeedX = Math.max(_currentSpeedX - DRAG, 0);
					else
						_currentSpeedX = Math.min(_currentSpeedX + DRAG, 0);
				}
			}
			if (panel.y > 0)
				trace("oops problem");
			
			// update the scroll bar(s) location
			if (_vScrollBar) 
			{
				_vScrollBar.y = getScrollBarPos(true);
				this.setChildIndex(_vScrollBar, this.numChildren - 1);
			}
			if (_hScrollBar)
			{
				_hScrollBar.x = getScrollBarPos(false);
				this.setChildIndex(_hScrollBar, this.numChildren - 1);
			}
		}
		
		private var eventStartX:Number;
		private var eventStartY:Number;
		private var panelStartX:Number;
		private var panelStartY:Number;
		private var _isMouseDown:Boolean = false;
		private function onPanelMouseDown(e:MouseEvent):void
		{
			trace("scroll pane mouze down");
			_isMouseDown = true;
			eventStartX = e.stageX;
			eventStartY = e.stageY;
			panelStartX = panel.x;
			panelStartY = panel.y;
			_currentSpeedY = 0;
			_currentSpeedX = 0;
			panel.addEventListener(MouseEvent.MOUSE_MOVE, onPanelMove);
			panel.addEventListener(MouseEvent.MOUSE_UP, onPanelMouseUp);
		}
		
		private function onPanelMouseUp(e:MouseEvent):void
		{
			trace("scroll pane mouze up");
			_isMouseDown = false;
			panel.removeEventListener(MouseEvent.MOUSE_MOVE, onPanelMove);
			panel.removeEventListener(MouseEvent.MOUSE_UP, onPanelMouseUp);
		}
		
		private var panelTargetX:Number;
		private var panelTargetY:Number;
		private function onPanelMove(e:MouseEvent):void
		{
			// update the panel's position by the delta
			if (_vScrollBar)
			{
				panelTargetY = Math.min(panelStartY + (e.stageY - eventStartY), 0);
				panelTargetY = Math.max(panelTargetY, _panelMask.height - panel.height);
			}
			if (_hScrollBar)
			{
				panelTargetX = Math.min(panelStartX + (e.stageX - eventStartX), 0);
				panelTargetX = Math.max(panelTargetX, _panelMask.width - panel.width);
			}
		}
		
		private function getScrollBarPos(vertical:Boolean = true):Number
		{
			if (vertical)
				return (_panelMask.height - _vScrollBar.height) * Math.abs(panel.y / (_panelMask.height - panel.height));
			else
				return (_panelMask.width - _hScrollBar.width) * Math.abs(panel.x / (_panelMask.width - panel.width));
		}
		
	}

}
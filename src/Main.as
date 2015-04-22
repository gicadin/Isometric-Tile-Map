package
{
	import City.CityView;
	import flash.display.Bitmap;
	import flash.events.MouseEvent;
	import WorldMap.WorldMapView;
	import Crafting.CraftingView;
	import flash.desktop.NativeApplication;
	import flash.events.Event;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	import flash.events.TouchEvent;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Main extends Sprite 
	{
		[Embed(source="../assets/WorldMap.png")]
		public static var WorldButton:Class;
		
		[Embed(source="../assets/Crafting.png")]
		public static var CraftingButton:Class;
		
		public function Main() 
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			stage.addEventListener(Event.DEACTIVATE, deactivate);
			
			// touch or gesture?
			Multitouch.inputMode = MultitouchInputMode.NONE;
			
			var mapButton:Sprite = new Sprite()
			mapButton.addChild(new WorldButton() as Bitmap);
			mapButton.addEventListener(MouseEvent.CLICK, onMap);
			addChild(mapButton);
			
			mapButton.y = 100;
			mapButton.x = 100;
			
			var craftingButton:Sprite = new Sprite()
			craftingButton.addChild(new CraftingButton() as Bitmap);
			craftingButton.addEventListener(MouseEvent.CLICK, onCrafting);
			addChild(craftingButton);
			craftingButton.x = 100;
			craftingButton.y = 400;
			
			// add the city view
			//addChild(new CityView());
			
			//addChild(new CraftingView());
		}
		
		private function onMap(e:Event):void
		{
			//pui aici ce vrei
			this.removeChildren();
			addChild(new WorldMapView()); 
		}
		
		private function onCrafting(e:Event):void
		{
			//pun aici ce vreau
			this.removeChildren();
			addChild(new CraftingView());
		}
		
		private function deactivate(e:Event):void 
		{
			// make sure the app behaves well (or exits) when in background
			//NativeApplication.nativeApplication.exit();
		}
		
	}
	
}
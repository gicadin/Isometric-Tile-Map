package Widgets.Tiles 
{
	import flash.display.Bitmap;
	import flash.display.NativeWindowDisplayState;
	import flash.display.Sprite;
	/**
	 * Basic Tile to be used in world map and town, to be extended by all other types of tiles
	 * @author Gicadin
	 */
	public class BasicTile extends Sprite
	{
		// TODO Might have to change this so it gets loaded in the constructor instead of out here 
		[Embed(source="../../../assets/grassTile.png")]
		private var basicTileClass:Class;
		private var basicTile:Bitmap = new basicTileClass(); 
		
		private var xPos:int, yPos:int, zPos:int; 
		public static var tileSize:int = 50; // in pixels, the tile is a square = each side equal
		
		private var tileType:String;
		private var tileTypeList:Vector.<String>; 
		
		public function BasicTile(x:int, y:int, z:int):void 
		{
			xPos = x; 
			yPos = y; 
			zPos = z;
			basicTile.x = x; 
			basicTile.y = y; 
			
			addChild(basicTile); 
			
		}
		
		public function setLocation(x:int, y:int, z:int):void 
		{
			xPos = x; 
			yPos = y; 
			zPos = z;
		}
		
		public function getLocationAsString():String 
		{
			return String( "X-Location:" + xPos.toString() + " Y-Location:" + yPos.toString() + "Z-Location:" + zPos.toString()); 
		}
		
		/* Changes tile to a different type */ 
		public function changeTileType(newTileType:String):void 
		{
			// TODO Iterate through tileTypeList for match, once found: instantiate tile with current data and delete current tile
		}
		
	}

}
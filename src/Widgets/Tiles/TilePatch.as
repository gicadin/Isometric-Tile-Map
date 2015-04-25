package Widgets.Tiles 
{
	import flash.display.Sprite;
	/**
	 * This creates a grid of 8 by 8 tiles to be used by WorldMapView
	 * @author Gicadin
	 */
	public class TilePatch extends Sprite
	{
		private var xPos:int, yPos:int; 
		private var patchSize:int = 8; // partition is a square with a side of 8 tiles
		
		public function TilePatch(location:int)
		{
			var x:int = 0, y:int = 0; 
			for ( var i:int = 0; i < patchSize; i++ ) 
			{
				for ( var j:int = 0; j < patchSize; j ++ ) 
				{
					x = j * BasicTile.tileSize;
					y = i * BasicTile.tileSize;
					addChild(new BasicTile(x, y, 0 ));
				}
			}
		}
		
	}

}
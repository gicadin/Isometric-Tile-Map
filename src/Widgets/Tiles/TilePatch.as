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
			for ( var i:int = 0; i < patchSize * patchSize; i++ ) 
			{
				addChild(new BasicTile(x * BasicTile.tileSize, y * BasicTile.tileSize, 0 ));
				if ( x % ( patchSize-1 ) == 0 && x != 0 ) { x = 0; y += 1;  } else { x += 1; } // patchSize -1 because it starts at 0 
			}
		}
		
	}

}
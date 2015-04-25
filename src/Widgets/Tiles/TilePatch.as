package Widgets.Tiles 
{
	import flash.display.Sprite;
	import flash.geom.Point;
	import Objects.Book;
	/**
	 * This creates a grid of 8 by 8 tiles to be used by WorldMapView
	 * @author Gicadin
	 */
	public class TilePatch extends Sprite
	{
		private var xPos:int, yPos:int; 
		private var xInitialPos:Number = 300;
		private var yInitialPos:Number; 
		
		private var patchSize:int = 18; // partition is a square with a side of 8 tiles
		
		public function TilePatch(location:int)
		{
			var x:int = 0, y:int = 0; 

			for ( var i:int = 0; i < patchSize; i++ ) 
			{
				for ( var j:int = 0; j < patchSize; j ++ ) 
				{
					x = j * BasicTile.tileSize;
					y = i * BasicTile.tileSize;
					
					var x_iso:Number = twoDToIso(x, y).x;
					var y_iso:Number = twoDToIso(x, y).y;
					
					trace("isoX: " + x_iso + "   isoY: " + y_iso);
					var tmpTile:BasicTile = new BasicTile(x_iso, y_iso, 0 );
					
					addChild(tmpTile);
				}
			}
		}
		
		private function twoDToIso(x:Number, y:Number):Point 
		{
			var tmp:Point = new Point(0, 0); 
			tmp.x = x - y;
			tmp.y = (x + y) / 2;
			return tmp;
		}
		
	}

}
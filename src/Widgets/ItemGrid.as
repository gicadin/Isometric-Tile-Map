package Widgets 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import Objects.InventoryItem;
	
	/**
	 * A n x m grid that displays items such as in an inventory
	 */
	
	public class ItemGrid extends Sprite 
	{
		
		[Embed(source="../../assets/inventory_tile.png")]
		public static var InventoryTile:Class;
	
		private const CELL_SIDE:int = 100;
		private var _horizontalSize:int;
		private var _verticalSize:int;
		private var _cells:Vector.<Vector.<Boolean>>
		public function ItemGrid(horizontal:int, vertical:int) 
		{
			super();
			_horizontalSize = horizontal;
			_verticalSize = vertical;

			//initialize the cells
			_cells = new Vector.<Vector.<Boolean>>();
			for (var i:int = 0; i < _horizontalSize; i++ )
			{
				_cells.push(new Vector.<Boolean>());
				for (var j:int = 0; j < _horizontalSize; j++ )
				{
					_cells[i][j] = false;
				}
			}
			//draw the background based on size 
			var tileBMP:Bitmap = new InventoryTile() as Bitmap;
			var tileBMD:BitmapData = tileBMP.bitmapData;
			
			var bg:Sprite=new Sprite();
			bg.graphics.clear();
			bg.graphics.beginBitmapFill(tileBMD);
			bg.graphics.drawRect(0,0,CELL_SIDE * horizontal, CELL_SIDE * vertical);
			addChild(bg);
		}
		
		public function addItem(item:InventoryItem):void
		{
			// check if the cell is empty
			if (_cells[item.gridX][item.gridY] = true)
				throw new Error("Attempting item overlap in grid");
				
			// use the item gridx and gridy to position it
			this.addChild(item);
			
			item.x = CELL_SIDE * item.gridX;
			item.y = CELL_SIDE * item.gridY;
		}
		
		public function removeItem(item:InventoryItem):void
		{
			// check if item really belongs to this grid
			if (!this.contains(item))
				throw new Error("Attempting to remove item that does not belong");
			
			this.removeChild(item);
			this._cells[item.gridX][item.gridY] = false;
		}
	}
	


}
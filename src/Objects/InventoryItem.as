package Objects 
{
	import flash.display.Sprite;
	
	/**
	 * This class represents any item that can be displayed in an item grid
	 * Some InventoryItems may be associated with more complex objects such as armor or weapons
	 */
	public class InventoryItem extends Sprite 
	{
		public var gridX:int;
		public var gridY:int;
		
		public function InventoryItem() 
		{
			super();
			
		}
		
	}

}
package Crafting 
{
	import flash.display.Sprite;
	import Widgets.ItemGrid;
	
	/**
	 * ...
	 * @author Dragoola
	 */
	public class CraftingView extends Sprite 
	{
		private var _model:CraftingModel;
		private var _controller:CraftingController;
		public function CraftingView() 
		{
			super();
			_model = new CraftingModel();
			_controller = new CraftingController();
			addChild(new ItemGrid(5, 5));
		}
	}
}
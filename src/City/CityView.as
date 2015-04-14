package City 
{
	import flash.display.Sprite;
	import Objects.GridElementBase;
	import Widgets.TileGrid;
	
	/**
	 * The view is the visual element. It is the one that gets instantiated when needed
	 * and it then instantiates a controller and passes itself as a parameter.
	 */
	public class CityView extends Sprite 
	{
		private var _grid:TileGrid;
		private var _model:CityModel;
		private var _controller:CityController;
		public function CityView() 
		{
			super();
			_model = new CityModel();
			_controller = new CityController();
			_grid = new TileGrid();
		}
		
		public function addObject(object:GridElementBase):void
		{
			//TODO: add the object to the grid
		}
		
		public function removeObject(object:GridElementBase):void
		{
			//TODO: the object from the grid
		}
		
	}

}
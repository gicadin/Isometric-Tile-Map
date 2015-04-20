package WorldMap 
{
	import Widgets.Tiles.BasicTile;
	import Widgets.Tiles.TilePatch;
	/**
	 * ...
	 * @author Gicadin
	 */
	public class WorldMapController 
	{
		private var _model:WorldMapModel;
		private var _view:WorldMapView; 
		
		private var _testTile:BasicTile;
		private var _testTile2:BasicTile;
		
		public function WorldMapController(worldMapView:WorldMapView):void
		{
			
			_view = worldMapView; 
			
			//_model = new WorldMapModel();
			//_testTile = new BasicTile(1 , 2, 3); 
			//_testTile2 = new BasicTile(51, 2, 3); 
			//_view.addChild(_testTile); 
			//_view.addChild(_testTile2); 
			_view.addChild(new TilePatch(1)); 
		}
		
	}

}


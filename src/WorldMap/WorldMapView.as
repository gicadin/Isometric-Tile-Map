package WorldMap 
{
	import WorldMap.WorldMapModel;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Gicadin
	 */
	public class WorldMapView extends Sprite 
	{
		
		private var _worldMapModel:WorldMapModel;
		private var _worldMapController:WorldMapController; 
		
		public function WorldMapView() 
		{
			
			super();
			
			//_worldMapModel = new WorldMapModel(this);
			_worldMapController = new WorldMapController(this); 
			
			//addChild(_worldMapModel); 
			
		}
		
	}

}
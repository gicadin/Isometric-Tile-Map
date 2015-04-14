package City 
{
	import flash.events.EventDispatcher;
	import Objects.Builiding;
	import Objects.GridElementBase;
	/**
	 * The model stores all the data that is available about the city
	 * It is updated by the controller either due to user input or 
	 * updates from the server
	 */
	public class CityModel
	{
		private var cityObjects:Vector.<GridElementBase>;
		public function CityModel() 
		{
			
		}
		
		public function addObject(object:GridElementBase):void 
		{
			cityObjects.push(object);
			
			//TODO: publish the change to the view
		}
		
		//performs a lazy remove that leaves null in its place
		public function removeBuilding(object:GridElementBase):void
		{
			for (var i = 0; i < cityObjects.length; i++ )
			{
				if (cityObjects[i] == object)
					cityObjects[i] = null
			}
			
			//TODO: publish the change to the view
		}
		
		
	}

}
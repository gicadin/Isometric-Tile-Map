package Objects 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Dragoola
	 */
	public class Book extends Sprite 
	{
		[Embed(source="../../assets/BookAsset.png")]
		public static var BookAsset:Class;
		
		public var title:String;
		
		public function Book() 
		{
			super();
			addChild(new BookAsset() as Bitmap);
		}
		
	}

}
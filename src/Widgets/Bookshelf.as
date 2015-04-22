package Widgets 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.Event;
	import Objects.Book;
	
	/**
	 * ...
	 * @author Dragoola
	 */
	public class Bookshelf extends Sprite 
	{
		[Embed(source="../../assets/Shelf.png")]
		public static var ShelfAsset:Class;
		
		[Embed(source="../../assets/LibraryBackground.png")]
		public static var LibraryBackgroundAsset:Class;
		
		private static var SHELF_HEIGHT:Number = 150;
		private static var BOOK_DISTANCE:Number = 100;
		private var bookLayer:Sprite;
		private var shelvesOccupancy:Vector.<int>;
		public function Bookshelf() 
		{
			super();
			
			bookLayer = new Sprite();
			shelvesOccupancy = new Vector.<int>();
			if (this.stage != null)
				initialize(null);
			else
				this.addEventListener(Event.ADDED_TO_STAGE, initialize);
				
				
		}
		
		private function initialize(e:Event):void
		{
			// add the background
			var bgBMP:Bitmap = new LibraryBackgroundAsset() as Bitmap;
			var bgBMD:BitmapData = bgBMP.bitmapData;
			var bg:Sprite = new Sprite();
			bg.graphics.clear();
			bg.graphics.beginBitmapFill(bgBMD);
			bg.graphics.drawRect(0,0,stage.stageWidth, stage.stageHeight);
			addChild(bg);
			
			// add the shelfs
			var i:Number = 0;
			while (i < this.height)
			{
				// add a shelf at this height
				var currentShelf:Bitmap = new ShelfAsset() as Bitmap;
				bg.addChild(currentShelf);
				currentShelf.y = i;
				i += SHELF_HEIGHT;
			}
			
			// add the book layer
			this.addChild(bookLayer);
			
		}
		
		public function addBook(book:Book, shelf:int):void
		{
			// check shelf occupancy
			for (var i:int = 0; i <= shelf; i++)
			{
				if (shelvesOccupancy.length < i + 1)
					shelvesOccupancy.push(0);
			}
			shelvesOccupancy[shelf]++;
			bookLayer.addChild(book);
			book.y = shelf * SHELF_HEIGHT;
			book.x = (book.width + BOOK_DISTANCE) * (shelvesOccupancy[shelf] - 1);
		}
	}

}
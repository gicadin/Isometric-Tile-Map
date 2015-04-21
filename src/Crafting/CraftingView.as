package Crafting 
{
	import flash.display.Sprite;
	import Objects.Book;
	import Subviews.Bookshelf;
	import Widgets.ItemGrid;
	
	/**
	 * ...
	 * @author Dragoola
	 */
	public class CraftingView extends Sprite 
	{
		private var _model:CraftingModel;
		private var _controller:CraftingController;
		
		private var _bookshelf:Bookshelf;
		public function CraftingView() 
		{
			super();
			_model = new CraftingModel();
			_controller = new CraftingController();
			_bookshelf = new Bookshelf();
			this.addChild(_bookshelf);
			
			_bookshelf.addBook(new Book(), 0);
			_bookshelf.addBook(new Book(), 0);
			
			_bookshelf.addBook(new Book(), 1);
			_bookshelf.addBook(new Book(), 2);
		}
	}
}
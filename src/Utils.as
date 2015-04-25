package 
{
	/**
	 * ...
	 * @author Dragoola
	 */
	public class Utils 
	{
		
		public function Utils() 
		{
			
		}
		
		public static function NearEquals(a:Number, b:Number, proximity:Number = 0.5):Boolean
		{
		  if ( Math.abs(a - b) < proximity)
			return true;
	      return false;
		}
		
		public static function BoundByInterval(value:Number, min:Number, max:Number):Number
		{
			if (value > max)
				return max;
			if (value < min)
				return min;
			return value;
		}
		
		
	}

}
package;

import openfl.utils.Assets as OpenFlAssets;
import flixel.FlxG;

class Paths
{
	static var currentLevel:String;

	static public function file(file:String)
	{
		var path = 'assets/$file';
		if (currentLevel != null && OpenFlAssets.exists('$currentLevel:$path'))
			return '$currentLevel:$path';

		return path;
	}

	inline static public function image(key:String)
	{
		return file('images/$key.png');
	}

	inline static public function font(key:String)
	{
		return 'assets/fonts/$key';
	}
}  
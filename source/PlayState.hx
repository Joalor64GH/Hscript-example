package;

import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.FlxState;
import flixel.FlxBasic;
import flixel.FlxG;
import openfl.Lib;
import horny.*;

class PlayState extends FlxState
{
	var hscript:HornyScript;

	public function new() 
	{
		super();

		try
		{
			hscript = new HornyScript("assets/data/script.hx");
			hscript.run();
        		hscript.executeFunc("new");
		}
		catch (e)
		{
			var errText:FlxText = new FlxText(0, 0, 0, "Oops! There was an error with the script!" + "\n" + e.message, 64);
        		errText.screenCenter();
        		add(errText);
		}
	}

	override public function create()
	{
		var coolText:FlxText = new FlxText(5, FlxG.height - 44, 0, "Hello World", 22);
		coolText.scrollFactor.set();
		coolText.setFormat("VCR OSD Mono", 26, 0xFFffffff, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(coolText);

		super.create();

		hscript.executeFunc("create");
	}
	
	override public function update(elapsed:Float) 
	{
		super.update(elapsed);

		hscript.executeFunc("update", [elapsed]);
		hscript.executeFunc("updatePost", [elapsed]);
	}
}

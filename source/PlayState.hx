package;

import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.FlxState;
import flixel.FlxBasic;
import flixel.FlxG;
import horny.*;

class PlayState extends FlxState
{
	public static var instance:PlayState = null;

	public var hscript:HornyScript;

	public function new() 
	{
		super();
		
        hscript = new HornyScript("main.hx");
		hscript.setVariable("state", this);
        hscript.setVariable("add", function(obj:FlxBasic) {add(obj);});
        hscript.setVariable("remove", function(obj:FlxBasic) {remove(obj);});
        hscript.setVariable("insert", function(i:Int, obj:FlxBasic) {insert(i, obj);});
        hscript.run();
        hscript.executeFunc("new");
	}

	override public function create()
	{
		instance = this;

		var coolText:FlxText = new FlxText(5, FlxG.height - 44, 0, "Hello World", 22);
		coolText.scrollFactor.set();
		coolText.setFormat(Paths.font('comic.ttf'), 26, 0xFFffffff, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
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
package states;

import flixel.FlxG;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import utilities.CurrentSelected;

class MenuState extends FlxState
{
	public var curSel:CurrentSelected = new CurrentSelected(0);

	public var options:Array<String> = ['story mode', 'freeplay', 'mods', 'awards', 'donate', 'play', 'options'];
	public var optGrp:FlxTypedGroup<FlxText>;

	override public function create()
	{
		// unessesary initalize since the 'new' function already does this
		// curSel.initalize(0);

		optGrp = new FlxTypedGroup<FlxText>();

		for (i in 0...options.length)
		{
			var txt:FlxText = new FlxText(0, 80 * (i + 1), 0, options[i], 128 - ((options.length + 1) * 5));
			txt.ID = i;
			txt.screenCenter(X);
			txt.y -= 60;
			optGrp.add(txt);
		}

		add(optGrp);

		super.create();
	}

	override public function update(elapsed:Float)
	{
		if (FlxG.keys.justReleased.UP)
			curSel.change(-1);
		if (FlxG.keys.justReleased.DOWN)
			curSel.change(1);

		if (curSel.curSelected > (options.length - 1))
			curSel.curSelected = (options.length - 1);
		if (curSel.curSelected < 0)
			curSel.curSelected = 0;

		optGrp.forEach(function(text:FlxText)
		{
			text.color = 0xffffff;

			if (curSel.curSelected == text.ID)
				text.color = 0xffff00;
		});

		if (FlxG.keys.justReleased.ENTER)
		{
			switch (options[curSel.curSelected])
			{
				default:
					FlxG.switchState(new PlayState());
			}
		}

		super.update(elapsed);
	}
}

package states;

import flixel.FlxG;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import utilities.CurrentSelected;

class MenuState extends FlxState
{
	public var curSel:CurrentSelected;

	public var options:Array<String> = ['play', 'options'];
	public var optGrp:FlxTypedGroup<FlxText>;

	override public function create()
	{
		curSel.initalize(0);

		optGrp = new FlxTypedGroup<FlxText>();

		for (i in 0...options.length)
		{
			var txt:FlxText = new FlxText(0, 120 * (i + 1) * options.length, 0, options[i]);
			txt.ID = i;
			txt.screenCenter(X);
			optGrp.add(txt);
		}

		super.create();
	}

	override public function update(elapsed:Float)
	{
		if (FlxG.keys.justReleased.LEFT)
			curSel.change(-1);
		if (FlxG.keys.justReleased.RIGHT)
			curSel.change();

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

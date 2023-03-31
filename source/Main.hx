package;

import flixel.FlxGame;
import openfl.display.FPS;
import openfl.display.Sprite;

class Main extends Sprite
{
	public function new()
	{
		super();
		addChild(new FlxGame(0, 0, states.MenuState));

		var fps:FPS = new FPS(0, 0, 0xffffff);
		addChild(fps);
	}
}

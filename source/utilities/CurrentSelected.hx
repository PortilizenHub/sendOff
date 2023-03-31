package utilities;

class CurrentSelected
{
	public var curSelected:Int = 0;

	public function change(amount:Int = 1)
		curSelected += amount;

	public function initalize(amount:Int = 1)
		curSelected = amount;
}

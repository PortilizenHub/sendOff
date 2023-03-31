package utilities;

class File
{
	public static var soundEnd:String = #if web '.mp3'; #else '.ogg'; #end

	public static function image(file:String, ?folder:String = '')
		return 'assets/$folder/images/$file.png';

	public static function data(file:String, type:String, ?folder:String = '')
		return 'assets/$folder/data/$file.$type';

	public static function music(file:String, ?folder:String = '')
		return 'assets/$folder/music/$file.$soundEnd';

	public static function sound(file:String, ?folder:String = '')
		return 'assets/$folder/sounds/$file.$soundEnd';
}

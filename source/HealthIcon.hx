package;

import flixel.FlxSprite;

class HealthIcon extends FlxSprite
{
	/**
	 * Used for FreeplayState! If you use it elsewhere, prob gonna annoying
	 */

	 //i understand
	public var sprTracker:FlxSprite;

	public function new(char:String = 'bf', isPlayer:Bool = false)
	{
		super();
		
		loadGraphic(Paths.image('iconGrid'), true, 150, 150);


		animation.add('bf', [0, 1, 34], 0, false, isPlayer);
		animation.add('bf-car', [0, 1], 0, false, isPlayer);
		animation.add('bf-christmas', [0, 1], 0, false, isPlayer);
		animation.add('bf-pixel', [21, 21], 0, false, isPlayer);
		animation.add('3d-bf', [39, 40, 41], 0, false, isPlayer);
		animation.add('spooky', [2, 3], 0, false, isPlayer);
		animation.add('pico', [4, 5], 0, false, isPlayer);
		animation.add('mom', [6, 7], 0, false, isPlayer);
		animation.add('mom-car', [6, 7], 0, false, isPlayer);
		animation.add('tankman', [8, 9], 0, false, isPlayer);
		animation.add('face', [10, 11], 0, false, isPlayer);
		animation.add('dad', [12, 13], 0, false, isPlayer);
		animation.add('senpai', [22, 22], 0, false, isPlayer);
		animation.add('senpai-angry', [22, 22], 0, false, isPlayer);
		animation.add('spirit', [23, 23], 0, false, isPlayer);
		animation.add('bf-old', [14, 15], 0, false, isPlayer);
		animation.add('gf', [16], 0, false, isPlayer);
		animation.add('gf-christmas', [16], 0, false, isPlayer);
		animation.add('gf-pixel', [16], 0, false, isPlayer);
		animation.add('parents-christmas', [17, 18], 0, false, isPlayer);
		animation.add('monster', [19, 20], 0, false, isPlayer);
		animation.add('monster-christmas', [19, 20], 0, false, isPlayer);
		animation.add('matt', [24, 25], 0, false, isPlayer);
		animation.add('bob', [26, 27], 0, false, isPlayer);
		animation.add('bob-player', [26, 27, 46], 0, false, isPlayer);
		animation.add('bob-bersama', [28, 29], 0, false, isPlayer);
		animation.add('gw-3d', [30, 31, 35], 0, false, isPlayer);
		animation.add('gw-3d-mad', [32, 33], 0, false, isPlayer);
		animation.add('gerlad', [35, 36], 0, false, isPlayer);
		animation.add('thierry-mad', [37, 38], 0, false, isPlayer);
		animation.add('fake', [42, 43], 0, false, isPlayer);
		animation.add('bob-real-omg', [44, 45], 0, false, isPlayer);
		animation.play(char);
		switch(char){
			case 'bf-pixel' | 'senpai' | 'senpai-angry' | 'spirit' | 'gf-pixel':
				{

				}
			default:
				{
					antialiasing = true;
				}
		}
		scrollFactor.set();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);
	}
}

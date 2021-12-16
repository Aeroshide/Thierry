package;

import openfl.Lib;
import Options;
import Controls.Control;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.input.keyboard.FlxKey;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;

class OptionsMenu extends MusicBeatState
{
	var selector:FlxText;
	var curSelected:Int = 0;
	var menuBG:FlxSprite = new FlxSprite().loadGraphic(Paths.image("menuDesat"));

	var options:Array<OptionCatagory> = [

		#if debug
		new OptionCatagory("Debug", [
			#if debug
			new Invincibility("No death"),
			new MemTrace("Enables memory tracing hehe")
			#end
		]),
		#end

		new OptionCatagory("Gameplay", [
			new DFJKOption(controls),
			new InsaneDifficulty("Count as miss if player press a key, and note is not hitting the receptor"),
			new Judgement("Customize your Hit Timings (LEFT or RIGHT)"),
			new InputSystem("Kade has very sensitive antimash penalty, Mine just disables antimash completely"),
			#if desktop
			
			#end
			new DownscrollOption("Change the layout of the strumline."),
			new ScrollSpeedOption("Change your scroll speed (Left for -0.1, right for +0.1. If its at 1, it will be chart dependent)"),
			//new AccuracyDOption("Change how accuracy is calculated. (Accurate = Simple, Complex = Milisecond Based)"),
			// new OffsetMenu("Get a note offset based off of your inputs!"),
			//new CustomizeGameplay("Drag'n'Drop Gameplay Modules around to your preference")
		]),
		new OptionCatagory("Visuals, UI and Sounds", [
			new SongPositionOption("Show the songs current position (as a bar)"),
			new HitSounds("You would hear a TICK, if you hit a note"),
			new Spong("Display a note splash whenever you hit SICK note (like in FNF week 7 update)"),
			new AccuracyOption("Simplified is bassically like on psych engine, and competitive is original kade engine score text")
			
			
		]),
		
		new OptionCatagory("Misc", [
			new MailCatmode("Do you want ThierryEngine to be dumb or smort (does absolutely nothing)"),
			new JokeSettings("Coba liat option pasti ada yang aneh -Thierry"),		
			new BigShot("Play BIG SHOT for no fucking reason")

			
		]),

		new OptionCatagory("Engine", [
			#if desktop
			new FPSCapOption("Cap your FPS (Left for -10, Right for +10. SHIFT to go faster)"),
			new FPSOption("Toggle the FPS Counter"),
			new RainbowFPSOption("Make the FPS Counter Rainbow (Only works with the FPS Counter toggeled on)"),
			#end
			new WatermarkOption("Turn off all watermarks from the engine."),
			new Ilang("Reset all mod variables to its default value")
		])
		
	];

	private var currentDescription:String = "";
	private var grpControls:FlxTypedGroup<Alphabet>;
	public static var versionShit:FlxText;
	public var blackBox:FlxSprite;

	var currentSelectedCat:OptionCatagory;

	override function create()
	{

		

		menuBG.color = 0xFFea71fd;
		menuBG.setGraphicSize(Std.int(menuBG.width * 1.1));
		menuBG.updateHitbox();
		menuBG.screenCenter();
		menuBG.antialiasing = true;
		add(menuBG);

		blackBox = new FlxSprite().makeGraphic(6969, 34, FlxColor.BLACK, false);
		blackBox.alpha = 0.7;
		blackBox.screenCenter(Y);
		blackBox.y += 350;
		add(blackBox);

		grpControls = new FlxTypedGroup<Alphabet>();
		add(grpControls);

		for (i in 0...options.length)
		{
			var controlLabel:Alphabet = new Alphabet(0, (70 * i) + 30, options[i].getName(), true, false);
			controlLabel.screenCenter(X);
			controlLabel.isMenuItem = true;
			controlLabel.targetY = i;
			grpControls.add(controlLabel);
			// DONT PUT X IN THE FIRST PARAMETER OF new ALPHABET() !!
		}

		currentDescription = "none";

		versionShit = new FlxText(5, FlxG.height - 28, 0, "Offset (Left, Right): " + FlxG.save.data.offset, 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 24, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);

		super.create();
	}

	var isCat:Bool = false;
	
	public static function truncateFloat( number : Float, precision : Int): Float {
		var num = number;
		num = num * Math.pow(10, precision);
		num = Math.round( num ) / Math.pow(10, precision);
		return num;
		}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

			for (item in grpControls.members)
			{
				
				item.screenCenter(X);

				item.alpha = 0.4;
				// item.setGraphicSize(Std.int(item.width * 0.8));

				if (item.targetY == 0)
				{
					item.alpha = 1;
					// item.setGraphicSize(Std.int(item.width));
				}
			}

			if (isCat)
			{
				currentDescription = currentSelectedCat.getOptions()[curSelected].getDescription();
			}

			
			if (controls.BACK && !isCat)
			{
				FlxG.switchState(new MainMenuState());
			}
			else if (controls.BACK)
			{
				isCat = false;
				grpControls.clear();
				for (i in 0...options.length)
					{
						var controlLabel:Alphabet = new Alphabet(0, (70 * i) + 30, options[i].getName(), true, false);
						controlLabel.isMenuItem = true;
						controlLabel.targetY = i;

						grpControls.add(controlLabel);
						// DONT PUT X IN THE FIRST PARAMETER OF new ALPHABET() !!
					}
				curSelected = 0;
			}
			if (controls.UP_P)
			{
				trace(menuBG.y + "y val");
				if (menuBG.y <= -15)
				{
					menuBG.y += 20;
				}	
				changeSelection(-1);
			}
				
			if (controls.DOWN_P)
			{
				trace(menuBG.y + "y val");
				if (menuBG.y >= -180)
				{
					menuBG.y -= 20;
				}	
				changeSelection(1);
			}
				
			
			if (isCat)
			{
				if (currentSelectedCat.getOptions()[curSelected].getAccept())
				{
					if (FlxG.keys.pressed.SHIFT)
						{
							if (FlxG.keys.pressed.RIGHT)
								currentSelectedCat.getOptions()[curSelected].right();
							if (FlxG.keys.pressed.LEFT)
								currentSelectedCat.getOptions()[curSelected].left();
						}
					else
					{
						if (FlxG.keys.justPressed.RIGHT)
							currentSelectedCat.getOptions()[curSelected].right();
						if (FlxG.keys.justPressed.LEFT)
							currentSelectedCat.getOptions()[curSelected].left();
					}
				}
				else
				{
					versionShit.text = currentDescription;
				}
			}
			else
			{
				if (FlxG.keys.pressed.SHIFT)
					{
						if (FlxG.keys.justPressed.RIGHT)
							FlxG.save.data.offset += 0.1;
						else if (FlxG.keys.justPressed.LEFT)
							FlxG.save.data.offset -= 0.1;
					}
					else if (FlxG.keys.pressed.RIGHT)
						FlxG.save.data.offset += 0.1;
					else if (FlxG.keys.pressed.LEFT)
						FlxG.save.data.offset -= 0.1;
				
				versionShit.text = "Offset (Left, Right, Shift for slow): " + truncateFloat(FlxG.save.data.offset,2);
			}
		

			if (controls.RESET)
					FlxG.save.data.offset = 0;

			if (controls.ACCEPT)
			{
				if (isCat)
				{
					if (currentSelectedCat.getOptions()[curSelected].press()) {
						grpControls.remove(grpControls.members[curSelected]);
						var ctrl:Alphabet = new Alphabet(0, (70 * curSelected) + 30, currentSelectedCat.getOptions()[curSelected].getDisplay(), true, false);
						ctrl.isMenuItem = true;
						grpControls.add(ctrl);
					}
				}
				else
				{
					currentSelectedCat = options[curSelected];
					isCat = true;
					grpControls.clear();
					for (i in 0...currentSelectedCat.getOptions().length)
						{
							var controlLabel:Alphabet = new Alphabet(0, (70 * i) + 30, currentSelectedCat.getOptions()[i].getDisplay(), true, false);
							controlLabel.isMenuItem = true;
							controlLabel.targetY = i;
							grpControls.add(controlLabel);
							// DONT PUT X IN THE FIRST PARAMETER OF new ALPHABET() !!
						}
					curSelected = 0;
				}
			}
		FlxG.save.flush();
	}

	var isSettingControl:Bool = false;

	function changeSelection(change:Int = 0)
	{
		#if !switch
		// NGio.logEvent("Fresh");
		#end
		
		FlxG.sound.play(Paths.sound("scrollMenu"), 0.4);

		curSelected += change;

		if (curSelected < 0)
			curSelected = grpControls.length - 1;
		if (curSelected >= grpControls.length)
			curSelected = 0;

		if (isCat)
			currentDescription = currentSelectedCat.getOptions()[curSelected].getDescription();
		else
			currentDescription = "Please select an Option";
		versionShit.text = currentDescription;

		// selector.y = (70 * curSelected) + 30;

		var bullShit:Int = 0;

		for (item in grpControls.members)
		{
			
			item.targetY = bullShit - curSelected;
			item.screenCenter(X);
			bullShit++;

			item.alpha = 0.4;
			// item.setGraphicSize(Std.int(item.width * 0.8));

			if (item.targetY == 0)
			{
				item.alpha = 1;
				// item.setGraphicSize(Std.int(item.width));
			}
		}
	}
}

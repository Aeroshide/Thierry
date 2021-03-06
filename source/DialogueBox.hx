package;

import flixel.system.FlxSound;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.text.FlxTypeText;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxSpriteGroup;
import flixel.input.FlxKeyManager;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

using StringTools;

class DialogueBox extends FlxSpriteGroup
{
	var box:FlxSprite;

	var curCharacter:String = '';

	var dialogue:Alphabet;
	var dialogueList:Array<String> = [];
	var text:String = "NO WAY THE RED BOB APPEARED";

	// SECOND DIALOGUE FOR THE PIXEL SHIT INSTEAD???
	var swagDialogue:FlxTypeText;

	var dropText:FlxText;

	public var finishThing:Void->Void;
	var hasSkipped:Bool = false;

	var portraitLeft:FlxSprite;
	var portraitRight:FlxSprite;
	var gwRight:FlxSprite;
	var raditRight:FlxSprite;
	var gw3D:FlxSprite;
	var geral:FlxSprite;
	var meksi:FlxSprite;
	var marsel:FlxSprite;
	var bf3D:FlxSprite;

	var handSelect:FlxSprite;
	var bgFade:FlxSprite;

	var sound:FlxSound;

	public function new(talkingRight:Bool = true, ?dialogueList:Array<String>)
	{
		super();

		switch (PlayState.SONG.song.toLowerCase())
		{
			case 'ded':
				sound = new FlxSound().loadEmbedded(Paths.music('Lunchbox'),true);
				sound.volume = 0;
				FlxG.sound.list.add(sound);
				sound.fadeIn(1, 0, 0.8);
			case 'anjing':
				if (FlxG.save.data.shouldHearAmbience)
				{
					sound = new FlxSound().loadEmbedded(Paths.music('SekolahSore'),true);
					sound.volume = 0;
					FlxG.sound.list.add(sound);
					sound.fadeIn(1, 0, 0.8);
				}

			case 'meninggal':
				sound = new FlxSound().loadEmbedded(Paths.music('gw'),true);
				sound.volume = 0;
				FlxG.sound.list.add(sound);
				sound.fadeIn(1, 0, 0.8);
		}

		bgFade = new FlxSprite(-200, -200).makeGraphic(Std.int(FlxG.width * 1.3), Std.int(FlxG.height * 1.3), 0xFFB3DFd8);
		bgFade.scrollFactor.set();
		bgFade.alpha = 0;
		add(bgFade);

		new FlxTimer().start(0.83, function(tmr:FlxTimer)
		{
			bgFade.alpha += (1 / 5) * 0.7;
			if (bgFade.alpha > 0.7)
				bgFade.alpha = 0.7;
		}, 5);

		box = new FlxSprite(-20, 45);
		
		var hasDialog = false;
		switch (PlayState.SONG.song.toLowerCase())
		{
			case 'ded' | 'revenge' | 'gerlad' | 'segitiga':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('dialogstuff/pixelUI/speech_bubble_talking', 'shared');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByIndices('normal', 'speech bubble normal', [4], "", 24);
				box.width = 200;
				box.height = 200;
				box.x = 100;
				box.y = 375;
			case 'anjing':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('dialogstuff/pixelUI/speech_bubble_talking', 'shared');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByIndices('normal', 'speech bubble normal', [4], "", 24);
				box.width = 200;
				box.height = 200;
				box.x = 100;
				box.y = 375;

			case 'meninggal':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('dialogstuff/pixelUI/speech_bubble_talking', 'shared');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByIndices('normal', 'speech bubble normal', [4], "", 24);
				box.width = 200;
				box.height = 200;
				box.x = 100;
				box.y = 375;
			case 'gerselo':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('dialogstuff/pixelUI/speech_bubble_talking', 'shared');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByIndices('normal', 'speech bubble normal', [4], "", 24);
				box.width = 200;
				box.height = 200;
				box.x = 100;
				box.y = 375;
			case 'roasting':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('dialogstuff/pixelUI/speech_bubble_talking', 'shared');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByIndices('normal', 'speech bubble normal', [4], "", 24);
				box.width = 200;
				box.height = 200;
				box.x = 100;
				box.y = 375;
			case 'get-out':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('dialogstuff/pixelUI/speech_bubble_talking', 'shared');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByIndices('normal', 'speech bubble normal', [4], "", 24);
				box.width = 200;
				box.height = 200;
				box.x = 100;
				box.y = 375;
			case 'screw-you':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('dialogstuff/pixelUI/speech_bubble_talking', 'shared');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByIndices('normal', 'speech bubble normal', [4], "", 24);
				box.width = 200;
				box.height = 200;
				box.x = 100;
				box.y = 375;
			case 'latihan':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('dialogstuff/pixelUI/speech_bubble_talking', 'shared');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByIndices('normal', 'speech bubble normal', [4], "", 24);//
				box.width = 200;
				box.height = 200;
				box.x = 100;
				box.y = 375;
			case 'roasting':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('dialogstuff/pixelUI/speech_bubble_talking', 'shared');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByIndices('normal', 'speech bubble normal', [4], "", 24);
				box.width = 200;
				box.height = 200;
				box.x = 100;
				box.y = 375;
			case 'cut0':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('dialogstuff/pixelUI/speech_bubble_talking', 'shared');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByIndices('normal', 'speech bubble normal', [4], "", 24);
				box.width = 200;
				box.height = 200;
				box.x = 100;
				box.y = 375;
			case 'cut1':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('dialogstuff/pixelUI/speech_bubble_talking', 'shared');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByIndices('normal', 'speech bubble normal', [4], "", 24);
				box.width = 200;
				box.height = 200;
				box.x = 100;
				box.y = 375;
			case 'cut2':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('dialogstuff/pixelUI/speech_bubble_talking', 'shared');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByIndices('normal', 'speech bubble normal', [4], "", 24);
				box.width = 200;
				box.height = 200;
				box.x = 100;
				box.y = 375;
		}

		this.dialogueList = dialogueList;
		
		if (!hasDialog)
			return;

		//IM STUPID SO LEFT AND RIGHT ARE FLIPPED (EXCEPT FOR THE ONES THAT IS NOT MINE)
		
		portraitLeft = new FlxSprite(0, 10);
		portraitLeft.frames = Paths.getSparrowAtlas('dialogstuff/thierryPortrait', 'shared'); //FIX OFFSET
		portraitLeft.animation.addByPrefix('enter', 'Portrait Enter instance', 24, false);
		portraitLeft.setGraphicSize(Std.int(portraitLeft.width * PlayState.daPixelZoom * 0.175));
		portraitLeft.updateHitbox();
		portraitLeft.scrollFactor.set();
		add(portraitLeft);
		portraitLeft.visible = false;

		portraitRight = new FlxSprite(0, 40);
		portraitRight.frames = Paths.getSparrowAtlas('dialogstuff/boyfriendPortrait', 'shared');
		portraitRight.animation.addByPrefix('enter', 'Portrait Enter instance', 24, false);
		portraitRight.setGraphicSize(Std.int(portraitRight.width * PlayState.daPixelZoom * 0.15));
		portraitRight.updateHitbox();
		portraitRight.scrollFactor.set();
		add(portraitRight);
		portraitRight.visible = false;
		
		bf3D = new FlxSprite(0, 40);
		bf3D.frames = Paths.getSparrowAtlas('dialogstuff/boyfriend3dPortrait', 'shared');
		bf3D.animation.addByPrefix('enter', 'Portrait Enter instance', 24, false);
		bf3D.setGraphicSize(Std.int(bf3D.width * PlayState.daPixelZoom * 0.15));
		bf3D.updateHitbox();
		bf3D.scrollFactor.set();
		add(bf3D);
		bf3D.visible = false;

		gwRight = new FlxSprite(-80, 120);
		gwRight.frames = Paths.getSparrowAtlas('dialogstuff/gwPortrait', 'shared');
		gwRight.animation.addByPrefix('enter', 'Bob Portrait Enter', 24, false);
		gwRight.setGraphicSize(Std.int(gwRight.width * PlayState.daPixelZoom * 0.15));
		gwRight.updateHitbox();
		gwRight.scrollFactor.set();
		add(gwRight);
		gwRight.visible = false;

		meksi = new FlxSprite(-80, 20);
		meksi.frames = Paths.getSparrowAtlas('dialogstuff/meksi', 'shared');
		meksi.animation.addByPrefix('enter', 'Portrait Enter instance', 24, false);
		meksi.setGraphicSize(Std.int(meksi.width * PlayState.daPixelZoom * 0.15));
		meksi.updateHitbox();
		meksi.scrollFactor.set();
		add(meksi);
		meksi.visible = false;

		marsel = new FlxSprite(-80, 80);
		marsel.frames = Paths.getSparrowAtlas('dialogstuff/achelPortrait', 'shared');
		marsel.animation.addByPrefix('enter', 'Portrait Enter instance', 24, false);
		marsel.setGraphicSize(Std.int(marsel.width * PlayState.daPixelZoom * 0.15));
		marsel.updateHitbox();
		marsel.scrollFactor.set();
		add(marsel);
		marsel.visible = false;

		geral = new FlxSprite(-80, 80);
		geral.frames = Paths.getSparrowAtlas('dialogstuff/geraldPortrait', 'shared');
		geral.animation.addByPrefix('enter', 'Portrait Enter instance', 24, false);
		geral.setGraphicSize(Std.int(geral.width * PlayState.daPixelZoom * 0.15));
		geral.updateHitbox();
		geral.scrollFactor.set();
		add(geral);
		geral.visible = false;

		gw3D = new FlxSprite(-130, 120);
		gw3D.frames = Paths.getSparrowAtlas('dialogstuff/gw3DPort', 'shared');
		gw3D.animation.addByPrefix('enter', 'dave furiosity portrait', 24, false);
		gw3D.setGraphicSize(Std.int(gw3D.width * PlayState.daPixelZoom * 0.275));
		gw3D.updateHitbox();
		gw3D.antialiasing = true;
		gw3D.scrollFactor.set();
		add(gw3D);
		gw3D.visible = false;

		raditRight = new FlxSprite(-80, 0);
		raditRight.frames = Paths.getSparrowAtlas('dialogstuff/raditPortrait', 'shared');
		raditRight.animation.addByPrefix('enter', 'Portrait Enter instance', 24, false);
		raditRight.setGraphicSize(Std.int(raditRight.width * PlayState.daPixelZoom * 0.15));
		raditRight.updateHitbox();
		raditRight.scrollFactor.set();
		add(raditRight);
		raditRight.visible = false;

		
		box.animation.play('normalOpen');
		box.setGraphicSize(Std.int(box.width * PlayState.daPixelZoom * 0.9));
		box.updateHitbox();
		add(box);

		box.screenCenter(X);
		portraitLeft.screenCenter(X);

		handSelect = new FlxSprite(FlxG.width * 0.9, FlxG.height * 0.9).loadGraphic(Paths.image('dialogstuff/pixelUI/hand_textbox'), 'shared');
		add(handSelect);


		if (!talkingRight)
		{
			// box.flipX = true;
		}

		dropText = new FlxText(242, 502, Std.int(FlxG.width * 0.6), "", 32);
		dropText.font = 'Pixel Arial 11 Bold';
		dropText.color = 0xFFD89494;
		add(dropText);

		swagDialogue = new FlxTypeText(240, 500, Std.int(FlxG.width * 0.6), "", 32);
		swagDialogue.font = 'Pixel Arial 11 Bold';
		swagDialogue.color = 0xFF3F2021;
		swagDialogue.sounds = [FlxG.sound.load(Paths.sound('pixelText'), 0.6)];
		add(swagDialogue);

		dialogue = new Alphabet(0, 80, "", false, true);
		// dialogue.x = 90;
		// add(dialogue);
	}

	var dialogueOpened:Bool = false;
	var dialogueStarted:Bool = false;

	override function update(elapsed:Float)
	{
		/* HARD CODING CUZ IM STUPDI (YEAH YOURE STUPID, THIS WHAT MAKES THE DIALOGUE NOT LOAD IDIOT)
		if (PlayState.SONG.song.toLowerCase() == 'ded')
			portraitLeft.visible = false;
		if (PlayState.SONG.song.toLowerCase() == 'anjing')
			portraitLeft.visible = false;
		if (PlayState.SONG.song.toLowerCase() == 'roasting')
			portraitLeft.visible = false;
		if (PlayState.SONG.song.toLowerCase() == 'meninggal')
			portraitLeft.visible = false;
		if (PlayState.SONG.song.toLowerCase() == 'get-out')
			portraitLeft.visible = false;
		if (PlayState.SONG.song.toLowerCase() == 'screw-you')
			portraitLeft.visible = false;
		if (PlayState.SONG.song.toLowerCase() == 'latihan')
			portraitLeft.visible = false;
		if (PlayState.SONG.song.toLowerCase() == 'cut0')
			portraitLeft.visible = false;
		if (PlayState.SONG.song.toLowerCase() == 'cut1')
			portraitLeft.visible = false;
		if (PlayState.SONG.song.toLowerCase() == 'cut2')
			portraitLeft.visible = false;
		/****/

		dropText.text = swagDialogue.text;

		if (box.animation.curAnim != null)
		{
			if (box.animation.curAnim.name == 'normalOpen' && box.animation.curAnim.finished)
			{
				box.animation.play('normal');
				dialogueOpened = true;
			}
		}

		if (dialogueOpened && !dialogueStarted)
		{
			startDialogue();
			dialogueStarted = true;
		}

		if (PlayerSettings.player1.controls.ACCEPT && dialogueStarted == true)
		{
			hasSkipped = true;
			remove(dialogue);
				
			FlxG.sound.play(Paths.sound('clickText'), 0.8);

			if (dialogueList[1] == null && dialogueList[0] != null)
			{
				if (!isEnding)
				{
					isEnding = true;

					if (PlayState.SONG.song.toLowerCase() == 'anjing' && FlxG.save.data.shouldHearAmbience || PlayState.SONG.song.toLowerCase() == 'ded' || PlayState.SONG.song.toLowerCase() == 'meninggal')
						sound.fadeOut(2.2, 0);
					new FlxTimer().start(0.2, function(tmr:FlxTimer)
					{
						box.alpha -= 1 / 5;
						bgFade.alpha -= 1 / 5 * 0.7;
						portraitLeft.visible = false;
						gwRight.visible = false;
						raditRight.visible = false;
						portraitRight.visible = false;
						swagDialogue.alpha -= 1 / 5;
						dropText.alpha = swagDialogue.alpha;
					}, 5);

					new FlxTimer().start(1.2, function(tmr:FlxTimer)
					{
						finishThing();
						kill();
					});
				}
			}
			else
			{
				dialogueList.remove(dialogueList[0]);
				startDialogue();
				
				//startDialogue();
			}
		}
		
		super.update(elapsed);
	}

	var isEnding:Bool = false;

	function startDialogue():Void
	{
		hasSkipped = false;
		cleanDialog();
		// var theDialog:Alphabet = new Alphabet(0, 70, dialogueList[0], false, true);
		// dialogue = theDialog;
		// add(theDialog);

		// swagDialogue.text = ;
		swagDialogue.resetText(dialogueList[0]);
		swagDialogue.start(0.04, true);

		/*
		KEY = DISABLE EVERYTHING EXCEPT [SELF]
		IF STATEMENT = IF SELF IS VISIBLE
		IF STATEMENT EXEC = SELF IS VISIBLE
		portraitRight.visible = false;
		gwRight.visible = false;
		raditRight.visible = false;
		geral.visible = false;
		meksi.visible = false;
		marsel.visible = false;
		gw3D.visible = false;
		portraitLeft.visible = false;
		/****/

		switch (curCharacter) // 
		{
			case 'dad':
				bf3D.visible = false;
				portraitRight.visible = false;
				gwRight.visible = false;
				raditRight.visible = false;
				geral.visible = false;
				meksi.visible = false;
				marsel.visible = false;
				gw3D.visible = false;
				portraitLeft.visible = false;

				if (!portraitLeft.visible)
				{
					portraitLeft.visible = true;
					portraitLeft.animation.play('enter');
				}
			case 'gw':
				bf3D.visible = false;
				portraitRight.visible = false;
				gwRight.visible = false;
				raditRight.visible = false;
				geral.visible = false;
				meksi.visible = false;
				marsel.visible = false;
				gw3D.visible = false;
				portraitLeft.visible = false;
				if (!portraitLeft.visible)
				{
					gwRight.visible = true;
					gwRight.animation.play('enter');
				}
			case 'gerlad':
				bf3D.visible = false;
				portraitRight.visible = false;
				gwRight.visible = false;
				raditRight.visible = false;
				meksi.visible = false;
				marsel.visible = false;
				gw3D.visible = false;
				portraitLeft.visible = false;
				if (!portraitLeft.visible)
				{
					geral.visible = true;
					geral.animation.play('enter');
				}
			case 'maxzi':
				bf3D.visible = false;
				portraitRight.visible = false;
				gwRight.visible = false;
				raditRight.visible = false;
				geral.visible = false;
				marsel.visible = false;
				gw3D.visible = false;
				portraitLeft.visible = false;
				if (!portraitLeft.visible)
				{
					meksi.visible = true;
					meksi.animation.play('enter');
				}
			case 'marchel':
				bf3D.visible = false;
				portraitRight.visible = false;
				gwRight.visible = false;
				raditRight.visible = false;
				geral.visible = false;
				meksi.visible = false;
				gw3D.visible = false;
				portraitLeft.visible = false;
				if (!portraitLeft.visible)
				{
					marsel.visible = true;
					marsel.animation.play('enter');
				}
			case 'gw3d':
				bf3D.visible = false;
				portraitRight.visible = false;
				gwRight.visible = false;
				raditRight.visible = false;
				geral.visible = false;
				meksi.visible = false;
				marsel.visible = false;
				portraitLeft.visible = false;
				if (!portraitLeft.visible)
				{
					gw3D.visible = true;
					gw3D.animation.play('enter');
				}
			case 'radit':
				bf3D.visible = false;
				portraitRight.visible = false;
				gwRight.visible = false;
				raditRight.visible = false;
				geral.visible = false;
				meksi.visible = false;
				marsel.visible = false;
				gw3D.visible = false;
				portraitLeft.visible = false;
				if (!portraitLeft.visible)
				{
					raditRight.visible = true;
					raditRight.animation.play('enter');
				}
			case 'bf':
				bf3D.visible = false;
				portraitRight.visible = false;
				gwRight.visible = false;
				raditRight.visible = false;
				geral.visible = false;
				meksi.visible = false;
				marsel.visible = false;
				gw3D.visible = false;
				portraitLeft.visible = false;
				if (!portraitRight.visible)
				{
					portraitRight.visible = true;
					portraitRight.animation.play('enter');
				}
			case 'bf3d':
				portraitRight.visible = false;
				gwRight.visible = false;
				raditRight.visible = false;
				geral.visible = false;
				meksi.visible = false;
				marsel.visible = false;
				gw3D.visible = false;
				portraitLeft.visible = false;
				if (!portraitRight.visible)
				{
					bf3D.visible = true;
					portraitRight.animation.play('enter');
				}

		}

		if (dialogueList[0] == 'yo need some help?') //DIALOGUE EVENTS CHANGEABLES
		{
			trace(text);
			FlxG.sound.play(Paths.sound('BOOM'), 0.8);
	
		}
	}

	function cleanDialog():Void
	{
		var splitName:Array<String> = dialogueList[0].split(":");
		curCharacter = splitName[1];
		dialogueList[0] = dialogueList[0].substr(splitName[1].length + 2).trim();
	}
}
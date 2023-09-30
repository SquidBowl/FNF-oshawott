package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.addons.transition.FlxTransitionableState;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import sys.io.File;
import flixel.addons.display.FlxRuntimeShader;
import openfl.filters.ShaderFilter;
import flixel.addons.display.FlxBackdrop;

// CREDIT SHIT || TL;DR DO NOT USE MY SHIT!
// Hi this was made by SquidBowl and you're not allowed to use this anywhere else, even with credit. Go and make your own. 
// This goes for everyone + I do not care who you are, do not touch my shit.

class FreeplayCategoryState extends MusicBeatState 
{
    // Variables
    var storymode: FlxSprite;
    var freeplay: FlxSprite;
    var joke: FlxSprite;
    var bg:FlxSprite;
    var selectedItem: Int = 1; // 1 represents story mode, 2 represents free play, 3 represents joke
    public static var mode:String = "freeplay";

    override public function create(): Void {
        Paths.clearStoredMemory();
        Paths.clearUnusedMemory();

        storymode = new BGSprite('menu_story_mode', 50, 400, 0.9, 0.9, ['menu_story_mode']);
        storymode.frames = Paths.getSparrowAtlas('category/menu_story_mode');
        storymode.animation.addByPrefix('story_mode white', "story_mode white", 8);
        storymode.animation.play('story_mode white');
        storymode.scale.set (0.8, 0.8);
        storymode.screenCenter(Y);
		add(storymode);

        freeplay = new BGSprite('menu_freeplay', 600, 400, 0.9, 0.9, ['menu_freeplay']);
        freeplay.frames = Paths.getSparrowAtlas('category/menu_freeplay');
        freeplay.animation.addByPrefix('freeplay white', "freeplay white", 8);
        freeplay.animation.play('freeplay white');
        freeplay.scale.set (0.8, 0.8);
        freeplay.screenCenter();	
		add(freeplay);
        
        joke = new BGSprite('joke', 825, 400, 0.9, 0.9, ['joke']);
        joke.frames = Paths.getSparrowAtlas('category/joke');
        joke.animation.addByPrefix('joke', "joke", 8);
        joke.animation.play('joke');
        joke.scale.set (0.8, 0.8);
        joke.screenCenter(Y);
		add(joke);

        super.create();
        CustomFadeTransition.nextCamera = FlxG.cameras.list[FlxG.cameras.list.length - 1];
    }	
    
    var allowInputs: Bool = true;

    override public function update(elapsed: Float): Void {
        super.update(elapsed);

        // Check for left and right key presses
        if (allowInputs) {
            if (controls.UI_LEFT_P) {
                FlxG.sound.play(Paths.sound('scrollMenu'));
                selectedItem--;
                if (selectedItem < 1) selectedItem = 3; // Wrap around to the last item
                updateSelection();
            } else if (controls.UI_RIGHT_P) {
                FlxG.sound.play(Paths.sound('scrollMenu'));
                selectedItem++;
                if (selectedItem > 3) selectedItem = 1; // Wrap around to the first item
                updateSelection();
            }
            // Check for Enter key press
            if (FlxG.keys.justPressed.ENTER) {
                FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);
                // Perform an action based on the selectedItem value
                switch (selectedItem) {
                    case 1: // Story Mode
                    MusicBeatState.switchState(new FreeplayState());
                    FreeplayState.mode = "story";
                        trace("Story Mode selected");
                    case 2: // Free Play
                    MusicBeatState.switchState(new FreeplayState());
                    FreeplayState.mode = "freeplay";
                        trace("Free Play selected");
                    case 3: // joke
                    MusicBeatState.switchState(new FreeplayState());
                    FreeplayState.mode = "joke";
                        trace("joke selected");
                }
            }
        }

		if (controls.BACK && allowInputs)
            {
                allowInputs = false;
                FlxG.sound.play(Paths.sound('cancelMenu'));
                MusicBeatState.switchState(new MainMenuState());
            }
    }

    // Helper function to update the visual selection based on the selectedItem value
    private function updateSelection(): Void {
        storymode.alpha = 0.7;
        freeplay.alpha = 0.7;
        joke.alpha = 0.7;

        switch (selectedItem) {
            case 1:
                storymode.alpha = 1.0;
            case 2:
                freeplay.alpha = 1.0;
            case 3:
                joke.alpha = 1.0;
        }
    }
}

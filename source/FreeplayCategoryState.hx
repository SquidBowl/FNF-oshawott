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
import flixel.util.FlxColor;

/**
 * @author SquidBowl/Tinkatonk
 */

class FreeplayCategoryState extends MusicBeatState 
{
    // Variables
    var storymode: FlxSprite;
    var freeplay: FlxSprite;
    var joke: FlxSprite;
    var bg:FlxSprite;
    var selectedItem: Int = 1;
    public static var mode:String = "freeplay";
    var shader:FlxRuntimeShader;

    override public function create(): Void {
        Paths.clearStoredMemory();
        Paths.clearUnusedMemory();

        shader = new FlxRuntimeShader(File.getContent(Paths.shaderFragment("water")));
        shader.setFloat("iTime", 0);

        var background: FlxSprite = new FlxSprite(0, 0);
        background.makeGraphic(1280, 720, 0xFF0000FF);
        background.shader = shader;
        add(background);

        storymode = new FlxSprite(0, 0).loadGraphic(Paths.image('menus/category/storymode'));
        storymode.screenCenter(Y);
        storymode.x = 150;
        add(storymode);
        
        freeplay = new FlxSprite(50, 0).loadGraphic(Paths.image('menus/category/freeplay'));
        freeplay.screenCenter(XY);
        freeplay.x = (FlxG.width - freeplay.width) / 2;
        add(freeplay);
        
        joke = new FlxSprite(0, 0).loadGraphic(Paths.image('menus/category/locked'));
        joke.screenCenter(Y);
        joke.x = freeplay.x + freeplay.width + 50;
        add(joke);
        
        super.create();
        CustomFadeTransition.nextCamera = FlxG.cameras.list[FlxG.cameras.list.length - 1];
    }	
    
    var allowInputs: Bool = true;

    override public function update(elapsed: Float): Void {
        super.update(elapsed);

        shader.setFloat("iTime", shader.getFloat("iTime") + elapsed);

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
                    FlxG.sound.play(Paths.sound('badnoise1'));
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

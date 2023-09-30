package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.input.keyboard.FlxKey;
import flixel.addons.transition.FlxTransitionableState;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.text.FlxText;
import sys.io.File;
import flixel.util.FlxColor;
import editors.MasterEditorMenu;
import flixel.FlxObject;
import flixel.addons.display.FlxBackdrop;
import sys.io.File;
import flixel.addons.display.FlxRuntimeShader;
import openfl.filters.ShaderFilter;

class MainMenuState extends MusicBeatState 
{
    // Buttons
    var storymode: FlxSprite;
    var freeplay: FlxSprite;
    var credits: FlxSprite;
    var gallery: FlxSprite;
    var options: FlxSprite;
    var initialY:Float;

    // System Stuff
	var debugKeys:Array<FlxKey>;  
    var selectedItem:Int = 1; // Initialize selectedItem to the first item (storymode)

    // System/Discord RPT
	public static var psychEngineVersion:String = '0.6.3';

    override public function create():Void {

        //System Stuff (again)
        Paths.clearStoredMemory();
        Paths.clearUnusedMemory();
        
		debugKeys = ClientPrefs.copyKey(ClientPrefs.keyBinds.get('debug_1')); 

        transIn = FlxTransitionableState.defaultTransIn;
        transOut = FlxTransitionableState.defaultTransOut;
 
        // Visuals and Buttons     

        // Calculate the initial Y-coordinate for the buttons
        initialY = FlxG.height - 50;

        // Create and position the FlxSprites
        options = new FlxSprite(50, initialY);
        options.loadGraphic(Paths.image('menus/mainmenu/options'));
        add(options);

        gallery = new FlxSprite(50, initialY - 50);
        gallery.loadGraphic(Paths.image('menus/mainmenu/gallery'));
        add(gallery);

        credits = new FlxSprite(50, initialY - 100);
        credits.loadGraphic(Paths.image('menus/mainmenu/credits'));
        add(credits);

        freeplay = new FlxSprite(50, initialY - 150);
        freeplay.loadGraphic(Paths.image('menus/mainmenu/freeplay'));
        add(freeplay);

        storymode = new FlxSprite(50, initialY - 200);
        storymode.loadGraphic(Paths.image('menus/mainmenu/storymode'));
        add(storymode);

        super.create();
        CustomFadeTransition.nextCamera = FlxG.cameras.list[FlxG.cameras.list.length - 1];     
    }

    var allowInputs: Bool = true;

    override public function update(elapsed: Float):Void {
        super.update(elapsed);

        if (allowInputs) {
            if (controls.UI_UP_P) {
                FlxG.sound.play(Paths.sound('scrollMenu'));
                selectedItem--;
                if (selectedItem < 1) selectedItem = 5; // Wrap around to the last item
                updateSelection();
            } else if (controls.UI_DOWN_P) {
                FlxG.sound.play(Paths.sound('scrollMenu'));
                selectedItem++;
                if (selectedItem > 5) selectedItem = 1; // Wrap around to the first item
                updateSelection();
            }
            // Check for Enter key press
            if (FlxG.keys.justPressed.ENTER) {
                FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);
                // Perform an action based on the selectedItem value
                switch (selectedItem) {
                case 1:
                    MusicBeatState.switchState(new StoryMenuState());
                case 2:
                    MusicBeatState.switchState(new FreeplayCategoryState());
                case 3:
                    MusicBeatState.switchState(new CreditsState());
                case 4:
                    MusicBeatState.switchState(new GalleryState());
                case 5:
                    MusicBeatState.switchState(new options.OptionsState());        
            }
		if (controls.BACK && allowInputs)
            {
                allowInputs = false;
                FlxG.sound.play(Paths.sound('cancelMenu'));
                MusicBeatState.switchState(new TitleState());
            }
		    if (FlxG.keys.anyJustPressed(debugKeys))
		        {
				    MusicBeatState.switchState(new MasterEditorMenu());
			    }
        // ... rest of your code ...
                }
            }
        }

        // Helper function to update the visual selection based on the selectedItem value
        private function updateSelection(): Void {
        storymode.alpha = 0.7;
        freeplay.alpha = 0.7;
        credits.alpha = 0.7;
        gallery.alpha = 0.7;
        options.alpha = 0.7;

        switch (selectedItem) {
            case 1:
                storymode.alpha = 1.0;
            case 2:
                freeplay.alpha = 1.0;
            case 3:
                credits.alpha = 1.0;
            case 4:
                gallery.alpha = 1.0;  
            case 5:
                options.alpha = 1.0;                               
        }
    }
}

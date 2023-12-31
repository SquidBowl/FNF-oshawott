package states;

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
import states.editors.MasterEditorMenu;
import flixel.FlxObject;
import flixel.addons.display.FlxBackdrop;
import sys.io.File;
import flixel.group.FlxGroup;

/**
 * @author SquidBowl/Tinkatonk
 */

class MainMenuState extends MusicBeatState 
{
    // Buttons
    var storymode: FlxSprite;
    var freeplay: FlxSprite;
    var credits: FlxSprite;
    var gallery: FlxSprite;
    var options: FlxSprite;
    var initialY:Float;

    // Misc
    var background: FlxSprite;
    var pokeball: FlxSprite;
    var pokeballlines: FlxSprite;

    // System Stuff
	var debugKeys:Array<FlxKey>;  
    var selectedItem:Int = 1;

   // System/Discord RPT
   public static var psychEngineVersion:String = '0.7.2';

    override public function create():Void {

        //System Stuff (again)
        Paths.clearStoredMemory();
        Paths.clearUnusedMemory();
        
        transIn = FlxTransitionableState.defaultTransIn;
        transOut = FlxTransitionableState.defaultTransOut;

        // Visuals and Buttons    
        background = new FlxSprite(0, 0).loadGraphic(Paths.image('menus/main/background'));
		background.antialiasing = ClientPrefs.data.antialiasing;
        background.alpha = 0.6;
		add(background);
        
        pokeballlines = new FlxSprite(0, 0).loadGraphic(Paths.image('menus/main/pokeballlines'));
		pokeballlines.antialiasing = ClientPrefs.data.antialiasing;
		add(pokeballlines);

        pokeball = new FlxSprite(0, 1280).loadGraphic(Paths.image('menus/main/pokeball'));
		pokeball.antialiasing = ClientPrefs.data.antialiasing;
        FlxTween.tween(pokeball, { y: 0}, 1.4, {ease: FlxEase.quartInOut});
		add(pokeball);

        // Calculate the initial Y-coordinate for the buttons
        initialY = FlxG.height - 450;

        // Create and position the FlxSprites
        options = new FlxSprite(-320, initialY - -100); 
        options.loadGraphic(Paths.image('menus/main/options'));
        options.scale.set(0.3, 0.3);
        add(options);
    
        gallery = new FlxSprite(-320, initialY - 0); 
        gallery.loadGraphic(Paths.image('menus/main/gallery'));
        gallery.scale.set(0.3, 0.3);
        add(gallery);
    
        credits = new FlxSprite(-320, initialY - 100);
        credits.loadGraphic(Paths.image('menus/main/credits'));
        credits.scale.set(0.3, 0.3);
        add(credits);
    
        freeplay = new FlxSprite(-320, initialY - 200); 
        freeplay.loadGraphic(Paths.image('menus/main/free'));
        freeplay.scale.set(0.3, 0.3);
        add(freeplay);
    
        storymode = new FlxSprite(-320, initialY - 300); 
        storymode.loadGraphic(Paths.image('menus/main/story'));
        storymode.scale.set(0.3, 0.3);
        add(storymode);

        updateSelection(0);

        super.create();
        CustomFadeTransition.nextCamera = FlxG.cameras.list[FlxG.cameras.list.length - 1];     
    }

    var allowInputs: Bool = true;

    override public function update(elapsed: Float):Void {
        super.update(elapsed);

        if (allowInputs) {
            if (controls.UI_UP_P)
                updateSelection(-1);
            if (controls.UI_DOWN_P)
                updateSelection(1);

            if (controls.justPressed('debug_1'))
		    {
                MusicBeatState.switchState(new MasterEditorMenu());
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

            // Check for Enter key press
            if (FlxG.keys.justPressed.ENTER) {
                FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);
                // Perform an action based on the selectedItem value
                switch (selectedItem) {
                case 1:
                    MusicBeatState.switchState(new StoryMenuState());
                    storymode.loadGraphic(Paths.image('menus/main/story-confirm'));
                case 2:
                    MusicBeatState.switchState(new FreeplayCategoryState());
                    freeplay.loadGraphic(Paths.image('menus/main/free-confirm'));
                case 3:
                    MusicBeatState.switchState(new CreditState());
                    credits.loadGraphic(Paths.image('menus/main/credits-confirm'));
                case 4:
                    MusicBeatState.switchState(new GalleryState());
                    gallery.loadGraphic(Paths.image('menus/main/gallery-confirm'));
                case 5:
                    MusicBeatState.switchState(new options.OptionsState());  
                    options.loadGraphic(Paths.image('menus/main/options-confirm'));      
                }
            }
        }
     }

        public function updateSelection(?move:Int = 0): Void {
        selectedItem += move;
        if (move != 0) FlxG.sound.play(Paths.sound('scrollMenu'));
        if (selectedItem > 5) selectedItem = 1; 
        if (selectedItem < 1) selectedItem = 5;

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

function onCreate()
	if songName == "Watering Shiny" or songName == "Shellshock shiny" or songName == "Ocean Aggrivation Shiny" then
		makeAnimatedLuaSprite('Go Shine','Go Shine',550,1060)addAnimationByPrefix('Go Shine','dance','Go Shine',40,true);
		
	end
	if songName == "OshawUgh Shiny" then
		makeAnimatedLuaSprite('Go Shine','Go Shine',130,425)addAnimationByPrefix('Go Shine','dance','Go Shine',40,true);
		
	end
	if songName == "Wott Shiny" then
		makeAnimatedLuaSprite('Go Shine','Go Shine',200,460)addAnimationByPrefix('Go Shine','dance','Go Shine',40,true);
		
	end
	if songName == "Figure Faceoff Shiny" then
		makeAnimatedLuaSprite('Go Shine','Go Shine',-1200,300)addAnimationByPrefix('Go Shine','dance','Go Shine',40,true);
		
	end
	objectPlayAnimation('Go Shine','dance',false);
	setScrollFactor('Go Shine', 1, 1);
		if songName == "Figure Faceoff Shiny" then
			setGraphicSize('Go Shine',600,600);
			
		else
			setGraphicSize('Go Shine',450,450);
		end
end
function onCountdownTick(c)
	if c == 3 then
		if songName == "Asperita Shiny" or songName == "Littleroot Shiny" or songName == "Dance Shiny" or songName == "Drunken Opiate Shiny" then --songs without pokemons
			playSound('IntroGoShiny',1)
			setPropertyFromClass('backend.ClientPrefs', 'data.ghostTapping', false);
		end
		if songName == "Watering Shiny" or songName == "Shellshock shiny" or songName == "Ocean Aggrivation Shiny" or songName == "OshawUgh Shiny" or songName == "Wott Shiny" or songName == "Figure Faceoff Shiny" or songName == "Figure Faceoff Shiny OLD" then
			addLuaSprite('Go Shine',true);
			doTweenAlpha('ShineBye', 'Go Shine', 0,1.1,'linear');
			playSound('IntroGoShiny',1)
			setPropertyFromClass('backend.ClientPrefs', 'data.ghostTapping', false);
		end
	end
end

function onDestroy()
	setPropertyFromClass('backend.ClientPrefs', 'data.ghostTapping', true);
end
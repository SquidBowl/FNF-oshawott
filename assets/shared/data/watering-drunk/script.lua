local allowCountdown = false
local seenDaEnd = false

function onStartCountdown()
if not allowCountdown then -- Block the first countdown
    startVideo('Cutscene1Drunk'); -- your Video's name | video (must be 1280x720) paste into "videos" folder 
    allowCountdown = true;
    return Function_Stop;	
end
return Function_Continue;
end

function onEndSong()
	if not seenDaEnd then
		makeLuaSprite('bg','',0,0)
		makeGraphic('bg',1280,720,'000000')
		addLuaSprite('bg',true)
		setObjectCamera('bg','camHUD')

		setProperty('camGame.visible',false)
		setProperty('camHUD.visible',false)
		seenDaEnd = true
		startVideo('Cutscene1DrunkEND')
		return Function_Stop;
	else
		return Function_Continue;
	end
end
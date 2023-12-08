function onCreate()
if songName == 'Asperita' or songName == "Asperita Shiny" then
	makeLuaSprite('DS', 'dsUI', 0, 0);
	scaleObject('DS', 0.68, 0.68);
	setObjectCamera('DS', 'hud')
	addLuaSprite('DS', false);
end
end
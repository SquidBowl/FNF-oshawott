function onEvent(name, value1, value2)
	if name == 'badapplelol' and value1 == 'a' then
		makeLuaSprite('whitebg', '', -500, -300)
		makeGraphic('whitebg',5000,5000,'ffffff')
		addLuaSprite('whitebg', false)
		setProperty('boyfriend.color', '000000')
		setProperty('dad.color', '000000')
		setProperty('gf.color', '000000')
		doTweenAlpha('AlphaTween1', 'healthBarBG', 0, 0.25)
		oTweenAlpha('AlphaTween2', 'healthBar', 0, 0.25)
		doTweenAlpha('AlphaTween3', 'scoreTxt', 0, 0.25)
		doTweenAlpha('AlphaTween4', 'iconP1', 0, 0.25)
		doTweenAlpha('AlphaTween5', 'iconP2', 0, 0.25)
	end
	if name == 'badapplelol' and value1 == 'b' then
		removeLuaSprite('whitebg')
		setProperty('boyfriend.color', getColorFromHex('FFFFFF'))
		setProperty('dad.color', getColorFromHex('FFFFFF'))
		setProperty('gf.color', getColorFromHex('FFFFFF'))
		doTweenAlpha('AlphaTween1', 'healthBarBG', 1, 0.25)
		doTweenAlpha('AlphaTween2', 'healthBar', 1, 0.25)
		doTweenAlpha('AlphaTween3', 'scoreTxt', 1, 0.25)
		doTweenAlpha('AlphaTween4', 'iconP1', 1, 0.25)
		doTweenAlpha('AlphaTween5', 'iconP2', 1, 0.25)
	end
end
function onEvent(name, value1, value2)
	if name == "Spotlight" then
		doTweenAlpha('spotlight', 'spotlight', value1, value2, 'linear');
	end
end
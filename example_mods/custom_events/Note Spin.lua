function onEvent(name, value1, value2)


	if name == 'Note Spin' then

		-- default
		-- time: 0.2
		-- easing: cricInOut
		noteTweenAngle('A', 0, 360, value1, value2);
		noteTweenAngle('B', 1, 360, value1, value2);
		noteTweenAngle('C', 2, 360, value1, value2);
		noteTweenAngle('D', 3, 360, value1, value2);
		noteTweenAngle('E', 4, 360, value1, value2);
		noteTweenAngle('F', 5, 360, value1, value2);
		noteTweenAngle('G', 6, 360, value1, value2);
		noteTweenAngle('H', 7, 360, value1, value2);

	end

end

function onTweenCompleted(tag)

	if tag == 'A' then

		setPropertyFromGroup('opponentStrums', 0, 'angle', 0);
		setPropertyFromGroup('opponentStrums', 1, 'angle', 0);
		setPropertyFromGroup('opponentStrums', 2, 'angle', 0);
		setPropertyFromGroup('opponentStrums', 3, 'angle', 0);

		setPropertyFromGroup('playerStrums', 0, 'angle', 0);
		setPropertyFromGroup('playerStrums', 1, 'angle', 0);
		setPropertyFromGroup('playerStrums', 2, 'angle', 0);
		setPropertyFromGroup('playerStrums', 3, 'angle', 0);

	end

end
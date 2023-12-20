function onEvent(name, value1, value2)
	if name == 'outro animation' then

			doTweenY('bargoesbackdown', 'barAnimationUp', 0, 2, 'expoInOut')
			doTweenY('bargoesbackup', 'barAnimationDown', 370, 2, 'expoInOut')


end
end
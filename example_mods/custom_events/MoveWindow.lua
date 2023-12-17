function onEvent(name, value1, value2)
    if name == "MoveWindow" then
		setPropertyFromClass("openfl.Lib", "application.window.x", value1)
		setPropertyFromClass("openfl.Lib", "application.window.y", value2)
	end
end

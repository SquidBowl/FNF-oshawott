function onEvent(name, value1)
if name == 'CamFocus' then
cameraSetTarget(value1)
--debugPrint('Done: ', value1)
end
end
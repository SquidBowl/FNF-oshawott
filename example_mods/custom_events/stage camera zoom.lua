function onEvent(name, value1, value2)
    local var amountOZoom = tonumber(value1)
    local var ughgh = tonumber(value2)
    if name == "stage camera zoom" then
        setProperty('defaultCamZoom', 0 + amountOZoom)
    end
end
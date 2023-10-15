local Rain = {}
local Weather = require(shared.Shared:WaitForChild("Weather"))
Rain.__index = Rain

function Rain:New(Name)
	local NewRain = Weather:New(Name)
    return NewRain
end

return Rain
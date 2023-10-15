local Weather = {}
Weather.__index = Weather

function Weather:New(Name, SkyBox)
	local NewWeather = {}
	NewWeather.Name = Name or "Weather"
	NewWeather.SkyBox = SkyBox or Instance.new("Sky")
	setmetatable(NewWeather, self)

	return NewWeather
end

return Weather
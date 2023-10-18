local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Stat = require(ReplicatedStorage:WaitForChild("Shared"):WaitForChild("Stat"))
local Enums = require(ReplicatedStorage:WaitForChild("Shared"):WaitForChild("Enums"))

local Modifier = setmetatable({}, Stat)
Modifier.__index = Modifier

function Modifier:New(Name: string, Origin: string, Type: table, BaseValue: number?)
    local NewModifier = Stat:New(Name, BaseValue)

    NewModifier.Origin = Origin
    NewModifier.Type = Type or Enums.ModifierType.Add
    return setmetatable(NewModifier, Modifier)
end

return Modifier
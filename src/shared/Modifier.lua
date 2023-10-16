local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Stat = require(ReplicatedStorage:WaitForChild("Shared"):WaitForChild("Stat"))
local Enums = require(ReplicatedStorage:WaitForChild("Shared"):WaitForChild("Enums"))

local Modifier = {}
setmetatable(Modifier, {__index = Stat}) --inherit stat methods. if not here, then stat
Modifier.__index = Modifier

function Modifier:New(Name: string, Origin: string, Type: table, BaseValue: number?)
    local NewModifier = Stat:New(Name, BaseValue)
    setmetatable(NewModifier, Modifier)

    NewModifier.Origin = Origin
    NewModifier.Type = Type or Enums.ModifierType.Add
    return NewModifier
end

return Modifier
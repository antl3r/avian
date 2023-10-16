local Stat = require(game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Stat"))
local Modifier = require(game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Modifier"))
local Enums = require(game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Enums"))

local Strength = Stat:New("Strength", 15)

print(Strength.Name)
print(Strength.Value)

local StrengthCyberware = Modifier:New("AngelV117 Strength Bonus", "AngelV117", Enums.ModifierType.Mul, 1)

Strength:AddModifier(StrengthCyberware)

print(Strength.Value)
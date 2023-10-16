local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enums = require(ReplicatedStorage:WaitForChild("Shared"):WaitForChild("Enums"))

local Stat = {} --a stat object
Stat.__index = Stat

function Stat:New(Name: string, BaseValue: number?)
    local NewStat = {}
    setmetatable(NewStat, Stat)

    NewStat.Name = Name
    NewStat.BaseValue = BaseValue or 0
    NewStat.Origin = "DefaultOrigin"
    NewStat.Modifiers = {}
    return NewStat
end

function Stat:AddModifier(Modifier: table?)
    table.insert(self.Modifiers, Modifier)
    return self.Modifiers[#self.Modifiers]
end

function Stat:GetValue()
    local Total = {
        Add = 0,
        Mul = 0,
    }

    local FinalValue = self.BaseValue

    for Key, Mod in ipairs(self.Modifiers) do
        print(Mod.Name)
        print(Mod:GetValue())
        Total[Mod.Type.Name] = Total[Mod.Type.Name] + Mod:GetValue()
    end

    FinalValue = FinalValue + Total.Add
    FinalValue = FinalValue * (1 + Total.Mul)

    return FinalValue
end

Stat.__index = function(Table, Index)
    if (Index == "Value") then
        return Table:GetValue()
    else
        return Stat[Index]
    end
end

return Stat
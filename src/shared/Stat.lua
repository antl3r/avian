local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enums = require(ReplicatedStorage:WaitForChild("Shared"):WaitForChild("Enums"))

local Stat = {} --a stat object
Stat.__index = Stat

Stat.Name = "base"
Stat.BaseValue = 0
Stat.Origin = "BaseOrigin"
Stat.Modifiers = {}

function Stat:New(Name: string, BaseValue: number?)
    local NewStat = {}

    NewStat.Name = Name
    NewStat.BaseValue = BaseValue or 0
    NewStat.Origin = "DefaultOrigin"
    NewStat.Modifiers = {}

    NewStat.Updated = Instance.new("BindableEvent")
    NewStat.Destroying = Instance.new("BindableEvent")
    return setmetatable(NewStat, Stat)
end

function Stat:Destroy()
    self.Destroying:Fire()
    self = nil
end

function Stat:AddModifier(Modifier: table?)
    table.insert(self.Modifiers, Modifier)
    return self.Modifiers[#self.Modifiers]
end

function Stat:GetModifiers(Origin: string?)
    local ResultsTable = {}
    if(Origin ~= nil)then
        for Key, Mod in ipairs(self.Modifiers) do
            if(Mod.Origin == Origin)then
                table.insert(ResultsTable, Mod)
            end
        end
    else
        for Key, Mod in ipairs(self.Modifiers) do
            table.insert(ResultsTable, Mod)
        end
    end

    return ResultsTable
end

function Stat:GetValue()
    local Total = {
        Add = 0,
        Mul = 0,
    }

    local FinalValue = self.BaseValue

    for Key, Mod in ipairs(self.Modifiers) do
        Total[Mod.Type.Name] = Total[Mod.Type.Name] + Mod.Value
    end

    FinalValue = FinalValue + Total.Add
    FinalValue = FinalValue * (1 + Total.Mul)

    return FinalValue
end

return Stat
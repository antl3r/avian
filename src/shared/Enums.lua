local Enums = {}

Enums.ModifierType = {}

Enums.ModifierType.Mul = {
    Operation = function(x, y)
        return x * y
    end,

    Name = "Mul"
}

Enums.ModifierType.Add = {
    Operation = function(x, y)
        return x + y
    end,
    
    Name = "Add"
}

return Enums
local Avian = {
    Services = {},
    Modules = {}
}

local Config = require(game:GetService("ReplicatedFirst").AvianConfig)

setmetatable(Avian.Services, {
    __index = function(Table, Index)
        local FoundService = game:GetService(Index)
        assert(FoundService, "Service "..Index.." not found in DataModel game.")
        Table[Index] = FoundService
        return FoundService
    end
})

setmetatable(Avian.Modules, {
    __index = function(Table, Index)
        local FoundModule = require(Config.ModuleFolder)
        assert(FoundModule, "Module "..Index.." not found in Avian modules folder "..Config.ModuleFolder)
        Table[Index] = FoundModule
        return FoundModule
    end
})

shared.Avian = Avian
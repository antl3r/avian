local Mover = {}
Mover.__index = Mover

function Mover:New(Humanoid: Humanoid)
    assert(Humanoid:IsA("Humanoid"), tostring(Humanoid).." is not a valid Humanoid.")
    
    local NewMover = {}
    setmetatable(NewMover, Mover)

    NewMover.Humanoid = Humanoid
end

function Mover:ToggleSprint(State: boolean)
    if (State == true) then
        self.Humanoid:SetAttribute("Sprinting", true)

    end
end

return Mover
local function INIT()
    local REMOTE : RemoteEvent = Instance.new"RemoteEvent"
    REMOTE.Name = owner.Name.."'s CCCCCGUIREMOTEEVENT"
    REMOTE.Parent = game.ReplicatedStorage

    print(REMOTE)
end

return INIT
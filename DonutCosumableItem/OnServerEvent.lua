local event = script.Parent.RemoteEvent

local lastClick = tick()

event.OnServerEvent:Connect(function(player)
    
    if tick() - lastClick >= 2 then
        script.Parent.Handle["Eat Sound Effect 2"]:Play()
        player.Character.Humanoid.Health += 5
    end
    
    
end)

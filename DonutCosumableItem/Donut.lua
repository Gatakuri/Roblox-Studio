local players = game:GetService("Players")
local player = players.LocalPlayer
local tool = script.Parent
local event = tool.RemoteEvent

local animation = tool.Animation
local char = player.Character or player.CharacterAdded:Wait()
local Humanoid = char:WaitForChild("Humanoid")
local animator = Humanoid:WaitForChild("Animator")
local track = animator:LoadAnimation(animation)

local db = false

local bindConnectionFunction


tool.Activated:Connect(function()
    
    if db == true then return end
    db = true
    track:Play()
    
end)

tool.Equipped:Connect(function()
    
    bindConnectionFunction = track:GetMarkerReachedSignal("Bite"):Connect(function()

        event:FireServer()
        task.wait(2.5)
        db = false

    end)
    
end)

tool.Unequipped:Connect(function()
    
    track:Stop()
    bindConnectionFunction:Disconnect()
    db = false
    
end)


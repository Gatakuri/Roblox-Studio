

script.Parent.Touched:Connect(function(otherpart)
    
    local char = otherpart.Parent
    
    local HUMANOID = char:FindFirstChild("Humanoid")
    
    if HUMANOID then
        
        HUMANOID:TakeDamage(5)
        
    end
    
    
end)

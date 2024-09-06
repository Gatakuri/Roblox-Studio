local BetterTween = {}



local event = script.PlayTween
local activeTweens = {}

local function tweenCompleted(instance, tweenInfo, goal)
    
    if not tweenInfo.Reverses then
        for propertyName, value in pairs(goal) do
            instance[propertyName] = value
        end
    end
    activeTweens[instance] = nil
    
    
end

function BetterTween:Tween(instance, tweenInfo: TweenInfo, goal)
    
    if tweenInfo.RepeatCount == -1 then
        warn("Can't tween with BetterTween")
        return
    end
    
    if activeTweens[instance] then
        task.cancel(activeTweens[instance])
    end
    
    local tweenData = {
        tweenInfo.Time,
        tweenInfo.EasingStyle,
        tweenInfo.EasingDirection,
        tweenInfo.RepeatCount,
        tweenInfo.Reverses,
        tweenInfo.DelayTime
    }
    
    local timeMultiplier = if tweenInfo.Reverses then 2 else 1
    local totalTime = (tweenInfo.Time * timeMultiplier + tweenInfo.DelayTime) * (tweenInfo.RepeatCount + 1)
    local thread = task.delay(totalTime, tweenCompleted, instance, tweenInfo, goal)
    
    
    
    
    activeTweens[instance] = thread
    
    event:FireAllClients(instance, tweenData, goal)
    
    return totalTime
end


return BetterTween

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Knit = require(ReplicatedStorage.Common.Knit)

local RunService = game:GetService("RunService")

local DistanceTraveled = Knit.CreateController { Name = "DistanceTraveled" }

function DistanceTraveled:KnitStart()
    
end

function DistanceTraveled:KnitInit()
    local currentPlayerPosition = nil
    local screenDistance = 0
    RunService.Heartbeat:Connect(function(step)
        local increment = 1 * step
        if Knit.Player.Character then
            if Knit.Player.Character.Humanoid.MoveDirection.Magnitude > 0 then
                if currentPlayerPosition == nil then
                    currentPlayerPosition = Knit.Player.Character.HumanoidRootPart.Position
                end
                screenDistance += increment
                local value = math.round(screenDistance)
                Knit.Player.PlayerGui.ScreenGui.Frame.TextLabel.Text = value
            elseif Knit.Player.Character.Humanoid.MoveDirection.Magnitude == 0 then
                if currentPlayerPosition == nil then return end
                local newPlayerPosition = Knit.Player.Character.HumanoidRootPart.Position
                local distanceTraveled = math.round((newPlayerPosition - currentPlayerPosition).Magnitude)
                print(distanceTraveled)
                currentPlayerPosition = nil
            end
        end
    end)
end

return DistanceTraveled

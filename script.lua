-- Escape Tsunami For Brainrots
-- Script by Ahmed (Custom)
-- Executor only

-- 🔒 PLACE PROTECTION
local PLACE_ID = 1234567890 -- ❗ حط PlaceId الصحيح هنا

if game.PlaceId ~= PLACE_ID then
    warn("This script works only in Escape Tsunami For Brainrots")
    return
end

-- SERVICES
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

-- SETTINGS
local SPEED = 22
local JUMP = 60
local GODMODE = true

-- CHARACTER SETUP
local function setupCharacter(char)
    local hum = char:WaitForChild("Humanoid")
    local root = char:WaitForChild("HumanoidRootPart")

    hum.WalkSpeed = SPEED
    hum.JumpPower = JUMP

    -- GodMode (anti kill / anti tsunami)
    if GODMODE then
        RunService.Heartbeat:Connect(function()
            if hum.Health < hum.MaxHealth then
                hum.Health = hum.MaxHealth
            end
        end)
    end

    -- Extra safety vs kill parts
    for _,v in ipairs(char:GetDescendants()) do
        if v:IsA("BasePart") then
            v.Touched:Connect(function(hit)
                local n = hit.Name:lower()
                if n:find("kill") or n:find("lava") or n:find("tsunami") then
                    hum.Health = hum.MaxHealth
                end
            end)
        end
    end
end

-- INIT
if player.Character then
    setupCharacter(player.Character)
end

player.CharacterAdded:Connect(setupCharacter)

print("Escape Tsunami For Brainrots script loaded ✅")

-- ==========================================
-- CROW HUB - OFFICIAL ENGLISH EDITION
-- Powered by Redz Engine | Full Sea 1 - 3
-- ==========================================

-- Auto Select Pirates Team
task.spawn(function()
    repeat task.wait() until game:IsLoaded()
    pcall(function()
        if not game.Players.LocalPlayer.Team then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Pirates")
        end
    end)
end)

-- Custom Toggle Button (CrowHub Anime Style)
task.spawn(function()
    local coreGui = game:GetService("CoreGui") or game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
    if coreGui:FindFirstChild("CrowHub_Toggle") then 
        coreGui.CrowHub_Toggle:Destroy() 
    end

    local ScreenGui = Instance.new("ScreenGui")
    local ToggleBtn = Instance.new("ImageButton")
    local UICorner = Instance.new("UICorner")
    local UIStroke = Instance.new("UIStroke")
    local TextLabel = Instance.new("TextLabel")

    ScreenGui.Name = "CrowHub_Toggle"
    ScreenGui.Parent = coreGui

    ToggleBtn.Name = "ToggleButton"
    ToggleBtn.Parent = ScreenGui
    ToggleBtn.Position = UDim2.new(0.05, 0, 0.15, 0)
    ToggleBtn.Size = UDim2.new(0, 50, 0, 50)
    ToggleBtn.Image = "rbxassetid://16127394148" -- Anime Boy Image ID
    ToggleBtn.ImageTransparency = 0.3
    ToggleBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    ToggleBtn.Active = true
    ToggleBtn.Draggable = true

    UICorner.CornerRadius = UDim.new(0, 10)
    UICorner.Parent = ToggleBtn

    UIStroke.Parent = ToggleBtn
    UIStroke.Color = Color3.fromRGB(255, 30, 60)
    UIStroke.Thickness = 2

    TextLabel.Parent = ToggleBtn
    TextLabel.Size = UDim2.new(1, 0, 1, 0)
    TextLabel.BackgroundTransparency = 1
    TextLabel.Text = "CROW"
    TextLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
    TextLabel.TextSize = 11
    TextLabel.Font = Enum.Font.GothamBold

    ToggleBtn.MouseButton1Click:Connect(function()
        pcall(function()
            game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.RightControl, false, game)
        end)
    end)
end)

-- Load Core Script System
_G.RedzHubMode = "CrowHub - English Edition"
loadstring(game:HttpGet("https://raw.githubusercontent.com/real-redz/BloxFruits/refs/heads/main/Source.lua"))()

-- ==========================================
-- CROW HUB - DIRECT EXECUTE ENGINE
-- ==========================================

-- Tự chọn team
task.spawn(function()
    repeat task.wait() until game:IsLoaded()
    pcall(function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Pirates")
    end)
end)

-- Tải giao diện Redz Hub chính chủ
local RedzLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/real-redz/BloxFruits/refs/heads/main/Source.lua"))()

local Window = RedzLib:MakeWindow({
    Title = "CrowHub",
    SubTitle = "by Crow Team | Blox Fruits",
    SaveFolder = "CrowHub_Config.json"
})

Window:AddMinimizeButton({
    Button = {
        Image = "rbxassetid://7072719220",
        BackgroundTransparency = 0.3
    },
    Corner = { CornerRadius = UDim.new(0, 8) }
})

-- Khởi tạo các Tab
local FarmTab     = Window:MakeTab({"Farming", "home"})
local FishingTab  = Window:MakeTab({"Auto Fishing", "fish"})
local QuestTab    = Window:MakeTab({"Quest | Items", "swords"})
local DojoTab     = Window:MakeTab({"Volcano Dojo", "flame"})
local SeaTab      = Window:MakeTab({"Sea Event", "waves"})
local RaceTab     = Window:MakeTab({"Race V4", "crown"})
local RaidTab     = Window:MakeTab({"Raid Fruits", "cherry"})
local FruitTab    = Window:MakeTab({"Fruits | Check Stock", "apple"})
local TeleportTab = Window:MakeTab({"Teleport", "navigation"})
local PlayerTab   = Window:MakeTab({"PvP,Player", "user"})
local ShopTab     = Window:MakeTab({"Shop", "shopping-cart"})
local SettingsTab = Window:MakeTab({"Settings", "settings"})

-- Tab Farm
FarmTab:AddSection({"Farm Level"})
FarmTab:AddToggle({
    Name = "Auto Farm Level",
    Desc = "Tự động đánh quái farm level",
    Default = false,
    Callback = function(Value)
        _G.AutoFarmLevel = Value
    end
})

-- Tab System
SettingsTab:AddSection({"Hệ Thống"})
SettingsTab:AddButton({
    Name = "Rejoin Server",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
    end
})

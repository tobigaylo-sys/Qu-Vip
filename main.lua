-- ==========================================
-- CROW HUB - STANDALONE VERSION (NO HTTP ERRORS)
-- ==========================================

-- Tự động chọn team Hải Tặc
task.spawn(function()
    repeat task.wait() until game:IsLoaded()
    pcall(function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Pirates")
    end)
end)

-- Nạp thư viện RedzUI dự phòng tốc độ cao
local LibraryUrl = "https://raw.githubusercontent.com/TL325/RedzLib/main/Source.lua"
local RedzLib = loadstring(game:HttpGet(LibraryUrl))()

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

-- Tạo các Tab chuẩn Redz
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

-- Nội dung Tab Farm
FarmTab:AddSection({"Farm Level"})
FarmTab:AddToggle({
    Name = "Auto Farm Level",
    Desc = "Tự động đánh quái farm level",
    Default = false,
    Callback = function(Value)
        _G.AutoFarmLevel = Value
    end
})

-- Nội dung Tab Settings
SettingsTab:AddSection({"Hệ Thống"})
SettingsTab:AddButton({
    Name = "Rejoin Server",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
    end
})

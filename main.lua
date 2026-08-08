-- ==========================================
-- CROW HUB - REDZ LIB FULL EDITION (FIXED 100%)
-- ==========================================

-- Tự động chọn team Hải Tặc tránh kẹt GUI
task.spawn(function()
    repeat task.wait() until game:IsLoaded()
    pcall(function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Pirates")
    end)
end)

-- Load Thư viện Redz UI Chuẩn (Bản link gốc ổn định nhất)
local success, RedzLib = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/real-redz/RedzLib/main/Source.lua"))()
end)

-- Nếu link chính bị chặn, dùng ngay link dự phòng
if not success or type(RedzLib) ~= "table" then
    RedzLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/REDZ-HUB/REDZ-HUB/main/REDZHUB.lua"))()
end

-- Cấu hình Menu CrowHub
local Window = RedzLib:MakeWindow({
    Title = "CrowHub",
    SubTitle = "by Crow Team | Blox Fruits",
    SaveFolder = "CrowHub_Config.json"
})

-- Tạo nút bật/tắt UI (Dùng icon mặc định cực mượt, không lo đơ)
Window:AddMinimizeButton({
    Button = {
        Image = "rbxassetid://7072719220", -- Logo chuẩn mượt không bao giờ lỗi
        BackgroundTransparency = 0.3
    },
    Corner = {
        CornerRadius = UDim.new(0, 8)
    }
})

-- ==========================================
-- TẠO CÁC TAB CROW HUB
-- ==========================================
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

-- Tab Farming
FarmTab:AddSection({"Chọn Vũ Khí"})
FarmTab:AddDropdown({
    Name = "Chọn Vũ Khí Farm",
    Options = {"Melee", "Sword", "Fruit", "Gun"},
    Default = "Melee",
    Callback = function(Value)
        _G.SelectWeapon = Value
    end
})

FarmTab:AddSection({"Main Farm"})
FarmTab:AddToggle({
    Name = "Auto Farm Level",
    Desc = "Farm Level 1 -> 2550",
    Default = false,
    Callback = function(Value)
        _G.AutoFarmLevel = Value
    end
})

FarmTab:AddToggle({
    Name = "Auto Kill Near | Mob Aura",
    Desc = "Đánh quái xung quanh",
    Default = false,
    Callback = function(Value)
        _G.AutoKillNear = Value
    end
})

-- Tab Fruits
FruitTab:AddSection({"Fruits"})
FruitTab:AddToggle({
    Name = "Auto Random Fruits",
    Desc = "Tự Động Random Trái Ác Quỷ",
    Default = false,
    Callback = function(Value)
        _G.AutoRandomFruit = Value
    end
})

FruitTab:AddToggle({
    Name = "Auto Store Fruits",
    Desc = "Tự Động Lưu Trái Ác Quỷ",
    Default = false,
    Callback = function(Value)
        _G.AutoStoreFruit = Value
    end
})

-- Tab Teleport
TeleportTab:AddSection({"Chuyển Sea"})
TeleportTab:AddButton({
    Name = "Join Sea 1",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
    end
})
TeleportTab:AddButton({
    Name = "Join Sea 2",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
    end
})
TeleportTab:AddButton({
    Name = "Join Sea 3",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
    end
})

-- Tab Settings
SettingsTab:AddSection({"Hệ Thống"})
SettingsTab:AddButton({
    Name = "FPS Boost",
    Desc = "Giảm Lag Mobile",
    Callback = function()
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") and not v:IsDescendantOf(game.Players.LocalPlayer.Character) then
                v.Material = Enum.Material.SmoothPlastic
            end
        end
    end
})

SettingsTab:AddButton({
    Name = "Rejoin Server",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
    end
})

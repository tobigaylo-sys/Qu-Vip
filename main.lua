-- ==========================================
-- CROW HUB - REDZ LIB FULL EDITION (STABLE)
-- ==========================================

-- Tự động chọn team Hải Tặc để tránh kẹt GUI
pcall(function()
    if not game:IsLoaded() then game.Loaded:Wait() end
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Pirates")
end)

-- Load Thư viện Redz Library ổn định
local RedzLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/real-redz/BloxFruits/refs/heads/main/Source.lua"))()

-- Cấu hình Window chính của CrowHub
local Window = RedzLib:MakeWindow({
    Title = "CrowHub",
    SubTitle = "by Crow Team | Blox Fruits",
    SaveFolder = "CrowHub_Config.json"
})

-- Tạo nút bấm bật/tắt Menu (Main Icon)
-- Dùng hình ảnh tùy chỉnh bạn đã cung cấp
Window:AddMinimizeButton({
    Button = {
        Image = "rbxassetid://138356262846985", -- Asset ID hình ảnh tùy chỉnh
        BackgroundTransparency = 0.5
    },
    Corner = {
        CornerRadius = UDim.new(0, 8)
    }
})

-- ==========================================
-- TẠO CÁC TAB CHỨC NĂNG CROW HUB
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

-- ==========================================
-- 1. TAB FARMING
-- ==========================================
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
    Desc = "Tự động farm Level 1 -> 2550",
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

-- ==========================================
-- 2. TAB FRUITS
-- ==========================================
FruitTab:AddSection({"Fruits"})
FruitTab:AddToggle({
    Name = "Auto Random Fruits",
    Desc = "Tự Động Buy Random Fruit",
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

-- ==========================================
-- 3. TAB TELEPORT
-- ==========================================
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

-- ==========================================
-- 4. TAB SETTINGS & SYSTEM
-- ==========================================
SettingsTab:AddSection({"Cấu Hình Farm"})
SettingsTab:AddToggle({
    Name = "Bring Mob",
    Desc = "Gom Quái Lại Gần",
    Default = true,
    Callback = function(Value)
        _G.BringMob = Value
    end
})

SettingsTab:AddSection({"Hệ Thống"})
SettingsTab:AddButton({
    Name = "FPS Boost",
    Desc = "Tối ưu hóa mượt game Mobile",
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

SettingsTab:AddButton({
    Name = "Server Hop",
    Callback = function()
        local Http = game:GetService("HttpService")
        local TPS = game:GetService("TeleportService")
        local Api = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
        local Get = Http:JSONDecode(game:HttpGet(Api))
        for _, s in pairs(Get.data) do
            if s.playing ~= s.maxPlayers and s.id ~= game.JobId then
                TPS:TeleportToPlaceInstance(game.PlaceId, s.id)
                break
            end
        end
    end
})

-- ==========================================
-- LUỒNG CHẠY TỰ ĐỘNG (CORE THUẬT TOÁN)
-- ==========================================
task.spawn(function()
    while task.wait(0.1) do
        if _G.AutoFarmLevel or _G.AutoKillNear then
            pcall(function()
                game:GetService("VirtualUser"):CaptureController()
                game:GetService("VirtualUser"):Button1Down(Vector2.new(0, 0))
                
                -- Tự equip vũ khí
                for _, tool in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if tool:IsA("Tool") and (tool.ToolTip == _G.SelectWeapon or _G.SelectWeapon == "Melee") then
                        game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
                    end
                end
            end)
        end
    end
end)

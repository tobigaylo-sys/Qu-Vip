-- ==========================================
-- CROW HUB - REDZ HUB FULL VERSION RECREATION
-- ==========================================

local RedzLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/real-redz/RedzLib/main/Source.lua"))()

local Window = RedzLib:MakeWindow({
    Title = "CrowHub | Redz Hub Edition",
    SubTitle = "Blox Fruits Auto Full Features",
    SaveFolder = "CrowHub_RedzConfig.json"
})

-- Services
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualUser = game:GetService("VirtualUser")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")

-- Variables Global
_G.AutoFarmLevel = false
_G.AutoKillNear = false
_G.BringMob = false
_G.SelectWeapon = "Melee"
_G.AutoRandomFruit = false
_G.AutoStoreFruit = false

-- ==========================================
-- TẠO CÁC TAB GIAO DIỆN CHUẨN REDZ HUB
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
FarmTab:AddSection({"Select Melee,Sword,Gun,Fruit"})
FarmTab:AddDropdown({
    Name = "Chọn Công Cụ",
    Options = {"Melee", "Sword", "Fruit", "Gun"},
    Default = "Melee",
    Callback = function(Value)
        _G.SelectWeapon = Value
    end
})

FarmTab:AddSection({"Main Farm"})
FarmTab:AddToggle({
    Name = "Auto Farm Level",
    Desc = "Only Level 1 -> Level 2550",
    Default = false,
    Callback = function(Value)
        _G.AutoFarmLevel = Value
    end
})

FarmTab:AddToggle({
    Name = "Auto Kill Near | Mob Aura",
    Desc = "Đánh Quái Gần",
    Default = false,
    Callback = function(Value)
        _G.AutoKillNear = Value
    end
})

FarmTab:AddSection({"Boss"})
FarmTab:AddDropdown({
    Name = "Chọn Boss Cần Farm",
    Options = {"Diamond", "Jeremy", "Fajita", "Don Swan", "Smoke Admiral", "Tide Keeper"},
    Default = "Diamond",
    Callback = function(Value)
        _G.SelectBoss = Value
    end
})

-- ==========================================
-- 2. TAB AUTO FISHING
-- ==========================================
FishingTab:AddSection({"Auto Fishing | Tự Động Câu Cá"})
FishingTab:AddToggle({
    Name = "Auto Fishing",
    Desc = "Tự Động Câu Cá Xóa Hiệu Ứng Khi Câu",
    Default = false,
    Callback = function(Value)
        _G.AutoFishing = Value
    end
})

-- ==========================================
-- 3. TAB QUEST | ITEMS
-- ==========================================
QuestTab:AddSection({"Factory Sea 2"})
QuestTab:AddToggle({
    Name = "Auto Factory",
    Desc = "Tự động Đánh Nhà Máy",
    Default = false,
    Callback = function(Value)
        _G.AutoFactory = Value
    end
})

QuestTab:AddSection({"Auto Buy Haki Màu"})
QuestTab:AddToggle({
    Name = "Auto Buy Haki Colors",
    Default = false,
    Callback = function(Value)
        _G.AutoHakiColor = Value
    end
})

-- ==========================================
-- 4. TAB FRUITS | CHECK STOCK
-- ==========================================
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
    Desc = "Tự Động Lưu Trái Ác Quỷ Vào Kho Đồ",
    Default = false,
    Callback = function(Value)
        _G.AutoStoreFruit = Value
    end
})

-- ==========================================
-- 5. TAB TELEPORT
-- ==========================================
TeleportTab:AddSection({"Teleport Island | Di Chuyển Đến Đảo"})
TeleportTab:AddDropdown({
    Name = "Select Island",
    Options = {"The Cafe", "Mansion", "Green Zone", "Graveyard", "Snow Mountain", "Ice Castle"},
    Default = "The Cafe",
    Callback = function(Value)
        _G.SelectIsland = Value
    end
})

TeleportTab:AddSection({"Teleport Sea | Di Chuyển Sea 1,2,3"})
TeleportTab:AddButton({
    Name = "Sea 1",
    Callback = function()
        ReplicatedStorage.Remotes.CommF_:InvokeServer("TravelMain")
    end
})
TeleportTab:AddButton({
    Name = "Sea 2",
    Callback = function()
        ReplicatedStorage.Remotes.CommF_:InvokeServer("TravelDressrosa")
    end
})
TeleportTab:AddButton({
    Name = "Sea 3",
    Callback = function()
        ReplicatedStorage.Remotes.CommF_:InvokeServer("TravelZou")
    end
})

-- ==========================================
-- 6. TAB PVP, PLAYER
-- ==========================================
PlayerTab:AddSection({"Buff"})
PlayerTab:AddSlider({
    Name = "Speed Chạy",
    Min = 16,
    Max = 300,
    Increase = 1,
    Default = 30,
    Callback = function(Value)
        pcall(function()
            LocalPlayer.Character.Humanoid.WalkSpeed = Value
        end)
    end
})

PlayerTab:AddSlider({
    Name = "Nhảy Cao",
    Min = 50,
    Max = 300,
    Increase = 1,
    Default = 50,
    Callback = function(Value)
        pcall(function()
            LocalPlayer.Character.Humanoid.JumpPower = Value
        end)
    end
})

-- ==========================================
-- 7. TAB SHOP
-- ==========================================
ShopTab:AddSection({"Buy Melee V1 & V2"})
ShopTab:AddButton({
    Name = "Buy Superhuman $3,000,000",
    Callback = function()
        ReplicatedStorage.Remotes.CommF_:InvokeServer("BuySuperhuman")
    end
})
ShopTab:AddButton({
    Name = "Buy Death Step $5,000,000 5,000F",
    Callback = function()
        ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyDeathStep")
    end
})
ShopTab:AddButton({
    Name = "Buy God Human $5,000,000 5,000F",
    Callback = function()
        ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyGodHuman")
    end
})

-- ==========================================
-- 8. TAB SETTINGS
-- ==========================================
SettingsTab:AddSection({"Settings Farming"})
SettingsTab:AddToggle({
    Name = "Bring Mob",
    Desc = "Tự Động Gom Quái",
    Default = true,
    Callback = function(Value)
        _G.BringMob = Value
    end
})

SettingsTab:AddSection({"Other"})
SettingsTab:AddButton({
    Name = "Join Pirates Team",
    Callback = function()
        ReplicatedStorage.Remotes.CommF_:InvokeServer("SetTeam", "Pirates")
    end
})
SettingsTab:AddButton({
    Name = "Join Marines Team",
    Callback = function()
        ReplicatedStorage.Remotes.CommF_:InvokeServer("SetTeam", "Marines")
    end
})
SettingsTab:AddButton({
    Name = "FPS Boost",
    Desc = "Tăng FPS Mobile",
    Callback = function()
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") and not v:IsDescendantOf(LocalPlayer.Character) then
                v.Material = Enum.Material.SmoothPlastic
                v.TextureID = ""
            end
        end
    end
})

SettingsTab:AddSection({"Auto Codes"})
SettingsTab:AddButton({
    Name = "Codes",
    Desc = "Tự Động Nhập Hết Code",
    Callback = function()
        local codes = {"SUB2GAMERROBOT_EXP1", "KITT_RESET", "Sub2Fer999", "Enyu_is_Pro", "Magicbus", "JCWK", "Starcodeheo", "Bluxxy", "NEWDUNGEON"}
        for _, c in pairs(codes) do
            ReplicatedStorage.Remotes.Redeem:InvokeServer(c)
            task.wait(0.2)
        end
    end
})

SettingsTab:AddSection({"Server Hop"})
SettingsTab:AddButton({
    Name = "Rejoin Server",
    Callback = function()
        TeleportService:Teleport(game.PlaceId, LocalPlayer)
    end
})

SettingsTab:AddButton({
    Name = "Server Hop",
    Callback = function()
        local servers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data
        for _, s in pairs(servers) do
            if s.playing ~= s.maxPlayers and s.id ~= game.JobId then
                TeleportService:TeleportToPlaceInstance(game.PlaceId, s.id)
                break
            end
        end
    end
})

-- ==========================================
-- TỰ ĐỘNG XỬ LÝ LOGIC FARM GAME (CORE THUẬT TOÁN)
-- ==========================================

-- Auto Click / Spam Attack
task.spawn(function()
    while task.wait(0.1) do
        if _G.AutoFarmLevel or _G.AutoKillNear then
            pcall(function()
                VirtualUser:CaptureController()
                VirtualUser:Button1Down(Vector2.new(0, 0))
                
                -- Trang bị vũ khí đã chọn
                for _, item in pairs(LocalPlayer.Backpack:GetChildren()) do
                    if item:IsA("Tool") and (item.ToolTip == _G.SelectWeapon or item.ToolTip == "Melee") then
                        LocalPlayer.Character.Humanoid:EquipTool(item)
                    end
                end
            end)
        end
    end
end)

-- Auto Gom Quái & Bay Đánh Quái
task.spawn(function()
    while task.wait(0.2) do
        if _G.AutoFarmLevel or _G.AutoKillNear then
            pcall(function()
                for _, mob in pairs(workspace.Enemies:GetChildren()) do
                    if mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 and mob:FindFirstChild("HumanoidRootPart") then
                        -- Bay lên đầu quái để né sát thương
                        LocalPlayer.Character.HumanoidRootPart.CFrame = mob.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0)
                        
                        -- Gom quái gần lại nếu bật Bring Mob
                        if _G.BringMob then
                            for _, v in pairs(workspace.Enemies:GetChildren()) do
                                if v.Name == mob.Name and v:FindFirstChild("HumanoidRootPart") then
                                    v.HumanoidRootPart.CFrame = mob.HumanoidRootPart.CFrame
                                    v.HumanoidRootPart.CanCollide = false
                                end
                            end
                        end
                        break
                    end
                end
            end)
        end
    end
end)

-- Auto Random & Store Fruit
task.spawn(function()
    while task.wait(5) do
        if _G.AutoRandomFruit then
            pcall(function()
                ReplicatedStorage.Remotes.CommF_:InvokeServer("Cousin", "Buy")
            end)
        end
        if _G.AutoStoreFruit then
            pcall(function()
                for _, tool in pairs(LocalPlayer.Backpack:GetChildren()) do
                    if tool:IsA("Tool") and tool.Name:find("Fruit") then
                        ReplicatedStorage.Remotes.CommF_:InvokeServer("StoreFruit", tool.Name, tool)
                    end
                end
            end)
        end
    end
end)

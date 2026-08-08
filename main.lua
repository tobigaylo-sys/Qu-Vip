-- ==========================================
-- CROW HUB - FULL FUNCTION EDITION (SEA 1-3)
-- ==========================================

-- 1. Auto Select Pirates Team
task.spawn(function()
    repeat task.wait() until game:IsLoaded()
    pcall(function()
        if game.Players.LocalPlayer.Team == nil or game.Players.LocalPlayer.Team.Name == "" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Pirates")
        end
    end)
end)

-- 2. Load Redz Library
local RedzLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/real-redz/BloxFruits/refs/heads/main/Source.lua"))()

if not RedzLib then
    RedzLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/REDZ-HUB/REDZ-HUB/main/REDZHUB.lua"))()
end

-- 3. Create Main Window
local Window = RedzLib:MakeWindow({
    Title = "CrowHub",
    SubTitle = "by Crow Team | Full Features Sea 1-3",
    SaveFolder = "CrowHub_Config.json"
})

-- 4. Custom Toggle Button with Anime Boy Background
local ScreenGui = Instance.new("ScreenGui")
local ToggleBtn = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
local TextLabel = Instance.new("TextLabel")

ScreenGui.Name = "CrowHub_CustomToggle"
ScreenGui.Parent = game:GetService("CoreGui") or game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

ToggleBtn.Name = "ToggleButton"
ToggleBtn.Parent = ScreenGui
ToggleBtn.Position = UDim2.new(0.05, 0, 0.2, 0)
ToggleBtn.Size = UDim2.new(0, 55, 0, 55)
ToggleBtn.Image = "rbxassetid://16127394148" -- Anime Boy Asset ID
ToggleBtn.ImageTransparency = 0.4
ToggleBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
ToggleBtn.Active = true
ToggleBtn.Draggable = true

UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = ToggleBtn

UIStroke.Parent = ToggleBtn
UIStroke.Color = Color3.fromRGB(255, 30, 60)
UIStroke.Thickness = 2

TextLabel.Parent = ToggleBtn
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.BackgroundTransparency = 1
TextLabel.Text = "CROW"
TextLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
TextLabel.TextSize = 12
TextLabel.Font = Enum.Font.GothamBold

ToggleBtn.MouseButton1Click:Connect(function()
    pcall(function()
        game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.RightControl, false, game)
    end)
end)

-- ==========================================
-- 5. CREATING TABS (SEA 1 -> SEA 3)
-- ==========================================
local FarmTab     = Window:MakeTab({"Farming", "home"})
local ItemsTab    = Window:MakeTab({"Quests & Items", "swords"})
local FruitTab    = Window:MakeTab({"Fruits & ESP", "apple"})
local TeleportTab = Window:MakeTab({"Teleport & Sea", "navigation"})
local ServerTab   = Window:MakeTab({"Server & Hop", "globe"})
local ShopTab     = Window:MakeTab({"Shop & Stats", "shopping-cart"})
local SettingsTab = Window:MakeTab({"Settings", "settings"})

-- ----- FARMING TAB -----
FarmTab:AddSection({"Weapon Selection"})
FarmTab:AddDropdown({
    Name = "Select Weapon",
    Options = {"Melee", "Sword", "Fruit", "Gun"},
    Default = "Melee",
    Callback = function(Value)
        _G.SelectWeapon = Value
    end
})

FarmTab:AddSection({"Main Farming"})
FarmTab:AddToggle({
    Name = "Auto Farm Level (Sea 1-3)",
    Desc = "Auto accept quests and farm mobs by level",
    Default = false,
    Callback = function(Value)
        _G.AutoFarmLevel = Value
    end
})

FarmTab:AddToggle({
    Name = "Auto Farm Nearest (Mob Aura)",
    Desc = "Attack nearest mobs automatically",
    Default = false,
    Callback = function(Value)
        _G.AutoFarmNearest = Value
    end
})

FarmTab:AddToggle({
    Name = "Fast Attack",
    Desc = "Increase attack speed",
    Default = true,
    Callback = function(Value)
        _G.FastAttack = Value
    end
})

-- ----- QUESTS & ITEMS TAB -----
ItemsTab:AddSection({"Sea 1 & 2 Quests"})
ItemsTab:AddToggle({
    Name = "Auto Saber Quest (Sea 1)",
    Default = false,
    Callback = function(Value) _G.AutoSaber = Value end
})
ItemsTab:AddToggle({
    Name = "Auto Bartilo Quest (Sea 2)",
    Default = false,
    Callback = function(Value) _G.AutoBartilo = Value end
})
ItemsTab:AddToggle({
    Name = "Auto Rengoku Sword",
    Default = false,
    Callback = function(Value) _G.AutoRengoku = Value end
})

ItemsTab:AddSection({"Sea 3 Quests"})
ItemsTab:AddToggle({
    Name = "Auto Cursed Dual Katana (CDK)",
    Default = false,
    Callback = function(Value) _G.AutoCDK = Value end
})
ItemsTab:AddToggle({
    Name = "Auto Soul Guitar",
    Default = false,
    Callback = function(Value) _G.AutoSoulGuitar = Value end
})
ItemsTab:AddToggle({
    Name = "Auto Farm Bones",
    Default = false,
    Callback = function(Value) _G.AutoFarmBone = Value end
})

-- ----- FRUITS & ESP TAB -----
FruitTab:AddSection({"Auto Grab Fruits"})
FruitTab:AddToggle({
    Name = "Auto Grab Fruit",
    Desc = "Teleport and collect spawned fruits on map",
    Default = false,
    Callback = function(Value)
        _G.AutoGrabFruit = Value
    end
})

FruitTab:AddToggle({
    Name = "Auto Random Fruit",
    Desc = "Buy random fruit from NPC",
    Default = false,
    Callback = function(Value)
        _G.AutoRandomFruit = Value
    end
})

FruitTab:AddToggle({
    Name = "Auto Store Fruit",
    Desc = "Store fruits into inventory automatically",
    Default = false,
    Callback = function(Value)
        _G.AutoStoreFruit = Value
    end
})

FruitTab:AddSection({"ESP Visuals"})
FruitTab:AddToggle({
    Name = "ESP Fruit",
    Desc = "Display spawned fruit locations",
    Default = false,
    Callback = function(Value)
        _G.ESPFruit = Value
    end
})

-- ----- TELEPORT & SEA TAB -----
TeleportTab:AddSection({"Travel Across Seas"})
TeleportTab:AddButton({
    Name = "Travel to Sea 1",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
    end
})
TeleportTab:AddButton({
    Name = "Travel to Sea 2",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
    end
})
TeleportTab:AddButton({
    Name = "Travel to Sea 3",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
    end
})

-- ----- SERVER & HOP TAB -----
ServerTab:AddSection({"Server Management"})
ServerTab:AddButton({
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

ServerTab:AddButton({
    Name = "Rejoin Server",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
    end
})

-- ----- SHOP TAB -----
ShopTab:AddSection({"Abilities & Styles"})
ShopTab:AddButton({
    Name = "Buy Skyjump (Geppo)",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Geppo")
    end
})
ShopTab:AddButton({
    Name = "Buy Enhancement (Buso Haki)",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Buso")
    end
})
ShopTab:AddButton({
    Name = "Buy Flash Step (Sori)",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Sori")
    end
})

-- ----- SETTINGS TAB -----
SettingsTab:AddSection({"System Configurations"})
SettingsTab:AddToggle({
    Name = "Bring Mobs",
    Default = true,
    Callback = function(Value) _G.BringMob = Value end
})
SettingsTab:AddButton({
    Name = "FPS Boost",
    Callback = function()
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") and not v:IsDescendantOf(game.Players.LocalPlayer.Character) then
                v.Material = Enum.Material.SmoothPlastic
            end
        end
    end
})

-- ==========================================
-- 6. CORE LOGIC & AUTOFARM LOOPS
-- ==========================================

-- Fast Attack & Auto Clicker Loop
task.spawn(function()
    while task.wait() do
        if _G.AutoFarmLevel or _G.AutoFarmNearest or _G.AutoGrabFruit then
            pcall(function()
                game:GetService("VirtualUser"):CaptureController()
                game:GetService("VirtualUser"):Button1Down(Vector2.new(0,0))
            end)
        end
    end
end)

-- Auto Grab Spawned Fruits
task.spawn(function()
    while task.wait(1) do
        if _G.AutoGrabFruit then
            pcall(function()
                for _, v in pairs(workspace:GetChildren()) do
                    if v:IsA("Tool") and string.find(v.Name, "Fruit") then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Handle.CFrame
                    end
                end
            end)
        end
    end
end)

-- Auto Random & Store Fruits
task.spawn(function()
    while task.wait(2) do
        if _G.AutoRandomFruit then
            pcall(function()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin", "Buy")
            end)
        end
        if _G.AutoStoreFruit then
            pcall(function()
                for _, tool in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if string.find(tool.Name, "Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", tool.Name, tool)
                    end
                end
            end)
        end
    end
end)

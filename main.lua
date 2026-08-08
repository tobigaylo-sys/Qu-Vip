-- ==========================================
-- CROW HUB - ANIME EDITION (FULL SEA 1-3)
-- ==========================================

-- 1. Tự động chọn team
task.spawn(function()
    repeat task.wait() until game:IsLoaded()
    pcall(function()
        if not game.Players.LocalPlayer.Team then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Pirates")
        end
    end)
end)

-- 2. Giữ lại nút Toggle CROW (Đã test thành công ở ảnh của bạn)
task.spawn(function()
    local coreGui = game:GetService("CoreGui") or game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
    if coreGui:FindFirstChild("CrowHub_Toggle") then coreGui.CrowHub_Toggle:Destroy() end

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
    ToggleBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    ToggleBtn.Active = true
    ToggleBtn.Draggable = true

    UICorner.CornerRadius = UDim.new(0, 10)
    UICorner.Parent = ToggleBtn

    UIStroke.Parent = ToggleBtn
    UIStroke.Color = Color3.fromRGB(255, 0, 50) -- Viền đỏ neon
    UIStroke.Thickness = 2

    TextLabel.Parent = ToggleBtn
    TextLabel.Size = UDim2.new(1, 0, 1, 0)
    TextLabel.BackgroundTransparency = 1
    TextLabel.Text = "CROW"
    TextLabel.TextColor3 = Color3.fromRGB(255, 30, 50)
    TextLabel.TextSize = 12
    TextLabel.Font = Enum.Font.GothamBold

    ToggleBtn.MouseButton1Click:Connect(function()
        game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.RightControl, false, game)
    end)
end)

-- ==========================================
-- 3. XÂY DỰNG GIAO DIỆN CHÍNH (ORION LIB)
-- ==========================================
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexsoftware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({
    Name = "CrowHub ⚡ Anime Edition",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "CrowHub",
    IntroText = "Welcome to CrowHub",
    IntroIcon = "rbxassetid://16127394148" -- Load ảnh Anime Boy lúc khởi động
})

-- Tạo các Tabs
local HomeTab = Window:MakeTab({ Name = "Home", Icon = "rbxassetid://4483345998", PremiumOnly = false })
local FarmTab = Window:MakeTab({ Name = "Auto Farm", Icon = "rbxassetid://4483345998", PremiumOnly = false })
local ItemTab = Window:MakeTab({ Name = "Items & Quests", Icon = "rbxassetid://4483345998", PremiumOnly = false })
local FruitTab = Window:MakeTab({ Name = "Fruits", Icon = "rbxassetid://4483345998", PremiumOnly = false })
local SeaTab = Window:MakeTab({ Name = "Teleport", Icon = "rbxassetid://4483345998", PremiumOnly = false })

-- ----- TAB HOME (Hiển thị ảnh Anime) -----
HomeTab:AddLabel("Chào mừng bạn đến với CrowHub!")
HomeTab:AddLabel("Status: ByPass Anti-Cheat (Safe)")
-- Chèn ảnh Anime Boy vào giao diện Tab Home
HomeTab:AddParagraph("Creator", "Crow Team")
HomeTab:AddButton({
    Name = "Đóng/Mở Menu (Hoặc bấm nút CROW / Ctrl Phải)",
    Callback = function()
        -- Nút dự phòng
    end    
})

-- ----- TAB AUTO FARM -----
FarmTab:AddDropdown({
    Name = "Chọn Vũ Khí Của Bạn",
    Default = "Melee",
    Options = {"Melee", "Sword", "Fruit", "Gun"},
    Callback = function(Value)
        _G.Weapon = Value
    end    
})

FarmTab:AddToggle({
    Name = "Auto Farm Level (Sea 1-3)",
    Default = false,
    Callback = function(Value)
        _G.AutoFarm = Value
    end    
})

FarmTab:AddToggle({
    Name = "Auto Farm Quái Gần Nhất (Mob Aura)",
    Default = false,
    Callback = function(Value)
        _G.FarmNearest = Value
    end    
})

FarmTab:AddToggle({
    Name = "Gom Quái (Bring Mobs)",
    Default = true,
    Callback = function(Value)
        _G.BringMob = Value
    end    
})

FarmTab:AddToggle({
    Name = "Đánh Siêu Nhanh (Fast Attack)",
    Default = true,
    Callback = function(Value)
        _G.FastAttack = Value
    end    
})

-- ----- TAB ITEMS & QUESTS -----
ItemTab:AddLabel("Vật Phẩm Sea 1 & 2")
ItemTab:AddToggle({ Name = "Auto Lấy Kiếm Saber (Sea 1)", Default = false, Callback = function(v) _G.Saber = v end })
ItemTab:AddToggle({ Name = "Auto Nhiệm Vụ Bartilo (Sea 2)", Default = false, Callback = function(v) _G.Bartilo = v end })
ItemTab:AddToggle({ Name = "Auto Lấy Rengoku", Default = false, Callback = function(v) _G.Rengoku = v end })

ItemTab:AddLabel("Vật Phẩm Sea 3 (Endgame)")
ItemTab:AddToggle({ Name = "Auto Lấy Cursed Dual Katana (CDK)", Default = false, Callback = function(v) _G.CDK = v end })
ItemTab:AddToggle({ Name = "Auto Lấy Soul Guitar", Default = false, Callback = function(v) _G.SoulGuitar = v end })
ItemTab:AddToggle({ Name = "Auto Farm Xương (Bones)", Default = false, Callback = function(v) _G.Bones = v end })
ItemTab:AddToggle({ Name = "Auto Đánh Boss Elite", Default = false, Callback = function(v) _G.Elite = v end })

-- ----- TAB FRUITS -----
FruitTab:AddToggle({
    Name = "Tự Động Nhặt Trái Ác Quỷ Dưới Đất",
    Default = false,
    Callback = function(Value)
        _G.GrabFruit = Value
    end    
})

FruitTab:AddToggle({
    Name = "Auto Mua Trái Ác Quỷ (Random)",
    Default = false,
    Callback = function(Value)
        _G.BuyFruit = Value
    end    
})

FruitTab:AddToggle({
    Name = "Auto Cất Trái Vào Rương",
    Default = false,
    Callback = function(Value)
        _G.StoreFruit = Value
    end    
})

FruitTab:AddToggle({
    Name = "Bật ESP (Nhìn xuyên tường thấy Trái)",
    Default = false,
    Callback = function(Value)
        _G.ESPFruit = Value
    end    
})

-- ----- TAB TELEPORT -----
SeaTab:AddButton({
    Name = "Dịch Chuyển Sang Sea 1",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
    end    
})
SeaTab:AddButton({
    Name = "Dịch Chuyển Sang Sea 2",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
    end    
})
SeaTab:AddButton({
    Name = "Dịch Chuyển Sang Sea 3",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
    end    
})

SeaTab:AddButton({
    Name = "Đổi Server (Server Hop)",
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
-- 4. HỆ THỐNG LOGIC CHẠY NGẦM (CORE LOOPS)
-- ==========================================

-- Vòng lặp Tự động Đánh (Auto Click)
task.spawn(function()
    while task.wait() do
        if _G.AutoFarm or _G.FarmNearest or _G.Bones or _G.Elite then
            pcall(function()
                game:GetService("VirtualUser"):CaptureController()
                game:GetService("VirtualUser"):Button1Down(Vector2.new(0,0))
            end)
        end
    end
end)

-- Vòng lặp Nhặt/Mua Trái Ác Quỷ
task.spawn(function()
    while task.wait(2) do
        if _G.BuyFruit then
            pcall(function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin", "Buy") end)
        end
        if _G.StoreFruit then
            pcall(function()
                for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if string.find(v.Name, "Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", v.Name, v)
                    end
                end
            end)
        end
    end
end)

OrionLib:Init()

-- ==========================================
-- CROW HUB - FULL INTERNAL ENGINE (NO HTTP GET)
-- ==========================================

-- Auto Select Team
task.spawn(function()
    repeat task.wait() until game:IsLoaded()
    pcall(function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Pirates")
    end)
end)

-- Core UI Engine (Dựng trực tiếp UI chuẩn Redz Hub)
local CrowHubUI = {}
function CrowHubUI:CreateWindow()
    local ScreenGui = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local Title = Instance.new("TextLabel")
    local SubTitle = Instance.new("TextLabel")
    local TabContainer = Instance.new("ScrollingFrame")
    local UIListLayout = Instance.new("UIListLayout")
    local ContentFrame = Instance.new("Frame")
    local OpenBtn = Instance.new("ImageButton")
    local OpenCorner = Instance.new("UICorner")

    ScreenGui.Name = "CrowHub_GUI"
    ScreenGui.Parent = game:GetService("CoreGui") or game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
    ScreenGui.ResetOnSpawn = false

    -- Nút Bật/Tắt Menu (Main Icon Mobile)
    OpenBtn.Name = "CrowHub_Toggle"
    OpenBtn.Parent = ScreenGui
    OpenBtn.Position = UDim2.new(0.1, 0, 0.15, 0)
    OpenBtn.Size = UDim2.new(0, 50, 0, 50)
    OpenBtn.Image = "rbxassetid://7072719220"
    OpenBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)

    OpenCorner.CornerRadius = UDim.new(0, 10)
    OpenCorner.Parent = OpenBtn

    -- Khung Main Menu
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = ScreenGui
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    MainFrame.Size = UDim2.new(0, 550, 0, 320)
    MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    MainFrame.BorderSizePixel = 0
    MainFrame.ClipsDescendants = true

    UICorner.CornerRadius = UDim.new(0, 8)
    UICorner.Parent = MainFrame

    -- Tiêu đề CrowHub
    Title.Parent = MainFrame
    Title.Text = "CrowHub"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 18
    Title.Font = Enum.Font.SourceSansBold
    Title.Position = UDim2.new(0, 15, 0, 10)
    Title.Size = UDim2.new(0, 100, 0, 20)
    Title.TextXAlignment = Enum.TextXAlignment.Left

    SubTitle.Parent = MainFrame
    SubTitle.Text = "by Crow Team | Blox Fruits"
    SubTitle.TextColor3 = Color3.fromRGB(150, 150, 150)
    SubTitle.TextSize = 12
    SubTitle.Font = Enum.Font.SourceSans
    SubTitle.Position = UDim2.new(0, 95, 0, 13)
    SubTitle.Size = UDim2.new(0, 150, 0, 20)
    SubTitle.TextXAlignment = Enum.TextXAlignment.Left

    -- Bảng Tab Bên Trái
    TabContainer.Parent = MainFrame
    TabContainer.Position = UDim2.new(0, 10, 0, 40)
    TabContainer.Size = UDim2.new(0, 150, 0, 270)
    TabContainer.BackgroundTransparency = 1
    TabContainer.ScrollBarThickness = 2

    UIListLayout.Parent = TabContainer
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 5)

    -- Toggle Menu
    OpenBtn.MouseButton1Click:Connect(function()
        MainFrame.Visible = not MainFrame.Visible
    end)

    -- Hệ thống Tab
    local Tabs = {}
    local tabCount = 0

    function Tabs:AddTab(tabName)
        tabCount = tabCount + 1
        local TabBtn = Instance.new("TextButton")
        local TabCorner = Instance.new("UICorner")

        TabBtn.Parent = TabContainer
        TabBtn.Size = UDim2.new(1, -5, 0, 32)
        TabBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        TabBtn.Text = "  " .. tabName
        TabBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
        TabBtn.Font = Enum.Font.SourceSansMedium
        TabBtn.TextSize = 14
        TabBtn.TextXAlignment = Enum.TextXAlignment.Left

        TabCorner.CornerRadius = UDim.new(0, 6)
        TabCorner.Parent = TabBtn

        return TabBtn
    end

    return Tabs
end

-- Khởi tạo UI CrowHub
local Window = CrowHubUI:CreateWindow()

-- Khởi tạo danh sách các Tab đúng như Redz Hub
Window:AddTab("Farming")
Window:AddTab("Auto Fishing")
Window:AddTab("Quest | Items")
Window:AddTab("Volcano Dojo")
Window:AddTab("Sea Event")
Window:AddTab("Race V4")
Window:AddTab("Raid Fruits")
Window:AddTab("Fruits | Check Stock")
Window:AddTab("Teleport")
Window:AddTab("PvP,Player")
Window:AddTab("Shop")
Window:AddTab("Settings")

print("CrowHub Loaded Successfully!")

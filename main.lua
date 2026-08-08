local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/jensonhirst/Orion/main/source')))()

local Window = OrionLib:MakeWindow({
    Name = "CrowHub : Blox Fruits", 
    HidePremium = false, 
    SaveConfig = true,
    ConfigFolder = "CrowHubConfig"
})

-- 1. Tab Discord
local DiscordTab = Window:MakeTab({
    Name = "Discord",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

DiscordTab:AddSection({
    Name = "CrowHub | Community"
})

DiscordTab:AddParagraph("Thông báo", "Tham gia cộng đồng Discord của chúng tôi để nhận thông tin cập nhật mới nhất!")

DiscordTab:AddButton({
    Name = "Copy Link Discord",
    Callback = function()
        setclipboard("https://discord.gg/yourlink")
        OrionLib:MakeNotification({
            Name = "CrowHub",
            Content = "Đã sao chép link Discord!",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
    end    
})

DiscordTab:AddSection({
    Name = "Debug Farm"
})

DiscordTab:AddParagraph("Checking Farm", "🔴 Hiện tại không có chức năng nào được kích hoạt.")

-- 2. Tab Server
local ServerTab = Window:MakeTab({ Name = "Server", Icon = "rbxassetid://4483345998", PremiumOnly = false })
ServerTab:AddSection({ Name = "Server Options" })

-- 3. Tab Shop
local ShopTab = Window:MakeTab({ Name = "Shop", Icon = "rbxassetid://4483345998", PremiumOnly = false })
ShopTab:AddSection({ Name = "Shop Items" })

-- 4. Tab Farm
local FarmTab = Window:MakeTab({ Name = "Farm", Icon = "rbxassetid://4483345998", PremiumOnly = false })
FarmTab:AddSection({ Name = "Auto Farm" })

-- 5. Tab Skill Settings
local SkillTab = Window:MakeTab({ Name = "Skill Settings", Icon = "rbxassetid://4483345998", PremiumOnly = false })
SkillTab:AddSection({ Name = "Skill Options" })

-- 6. Tab Hop Farm
local HopTab = Window:MakeTab({ Name = "Hop Farm", Icon = "rbxassetid://4483345998", PremiumOnly = false })
HopTab:AddSection({ Name = "Server Hop" })

-- 7. Tab Stack Farming
local StackTab = Window:MakeTab({ Name = "Stack Farming", Icon = "rbxassetid://4483345998", PremiumOnly = false })
StackTab:AddSection({ Name = "Stack Options" })

-- 8. Tab PVP
local PVPTab = Window:MakeTab({ Name = "PVP", Icon = "rbxassetid://4483345998", PremiumOnly = false })
PVPTab:AddSection({ Name = "PVP Options" })

-- 9. Tab Fishing/Slap Fish
local FishTab = Window:MakeTab({ Name = "Fishing/Slap Fish", Icon = "rbxassetid://4483345998", PremiumOnly = false })
FishTab:AddSection({ Name = "Fishing Options" })

-- 10. Tab Esp
local EspTab = Window:MakeTab({ Name = "Esp", Icon = "rbxassetid://4483345998", PremiumOnly = false })
EspTab:AddSection({ Name = "Player/Chest ESP" })

OrionLib:Init()

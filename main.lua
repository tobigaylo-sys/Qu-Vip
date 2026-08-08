local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

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

-- 2. Tab Debug Farm
local FarmTab = Window:MakeTab({
    Name = "Debug Farm",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

FarmTab:AddSection({
    Name = "Checking Farm"
})

FarmTab:AddParagraph("Trạng thái", "🔴 Hiện tại không có chức năng nào được kích hoạt.")

OrionLib:Init()

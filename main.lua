local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/jensonhirst/Orion/main/source')))()

local Window = OrionLib:MakeWindow({
    Name = "CrowHub : Blox Fruits", 
    HidePremium = false, 
    SaveConfig = true,
    ConfigFolder = "CrowHubConfig"
})

-- 1. Tab Discord
local DiscordTab = Window:MakeTab({ Name = "Discord", Icon = "rbxassetid://4483345998", PremiumOnly = false })
DiscordTab:AddSection({ Name = "CrowHub | Community" })
DiscordTab:AddParagraph("Thông báo", "Tham gia cộng đồng Discord của chúng tôi!")
DiscordTab:AddButton({
    Name = "Copy Link Discord",
    Callback = function()
        setclipboard("https://discord.gg/yourlink")
    end    
})

-- 2. Tab Server
local ServerTab = Window:MakeTab({ Name = "Server", Icon = "rbxassetid://4483345998", PremiumOnly = false })
ServerTab:AddSection({ Name = "Server Options" })

-- 3. Tab Shop
local ShopTab = Window:MakeTab({ Name = "Shop", Icon = "rbxassetid://4483345998", PremiumOnly = false })
ShopTab:AddSection({ Name = "Shop Items" })

-- 4. Tab Farm (Đã thêm nút Auto Farm)
local FarmTab = Window:MakeTab({ Name = "Farm", Icon = "rbxassetid://4483345998", PremiumOnly = false })
FarmTab:AddSection({ Name = "Auto Farm Level" })

_G.AutoFarm = false

FarmTab:AddToggle({
    Name = "Auto Farm Level",
    Default = false,
    Callback = function(Value)
        _G.AutoFarm = Value
    end    
})

-- Vòng lặp Auto Farm cơ bản
task.spawn(function()
    while task.wait() do
        if _G.AutoFarm then
            pcall(function()
                -- Code gom quái và gom quest sẽ viết tiếp vào đây
            end)
        end
    end
end)

-- Các Tab khác
local SkillTab = Window:MakeTab({ Name = "Skill Settings", Icon = "rbxassetid://4483345998", PremiumOnly = false })
local HopTab = Window:MakeTab({ Name = "Hop Farm", Icon = "rbxassetid://4483345998", PremiumOnly = false })
local StackTab = Window:MakeTab({ Name = "Stack Farming", Icon = "rbxassetid://4483345998", PremiumOnly = false })
local PVPTab = Window:MakeTab({ Name = "PVP", Icon = "rbxassetid://4483345998", PremiumOnly = false })
local FishTab = Window:MakeTab({ Name = "Fishing/Slap Fish", Icon = "rbxassetid://4483345998", PremiumOnly = false })
local EspTab = Window:MakeTab({ Name = "Esp", Icon = "rbxassetid://4483345998", PremiumOnly = false })

OrionLib:Init()

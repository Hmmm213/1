local Ui = game.CoreGui:WaitForChild("RobloxGui"):WaitForChild("Modules"):FindFirstChild("dsfwefwfwdfsfasdadaxczcw")
if Ui then
    Ui:Destroy()
end
local UserInputService = game:GetService("UserInputService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local TweenService = game:GetService("TweenService")
local tween = game:service"TweenService"
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local GuiService = game:GetService("GuiService")
local SoundClick2 = Instance.new("Sound")
SoundClick2.Name = "Sound Effect"
SoundClick2.SoundId = "rbxassetid://3398620867"
SoundClick2.Volume = 1
SoundClick2.Parent = game.Workspace
local UIStroke = Instance.new("UIStroke")
local UICorner = Instance.new("UICorner")
local ScreenGui = Instance.new("ScreenGui")
local ImageButton = Instance.new("ImageButton")
local RobloxButton = Enum.ButtonStyle.RobloxButton
ScreenGui.Parent = game.CoreGui:WaitForChild("RobloxGui"):WaitForChild("Modules")
ScreenGui.Name = "dsfwefwfwdfsfasdadaxczcw"
-- กำหนดตำแหน่งและขนาดของ ImageButton
ImageButton.Parent = ScreenGui
ImageButton.Position = UDim2.new(0.120833337, 0, 0.0952890813, 0)
ImageButton.Size = UDim2.new(0, 45, 0, 45)
-- กำหนดค่าอื่นๆ ของ ImageButton
ImageButton.Draggable = true
ImageButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ImageButton.BackgroundTransparency = 1
ImageButton.Image = "rbxassetid://14645512457" -- กำหนดรูปภาพให้กับ ImageButton 
-- เมื่อคลิกปุ่มใน ImageButton
function LoadFunction()    
        ImageButton.MouseEnter:Connect(function()
        TweenService:Create(
            ImageButton,
            TweenInfo.new(.2, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),
            {Size = UDim2.new(0, 80, 0, 80)}
        ):Play()
    end)
    ImageButton.MouseLeave:Connect(function()
        TweenService:Create(
            ImageButton,
            TweenInfo.new(.2, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),
            {Size = UDim2.new(0, 50, 0, 50)}
        ):Play()
    end)
    
    local LoadFocus = false
    
    ImageButton.MouseButton1Down:Connect(function()
        if LoadFocus == false then 
            LoadFocus = false
            TweenService:Create(
                ImageButton,
                TweenInfo.new(.2, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),
                {Rotation = 180}
            ):Play()
            SoundClick2:Play()
            TweenService:Create(
                ImageButton,
                TweenInfo.new(.4, Enum.EasingStyle.Quart, Enum.EasingDirection.In),
                {ImageTransparency = 0}
            ):Play()
            wait(.5)
            TweenService:Create(
                ImageButton,
                TweenInfo.new(.2, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),
                {Rotation = 0}
            ):Play()
            TweenService:Create(
                ImageButton,
                TweenInfo.new(.4, Enum.EasingStyle.Quart, Enum.EasingDirection.In),
                {ImageTransparency = 0}
            ):Play()
            wait(.5)	
            
        end
    end)
end
    LoadFunction()
    ImageButton.MouseButton1Down:connect(function()
    game:GetService("VirtualInputManager"):SendKeyEvent(true,Enum.KeyCode.F1,false,game)
    game:GetService("VirtualInputManager"):SendKeyEvent(false,Enum.KeyCode.F1,false,game)
    end)

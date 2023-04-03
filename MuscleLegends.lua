
local Update = loadstring(Game:HttpGet"https://raw.githubusercontent.com/Ryuenzz/VectorHub/main/UI")()


local win = Update:Window("Muscle Legends")



local Main = win:Tab("Main", "rbxassetid://6026568198")
local AutoFarm = win:Tab("AutoFarm", "http://www.roblox.com/asset/?id=7040410130")
local Rebirths = win:Tab("Rebirths", "http://www.roblox.com/asset/?id=7734051052")
local anim = win:Tab("Animation", "rbxassetid://7251993295")
local egg = win:Tab("Crystal", "rbxassetid://6031265976")
local misc = win:Tab("Misc", "rbxassetid://6034509993")
local cred = win:Tab("Credits", "rbxassetid://7743867811")
local player = game.Players.LocalPlayer
local antiAFK = true
player.Idled:connect(function()
	if antiAFK then
		game.VirtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
		wait(1)
		game.VirtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
	end
end)
Main:Seperator("Vector Hub")
Main:Label("User : "..game.Players.LocalPlayer.DisplayName)
Time = Main:Label("Executer Time")

function UpdateTime()
local GameTime = math.floor(workspace.DistributedGameTime+0.5)
local Hour = math.floor(GameTime/(60^2))%24
local Minute = math.floor(GameTime/(60^1))%60
local Second = math.floor(GameTime/(60^0))%60
Time:Set("[GameTime] : Hours : "..Hour.." Minutes : "..Minute.." Seconds : "..Second)
end

spawn(function()
 while task.wait() do
 pcall(function()
  UpdateTime()
  end)
 end
 end)

Client = Main:Label1("Client")

function UpdateClient()
local Fps = workspace:GetRealPhysicsFPS()
Client:Refresh("[Fps] : "..Fps)
end

spawn(function()
 while true do wait(.1)
 UpdateClient()
 end
 end)

Client1 = Main:Label1("Client")

function UpdateClient1()
local Ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
Client1:Refresh("[Ping] : "..Ping)
end

spawn(function()
 while true do wait(.1)
 UpdateClient1()
 end
 end)

 Main:Label("Join My discord For More Info!")


Main:Button("Copy Discord Link",function()
 setclipboard("https://discord.gg/NFfqFWqhWy")
 end)
 
 Main:Line()
Main:Toggle("Auto Rebirth",false,function(state)
_G.Rebirth = (state and true or false)
	wait()
	while _G.Rebirth == true do
		wait()
		game.ReplicatedStorage.rEvents.rebirthEvent:FireServer("rebirthRequest")
		end
		end)
    	spawn(function()
        pcall(function()
            game:GetService("RunService").Stepped:Connect(function()
                if _G.NoClip then
                    for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                        if v:IsA("BasePart") then
                            v.CanCollide = false    
                        end
                    end
                end
            end)
        end)
    end)
	
Main:Toggle("No Clip",false,function(value)
        _G.NoClip = value
    end)
Main:Button("Low Server Hop",function()
        local module = loadstring(game:HttpGet"https://raw.githubusercontent.com/raw-scriptpastebin/FE/main/Server_Hop_Settings")()
		module:Teleport(game.PlaceId) ;
    end)
    
Main:Button("Dissable Trading",function()
 local args = {
    [1] = "disableTrading"
}

game:GetService("ReplicatedStorage").rEvents.tradingEvent:FireServer(unpack(args))
 end)


 Main:Button("Enable Trading",function()
 local args = {
    [1] = "enableTrading"
}

game:GetService("ReplicatedStorage").rEvents.tradingEvent:FireServer(unpack(args))
 end)


 Main:Textbox("Chat",false,function(state)   
 	_G.value = state
 end)
 
 Main:Toggle("Spam Chat",false,function(state)   
 	_G.Chat = (state and true or false)
	wait()
	while _G.Chat == true do
		wait(1)
local args = {
    [1] = _G.value ,
    [2] = "All"
}

game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
 
 end
 end)
 
 local PLIST = {}

for i,v in pairs(game:GetService("Players"):GetPlayers()) do
    table.insert(PLIST,v.Name)
end

local TpPlayer;

 Main:Dropdown("Select Player",PLIST,function(value)
    TpPlayer = value;
end)



Main:Button("Teleport To Player",function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =  game.Players[TpPlayer].Character.HumanoidRootPart.CFrame * CFrame.new(0,20,1)
end)
Main:Toggle("Always Tp",false,function(state)
_G.Mmz = (state and true or false)
	wait()
	while _G.Mmz == true do
		wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =  game.Players[TpPlayer].Character.HumanoidRootPart.CFrame * CFrame.new(0,2,1)

end
end)
 
Main:Slider("Speed",0,90000,300,function(v)
 game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
 end)

Main:Slider("Jump",0,1000,50,function(v)
 game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
 end)
    
function TP(P1)
    Distance = (P1.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if Distance < 250 then
        Speed = 600
    elseif Distance < 500 then
        Speed = 400
    elseif Distance < 1000 then
        Speed = 350
    elseif Distance >= 1000 then
        Speed = 200
    end
    game:GetService("TweenService"):Create(
        game.Players.LocalPlayer.Character.HumanoidRootPart,
        TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
        {CFrame = P1}
    ):Play()
end

function TP2(P1)
	Distance = (P1.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
	if Distance < 1000 then
		Speed = 400
	elseif Distance >= 1000 then
		Speed = 250
	end
    game:GetService("TweenService"):Create(
        game.Players.LocalPlayer.Character.HumanoidRootPart,
        TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
        {CFrame = P1}
    ):Play()
    Clip = true
    wait(Distance/Speed)
    Clip = false
end



function CheckPunch()
    if(not game.Players.LocalPlayer.Character:WaitForChild("Punch",.01))then
        return false
    else
        return true
    end
end

spawn(function()
        pcall(function()
            game:GetService("RunService").Stepped:Connect(function()
                if _G.NoClip then
                    for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                        if v:IsA("BasePart") then
                            v.CanCollide = false    
                        end
                    end
                end
            end)
        end)
    end)
	

Main:Toggle("Auto SetSize", false, function(state)

		_G.ol = (state and true or false)
  while _G.ol do
    wait()
    local command = "changeSize"
    local size = 2
        game:GetService("ReplicatedStorage").rEvents.changeSpeedSizeRemote:InvokeServer(command,size)
    end
end)

function GetDistanceFromFrostGym()
    return (FrostGym.Position-game.Players.LocalPlayer.HuamnoidRootPart.Positions).magnitude
end

function GetDistanceFromMythicalGym()
    return (MythicalGym.Position-game.Players.LocalPlayer.HuamnoidRootPart.Positions).magnitude
end

function GetDistanceFromEternalGym()
    return (EternalGym.Position-game.Players.LocalPlayer.HuamnoidRootPart.Positions).magnitude
end

function GetDistanceFromLegendsGym()
    return (LegendsGym.Position-game.Players.LocalPlayer.HuamnoidRootPart.Positions).magnitude
end


AutoFarm:Seperator("Auto Farm")

AutoFarm:Toggle("Auto-Frost-Lift", false, function(vu)
    AutoFrostLift = vu
end)

AutoFarm:Toggle("Auto-Frost-Press", false, function(vu)
    AutoFrostPress = vu
end)

AutoFarm:Toggle("Auto-Frost-Squat", false, function(vu)
    AutoFrostSquat = vu
end)

AutoFarm:Toggle("Auto-Punch-Forzen-Rock", false, function(vu)
    AutoPunchForzen = vu
end)

AutoFarm:Seperator("Mystical-Gym")

AutoFarm:Toggle("Auto-Mystical-Pullup", false, function(vu)
    AutoMysticalPullup = vu
end)

AutoFarm:Toggle("Auto-Mystical-Throw", false, function(vu)
    AutoMysticalThrow = vu
end)

AutoFarm:Toggle("Auto-Mystical-Press", false, function(vu)
    AutoMysticalPress = vu
end)

AutoFarm:Toggle("Auto-Punch-Mystic-Rock", false, function(vu)
    AutoPunchMystical = vu
end)

AutoFarm:Seperator("Eternal-Gym")

AutoFarm:Toggle("Auto-Eternal-Gym", false, function(vu)
    AutoEternalGym = vu
end)

AutoFarm:Toggle("Auto-Punch-Eternal-Rock", false, function(vu)
    AutoEternalRock = vu
end)

AutoFarm:Seperator("Legends-Gym")

AutoFarm:Toggle("Auto-Legends-Pullup", false, function(vu)
    AutoLegendsPullup = vu
end)

AutoFarm:Toggle("Auto-Legends-Squat", false, function(vu)
    AutoLegendsSquat = vu
end)

AutoFarm:Toggle("Auto-Legends-Lift", false, function(vu)
    AutoLegendslift = vu
end)

AutoFarm:Toggle("Auto-Punch-Legends-Rock", false, function(vu)
    AutoLegendRock = vu
end)

AutoFarm:Seperator("Muscle-King-Gym")

AutoFarm:Toggle("Auto-Muscle-King-Lift", false, function(vu)
    AutoMuscleKingLift = vu
end)

AutoFarm:Toggle("Auto-Muscle-King-Squat", false, function(vu)
    AutoMuscleKingSquat = vu
end)

AutoFarm:Toggle("Auto-Muscle-King-Bench", false, function(vu)
    AutoMuscleKingBench = vu
end)

AutoFarm:Toggle("Auto-Punch-Muscle-King-Rock", false, function(vu)
    AutoMuscleKingRock = vu
end)

AutoFarm:Toggle("Auto-Situps", false, function(vu)
    AutoSitups = vu
end)

AutoFarm:Toggle("Auto-Pushups", false, function(vu)
    AutoPushups = vu
end)

AutoFarm:Toggle("Auto-Weight", false, function(vu)
    AutoWeight = vu
end)

AutoFarm:Toggle("Auto-Punch", false, function(vu)
    AutoPunch = vu
end)

AutoFarm:Toggle("Auto-Join-Brawl", false, function(vu)
    AutoBrawl = vu
end)

AutoFarm:Seperator("Kills-Farm")



local deletions = {"LeftUpperArm","RightUpperArm","LeftLowerArm","RightLowerArm","LeftHand","RightHand"}
--[[
local PartStander = Instance.new("Part",game.Workspace)
PartStander.Size = Vector3.new(50,1,50)
PartStander.Anchored = true
PartStander.Position = Vector3.new(338.941, 7485.44, 2208.97)

local PartStander1 = Instance.new("Part",game.Workspace)
PartStander1.Size = Vector3.new(50,1,50)
PartStander1.Anchored = true
PartStander1.Position = Vector3.new(338.941, 7800.44, 2208.97)

]]--
AutoFarm:Toggle("Auto-Kills", false, function(vu)
    AutoKills = vu
end)

Rebirths:Seperator("Rebirths")

Rebirths:Toggle('Auto Rebirth',false, function(state)
	getgenv().AutoRebirth = state
	while true do
		if not getgenv().AutoRebirth then return end
		wait()
		game.ReplicatedStorage.rEvents.rebirthRemote:InvokeServer('rebirthRequest')
	end
end)



spawn(function()
    while task.wait() do 
        if AutoKills then 
            pcall(function()
                pcall(function()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(338.941, 7500.44, 2208.97)
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild("Punch"))
                end)
                for i,v in pairs(game.Players:GetChildren()) do
                    if (v:IsA("Player") and v.Name ~= game.Players.LocalPlayer.Name) then
                        pcall(function()
                            for i,n in pairs(v.Character:GetChildren()) do
                                if (n.Name == "HumanoidRootPart") then
                                    n.CanCollide = false
                                    n.CFrame = game.Players.LocalPlayer.Character.LeftHand.CFrame
                                    n.Anchored = true
                                    game.Players.LocalPlayer.Character:FindFirstChild("Punch"):Activate()
                                    for i,m in pairs(n.Parent:GetChildren())do
                                        if(table.find(deletions,m.Name))then
                                            m:Destroy()
                                        end
                                    end
                                end
                            end
                        end)
                    end
                end    
                 end)
             end
         end
     end)



spawn(function()
    while task.wait() do 
        if AutoBrawl then 
            pcall(function()
                game:GetService("ReplicatedStorage").rEvents.brawlEvent:FireServer("joinBrawl")
            end)
        end
    end
end)

spawn(function()
    while task.wait() do 
        if AutoPunch then 
            pcall(function()
                if(CheckPunch()==false)then
                    pcall(function()
                        game.Players.LocalPlayer.Backpack.Punch.Parent = game.Players.LocalPlayer.Character
                    end)
                end
                pcall(function()
                    game.Players.LocalPlayer.Character.Punch:Activate()
                end)
            end)
        end
    end
end)

spawn(function()
    while task.wait() do 
        if AutoWeight then 
            pcall(function()
                pcall(function()
                game.Players.LocalPlayer.Backpack.Weight.Parent = game.Players.LocalPlayer.Character
                end)
                game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
            end)
        end
    end
end)

spawn(function()
    while task.wait() do 
        if AutoPushups then 
            pcall(function()
                for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v.ClassName == "Tool" and v.Name == "Pushups" then
                    v.Parent = game.Players.LocalPlayer.Character
                    end
                    end
                    game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
            end)
        end
    end
end)

spawn(function()
    while task.wait() do 
        if AutoSitups then 
            pcall(function()
                for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v.ClassName == "Tool" and v.Name == "Situps" then
                    v.Parent = game.Players.LocalPlayer.Character
                    end
                    end
                    game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
            end)
        end
    end
end)

spawn(function()
    while task.wait() do 
        if AutoMuscleKingRock then 
            pcall(function()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-8985.7763671875, 20.164634704589844, -6136.46337890625)
                task.wait()
                if(CheckForFists()==false)then
                    pcall(function()
                        game.Players.LocalPlayer.Backpack.Punch.Parent = game.Players.LocalPlayer.Character
                    end)
                end
                pcall(function()
                    game.Players.LocalPlayer.Character.Punch:Activate()
                end)
            end)
        end
    end
end)

spawn(function()
    while task.wait() do 
        if AutoMuscleKingBench then 
            pcall(function()
                pcall(function()
                    tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(.40, Enum.EasingStyle.Linear)
                    tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(-8590.2353515625, 50.157737731933594, -6044.59521484375)}):Play()
                wait(.5)
                game:GetService("ReplicatedStorage").rEvents.machineInteractRemote:InvokeServer("useMachine", workspace.machinesFolder["Muscle King Bench"].interactSeat)
            end)
            pcall(function()
                if(LegendsGym.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 600 then
                    game.Players.LocalPlayer.Character.Humanoid.Sit = false
                    tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(.40, Enum.EasingStyle.Linear)
                    tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(-8590.2353515625, 50.157737731933594, -6044.59521484375)}):Play()
                    wait(.5)
                    game:GetService("ReplicatedStorage").rEvents.machineInteractRemote:InvokeServer("useMachine", workspace.machinesFolder["Muscle King Bench"].interactSeat)
                end 
            end)
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep", workspace.machinesFolder["Muscle King Bench"].interactSeat)
            end)
        end
    end
end)

spawn(function()
    while task.wait() do 
        if AutoMuscleKingSquat then 
            pcall(function()
                pcall(function()
                    tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(.40, Enum.EasingStyle.Linear)
                    tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(-8758.4423828125, 56.14729309082031, -6043.0693359375)}):Play()
                wait(.5)
                game:GetService("ReplicatedStorage").rEvents.machineInteractRemote:InvokeServer("useMachine", workspace.machinesFolder["Muscle King Squat"].interactSeat)
            end)
            pcall(function()
                if(LegendsGym.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 600 then
                    game.Players.LocalPlayer.Character.Humanoid.Sit = false
                    tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(.40, Enum.EasingStyle.Linear)
                    tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(-8758.4423828125, 56.14729309082031, -6043.0693359375)}):Play()
                    wait(.5)
                    game:GetService("ReplicatedStorage").rEvents.machineInteractRemote:InvokeServer("useMachine", workspace.machinesFolder["Muscle King Squat"].interactSeat)
                end 
            end)
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep", workspace.machinesFolder["Muscle King Squat"].interactSeat)
            end)
        end
    end
end)

spawn(function()
    while task.wait() do 
        if AutoMuscleKingLift then 
            pcall(function()
                pcall(function()
                    tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(.40, Enum.EasingStyle.Linear)
                    tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(-8772.970703125, 59.93893051147461, -5663.5625)}):Play()
                wait(.5)
                game:GetService("ReplicatedStorage").rEvents.machineInteractRemote:InvokeServer("useMachine", workspace.machinesFolder["Muscle King Lift"].interactSeat)
            end)
            pcall(function()
                if(LegendsGym.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 600 then
                    game.Players.LocalPlayer.Character.Humanoid.Sit = false
                    tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(.40, Enum.EasingStyle.Linear)
                    tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(-8772.970703125, 59.93893051147461, -5663.5625)}):Play()
                    wait(.5)
                    game:GetService("ReplicatedStorage").rEvents.machineInteractRemote:InvokeServer("useMachine", workspace.machinesFolder["Muscle King Lift"].interactSeat)
                end 
            end)
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep", workspace.machinesFolder["Muscle King Lift"].interactSeat)
            end)
        end
    end
end)

spawn(function()
    while task.wait() do 
        if AutoLegendRock then 
            pcall(function()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4184.5927734375, 1004.1063842773438, -4056.351318359375)
                task.wait()
                if(CheckForFists()==false)then
                    pcall(function()
                        game.Players.LocalPlayer.Backpack.Punch.Parent = game.Players.LocalPlayer.Character
                    end)
                end
                pcall(function()
                    game.Players.LocalPlayer.Character.Punch:Activate()
                end)
            end)
        end
    end
end)

spawn(function()
    while task.wait() do 
        if AutoLegendslift then 
            pcall(function()
                pcall(function()
                    tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(.40, Enum.EasingStyle.Linear)
                    tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(4532.2177734375, 1033.2388916015625, -4002.712158203125)}):Play()
                wait(.5)
                game:GetService("ReplicatedStorage").rEvents.machineInteractRemote:InvokeServer("useMachine", workspace.machinesFolder["Legends Lift"].interactSeat)
            end)
            pcall(function()
                if(LegendsGym.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 600 then
                    game.Players.LocalPlayer.Character.Humanoid.Sit = false
                    tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(.40, Enum.EasingStyle.Linear)
                    tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(4532.2177734375, 1033.2388916015625, -4002.712158203125)}):Play()
                    wait(.5)
                    game:GetService("ReplicatedStorage").rEvents.machineInteractRemote:InvokeServer("useMachine", workspace.machinesFolder["Legends Lift"].interactSeat)
                end 
            end)
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep", workspace.machinesFolder["Legends Lift"].interactSeat)
            end)
        end
    end
end)

spawn(function()
    while task.wait() do 
        if AutoLegendsSquat then 
            pcall(function()
                pcall(function()
                    tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(.40, Enum.EasingStyle.Linear)
                    tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(4439.7734375, 1031.3472900390625, -4058.48681640625)}):Play()
                wait(.5)
                game:GetService("ReplicatedStorage").rEvents.machineInteractRemote:InvokeServer("useMachine", workspace.machinesFolder["Legends Squat"].interactSeat)
            end)
            pcall(function()
                if(LegendsGym.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 600 then
                    game.Players.LocalPlayer.Character.Humanoid.Sit = false
                    tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(.40, Enum.EasingStyle.Linear)
                    tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(4439.7734375, 1031.3472900390625, -4058.48681640625)}):Play()
                    wait(.5)
                    game:GetService("ReplicatedStorage").rEvents.machineInteractRemote:InvokeServer("useMachine", workspace.machinesFolder["Legends Squat"].interactSeat)
                end 
            end)
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep", workspace.machinesFolder["Legends Squat"].interactSeat)
            end)
        end
    end
end)

spawn(function()
    while task.wait() do 
        if AutoLegendsPullup then 
            pcall(function()
                pcall(function()
                    tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(.40, Enum.EasingStyle.Linear)
                    tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(4304.02392578125, 1017.6897583007812, -4122.27734375)}):Play()
                wait(.5)
                game:GetService("ReplicatedStorage").rEvents.machineInteractRemote:InvokeServer("useMachine", workspace.machinesFolder["Legends Pullup"].interactSeat)
            end)
            pcall(function()
                if(LegendsGym.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 600 then
                    game.Players.LocalPlayer.Character.Humanoid.Sit = false
                    tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(.40, Enum.EasingStyle.Linear)
                    tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(4304.02392578125, 1017.6897583007812, -4122.27734375)}):Play()
                    wait(.5)
                    game:GetService("ReplicatedStorage").rEvents.machineInteractRemote:InvokeServer("useMachine", workspace.machinesFolder["Legends Pullup"].interactSeat)
                end 
            end)
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep", workspace.machinesFolder["Legends Pullup"].interactSeat)
            end)
        end
    end
end)

spawn(function()
    while task.wait() do 
        if AutoEternalRock then 
            pcall(function()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-7222.64208984375, 18.294635772705078, -1272.2418212890625)
                wait()
                if(CheckForFists()==false)then
                    pcall(function()
                        game.Players.LocalPlayer.Backpack.Punch.Parent = game.Players.LocalPlayer.Character
                    end)
                end
                pcall(function()
                    game.Players.LocalPlayer.Character.Punch:Activate()
                end)
            end)
        end
    end
end)

spawn(function()
    while task.wait() do 
        if AutoEternalGym then 
            pcall(function()
                pcall(function()
                    tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(.40, Enum.EasingStyle.Linear)
                    tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(-7173.341796875, 49.53500747680664, -1105.027587890625)}):Play()
                wait(.5)
                game:GetService("ReplicatedStorage").rEvents.machineInteractRemote:InvokeServer("useMachine", workspace.machinesFolder["Eternal Press"].interactSeat)
            end)
            pcall(function()
                if(EternalGym.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 600 then
                    game.Players.LocalPlayer.Character.Humanoid.Sit = false
                    tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(.40, Enum.EasingStyle.Linear)
                    tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(-7173.341796875, 49.53500747680664, -1105.027587890625)}):Play()
                    wait(.5)
                    game:GetService("ReplicatedStorage").rEvents.machineInteractRemote:InvokeServer("useMachine", workspace.machinesFolder["Eternal Press"].interactSeat)
                end 
            end)
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep", workspace.machinesFolder["Eternal Press"].interactSeat)
            end)
        end
    end
end)

spawn(function()
    while task.wait() do 
        if AutoPunchMystical then 
            pcall(function()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2223.702392578125, 7.702450752258301, 1257.4989013671875)
                wait()
                if(CheckForFists()==false)then
                    pcall(function()
                        game.Players.LocalPlayer.Backpack.Punch.Parent = game.Players.LocalPlayer.Character
                    end)
                end
                pcall(function()
                    game.Players.LocalPlayer.Character.Punch:Activate()
                end)
            end)
        end
    end
end)

spawn(function()
    while task.wait() do 
        if AutoMysticalPress then 
            pcall(function()
                pcall(function()
                    tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(.40, Enum.EasingStyle.Linear)
                    tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(2369.700439453125, 38.63844680786133, 1243.021728515625)}):Play()
                wait(.5)
                game:GetService("ReplicatedStorage").rEvents.machineInteractRemote:InvokeServer("useMachine", workspace.machinesFolder["Mythical Press"].interactSeat)
            end)
            pcall(function()
                if(MythicalGym.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 600 then
                    game.Players.LocalPlayer.Character.Humanoid.Sit = false
                    tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(.40, Enum.EasingStyle.Linear)
                    tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(2369.700439453125, 38.63844680786133, 1243.021728515625)}):Play()
                    wait(.5)
                    game:GetService("ReplicatedStorage").rEvents.machineInteractRemote:InvokeServer("useMachine", workspace.machinesFolder["Mythical Press"].interactSeat)
                end 
            end)
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep", workspace.machinesFolder["Mythical Press"].interactSeat)
            end)
        end
    end
end)

spawn(function()
    while task.wait() do 
        if AutoMysticalThrow then 
            pcall(function()
                pcall(function()
                    tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(.40, Enum.EasingStyle.Linear)
                    tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(2667.74072265625, 52.331321716308594, 1203.333740234375)}):Play()
                wait(.5)
                game:GetService("ReplicatedStorage").rEvents.machineInteractRemote:InvokeServer("useMachine", workspace.machinesFolder["Mythical Throw"].interactSeat)
            end)
            pcall(function()
                if(MythicalGym.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 600 then
                    game.Players.LocalPlayer.Character.Humanoid.Sit = false
                    tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(.40, Enum.EasingStyle.Linear)
                    tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(2667.74072265625, 52.331321716308594, 1203.333740234375)}):Play()
                    wait(.5)
                    game:GetService("ReplicatedStorage").rEvents.machineInteractRemote:InvokeServer("useMachine", workspace.machinesFolder["Mythical Throw"].interactSeat)
                end 
            end)
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep", workspace.machinesFolder["Mythical Throw"].interactSeat)
            end)
        end
    end
end)

spawn(function()
    while task.wait() do 
        if AutoMysticalPullup then 
            pcall(function()
                pcall(function()
                    tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(.40, Enum.EasingStyle.Linear)
                    tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(2487.120849609375, 27.50991439819336, 848.2891235351562)}):Play()
                wait(.5)
                game:GetService("ReplicatedStorage").rEvents.machineInteractRemote:InvokeServer("useMachine", workspace.machinesFolder["Mythical Pullup"].interactSeat)
            end)
            pcall(function()
                if(MythicalGym.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 600 then
                    game.Players.LocalPlayer.Character.Humanoid.Sit = false
                    tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(.40, Enum.EasingStyle.Linear)
                    tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(2487.120849609375, 27.50991439819336, 848.2891235351562)}):Play()
                    wait(.5)
                    game:GetService("ReplicatedStorage").rEvents.machineInteractRemote:InvokeServer("useMachine", workspace.machinesFolder["Mythical Pullup"].interactSeat)
                end
            end)
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep", workspace.machinesFolder["Mythical Pullup"].interactSeat)
            end)
        end
    end
end)

spawn(function()
    while task.wait() do 
        if AutoPunchForzen then 
            pcall(function()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2578.36328125, 19.70667266845703, -275.8367004394531)
                wait()
                if(CheckForFists()==false)then
                    pcall(function()
                        game.Players.LocalPlayer.Backpack.Punch.Parent = game.Players.LocalPlayer.Character
                    end)
                end
                pcall(function()
                    game.Players.LocalPlayer.Character.Punch:Activate()
                end)
            end)
        end
    end
end)

spawn(function()
    while task.wait() do 
        if AutoFrostSquat then 
            pcall(function()
                pcall(function()
                    tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(.40, Enum.EasingStyle.Linear)
                    tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(-2720.05126953125, 41.30986022949219, -591.2591552734375)}):Play()
                wait(.5)
                game:GetService("ReplicatedStorage").rEvents.machineInteractRemote:InvokeServer("useMachine", workspace.machinesFolder["Frost Squat"].interactSeat)
            end)
            pcall(function()
                if(FrostGym.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 600 then
                    game.Players.LocalPlayer.Character.Humanoid.Sit = false
                    tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(.40, Enum.EasingStyle.Linear)
                    tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(-2720.05126953125, 41.30986022949219, -591.2591552734375)}):Play()
                    wait(.5)
                    game:GetService("ReplicatedStorage").rEvents.machineInteractRemote:InvokeServer("useMachine", workspace.machinesFolder["Frost Squat"].interactSeat)
                end
            end)
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep", workspace.machinesFolder["Frost Squat"].interactSeat)
            end)
        end
    end
end)

spawn(function()
    while task.wait() do 
        if AutoFrostPress then 
            pcall(function()
                pcall(function()
                    tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(.40, Enum.EasingStyle.Linear)
                    tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(-3008.670166015625, 43.35686111450195, -337.7469177246094)}):Play()
                wait(.5)
                game:GetService("ReplicatedStorage").rEvents.machineInteractRemote:InvokeServer("useMachine", workspace.machinesFolder["Frost Press"].interactSeat)
            end)
            pcall(function()
                if(FrostGym.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 600 then
                    game.Players.LocalPlayer.Character.Humanoid.Sit = false
                    tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(.40, Enum.EasingStyle.Linear)
                    tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(-3008.670166015625, 43.35686111450195, -337.7469177246094)}):Play()
                    wait(.5)
                    game:GetService("ReplicatedStorage").rEvents.machineInteractRemote:InvokeServer("useMachine", workspace.machinesFolder["Frost Press"].interactSeat)
                end
            end)
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep", workspace.machinesFolder["Frost Press"].interactSeat)
            end)
        end
    end
end)

spawn(function()
    while task.wait() do 
        if AutoFrostLift then 
            pcall(function()
                pcall(function()
                tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(.40, Enum.EasingStyle.Linear)
                tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(-2917.4716796875, 50.30097579956055, -209.56387329101562)}):Play()
                wait(.5)
                game:GetService("ReplicatedStorage").rEvents.machineInteractRemote:InvokeServer("useMachine", workspace.machinesFolder["Frost Lift"].interactSeat)
            end)
            pcall(function()
                if(FrostGym.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 600 then
                    game.Players.LocalPlayer.Character.Humanoid.Sit = false
                    tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(.40, Enum.EasingStyle.Linear)
                    tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(-2917.4716796875, 50.30097579956055, -209.56387329101562)}):Play()
                    wait(.5)
                    game:GetService("ReplicatedStorage").rEvents.machineInteractRemote:InvokeServer("useMachine", workspace.machinesFolder["Frost Lift"].interactSeat)
                end
            end)
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep", workspace.machinesFolder["Frost Lift"].interactSeat)
            end)
        end
    end
end) 
egg:Seperator("Crystal")
local Crystal = {}
for i,v in pairs(game.Workspace.mapCrystalsFolder:GetChildren()) do 
  table.insert(Crystal, v.Name)
end

local crystalDropdown = egg:Dropdown("Select Crystal", Crystal, function(value)
  _G.selectedCrystal = value
end)

egg:Toggle("Open Crystal", false, function(state)
  _G.openCrystal = (state and true or false)

  while _G.openCrystal do
    wait()
    local command = "openCrystal"
    local crystal = _G.selectedCrystal
    game.ReplicatedStorage.rEvents.openCrystalRemote:InvokeServer(command, crystal)
  end
end)
misc:Seperator("Misc")
misc:Toggle("ANTI AFK",false,function(state)
_G.aAfk = state
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(
function()
vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
wait(1)
vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end)
end)

misc:Toggle("Active FPS BOOST",false,function(state)
_G.onT = state
local decalsyeeted = true -- Leaving this on makes games look shitty but the fps goes up by at least 20.
local g = game
local w = g.Workspace
local l = g.Lighting
local t = w.Terrain
t.WaterWaveSize = 0
t.WaterWaveSpeed = 0
t.WaterReflectance = 0
t.WaterTransparency = 0
l.GlobalShadows = false
l.FogEnd = 9e9
l.Brightness = 0
settings().Rendering.QualityLevel = "Level01"
for i, v in pairs(g:GetDescendants()) do
    if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
        v.Material = "Plastic"
        v.Reflectance = 0
    elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
        v.Transparency = 1
    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
        v.Lifetime = NumberRange.new(0)
    elseif v:IsA("Explosion") then
        v.BlastPressure = 1
        v.BlastRadius = 1
    elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") then
        v.Enabled = false
    elseif v:IsA("MeshPart") then
        v.Material = "Plastic"
        v.Reflectance = 0
        v.TextureID = 10385902758728957
    end
end
for i, e in pairs(l:GetChildren()) do
    if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
        e.Enabled = false
    end
end
end)

misc:Toggle("INF JUMP",false,function(state)
_G.iJumps = state
local InfiniteJumpEnabled = true
game:GetService("UserInputService").JumpRequest:connect(function()
	if InfiniteJumpEnabled then
		game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
		end
end)
end)
 
 misc:Button("Rejoin",function()
 local ts = game:GetService("TeleportService")

local p = game:GetService("Players").LocalPlayer

 

ts:Teleport(game.PlaceId, p)
end)
 								
misc:Button("Destroy Gui",function()
game.CoreGui["BlackTrap"]:Destroy()
end)

cred:Seperator("Credits")

cred:Button("Youtube Channel",function()
setclipboard('https://www.youtube.com/channel/UCA02zGXq3-etT3QljLAIgmA')
end)


cred:Button("Discord" ,function()
setclipboard("https://discord.gg/NFfqFWqhWy")
end)

local Animate = game.Players.LocalPlayer.Character.Animate


anim:Seperator("Animation")
local animDD; 
    anim:Dropdown("Select Animation", {"Default Animation",
  "Zombie"  ,
  "Astrounaut"  ,
  "Bubbly"  ,
  "Cartoony"  ,
  "Elder"  ,
  "Knight"  
  ,
  "Levitation"  ,
  "Mage"  ,
  "Ninja"  ,
  "Pirate"  ,
  "Robot"  ,
  "Stylish"  
  ,
  "Super Hero"  ,
  "Toy"  ,
  "Vampire"  ,
  "Werewolf"  ,
  "Patrol"  ,
  "Confident"  
  ,
  "PopStar"  ,
  "CowBoy"  ,
  "Ghost"  ,
  "Sneeky"  
  
  
    },  function(value)
        animDD = value; --STORES THE USERS SELECTION
    end)
  anim:Button("Set Animation", function()

        ---Loops---
        

if animDD == "Default Animation" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=2510196951"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=2510197257"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=2510202577"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=2510198475"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=2510197830"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=2510192778"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=2510195892"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
if animDD == "Zombie" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616158929"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616160636"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616168032"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616163682"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616161997"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616156119"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616157476"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
if animDD == "Astronout" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=891621366"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=891633237"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=891667138"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=891636393"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=891627522"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=891609353"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=891617961"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
if animDD == "Bubbly" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=910004836"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=910009958"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=910034870"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=910025107"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=910016857"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=910001910"
Animate.swimidle.SwimIdle.AnimationId = "http://www.roblox.com/asset/?id=910030921"
Animate.swim.Swim.AnimationId = "http://www.roblox.com/asset/?id=910028158"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
if animDD == "Cartoony" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=742637544"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=742638445"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=742640026"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=742638842"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=742637942"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=742636889"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=742637151"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
if animDD == "Elder" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=845397899"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=845400520"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=845403856"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=845386501"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=845398858"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=845392038"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=845396048"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
if animDD == "Knight" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=657595757"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=657568135"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=657552124"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=657564596"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=658409194"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=658360781"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=657600338"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
if animDD == "Levitation" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616006778"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616008087"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616013216"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616010382"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616008936"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616003713"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616005863"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
if animDD == "Mage" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=707742142"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=707855907"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=707897309"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=707861613"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=707853694"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=707826056"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=707829716"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
if animDD == "Ninja" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=656117400"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=656118341"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=656121766"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=656118852"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=656117878"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=656114359"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=656115606"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
if animDD == "Pirate" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=750781874"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=750782770"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=750785693"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=750783738"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=750782230"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=750779899"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=750780242"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
if animDD == "Robot" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616088211"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616089559"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616095330"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616091570"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616090535"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616086039"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616087089"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
if animDD == "Stylish" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616136790"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616138447"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616146177"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616140816"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616139451"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616133594"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616134815"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
if animDD == "Super Hero" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616111295"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616113536"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616122287"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616117076"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616115533"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616104706"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616108001"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
if animDD == "Toy" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=782841498"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=782845736"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=782843345"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=782842708"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=782847020"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=782843869"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=782846423"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
if animDD == "Vampire" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1083445855"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1083450166"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1083473930"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1083462077"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1083455352"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1083439238"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1083443587"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
if animDD == "Werewolf" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1083195517"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1083214717"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1083178339"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1083216690"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1083218792"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1083182000"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1083189019"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end

if animDD == "Patrol" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1149612882"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1150842221"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1151231493"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1150967949"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1148811837"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1148811837"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1148863382"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
if animDD == "Confident" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1069977950"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1069987858"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1070017263"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1070001516"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1069984524"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1069946257"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1069973677"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
if animDD == "PopStar" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1212900985"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1150842221"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1212980338"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1212980348"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1212954642"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1213044953"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1212900995"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
if animDD == "CowBoy" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1014390418"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1014398616"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1014421541"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1014401683"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1014394726"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1014380606"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1014384571"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
if animDD == "Ghost" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616006778"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616008087"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616013216"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616013216"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616008936"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616005863"
Animate.swimidle.SwimIdle.AnimationId = "http://www.roblox.com/asset/?id=616012453"
Animate.swim.Swim.AnimationId = "http://www.roblox.com/asset/?id=616011509"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
if animDD == "Sneeky" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1132473842"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1132477671"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1132510133"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1132494274"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1132489853"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1132461372"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1132469004"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
end)

    

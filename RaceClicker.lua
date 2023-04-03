-- Library
local Update =  loadstring(Game:HttpGet"https://raw.githubusercontent.com/Ryuenzz/VectorHub/main/UI")()
local Library = Update:Window("Vector Hub","",Enum.KeyCode.RightControl);
local main = Library:Tab("Main", "rbxassetid://6026568198")
local farm = Library:Tab("Auto Farm", "rbxassetid://7044284832")
local sss = Library:Tab("Teleport", "rbxassetid://6035190846")
local anim = Library:Tab("Animation", "rbxassetid://7743875962")
local egg = Library:Tab("Eggs", "rbxassetid://6031265976")
local misc = Library:Tab("Misc", "rbxassetid://6034509993")
local cred = Library:Tab("Credits", "rbxassetid://7743866778")

game:GetService("StarterGui"):SetCore("SendNotification",{
		Title = "VectorHub",
		Text = "Loading..",
		Icon = "rbxassetid://12932179211",
		Duration = 5
		})
game:GetService("StarterGui"):SetCore("SendNotification",{
		Title = "VectorHub",
		Text = "Success!!",
		Icon = "rbxassetid://12932179211",
		Duration = 5
		})

local player = game.Players.LocalPlayer
local antiAFK = true
player.Idled:connect(function()
	if antiAFK then
		game.VirtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
		wait(1)
		game.VirtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
	end
end)

main:Seperator("Vector Hub")
main:Label("Welcome "..game.Players.LocalPlayer.DisplayName)
Time = main:Label("Executer Time")

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

Client = main:Label1("Client")

function UpdateClient()
local Fps = workspace:GetRealPhysicsFPS()
Client:Refresh("[Fps] : "..Fps)
end

spawn(function()
 while true do wait(.1)
 UpdateClient()
 end
 end)

Client1 = main:Label1("Client")

function UpdateClient1()
local Ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
Client1:Refresh("[Ping] : "..Ping)
end

spawn(function()
 while true do wait(.1)
 UpdateClient1()
 end
 end)
 
 
 main:Label("Join My discord For More Info!")


main:Button("Copy Discord Link",function()
 setclipboard("https://discord.gg/NFfqFWqhWy")
 end)
 

main:Line()


main:Seperator("Main")
main:Button('Claim All Chests', function()
	workspace.goldenChest.circleInner.CFrame = player.Character.HumanoidRootPart.CFrame
	workspace.enchantedChest.circleInner.CFrame = player.Character.HumanoidRootPart.CFrame
	workspace.magmaChest.circleInner.CFrame = player.Character.HumanoidRootPart.CFrame
	workspace.groupRewardsCircle.circleInner.CFrame = player.Character.HumanoidRootPart.CFrame
	wait()
	workspace.goldenChest.circleInner.CFrame = oldGoldenChestPosition
	workspace.enchantedChest.circleInner.CFrame = oldEnchantedChestPosition
	workspace.magmaChest.circleInner.CFrame = oldMagmaChestPosition
	workspace.groupRewardsCircle.circleInner.CFrame = oldGroupRewardsPosition
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
	
main:Toggle("No Clip",false,function(value)
        _G.NoClip = value
    end)
main:Button("Low Server Hop",function()
        local module = loadstring(game:HttpGet"https://raw.githubusercontent.com/raw-scriptpastebin/FE/main/Server_Hop_Settings")()
		module:Teleport(game.PlaceId) ;
    end)
    
 

 main:Toggle("Spam Chat",false,function(state)   
 	_G.Chat = (state and true or false)
	wait()
	while _G.Chat == true do
		wait(1)
local args = {
    [1] = "Uciha Hub The Beast",
    [2] = "All"
}

game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
 
 end
 end)
 
 main:Toggle("Spam Chat",false,function(state)   
 	_G.Chat = (state and true or false)
	wait()
	while _G.Chat == true do
		wait(1)
local args = {
    [1] = "You're a Noob",
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

 main:Dropdown("Select Player",PLIST,function(value)
    TpPlayer = value;
end)



main:Button("Teleport To Player",function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =  game.Players[TpPlayer].Character.HumanoidRootPart.CFrame * CFrame.new(0,2,1)
end)
 
main:Slider("Speed",0,90000,300,function(v)
 game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
 end)

main:Slider("Jump",0,1000,50,function(v)
 game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
 end)
    
local Players = game:GetService("Players")

local lp = Players.LocalPlayer

-- Tables


local Eggs = {"5 Wins", "25 Wins", "175 Wins", "1k Wins", "10k Wins", "75k Wins", "250k Wins", "1M Wins", "2.5M Wins", "5M Wins"}
local Codes = {"UPDATECLICKCODE", "hallowx3", "Accelhidden", "opx3code", "500KLikes", "Almost100MVisits", "1MGroupMembers", "Thankyou50M", "NewUpdate", "LetsGo5KLikes", "ThanksFor5MillionsVisits"}

-- Main
farm:Seperator("Auto Farm")
farm:Label("[ Settings ]")

local setrace
farm:Dropdown("Select Mode",{
    "Auto Finish",
    "Super Fast",
    "Fast"
},function(value)
    setrace = value
if setrace == "Super Fast" then
        setrace = 99999999,0,0
elseif setrace == "Auto Finish" then
        setrace = -442415.71875, 2.9999988079071045, -70.02269744873047
elseif setrace =="Fast" then 
        setrace = 999999,0,0
       end
end)
local delay
farm:Dropdown("Select Delay",{0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1
},function(value)
    delay = value
--[[
if delay == "Super Fast" then
        delay = 0
elseif delay =="Fast" then 
        delay = 0.1
elseif delay =="Medium" then 
        delay = 0.5
elseif delay =="Slow" then 
        delay = 1
       end 
       ]]--
end)
farm:Seperator("Menu")
farm:Toggle("Auto Race",false,function(bool)
    getgenv().AutoFinish = bool
    
    task.spawn(function()
        while task.wait(delay) do
            if AutoFinish then
                pcall(function()
                  if lp.PlayerGui.TimerUI.RaceTimer.Visible == true then
                     --   local char = lp.Character
                     --   local hum = char.Humanoid
                     --   local hrp = char.HumanoidRootPart
                        game.Players.LocalPlayer.Character:MoveTo(Vector3.new(setrace))
                      --  hrp.CFrame = hrp.CFrame + CFrame.new(-442415.71875, 2.9999988079071045, -70.02269744873047) --Vector3.new(setrace, 0, 0)
                        
                    end
                end)
            end
        end
    end)
end)

farm:Toggle("Auto Click",false,function(bool)
    getgenv().AutoClick = bool
    
    task.spawn(function()
        while task.wait() do
            if AutoClick then
                if lp.PlayerGui.ClicksUI.ClickHelper.Visible == true then
                    game:GetService("ReplicatedStorage").Packages.Knit.Services.ClickService.RF.Click:InvokeServer()
                end
            end
        end
    end)
end)

farm:Toggle("Auto Rebirth",false,function(bool)
    getgenv().AutoRebirth = bool
    
    task.spawn(function()
        while task.wait() do
            if AutoRebirth then
                game:GetService("ReplicatedStorage").Packages.Knit.Services.RebirthService.RF.Rebirth:InvokeServer()
                task.wait(1)
            end
        end
    end)
end)

egg:Seperator("Eggs")
local choosed_egg
egg:Dropdown("Choose Egg",{unpack(Eggs)},function(egg)
    if egg == Eggs[1] then
       choosed_egg = "Starter01"
    elseif egg == Eggs[2] then
        choosed_egg = "Starter02"
    elseif egg == Eggs[3] then
        choosed_egg = "Starter03"
    elseif egg == Eggs[4] then
        choosed_egg = "Starter04"
    elseif egg == Eggs[5] then
        choosed_egg = "Pro01"
    elseif egg == Eggs[6] then
        choosed_egg = "Pro02"
    elseif egg == Eggs[7] then
        choosed_egg = "Pro03"
    elseif egg == Eggs[8] then
        choosed_egg = "Space01"
    elseif egg == Eggs[9] then
        choosed_egg = "Ocean01"
    end
end)

egg:Toggle("Auto Hatch",false,function(bool)
    getgenv().AutoHatch = bool
    
    task.spawn(function()
        while task.wait() do
            if AutoHatch then
                if choosed_egg then
                    local args = {[1] = choosed_egg,[2] = "1",[3] = {}}
                    game:GetService("ReplicatedStorage").Packages.Knit.Services.EggService.RF.Open:InvokeServer(unpack(args))
                else
                    warn("Please, choose your egg !")
                end
            end
        end
    end)
end)

egg:Toggle("Auto Craft",false,function(bool)
    getgenv().AutoCraft = bool
    
    task.spawn(function()
        while task.wait(3) do
            if AutoCraft then
                game:GetService("ReplicatedStorage").Packages.Knit.Services.PetsService.RF.CraftAll:InvokeServer()
            end
        end
    end)
end)

egg:Toggle("Auto Equip Beast",false,function(bool)
    getgenv().AutoEquipBest = bool
    
    task.spawn(function()
        while task.wait(3) do
            if AutoEquipBest then
                game:GetService("ReplicatedStorage").Packages.Knit.Services.PetsService.RF.EquipBest:InvokeServer()
            end
        end
    end)
end)
sss:Seperator("Teleport")
local map
sss:Dropdown("Select Map",{"Home","Space","Ocean"

},function(v)
    map = v
end)
sss:Button("Teleport",function()
game:GetService("ReplicatedStorage").Packages.Knit.Services.WorldService.RF.Travel:InvokeServer(map)    
end)
main:Button("Redeem Codes",function()
    for i,v in (Codes) do
        local args = {[1] = v}
        game:GetService("ReplicatedStorage").Packages.Knit.Services.CodesService.RF.Redeem:InvokeServer(unpack(args))
    end
end)
misc:Seperator("Misc")

	
misc:Button("Dissable Jump",function()
	game.Players.LocalPlayer.Character.Humanoid.JumpPower = 0
end)

misc:Button("Enable Jump",function()
	game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
end)





misc:Toggle("ANTI AFK",false,function(v)
antiAFK = v
while antiAFK do
wait()
local player = game.Players.LocalPlayer
player.Idled:connect(function()
	if antiAFK then
		game.VirtualUser:Button2Down(Vector2.new(1, 0), workspace.CurrentCamera.CFrame)
		wait(1)
		game.VirtualUser:Button2Up(Vector2.new(1, 0), workspace.CurrentCamera.CFrame)
	end
end)
end
end)

misc:Button("Active FPS BOOST",false,function()
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

misc:Toggle("INF JUMP",false,function(v)
_G.InfJump = v
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
game.CoreGui["RELZHUB"]:Destroy()
end)

cred:Seperator("Credits")

cred:Button("Youtube Channel",function()
setclipboard('https://www.youtube.com/channel/UCA02zGXq3-etT3QljLAIgmA')
end)
cred:Button("Discord",function()
setclipboard("https://discord.gg/NFfqFWqhWy")
end)

local Animate = game.Players.LocalPlayer.Character.Animate


anim:Seperator("Animation")
local getAnimation; 
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
        getAnimation = value; --STORES THE USERS SELECTION
    end)
  anim:Button("Set Animation", function()

        ---Loops---
        

if getAnimation == "Default Animation" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=2510196951"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=2510197257"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=2510202577"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=2510198475"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=2510197830"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=2510192778"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=2510195892"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
if getAnimation == "Zombie" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616158929"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616160636"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616168032"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616163682"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616161997"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616156119"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616157476"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
if getAnimation == "Astronout" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=891621366"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=891633237"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=891667138"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=891636393"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=891627522"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=891609353"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=891617961"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
if getAnimation == "Bubbly" then

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
if getAnimation == "Cartoony" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=742637544"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=742638445"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=742640026"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=742638842"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=742637942"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=742636889"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=742637151"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
if getAnimation == "Elder" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=845397899"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=845400520"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=845403856"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=845386501"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=845398858"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=845392038"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=845396048"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
if getAnimation == "Knight" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=657595757"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=657568135"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=657552124"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=657564596"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=658409194"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=658360781"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=657600338"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
if getAnimation == "Levitation" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616006778"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616008087"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616013216"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616010382"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616008936"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616003713"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616005863"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
if getAnimation == "Mage" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=707742142"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=707855907"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=707897309"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=707861613"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=707853694"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=707826056"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=707829716"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
if getAnimation == "Ninja" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=656117400"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=656118341"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=656121766"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=656118852"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=656117878"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=656114359"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=656115606"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
if getAnimation == "Pirate" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=750781874"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=750782770"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=750785693"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=750783738"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=750782230"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=750779899"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=750780242"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
if getAnimation == "Robot" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616088211"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616089559"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616095330"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616091570"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616090535"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616086039"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616087089"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
if getAnimation == "Stylish" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616136790"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616138447"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616146177"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616140816"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616139451"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616133594"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616134815"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
if getAnimation == "Super Hero" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616111295"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616113536"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616122287"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616117076"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616115533"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616104706"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616108001"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
if getAnimation == "Toy" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=782841498"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=782845736"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=782843345"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=782842708"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=782847020"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=782843869"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=782846423"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
if getAnimation == "Vampire" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1083445855"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1083450166"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1083473930"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1083462077"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1083455352"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1083439238"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1083443587"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
if getAnimation == "Werewolf" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1083195517"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1083214717"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1083178339"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1083216690"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1083218792"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1083182000"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1083189019"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end

if getAnimation == "Patrol" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1149612882"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1150842221"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1151231493"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1150967949"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1148811837"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1148811837"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1148863382"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
if getAnimation == "Confident" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1069977950"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1069987858"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1070017263"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1070001516"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1069984524"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1069946257"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1069973677"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
if getAnimation == "PopStar" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1212900985"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1150842221"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1212980338"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1212980348"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1212954642"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1213044953"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1212900995"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
if getAnimation == "CowBoy" then

Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1014390418"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1014398616"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1014421541"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1014401683"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1014394726"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1014380606"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1014384571"
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
if getAnimation == "Ghost" then

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
if getAnimation == "Sneeky" then

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

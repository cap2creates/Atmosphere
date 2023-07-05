local TweenService = game:GetService("TweenService")
local Atmosphere = {}
local AtmosphereLib
local AtmosphereMainVariables
local ImageIDs
local GuiSettings
local function setSettings()
    AtmosphereMainVariables = {
         ["Colors"] = {
            ["TopBarButtons"] = Color3.fromRGB(140,140,140),
            ["MinimizeButton"] = Color3.fromRGB(255,255,255),
            ["TextColor"] = Color3.fromRGB(55,55,55)            },
        ["UIStrokeSettings"] = {
            ["Thickness"] = 2,
            ["Color"] = Color3.fromRGB(0, 0, 0),
            ["StrokeMode"] = Enum.ApplyStrokeMode.Contextual,
            ["LineMode"] = Enum.LineJoinMode.Round,
            ["Transparency"] = 0
        },
        ["CheckMarkSettings"] = {
            ["CheckButtonSize"] = UDim2.new(0.25,0,0.2,0),
            ["CheckMarkSize"] = UDim2.new(0.1,0,0.2,0)
        }
    }
    AtmosphereMainVariables["TextLabelSettings"] = {
            ["Font"] = Enum.Font.FredokaOne,
            ["Color"] = AtmosphereMainVariables["Colors"]["TextColor"],
            ["Scaled"] = true,
            ["Size"] = nil
        }
     ImageIDs = {
        ["Minimize"] = "http://www.roblox.com/asset/?id=11622919444",
        ["Open"] = "http://www.roblox.com/asset/?id=12072054746"
    }
end
local function findAtmosphere()
    local item = nil
    for i,v in pairs(game.Players.LocalPlayer.PlayerGui:GetChildren()) do
        if v.Name == "AtmosphereLib" and v:FindFirstChild("MainFrame") then
            item = v
            break
        end
    end
    return item
end
local function createGui()
    local AtmosphereGUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/cap2creates/Atmosphere/main/gui.lua"))()
    AtmosphereLib = AtmosphereGUI
    local Label = AtmosphereGUI.MainFrame.TopBar.Title
    if not Label then return end
    AtmosphereLib.MainFrame.Size = 0.5,0,0,0
    AtmosphereLib.MainFrame.Visible = false
    Label.Font = AtmosphereMainVariables["TextLabelSettings"]["Font"]
    Label.TextScaled = AtmosphereMainVariables["TextLabelSettings"]["Scaled"]
    Label.TextColor3 = AtmosphereMainVariables["TextLabelSettings"]["Color"]
    if not Label.TextScaled then Label.TextSize = AtmosphereMainVariables["TextLabelSettings"]["Size"] end
    Label.Text = GuiSettings["GUIName"]
    local stroke = Instance.new("UIStroke",Label)
    stroke.Thickness = AtmosphereMainVariables["UIStrokeSettings"]["Thickness"]
    stroke.Color = AtmosphereMainVariables["UIStrokeSettings"]["Color"]
    stroke.ApplyStrokeMode = AtmosphereMainVariables["UIStrokeSettings"]["StrokeMode"]
    stroke.LineJoinMode = AtmosphereMainVariables["UIStrokeSettings"]["LineMode"]
    stroke.Transparency = AtmosphereMainVariables["UIStrokeSettings"]["Transparency"]
    return AtmosphereLib
end
local function createLoadingScreen()
    local AtmosphereLib = Instance.new("ScreenGui")
    local LoadingScreen = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local UIGradient = Instance.new("UIGradient")
    local MainLabel = Instance.new("TextLabel")
    local KeyBox = Instance.new("TextBox")
    local UICorner_2 = Instance.new("UICorner")
    local Check = Instance.new("TextButton")
    local UICorner_3 = Instance.new("UICorner")
    local CheckMark = Instance.new("ImageLabel")

    LoadingScreen.Name = "LoadingScreen"
    LoadingScreen.Parent = AtmosphereLib
    LoadingScreen.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    LoadingScreen.Position = UDim2.new(0.410810798, 0, 0.411856472, 0)
    LoadingScreen.Size = UDim2.new(0.174999997, 0, 0.174999997, 0)

    UICorner.CornerRadius = UDim.new(0, 12)
    UICorner.Parent = LoadingScreen

    UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(35, 35, 35)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(75, 75, 75))}
    UIGradient.Parent = LoadingScreen

    MainLabel.Name = "MainLabel"
    MainLabel.Parent = LoadingScreen
    MainLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MainLabel.BackgroundTransparency = 1.000
    MainLabel.Size = UDim2.new(1, 0, 0.600000024, 0)
    MainLabel.Font = Enum.Font.FredokaOne
    MainLabel.Text = "Atmosphere"
    MainLabel.TextColor3 = Color3.fromRGB(50, 50, 50)
    MainLabel.TextScaled = true
    MainLabel.TextSize = 35.000
    MainLabel.TextWrapped = true

    KeyBox.Name = "KeyBox"
    KeyBox.Parent = LoadingScreen
    KeyBox.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    KeyBox.Position = UDim2.new(0.0500000007, 0, 0.699999988, 0)
    KeyBox.Size = UDim2.new(0.600000024, 0, 0.200000003, 0)
    KeyBox.Font = Enum.Font.FredokaOne
    KeyBox.PlaceholderColor3 = Color3.fromRGB(50, 50, 50)
    KeyBox.PlaceholderText = "Key Here"
    KeyBox.Text = ""
    KeyBox.TextColor3 = Color3.fromRGB(50, 50, 50)
    KeyBox.TextScaled = true
    KeyBox.TextSize = 14.000
    KeyBox.TextWrapped = true

    UICorner_2.CornerRadius = UDim.new(0, 12)
    UICorner_2.Parent = KeyBox

    Check.Name = "Check"
    Check.Parent = LoadingScreen
    Check.BackgroundColor3 = Color3.fromRGB(40, 150, 255)
    Check.Position = UDim2.new(0.699999988, 0, 0.699999988, 0)
    Check.Size = UDim2.new(0.25, 0, 0.200000003, 0)
    Check.Font = Enum.Font.FredokaOne
    Check.Text = "Check"
    Check.TextColor3 = Color3.fromRGB(10, 110, 210)
    Check.TextScaled = true
    Check.TextSize = 20.000
    Check.TextWrapped = true

    UICorner_3.CornerRadius = UDim.new(1,0)
    UICorner_3.Parent = Check

    CheckMark.Name = "CheckMark"
    CheckMark.Parent = Check
    CheckMark.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    CheckMark.BackgroundTransparency = 1.000
    CheckMark.Position = UDim2.new(0.200000003, 0, 0.200000003, 0)
    CheckMark.Size = UDim2.new(0.600000024, 0, 0.600000024, 0)
    CheckMark.SizeConstraint = Enum.SizeConstraint.RelativeYY
    CheckMark.Visible = true
    CheckMark.Image = "http://www.roblox.com/asset/?id=12690727184"
    CheckMark.ImageTransparency = 1
    return LoadingScreen
end
function Atmosphere:LoadingScreen(info)
    if findAtmosphere() then
        findAtmosphere().Disconnect.Value = true
    end
    GuiSettings = info["GUIInfo"]
    local lS = createLoadingScreen()
    LS.Size = UDim2.new(0.175,0,0,0)
    TweenService:Create(lS,TweenInfo.new(0.5,"Bounce","Out",0),{Size = UDim2.new(0.175,0,0.175,0)}):Play()
    if info.KeyEnabled == true then
        lS.KeyBox.Visible = true
        lS.Check.Visible = true
        lS.Check.MouseButton1Click:Connect(function()
            if ls.KeyBox.Text == info["Key"] then
                local tween = TweenService:Create(lS.Check,TweenInfo.new(0.75,"Linear","Out",0),{Size = UDim2.new(0.1,0,0.2,0)})
                tween:Play()
                task.wait(0.4)
                local tween2 = TweenService:Create(lS.Check,TweenInfo.new(0.75,"Linear","Out",0),{TextTransparency = 1})
                tween2:Play()
                spawn(function()
                    local tween3 = TweenService:Create(lS.Check.CheckMark,TweenInfo.new(0.35,"Linear","Out",0),{ImageTransparency = 0})
                    tween3:Play()
                end)
                tween = TweenService:Create(lS,TweenInfo.new(0.6,"Linear","Out",0),{Size = UDim2.new(0.175,0,0,0)})
                tween:Play()
                task.wait(0.6)
                lS.Visible = false
            end
        end)
    else
        task.wait(3)
        local tween = TweenService:Create(lS,TweenInfo.new(0.6,"Linear","Out",0),{Size = UDim2.new(0.175,0,0,0)})
        task.wait(0.6)
    end
    task.wait(0.15)
    AtmosphereLib.MainFrame.Visible = true
    local tween = TweenService:Create(AtmosphereLib.MainFrame,TweenInfo.new(0.85,"Linear","Out",0),{Size = UDim2.new(0.5,0,0.5,0)})
end
spawn(function()
    if not findAtmosphere() then repeat task.wait() until findAtmosphere() end
    findAtmosphere().Disconnect.Changed:Connect(function()
        if findAtmosphere().Disconnect.Value == true then
            findAtmosphere():Destroy()
        end
    end)
end)
function Atmosphere:Initiate()
    setSettings()
    createGui()
end
function Atmosphere:Destroy()
    findAtmosphere():Destroy()
end
return Atmosphere

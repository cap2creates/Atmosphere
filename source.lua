--its returned, W.I.P
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
            ["TextColor"] = Color3.fromRGB(55,55,55)
        },
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
        },
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
    Label.Text = GuiSettings["GUIName"]
    AtmosphereLib.MainFrame.Size = UDim2.new(0.5,0,0,0)
    AtmosphereLib.MainFrame.Visible = false
    Label.Font = AtmosphereMainVariables["TextLabelSettings"]["Font"]
    Label.TextScaled = AtmosphereMainVariables["TextLabelSettings"]["Scaled"]
    Label.TextColor3 = AtmosphereMainVariables["TextLabelSettings"]["Color"]
    if not Label.TextScaled then Label.TextSize = AtmosphereMainVariables["TextLabelSettings"]["Size"] end
    local stroke = Instance.new("UIStroke",Label)
    stroke.Thickness = AtmosphereMainVariables["UIStrokeSettings"]["Thickness"]
    stroke.Color = AtmosphereMainVariables["UIStrokeSettings"]["Color"]
    stroke.ApplyStrokeMode = AtmosphereMainVariables["UIStrokeSettings"]["StrokeMode"]
    stroke.LineJoinMode = AtmosphereMainVariables["UIStrokeSettings"]["LineMode"]
    stroke.Transparency = AtmosphereMainVariables["UIStrokeSettings"]["Transparency"]
    return AtmosphereLib
end
local function drag(input)
	local uis = game:GetService("UserInputService")
	local rs = game:GetService("RunService")
	local gui = input
	local dragging
	local dragInput
	local dragStart
	local startPos
	local function lerp(a, b, m)
		return a + (b - a) * m
	end
	local lastMousePos
	local lastGoalPos
	local DRAG_SPEED = (8)
	local function update(dt)
		if not (startPos) then return end;
		if not (dragging) and (lastGoalPos) then
			gui.Position = UDim2.new(startPos.X.Scale, lerp(gui.Position.X.Offset, lastGoalPos.X.Offset, dt * DRAG_SPEED), startPos.Y.Scale, lerp(gui.Position.Y.Offset, lastGoalPos.Y.Offset, dt * DRAG_SPEED))
			return 
		end
		local delta = (lastMousePos - uis:GetMouseLocation())
		local xGoal = (startPos.X.Offset - delta.X)
		local yGoal = (startPos.Y.Offset - delta.Y)
		lastGoalPos = UDim2.new(startPos.X.Scale, xGoal, startPos.Y.Scale, yGoal)
		gui.Position = UDim2.new(startPos.X.Scale, lerp(gui.Position.X.Offset, xGoal, dt * DRAG_SPEED), startPos.Y.Scale, lerp(gui.Position.Y.Offset, yGoal, dt * DRAG_SPEED))
	end;
	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position
			lastMousePos = uis:GetMouseLocation()

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	rs.Heartbeat:Connect(update)
end
local function createLoadingScreen()
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

    local stroke = Instance.new("UIStroke",MainLabel)
    stroke.Thickness = AtmosphereMainVariables["UIStrokeSettings"]["Thickness"]
    stroke.Color = AtmosphereMainVariables["UIStrokeSettings"]["Color"]
    stroke.ApplyStrokeMode = AtmosphereMainVariables["UIStrokeSettings"]["StrokeMode"]
    stroke.LineJoinMode = AtmosphereMainVariables["UIStrokeSettings"]["LineMode"]
    stroke.Transparency = AtmosphereMainVariables["UIStrokeSettings"]["Transparency"]

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
    KeyBox.Visible = false

    local stroke = Instance.new("UIStroke",KeyBox)
    stroke.Thickness = AtmosphereMainVariables["UIStrokeSettings"]["Thickness"]
    stroke.Color = AtmosphereMainVariables["UIStrokeSettings"]["Color"]
    stroke.ApplyStrokeMode = AtmosphereMainVariables["UIStrokeSettings"]["StrokeMode"]
    stroke.LineJoinMode = AtmosphereMainVariables["UIStrokeSettings"]["LineMode"]
    stroke.Transparency = AtmosphereMainVariables["UIStrokeSettings"]["Transparency"]

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
    Check.Visible = false

    local stroke = Instance.new("UIStroke",Check)
    stroke.Thickness = AtmosphereMainVariables["UIStrokeSettings"]["Thickness"]
    stroke.Color = AtmosphereMainVariables["UIStrokeSettings"]["Color"]
    stroke.ApplyStrokeMode = AtmosphereMainVariables["UIStrokeSettings"]["StrokeMode"]
    stroke.LineJoinMode = AtmosphereMainVariables["UIStrokeSettings"]["LineMode"]
    stroke.Transparency = AtmosphereMainVariables["UIStrokeSettings"]["Transparency"]

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
    spawn(function()
        GuiSettings = info["GUIInfo"]
        if findAtmosphere() then
            findAtmosphere().Disconnect.Value = true
        end
        repeat wait() until findAtmosphere()
        local lS = createLoadingScreen()
        lS.Size = UDim2.new(0.1+(info["KeyEnabled"]==true and 0.75 or 0),0,0,0)
        lS.Visible = true
        if info["KeyEnabled"] == false then lS.MainLabel.Size = UDim2.new(1,0,1,0) end
        TweenService:Create(lS,TweenInfo.new(0.2,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0),{Size = UDim2.new(0.175,0,0.175,0)}):Play()
        if info["KeyEnabled"] == true then
            lS.KeyBox.Visible = true
            lS.Check.Visible = true
            local keyGuessed = false
            lS.Check.MouseButton1Click:Connect(function()
                if lS.KeyBox.Text == info["Key"] then
                    local tween = TweenService:Create(lS.Check,TweenInfo.new(0.2,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0),{Size = UDim2.new(0.1,0,0.2,0)})
                    tween:Play()
                    task.wait(0.4)
                    local tween2 = TweenService:Create(lS.Check,TweenInfo.new(0.1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0),{TextTransparency = 1})
                    local tween3 = TweenService:Create(lS.Check.UIStroke,TweenInfo.new(0.1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0),{Transparency = 1})
                    tween3:Play()
                    tween2:Play()
                    spawn(function()
                        task.wait(0.1)
                        local tween3 = TweenService:Create(lS.Check.CheckMark,TweenInfo.new(0.1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0),{ImageTransparency = 0})
                        tween3:Play()
                    end)
                    task.wait(1.2)
                    tween = TweenService:Create(lS,TweenInfo.new(0.15,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0),{Size = UDim2.new(0.175,0,0,0)})
                    tween:Play()
                    task.wait(0.1)
                    lS.Visible = false
                    keyGuessed = true
                end
            end)
            repeat wait() until keyGuessed == true
        elseif info["KeyEnabled"] == false then
            task.wait(3)
            local tween = TweenService:Create(lS,TweenInfo.new(0.15,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0),{Size = UDim2.new(0.175,0,0,0)})
            tween:Play()
            task.wait(0.1)
            lS.Visible = false
        end
        task.wait(0.5)
        AtmosphereLib.MainFrame.Visible = true
        local tween = TweenService:Create(AtmosphereLib.MainFrame,TweenInfo.new(0.22,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0),{Size = UDim2.new(0.5,0,0.5,0)})
        tween:Play()
    end)
end
spawn(function()
    if not findAtmosphere() then repeat task.wait() until findAtmosphere() end
    findAtmosphere().Disconnect.Changed:Connect(function()
        if findAtmosphere().Disconnect.Value == true then
            findAtmosphere():Destroy()
        end
    end)
end)
function Atmosphere:Init()
    setSettings()
    createGui()
    drag(AtmosphereLib.MainFrame)
    AtmosphereLib.MainFrame.TopBar.Buttons.Close.MouseButton1Click:Connect(function()
        Atmosphere:Destroy()
    end)
end
function Atmosphere:Destroy()
    AtmosphereLib:Destroy()
end
return Atmosphere

--[[testing gui lib
Atmosphere:LoadingScreen({
    ["KeyEnabled"] = false, --if there is a key, i made a key system myself no need to make your own
    ["Key"] = "sigma", --if keys are enabled, people have to enter this to open the gui
    ["GUIInfo"] = { --info for the gui
      ["GUIName"] = "sdad" --name of the gui
    }
})

Atmosphere:Init()]]

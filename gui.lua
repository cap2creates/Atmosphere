-- Gui to Lua
-- Version: 3.2

-- Instances:

local AtmosphereLib = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TopBar = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local ExtraFrame = Instance.new("Frame")
local Buttons = Instance.new("Folder")
local Minimize = Instance.new("ImageButton")
local Close = Instance.new("ImageButton")
local Title = Instance.new("TextLabel")
local BottomBar = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local ExtraFrame_2 = Instance.new("Frame")
local ButtonMainFrame = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local Catergories = Instance.new("ScrollingFrame")
local UIListLayout_2 = Instance.new("UIListLayout")

AtmosphereLib.Name = "AtmosphereLib"
AtmosphereLib.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
AtmosphereLib.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainFrame.Name = "MainFrame"
MainFrame.Parent = AtmosphereLib
MainFrame.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.375, 0, 0.25, 0)
MainFrame.Size = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.SizeConstraint = Enum.SizeConstraint.RelativeYY

TopBar.Name = "TopBar"
TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
TopBar.Position = UDim2.new(0, 0, -0.100000001, 0)
TopBar.Size = UDim2.new(1, 0, 0.100000001, 0)

UICorner.CornerRadius = UDim.new(1, 0)
UICorner.Parent = TopBar

ExtraFrame.Name = "ExtraFrame"
ExtraFrame.Parent = TopBar
ExtraFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
ExtraFrame.BorderSizePixel = 0
ExtraFrame.Position = UDim2.new(0, 0, 0.5, 0)
ExtraFrame.Size = UDim2.new(1, 0, 0.5, 0)

Buttons.Name = "Buttons"
Buttons.Parent = TopBar

Minimize.Name = "Minimize"
Minimize.Parent = Buttons
Minimize.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Minimize.BackgroundTransparency = 1.000
Minimize.Position = UDim2.new(0.75, 0, 0.0500000007, 0)
Minimize.Size = UDim2.new(0.899999976, 0, 0.899999976, 0)
Minimize.SizeConstraint = Enum.SizeConstraint.RelativeYY
Minimize.Image = "http://www.roblox.com/asset/?id=11622919444"
Minimize.ImageColor3 = Color3.fromRGB(140, 140, 140)
Minimize.ScaleType = Enum.ScaleType.Fit

Close.Name = "Close"
Close.Parent = Buttons
Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Close.BackgroundTransparency = 1.000
Close.Position = UDim2.new(0.875, 0, 0.0500000007, 0)
Close.Size = UDim2.new(0.899999976, 0, 0.899999976, 0)
Close.SizeConstraint = Enum.SizeConstraint.RelativeYY
Close.Image = "http://www.roblox.com/asset/?id=9545003266"
Close.ImageColor3 = Color3.fromRGB(140, 140, 140)

Title.Name = "Title"
Title.Parent = TopBar
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.Size = UDim2.new(0.699999988, 0, 1, 0)
Title.Font = Enum.Font.SourceSans
Title.TextColor3 = Color3.fromRGB(0, 0, 0)
Title.TextSize = 14.000

BottomBar.Name = "BottomBar"
BottomBar.Parent = MainFrame
BottomBar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
BottomBar.Position = UDim2.new(0, 0, 1, 0)
BottomBar.Size = UDim2.new(1, 0, 0.100000001, 0)

UICorner_2.CornerRadius = UDim.new(1, 0)
UICorner_2.Parent = BottomBar

ExtraFrame_2.Name = "ExtraFrame"
ExtraFrame_2.Parent = BottomBar
ExtraFrame_2.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
ExtraFrame_2.BorderSizePixel = 0
ExtraFrame_2.Size = UDim2.new(1, 0, 0.5, 0)

ButtonMainFrame.Name = "ButtonMainFrame"
ButtonMainFrame.Parent = MainFrame
ButtonMainFrame.Active = true
ButtonMainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ButtonMainFrame.BackgroundTransparency = 1.000
ButtonMainFrame.Position = UDim2.new(0, 0, 0.100000001, 0)
ButtonMainFrame.Size = UDim2.new(1, 0, 0.899999976, 0)
ButtonMainFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ButtonMainFrame.ScrollBarThickness = 0

UIListLayout.Parent = ButtonMainFrame
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0.0500000007, 0)

Catergories.Name = "Catergories"
Catergories.Parent = MainFrame
Catergories.Active = true
Catergories.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Catergories.BackgroundTransparency = 1.000
Catergories.Size = UDim2.new(1, 0, 0.100000001, 0)
Catergories.CanvasSize = UDim2.new(0, 0, 0, 0)
Catergories.ScrollBarThickness = 0

UIListLayout_2.Parent = Catergories
UIListLayout_2.FillDirection = Enum.FillDirection.Horizontal
UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_2.VerticalAlignment = Enum.VerticalAlignment.Center
UIListLayout_2.Padding = UDim.new(0.0500000007, 0)

return AtmosphereLib

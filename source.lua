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
local function createGui()
    local AtmosphereGUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/cap2creates/Atmosphere/main/gui.lua"))()
    AtmosphereLib = AtmosphereGUI
    local Label = AtmosphereGUI.MainFrame.TopBar.Title
    if not Label then return end
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

function Atmosphere:LoadingScreen(info)
    --[[if findAtmosphere() then
        findAtmosphere().Disconnect.Value = true
    end]]
    GuiSettings = info["GUIInfo"]
    if info.KeyEnabled == true then
        --later
    end
end
function Atmosphere:Initiate()
    setSettings()
    createGui()
end
Atmosphere:LoadingScreen({["KeyEnabled"] = false, ["GUIInfo"] = {["GUIName"] = "amogas"}})
Atmosphere:Initiate()
return Atmosphere

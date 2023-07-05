local Atmosphere
local AtmosphereMainVariables
local ImageIDs
local GuiSettings
function setSettings()
    if AtmosphereMainVariables then
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
            ["TextLabelSettings"] = {
                ["Font"] = Enum.Font.FredokaOne,
                ["Color"] = AtmosphereMainVariables["Colors"]["TextColor"],
                ["Scaled"] = true,
                ["Size"] = nil,
                [""]
            }
        }
    end
    if ImageIDs then
        ImageIDs = {
            ["Minimize"] = "http://www.roblox.com/asset/?id=11622919444",
            ["Open"] = "http://www.roblox.com/asset/?id=12072054746"
        }
    end
end
function createGui()
    local AtmosphereLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/cap2creates/Atmosphere/main/gui.lua"))()
    Atmosphere = AtmosphereLib
    local Label = AtmosphereLib.MainFrame.TopBar.Title
    if not Label or not AtmosphereMainVariables then return end
    Label.Font = AtmosphereMainVariables["TextLabelSettings"]["Font"]
    Label.TextScaled = AtmosphereMainVariables["TextLabelSettings"]["Scaled"]
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
    if findAtmosphere() then
        findAtmosphere().Disconnect.Value = true
    end
    if info.KeyEnabled == true then
        --later
    end
    createGui()
end

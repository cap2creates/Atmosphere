--[[
Welcome to Atmosphere! Atmosphere is a gui library that i made because i had absolutely nothing to do and was bored.
This script has the loadstring and all of the functions and how Atmosphere works, so please read before use of Atmosphere
All gui and code is free to use but please give credit because i worked hard on this
Please leave all of the tables and things in the tables, Atmosphere will break if you dont
]]
local Atmosphere = loadstring(game:HttpGet("https://raw.githubusercontent.com/cap2creates/Atmosphere/main/source.lua"))() --The loadstring, always put at the start of the script

Atmosphere:LoadingScreen({
    ["KeyEnabled"] = true, --if there is a key, i made a key system myself no need to make your own
    ["Key"] = "", --if keys are enabled, people have to enter this to open the gui
    ["GUIInfo"] = { --info for the gui
      ["GUIName"] = "" --name of the gui
    }
})

Atmosphere:Initiate() --ALWAYS put this at the end of your script, if it isnt placed Atmosphere wont load because this has the gui and sets the settings

--Notes
--[[
Saving isnt added yet, coming when i learn about JSON and files and stuff
All made by me, everything you see is from me
Inspired by: Orion and Rayfield (i kinda used the grey theme)
]]

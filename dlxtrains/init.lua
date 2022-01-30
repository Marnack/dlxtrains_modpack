
dlxtrains = {}

-- Support localized strings if intllib mod is installed.
if minetest.get_modpath( "intllib" ) and intllib then
	dlxtrains.S = intllib.Getter()
else
	dlxtrains.S = function(s) return s end
end

local maximum_wagon_length_enum = minetest.settings:get("dlxtrains_maximum_wagon_length") or "Unlimited"
dlxtrains.max_wagon_length = ({["5m"]=5, ["6m"]=6, ["7m"]=7, ["8m"]=8, ["Unlimited"]=100})[maximum_wagon_length_enum]

local locomotive_sounds_enum = minetest.settings:get("dlxtrains_locomotive_sounds") or "Dynamic"
dlxtrains.locomotive_sounds = ({["Off"]=0, ["Constant"]=1, ["Dynamic"]=2})[locomotive_sounds_enum]

local locomotive_smoke_enum = minetest.settings:get("dlxtrains_locomotive_smoke") or "Dynamic"
dlxtrains.locomotive_smoke = ({["Off"]=0, ["Constant"]=1, ["Dynamic"]=2})[locomotive_smoke_enum]

local dlxtrains_path = minetest.get_modpath("dlxtrains")

advtrains.register_coupler_type("knuckle", dlxtrains.S("Knuckle Coupler"))

dofile(dlxtrains_path.."/items.lua")
dofile(dlxtrains_path.."/tools.lua")
dofile(dlxtrains_path.."/livery_functions.lua")

-- Cleanup
dlxtrains.S = nil

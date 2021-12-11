
dlxtrains = {}

-- Support localized strings if intllib mod is installed.
if minetest.get_modpath( "intllib" ) and intllib then
	dlxtrains.S = intllib.Getter()
else
	dlxtrains.S = function(s) return s end
end

local maximum_wagon_length_enum = minetest.settings:get("dlxtrains_maximum_wagon_length") or "Unlimited"
dlxtrains.max_wagon_length = ({["5m"]=5, ["6m"]=6, ["7m"]=7, ["8m"]=8, ["Unlimited"]=100})[maximum_wagon_length_enum]

local dlxtrains_path = minetest.get_modpath("dlxtrains")

advtrains.register_coupler_type("knuckle",attrans("Knuckle Coupler"))

dofile(dlxtrains_path.."/items.lua")
dofile(dlxtrains_path.."/tools.lua")
dofile(dlxtrains_path.."/livery_functions.lua")

-- Cleanup
dlxtrains.S = nil

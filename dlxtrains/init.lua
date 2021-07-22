
dlxtrains = {}

-- Support localized strings if intllib mod is installed.
if minetest.get_modpath( "intllib" ) and intllib then
	dlxtrains.S = intllib.Getter()
else
	dlxtrains.S = function(s) return s end
end

local dlxtrains_path = minetest.get_modpath("dlxtrains")

dofile(dlxtrains_path.."/items.lua")
dofile(dlxtrains_path.."/tools.lua")
dofile(dlxtrains_path.."/livery_functions.lua")

-- Cleanup
dlxtrains.S = nil

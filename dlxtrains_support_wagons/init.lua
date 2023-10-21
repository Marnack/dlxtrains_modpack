local mod_name = "dlxtrains_support_wagons"

dlxtrains_support_wagons = {}

dlxtrains_support_wagons.S = minetest.get_translator(mod_name)

dlxtrains_support_wagons.max_wagon_length = 100	-- A large number to represent "unlimited"

if minetest.get_modpath( "dlxtrains" ) and dlxtrains then
	dlxtrains_support_wagons.max_wagon_length = dlxtrains.max_wagon_length
end

local mod_path = minetest.get_modpath(mod_name)
dofile(mod_path.."/items.lua")
dofile(mod_path.."/wagons.lua")
dofile(mod_path.."/wagon_recipes.lua")

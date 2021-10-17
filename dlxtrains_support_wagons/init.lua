
dlxtrains_support_wagons = {}

-- Support localized strings if intllib mod is installed.
if minetest.get_modpath( "intllib" ) and intllib then
	dlxtrains_support_wagons.S = intllib.Getter()
else
	dlxtrains_support_wagons.S = function(s) return s end
end

dlxtrains_support_wagons.max_wagon_length = 100	-- A large number to represent "unlimited"

if minetest.get_modpath( "dlxtrains" ) and dlxtrains then
	dlxtrains_support_wagons.max_wagon_length = dlxtrains.max_wagon_length
end

dofile(minetest.get_modpath("dlxtrains_support_wagons").."/items.lua")
dofile(minetest.get_modpath("dlxtrains_support_wagons").."/wagons.lua")
dofile(minetest.get_modpath("dlxtrains_support_wagons").."/wagon_recipes.lua")

-- Cleanup
dlxtrains_support_wagons.S = nil


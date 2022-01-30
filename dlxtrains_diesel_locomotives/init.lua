
dlxtrains_diesel_locomotives = {}

-- Support localized strings if intllib mod is installed.
if minetest.get_modpath( "intllib" ) and intllib then
	dlxtrains_diesel_locomotives.S = intllib.Getter()
else
	dlxtrains_diesel_locomotives.S = function(s) return s end
end

dlxtrains_diesel_locomotives.max_wagon_length = 100	-- A large number to represent "unlimited"

if minetest.get_modpath( "dlxtrains" ) and dlxtrains then
	dlxtrains_diesel_locomotives.max_wagon_length = dlxtrains.max_wagon_length
end

dofile(minetest.get_modpath("dlxtrains_diesel_locomotives").."/items.lua")
dofile(minetest.get_modpath("dlxtrains_diesel_locomotives").."/locomotives.lua")
dofile(minetest.get_modpath("dlxtrains_diesel_locomotives").."/locomotive_recipes.lua")

-- Cleanup
dlxtrains_diesel_locomotives.S = nil


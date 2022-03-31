
dlxtrains_industrial_wagons = {}

-- Support localized strings if intllib mod is installed.
if minetest.get_modpath( "intllib" ) and intllib then
	dlxtrains_industrial_wagons.S = intllib.Getter()
else
	dlxtrains_industrial_wagons.S = function(s) return s end
end

dlxtrains_industrial_wagons.max_wagon_length = 100	-- A large number to represent "unlimited"

if minetest.get_modpath( "dlxtrains" ) and dlxtrains then
	dlxtrains_industrial_wagons.max_wagon_length = dlxtrains.max_wagon_length
end

dlxtrains_industrial_wagons.crate_texture_count = 1
dlxtrains_industrial_wagons.get_crate_texture = nil

dlxtrains_industrial_wagons.shipping_container_livery_count = 1		-- Each container wagon has a "built-in" container livery that will typically match the wagon's livery.
dlxtrains_industrial_wagons.get_shipping_container_texture = nil

dlxtrains_industrial_wagons.tank_container_livery_count = 1		-- Each container wagon has a corresponding tank container livery that will typically match the wagon's livery.
dlxtrains_industrial_wagons.get_tank_container_texture = nil

if minetest.get_modpath( "dlxtrains_cargo" ) and dlxtrains_cargo then
	dlxtrains_industrial_wagons.crate_texture_count = dlxtrains_industrial_wagons.crate_texture_count + dlxtrains_cargo.get_crate_texture_count()
	dlxtrains_industrial_wagons.get_crate_texture = dlxtrains_cargo.get_crate_texture
	dlxtrains_industrial_wagons.shipping_container_livery_count = dlxtrains_industrial_wagons.shipping_container_livery_count + dlxtrains_cargo.get_shipping_container_livery_count()
	dlxtrains_industrial_wagons.get_shipping_container_texture = dlxtrains_cargo.get_shipping_container_texture
	dlxtrains_industrial_wagons.tank_container_livery_count = dlxtrains_industrial_wagons.tank_container_livery_count + dlxtrains_cargo.get_tank_container_livery_count()
	dlxtrains_industrial_wagons.get_tank_container_texture = dlxtrains_cargo.get_tank_container_texture
end

dofile(minetest.get_modpath("dlxtrains_industrial_wagons").."/items.lua")
dofile(minetest.get_modpath("dlxtrains_industrial_wagons").."/wagons.lua")
dofile(minetest.get_modpath("dlxtrains_industrial_wagons").."/wagon_recipes.lua")

-- Cleanup
dlxtrains_industrial_wagons.S = nil


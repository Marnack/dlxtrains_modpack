
local S = dlxtrains_diesel_locomotives.S

if dlxtrains.get_config_wagon_crafting_recipe_complexity() == 1 then

	if dlxtrains_diesel_locomotives.max_wagon_length >= 6.80725 then

		minetest.register_craftitem("dlxtrains_diesel_locomotives:locomotive_chassis", {
			description = S("Diesel Locomotive Chassis"),
			inventory_image = "dlxtrains_diesel_locomotives_locomotive_chassis.png",
		})

		minetest.register_craft({
			output = "dlxtrains_diesel_locomotives:locomotive_chassis",
			recipe = {
				{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
				{"default:steelblock", "default:steelblock", "default:steelblock"},
				{"default:ladder_steel", "dlxtrains:blueprint", "default:ladder_steel"},
			}
		})

		minetest.register_craftitem("dlxtrains_diesel_locomotives:locomotive_bogie", {
			description = S("Diesel Locomotive Bogie"),
			inventory_image = "dlxtrains_diesel_locomotives_bogie.png",
		})

		minetest.register_craft({
			output = "dlxtrains_diesel_locomotives:locomotive_bogie",
			recipe = {
				{"default:steel_ingot", "", "default:steel_ingot"},
				{"default:sand", "default:steelblock", "default:sand"},
				{"default:steel_ingot", "dlxtrains:bogie", "default:steel_ingot"},
			}
		})

		minetest.register_craftitem("dlxtrains_diesel_locomotives:fuel_tank", {
			description = S("Diesel Locomotive Fuel Tank"),
			inventory_image = "dlxtrains_diesel_locomotives_fuel_tank.png",
		})

		minetest.register_craft({
			output = "dlxtrains_diesel_locomotives:fuel_tank",
			recipe = {
				{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
				{"default:steel_ingot", "dlxtrains:blueprint", "default:steel_ingot"},
				{"", "default:steel_ingot", ""},
			}
		})

		minetest.register_craftitem("dlxtrains_diesel_locomotives:hood", {
			description = S("Diesel Locomotive Hood"),
			inventory_image = "dlxtrains_diesel_locomotives_hood.png",
		})

		minetest.register_craft({
			output = "dlxtrains_diesel_locomotives:hood",
			recipe = {
				{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
				{"default:steel_ingot", "", "default:steel_ingot"},
				{"default:steel_ingot", "dlxtrains:blueprint", "default:steel_ingot"},
			}
		})

		minetest.register_craftitem("dlxtrains_diesel_locomotives:cooling_fan", {
			description = S("Diesel Locomotive Cooling Fan"),
			inventory_image = "dlxtrains_diesel_locomotives_cooling_fan.png",
		})

		minetest.register_craft({
			output = "dlxtrains_diesel_locomotives:cooling_fan",
			recipe = {
				{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
				{"default:steel_ingot", "default:copper_ingot", "default:steel_ingot"},
				{"default:steel_ingot", "dlxtrains:blueprint", "default:steel_ingot"},
			}
		})

		minetest.register_craftitem("dlxtrains_diesel_locomotives:radiator", {
			description = S("Diesel Locomotive Radiator"),
			inventory_image = "dlxtrains_diesel_locomotives_radiator.png",
		})

		minetest.register_craft({
			output = "dlxtrains_diesel_locomotives:radiator",
			recipe = {
				{"default:steel_ingot", "default:copper_ingot", "default:steel_ingot"},
				{"default:copper_ingot", "bucket:bucket_water", "default:copper_ingot"},
				{"default:steel_ingot", "dlxtrains:blueprint", "default:steel_ingot"},
			}
		})

		minetest.register_craftitem("dlxtrains_diesel_locomotives:cooling_unit", {
			description = S("Diesel Locomotive Cooling Unit"),
			inventory_image = "dlxtrains_diesel_locomotives_cooling_unit.png",
		})

		minetest.register_craft({
			output = "dlxtrains_diesel_locomotives:cooling_unit",
			recipe = {
				{"default:steel_ingot", "dlxtrains_diesel_locomotives:cooling_fan", "default:steel_ingot"},
				{"dlxtrains_diesel_locomotives:radiator", "default:copper_ingot", "dlxtrains_diesel_locomotives:radiator"},
				{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
			}
		})

		minetest.register_craftitem("dlxtrains_diesel_locomotives:battery_pack", {
			description = S("Diesel Locomotive Battery Pack"),
			inventory_image = "dlxtrains_diesel_locomotives_battery_pack.png",
		})

		minetest.register_craft({
			output = "dlxtrains_diesel_locomotives:battery_pack",
			recipe = {
				{"default:copper_ingot", "default:copper_ingot", "default:copper_ingot"},
				{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
				{"default:mese_crystal", "dlxtrains:blueprint", "default:obsidian"},
			}
		})

		minetest.register_craftitem("dlxtrains_diesel_locomotives:diesel_engine", {
			description = S("Diesel Locomotive Engine"),
			inventory_image = "dlxtrains_diesel_locomotives_diesel_engine.png",
		})

		minetest.register_craft({
			output = "dlxtrains_diesel_locomotives:diesel_engine",
			recipe = {
				{"default:copper_ingot", "default:steel_ingot", "default:copper_ingot"},
				{"default:steel_ingot", "default:steelblock", "default:steel_ingot"},
				{"default:steel_ingot", "dlxtrains:blueprint", "default:steel_ingot"},
			}
		})

		minetest.register_craftitem("dlxtrains_diesel_locomotives:generator", {
			description = S("Diesel Locomotive Generator"),
			inventory_image = "dlxtrains_diesel_locomotives_generator.png",
		})

		minetest.register_craft({
			output = "dlxtrains_diesel_locomotives:generator",
			recipe = {
				{"default:copper_ingot", "default:steel_ingot", "default:copper_ingot"},
				{"default:steel_ingot", "default:copperblock", "default:steel_ingot"},
				{"default:steel_ingot", "dlxtrains:blueprint", "default:steel_ingot"},
			}
		})

		minetest.register_craftitem("dlxtrains_diesel_locomotives:locomotive_body_type2", {
			description = S("North American SW1500 Diesel Locomotive Body"),
			inventory_image = "dlxtrains_diesel_locomotives_locomotive_body_type2.png",
		})

		minetest.register_craft({
			output = "dlxtrains_diesel_locomotives:locomotive_body_type2",
			recipe = {
				{"", "dlxtrains_diesel_locomotives:hood", "advtrains:driver_cab"},
				{"", "dye:black", "dlxtrains_diesel_locomotives:cooling_unit"},
				{"dlxtrains_diesel_locomotives:battery_pack", "dlxtrains_diesel_locomotives:generator", "dlxtrains_diesel_locomotives:diesel_engine"},
			}
		})

	end

	if dlxtrains_diesel_locomotives.max_wagon_length >= 7.35 then

		minetest.register_craftitem("dlxtrains_diesel_locomotives:hydraulic_transmission", {
			description = S("Diesel Locomotive Hydraulic Transmission"),
			inventory_image = "dlxtrains_diesel_locomotives_hydraulic_transmission.png",
		})

		minetest.register_craft({
			output = "dlxtrains_diesel_locomotives:hydraulic_transmission",
			recipe = {
				{"", "default:steelblock", ""},
				{"default:steel_ingot", "bucket:bucket_water", "default:steel_ingot"},
				{"", "dlxtrains:blueprint", ""},
			}
		})

		minetest.register_craftitem("dlxtrains_diesel_locomotives:locomotive_body_type1", {
			description = S("European G1206 Diesel Locomotive Body"),
			inventory_image = "dlxtrains_diesel_locomotives_locomotive_body_type1.png",
		})

		minetest.register_craft({
			output = "dlxtrains_diesel_locomotives:locomotive_body_type1",
			recipe = {
				{"dlxtrains_diesel_locomotives:hood", "advtrains:driver_cab", "dlxtrains_diesel_locomotives:hood"},
				{"dye:red", "dlxtrains_diesel_locomotives:cooling_unit", "dlxtrains_diesel_locomotives:cooling_unit"},
				{"dlxtrains_diesel_locomotives:battery_pack", "dlxtrains_diesel_locomotives:hydraulic_transmission", "dlxtrains_diesel_locomotives:diesel_engine"},
			}
		})
	end

end
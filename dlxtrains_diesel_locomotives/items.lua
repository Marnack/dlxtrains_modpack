
local S = dlxtrains_diesel_locomotives.S

if dlxtrains.crafting_enabled() and dlxtrains.get_config_wagon_crafting_recipe_complexity() == 1 then

	if dlxtrains_diesel_locomotives.max_wagon_length >= 6.80725 then

		minetest.register_craftitem("dlxtrains_diesel_locomotives:locomotive_chassis", {
			description = S("Diesel Locomotive Chassis"),
			inventory_image = "dlxtrains_diesel_locomotives_locomotive_chassis.png",
		})

		minetest.register_craft({
			output = "dlxtrains_diesel_locomotives:locomotive_chassis",
			recipe = {
				{dlxtrains.materials.steel_ingot, dlxtrains.materials.steel_ingot, dlxtrains.materials.steel_ingot},
				{dlxtrains.materials.steelblock, dlxtrains.materials.steelblock, dlxtrains.materials.steelblock},
				{dlxtrains.materials.ladder_steel, "dlxtrains:blueprint", dlxtrains.materials.ladder_steel},
			}
		})

		minetest.register_craftitem("dlxtrains_diesel_locomotives:locomotive_bogie", {
			description = S("Diesel Locomotive Bogie"),
			inventory_image = "dlxtrains_diesel_locomotives_bogie.png",
		})

		minetest.register_craft({
			output = "dlxtrains_diesel_locomotives:locomotive_bogie",
			recipe = {
				{dlxtrains.materials.steel_ingot, "", dlxtrains.materials.steel_ingot},
				{dlxtrains.materials.sand, dlxtrains.materials.steelblock, dlxtrains.materials.sand},
				{dlxtrains.materials.steel_ingot, "dlxtrains:bogie", dlxtrains.materials.steel_ingot},
			}
		})

		minetest.register_craftitem("dlxtrains_diesel_locomotives:fuel_tank", {
			description = S("Diesel Locomotive Fuel Tank"),
			inventory_image = "dlxtrains_diesel_locomotives_fuel_tank.png",
		})

		minetest.register_craft({
			output = "dlxtrains_diesel_locomotives:fuel_tank",
			recipe = {
				{dlxtrains.materials.steel_ingot, dlxtrains.materials.steel_ingot, dlxtrains.materials.steel_ingot},
				{dlxtrains.materials.steel_ingot, "dlxtrains:blueprint", dlxtrains.materials.steel_ingot},
				{"", dlxtrains.materials.steel_ingot, ""},
			}
		})

		minetest.register_craftitem("dlxtrains_diesel_locomotives:hood", {
			description = S("Diesel Locomotive Hood"),
			inventory_image = "dlxtrains_diesel_locomotives_hood.png",
		})

		minetest.register_craft({
			output = "dlxtrains_diesel_locomotives:hood",
			recipe = {
				{dlxtrains.materials.steel_ingot, dlxtrains.materials.steel_ingot, dlxtrains.materials.steel_ingot},
				{dlxtrains.materials.steel_ingot, "", dlxtrains.materials.steel_ingot},
				{dlxtrains.materials.steel_ingot, "dlxtrains:blueprint", dlxtrains.materials.steel_ingot},
			}
		})

		minetest.register_craftitem("dlxtrains_diesel_locomotives:cooling_fan", {
			description = S("Diesel Locomotive Cooling Fan"),
			inventory_image = "dlxtrains_diesel_locomotives_cooling_fan.png",
		})

		minetest.register_craft({
			output = "dlxtrains_diesel_locomotives:cooling_fan",
			recipe = {
				{dlxtrains.materials.steel_ingot, dlxtrains.materials.steel_ingot, dlxtrains.materials.steel_ingot},
				{dlxtrains.materials.steel_ingot, dlxtrains.materials.copper_ingot, dlxtrains.materials.steel_ingot},
				{dlxtrains.materials.steel_ingot, "dlxtrains:blueprint", dlxtrains.materials.steel_ingot},
			}
		})

		minetest.register_craftitem("dlxtrains_diesel_locomotives:radiator", {
			description = S("Diesel Locomotive Radiator"),
			inventory_image = "dlxtrains_diesel_locomotives_radiator.png",
		})

		minetest.register_craft({
			output = "dlxtrains_diesel_locomotives:radiator",
			recipe = {
				{dlxtrains.materials.steel_ingot, dlxtrains.materials.copper_ingot, dlxtrains.materials.steel_ingot},
				{dlxtrains.materials.copper_ingot, dlxtrains.materials.bucket_water, dlxtrains.materials.copper_ingot},
				{dlxtrains.materials.steel_ingot, "dlxtrains:blueprint", dlxtrains.materials.steel_ingot},
			}
		})

		minetest.register_craftitem("dlxtrains_diesel_locomotives:cooling_unit", {
			description = S("Diesel Locomotive Cooling Unit"),
			inventory_image = "dlxtrains_diesel_locomotives_cooling_unit.png",
		})

		minetest.register_craft({
			output = "dlxtrains_diesel_locomotives:cooling_unit",
			recipe = {
				{dlxtrains.materials.steel_ingot, "dlxtrains_diesel_locomotives:cooling_fan", dlxtrains.materials.steel_ingot},
				{"dlxtrains_diesel_locomotives:radiator", dlxtrains.materials.copper_ingot, "dlxtrains_diesel_locomotives:radiator"},
				{dlxtrains.materials.steel_ingot, dlxtrains.materials.steel_ingot, dlxtrains.materials.steel_ingot},
			}
		})

		minetest.register_craftitem("dlxtrains_diesel_locomotives:battery_pack", {
			description = S("Diesel Locomotive Battery Pack"),
			inventory_image = "dlxtrains_diesel_locomotives_battery_pack.png",
		})

		minetest.register_craft({
			output = "dlxtrains_diesel_locomotives:battery_pack",
			recipe = {
				{dlxtrains.materials.copper_ingot, dlxtrains.materials.copper_ingot, dlxtrains.materials.copper_ingot},
				{dlxtrains.materials.steel_ingot, dlxtrains.materials.steel_ingot, dlxtrains.materials.steel_ingot},
				{dlxtrains.materials.mese_crystal, "dlxtrains:blueprint", dlxtrains.materials.obsidian},
			}
		})

		minetest.register_craftitem("dlxtrains_diesel_locomotives:diesel_engine", {
			description = S("Diesel Locomotive Engine"),
			inventory_image = "dlxtrains_diesel_locomotives_diesel_engine.png",
		})

		minetest.register_craft({
			output = "dlxtrains_diesel_locomotives:diesel_engine",
			recipe = {
				{dlxtrains.materials.copper_ingot, dlxtrains.materials.steel_ingot, dlxtrains.materials.copper_ingot},
				{dlxtrains.materials.steel_ingot, dlxtrains.materials.steelblock, dlxtrains.materials.steel_ingot},
				{dlxtrains.materials.steel_ingot, "dlxtrains:blueprint", dlxtrains.materials.steel_ingot},
			}
		})

		minetest.register_craftitem("dlxtrains_diesel_locomotives:generator", {
			description = S("Diesel Locomotive Generator"),
			inventory_image = "dlxtrains_diesel_locomotives_generator.png",
		})

		minetest.register_craft({
			output = "dlxtrains_diesel_locomotives:generator",
			recipe = {
				{dlxtrains.materials.copper_ingot, dlxtrains.materials.steel_ingot, dlxtrains.materials.copper_ingot},
				{dlxtrains.materials.steel_ingot, dlxtrains.materials.copperblock, dlxtrains.materials.steel_ingot},
				{dlxtrains.materials.steel_ingot, "dlxtrains:blueprint", dlxtrains.materials.steel_ingot},
			}
		})

		minetest.register_craftitem("dlxtrains_diesel_locomotives:locomotive_body_type2", {
			description = S("North American SW1500 Diesel Locomotive Body"),
			inventory_image = "dlxtrains_diesel_locomotives_locomotive_body_type2.png",
		})

		minetest.register_craft({
			output = "dlxtrains_diesel_locomotives:locomotive_body_type2",
			recipe = {
				{"", "dlxtrains_diesel_locomotives:hood", dlxtrains.materials.advtrains_driver_cab},
				{"", dlxtrains.materials.dye_black, "dlxtrains_diesel_locomotives:cooling_unit"},
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
				{"", dlxtrains.materials.steelblock, ""},
				{dlxtrains.materials.steel_ingot, dlxtrains.materials.bucket_water, dlxtrains.materials.steel_ingot},
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
				{"dlxtrains_diesel_locomotives:hood", dlxtrains.materials.advtrains_driver_cab, "dlxtrains_diesel_locomotives:hood"},
				{dlxtrains.materials.dye_red, "dlxtrains_diesel_locomotives:cooling_unit", "dlxtrains_diesel_locomotives:cooling_unit"},
				{"dlxtrains_diesel_locomotives:battery_pack", "dlxtrains_diesel_locomotives:hydraulic_transmission", "dlxtrains_diesel_locomotives:diesel_engine"},
			}
		})
	end

	if dlxtrains_diesel_locomotives.max_wagon_length >= 8.2 then

		minetest.register_craftitem("dlxtrains_diesel_locomotives:locomotive_body_type3", {
			description = S("European BR218 Diesel Locomotive Body"),
			inventory_image = "dlxtrains_diesel_locomotives_locomotive_body_type3.png",
		})

		minetest.register_craft({
			output = "dlxtrains_diesel_locomotives:locomotive_body_type3",
			recipe = {
				{dlxtrains.materials.advtrains_driver_cab, "dlxtrains_diesel_locomotives:hood", dlxtrains.materials.advtrains_driver_cab},
				{dlxtrains.materials.dye_red, "dlxtrains_diesel_locomotives:cooling_unit", "dlxtrains_diesel_locomotives:generator"},
				{"dlxtrains_diesel_locomotives:battery_pack", "dlxtrains_diesel_locomotives:hydraulic_transmission", "dlxtrains_diesel_locomotives:diesel_engine"},
			}
		})

	end

end
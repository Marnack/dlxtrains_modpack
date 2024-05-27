
local S = dlxtrains.S

function dlxtrains.get_config_wagon_crafting_recipe_complexity()
	local wagon_crafting_recipe_complexity_enum = minetest.settings:get("dlxtrains_wagon_crafting_recipe_complexity") or "Standard"
	return ({["Basic"]=0, ["Standard"]=1})[wagon_crafting_recipe_complexity_enum]
end

-- ////////////////////////////////////////////////////////////////////////////////////

if dlxtrains.crafting_enabled() then
	minetest.register_craftitem("dlxtrains:blueprint", {
		description = S("DLX Blueprint"),
		inventory_image = "dlxtrains_blueprint.png",
		groups = {flammable = 3},
	})

	minetest.register_craft({
		output = "dlxtrains:blueprint 9",
		recipe = {
			{dlxtrains.materials.paper, dlxtrains.materials.paper, dlxtrains.materials.paper},
			{dlxtrains.materials.paper, dlxtrains.materials.mese_crystal_fragment, dlxtrains.materials.paper},
			{dlxtrains.materials.paper, dlxtrains.materials.dye_blue, dlxtrains.materials.paper},
		}
	})
end

-- ////////////////////////////////////////////////////////////////////////////////////

if dlxtrains.crafting_enabled() and dlxtrains.get_config_wagon_crafting_recipe_complexity() == 1 then

	if dlxtrains.max_wagon_length >= 6 then					-- Currently, no wagons < 6m use a bogie
		minetest.register_craftitem("dlxtrains:bogie", {
			description = S("Bogie"),
			inventory_image = "dlxtrains_bogie.png",
		})

		minetest.register_craft({
			output = "dlxtrains:bogie",
			recipe = {
				{dlxtrains.materials.advtrains_wheel, dlxtrains.materials.steel_ingot, dlxtrains.materials.advtrains_wheel},
				{"dlxtrains:blueprint", dlxtrains.materials.steel_ingot, ""},
				{dlxtrains.materials.advtrains_wheel, dlxtrains.materials.steel_ingot, dlxtrains.materials.advtrains_wheel},
			}
		})
	end

	minetest.register_craftitem("dlxtrains:coupler_buffer_and_chain", {
		description = S("Coupler, buffer and chain"),
		inventory_image = "dlxtrains_coupler_buffer_and_chain.png",
	})

	minetest.register_craft({
		output = "dlxtrains:coupler_buffer_and_chain 2",
		recipe = {
			{"", "dlxtrains:blueprint", ""},
			{dlxtrains.materials.steel_ingot, dlxtrains.materials.steel_ingot, dlxtrains.materials.steel_ingot},
			{dlxtrains.materials.steel_ingot, "", dlxtrains.materials.steel_ingot},
		}
	})

	if dlxtrains.max_wagon_length >= 6 then					-- Currently, no wagons < 6m use knuckle coupler
		minetest.register_craftitem("dlxtrains:coupler_knuckle", {
			description = S("Coupler, knuckle"),
			inventory_image = "dlxtrains_coupler_knuckle.png",
		})

		minetest.register_craft({
			output = "dlxtrains:coupler_knuckle 2",
			recipe = {
				{dlxtrains.materials.steel_ingot, "dlxtrains:blueprint", dlxtrains.materials.steel_ingot},
				{dlxtrains.materials.steel_ingot, dlxtrains.materials.steel_ingot, dlxtrains.materials.steel_ingot},
				{"", dlxtrains.materials.steel_ingot, ""},
			}
		})
	end

	minetest.register_craftitem("dlxtrains:wagon_chassis", {
		description = S("Wagon Chassis"),
		inventory_image = "dlxtrains_wagon_chassis.png",
	})

	minetest.register_craft({
		output = "dlxtrains:wagon_chassis",
		recipe = {
			{dlxtrains.materials.steel_ingot, dlxtrains.materials.steel_ingot, dlxtrains.materials.steel_ingot},
			{dlxtrains.materials.steel_ingot, "dlxtrains:blueprint", dlxtrains.materials.steel_ingot},
			{dlxtrains.materials.steel_ingot, dlxtrains.materials.steel_ingot, dlxtrains.materials.steel_ingot},
		}
	})

	minetest.register_craftitem("dlxtrains:wheel_set", {
		description = S("Wheel Set"),
		inventory_image = "dlxtrains_wheel_set.png",
	})

	minetest.register_craft({
		output = "dlxtrains:wheel_set",
		recipe = {
			{"", dlxtrains.materials.advtrains_wheel, ""},
			{"dlxtrains:blueprint", dlxtrains.materials.steel_ingot, ""},
			{"", dlxtrains.materials.advtrains_wheel, ""},
		}
	})
end
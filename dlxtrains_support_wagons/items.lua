
local S = dlxtrains_support_wagons.S

if dlxtrains.crafting_enabled() and dlxtrains.get_config_wagon_crafting_recipe_complexity() == 1 then

	if dlxtrains_support_wagons.max_wagon_length >= 6 then
		minetest.register_craftitem("dlxtrains_support_wagons:caboose_body_type1", {
			description = S("Wooden Caboose Cabin with Cupola"),
			inventory_image = "dlxtrains_support_wagons_caboose_body_type1.png",
		})

		minetest.register_craft({
			output = "dlxtrains_support_wagons:caboose_body_type1",
			recipe = {
				{dlxtrains.materials.wood, dlxtrains.materials.glass, dlxtrains.materials.wood},
				{dlxtrains.materials.group_wool, "dlxtrains:blueprint", dlxtrains.materials.ladder_steel},
				{dlxtrains.materials.wood, dlxtrains.materials.furnace, dlxtrains.materials.wood},
			}
		})
	end

	if dlxtrains_support_wagons.max_wagon_length >= 4.875 then
		minetest.register_craftitem("dlxtrains_support_wagons:escort_body_type1", {
			description = S("Small Escort Wagon Cabin"),
			inventory_image = "dlxtrains_support_wagons_escort_body_type1.png",
		})

		minetest.register_craft({
			output = "dlxtrains_support_wagons:escort_body_type1",
			recipe = {
				{dlxtrains.materials.steel_ingot, dlxtrains.materials.steel_ingot, dlxtrains.materials.steel_ingot},
				{dlxtrains.materials.steel_ingot, "dlxtrains:blueprint", dlxtrains.materials.glass},
				{dlxtrains.materials.wood, dlxtrains.materials.furnace, dlxtrains.materials.group_wool},
			}
		})
	end

end
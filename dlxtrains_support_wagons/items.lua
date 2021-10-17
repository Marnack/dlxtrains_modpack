
local S = dlxtrains_support_wagons.S

if dlxtrains.get_config_wagon_crafting_recipe_complexity() == 1 then

	if dlxtrains_support_wagons.max_wagon_length >= 6 then
		minetest.register_craftitem("dlxtrains_support_wagons:caboose_body_type1", {
			description = S("Wooden Caboose Cabin with Cupola"),
			inventory_image = "dlxtrains_support_wagons_caboose_body_type1.png",
		})

		minetest.register_craft({
			output = "dlxtrains_support_wagons:caboose_body_type1",
			recipe = {
				{"default:wood", "default:glass", "default:wood"},
				{"group:wool", "dlxtrains:blueprint", "default:ladder_steel"},
				{"default:wood", "default:furnace", "default:wood"},
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
				{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
				{"default:steel_ingot", "dlxtrains:blueprint", "default:glass"},
				{"default:wood", "default:furnace", "group:wool"},
			}
		})
	end

end
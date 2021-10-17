
if dlxtrains.get_config_wagon_crafting_recipe_complexity() == 0 then

	if dlxtrains_support_wagons.max_wagon_length >= 4.875 then
		minetest.register_craft({
			output = "dlxtrains_support_wagons:escort_type1",
			recipe = {
				{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
				{"default:glass", "default:furnace", "group:wool"},
				{"advtrains:wheel", "dlxtrains:blueprint", "advtrains:wheel"},
			}
		})
	end

	if dlxtrains_support_wagons.max_wagon_length >= 6 then
		minetest.register_craft({
			output = "dlxtrains_support_wagons:caboose_type1",
			recipe = {
				{"default:wood", "default:glass", "default:wood"},
				{"group:wool", "default:furnace", "default:ladder_steel"},
				{"advtrains:wheel", "dlxtrains:blueprint", "advtrains:wheel"},
			}
		})
	end

elseif dlxtrains.get_config_wagon_crafting_recipe_complexity() == 1 then

	if dlxtrains_support_wagons.max_wagon_length >= 4.875 then
		minetest.register_craft({
			output = "dlxtrains_support_wagons:escort_type1",
			recipe = {
				{"", "dlxtrains_support_wagons:escort_body_type1", ""},
				{"dlxtrains:coupler_buffer_and_chain", "dlxtrains:wagon_chassis", "dlxtrains:coupler_buffer_and_chain"},
				{"dlxtrains:wheel_set", "", "dlxtrains:wheel_set"},
			}
		})
	end

	if dlxtrains_support_wagons.max_wagon_length >= 6 then
		minetest.register_craft({
			output = "dlxtrains_support_wagons:caboose_type1",
			recipe = {
				{"", "dlxtrains_support_wagons:caboose_body_type1", ""},
				{"dlxtrains:coupler_knuckle", "dlxtrains:wagon_chassis", "dlxtrains:coupler_knuckle"},
				{"dlxtrains:bogie", "", "dlxtrains:bogie"},
			}
		})
	end

end
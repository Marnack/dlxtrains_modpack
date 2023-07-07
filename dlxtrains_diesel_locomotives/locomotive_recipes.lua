
if dlxtrains.get_config_wagon_crafting_recipe_complexity() == 0 then

	if dlxtrains_diesel_locomotives.max_wagon_length >= 7.35 then
		minetest.register_craft({
			output = "dlxtrains_diesel_locomotives:locomotive_type1",
			recipe = {
				{"default:steelblock", "advtrains:driver_cab", "default:steelblock"},
				{"dye:red", "default:steelblock", "default:mese_crystal"},
				{"advtrains:wheel", "dlxtrains:blueprint", "advtrains:wheel"},
			}
		})
	end

	if dlxtrains_diesel_locomotives.max_wagon_length >= 6.80725 then
		minetest.register_craft({
			output = "dlxtrains_diesel_locomotives:locomotive_type2",
			recipe = {
				{"default:steelblock", "default:steelblock", "advtrains:driver_cab"},
				{"dye:black", "default:steelblock", "default:mese_crystal"},
				{"advtrains:wheel", "dlxtrains:blueprint", "advtrains:wheel"},
			}
		})
	end

	if dlxtrains_diesel_locomotives.max_wagon_length >= 8.2 then
		minetest.register_craft({
			output = "dlxtrains_diesel_locomotives:locomotive_type3",
			recipe = {
				{"advtrains:driver_cab", "default:steelblock", "advtrains:driver_cab"},
				{"dye:red", "default:steelblock", "default:mese_crystal"},
				{"advtrains:wheel", "dlxtrains:blueprint", "advtrains:wheel"},
			}
		})
	end

elseif dlxtrains.get_config_wagon_crafting_recipe_complexity() == 1 then

	if dlxtrains_diesel_locomotives.max_wagon_length >= 7.35 then
		minetest.register_craft({
			output = "dlxtrains_diesel_locomotives:locomotive_type1",
			recipe = {
				{"", "dlxtrains_diesel_locomotives:locomotive_body_type1", ""},
				{"dlxtrains:coupler_buffer_and_chain", "dlxtrains_diesel_locomotives:locomotive_chassis", "dlxtrains:coupler_buffer_and_chain"},
				{"dlxtrains_diesel_locomotives:locomotive_bogie", "dlxtrains_diesel_locomotives:fuel_tank", "dlxtrains_diesel_locomotives:locomotive_bogie"},
			}
		})
	end

	if dlxtrains_diesel_locomotives.max_wagon_length >= 6.80725 then
		minetest.register_craft({
			output = "dlxtrains_diesel_locomotives:locomotive_type2",
			recipe = {
				{"", "dlxtrains_diesel_locomotives:locomotive_body_type2", ""},
				{"dlxtrains:coupler_knuckle", "dlxtrains_diesel_locomotives:locomotive_chassis", "dlxtrains:coupler_knuckle"},
				{"dlxtrains_diesel_locomotives:locomotive_bogie", "dlxtrains_diesel_locomotives:fuel_tank", "dlxtrains_diesel_locomotives:locomotive_bogie"},
			}
		})
	end

	if dlxtrains_diesel_locomotives.max_wagon_length >= 8.2 then
		minetest.register_craft({
			output = "dlxtrains_diesel_locomotives:locomotive_type3",
			recipe = {
				{"", "dlxtrains_diesel_locomotives:locomotive_body_type3", ""},
				{"dlxtrains:coupler_buffer_and_chain", "dlxtrains_diesel_locomotives:locomotive_chassis", "dlxtrains:coupler_buffer_and_chain"},
				{"dlxtrains_diesel_locomotives:locomotive_bogie", "dlxtrains_diesel_locomotives:fuel_tank", "dlxtrains_diesel_locomotives:locomotive_bogie"},
			}
		})
	end

end

if dlxtrains.crafting_enabled() then
	if dlxtrains.get_config_wagon_crafting_recipe_complexity() == 0 then

		if dlxtrains_diesel_locomotives.max_wagon_length >= 7.35 then
			minetest.register_craft({
				output = "dlxtrains_diesel_locomotives:locomotive_type1",
				recipe = {
					{dlxtrains.materials.steelblock, dlxtrains.materials.advtrains_driver_cab, dlxtrains.materials.steelblock},
					{dlxtrains.materials.dye_red, dlxtrains.materials.steelblock, dlxtrains.materials.mese_crystal},
					{dlxtrains.materials.advtrains_wheel, "dlxtrains:blueprint", dlxtrains.materials.advtrains_wheel},
				}
			})
		end

		if dlxtrains_diesel_locomotives.max_wagon_length >= 6.80725 then
			minetest.register_craft({
				output = "dlxtrains_diesel_locomotives:locomotive_type2",
				recipe = {
					{dlxtrains.materials.steelblock, dlxtrains.materials.steelblock, dlxtrains.materials.advtrains_driver_cab},
					{dlxtrains.materials.dye_black, dlxtrains.materials.steelblock, dlxtrains.materials.mese_crystal},
					{dlxtrains.materials.advtrains_wheel, "dlxtrains:blueprint", dlxtrains.materials.advtrains_wheel},
				}
			})
		end

		if dlxtrains_diesel_locomotives.max_wagon_length >= 8.2 then
			minetest.register_craft({
				output = "dlxtrains_diesel_locomotives:locomotive_type3",
				recipe = {
					{dlxtrains.materials.advtrains_driver_cab, dlxtrains.materials.steelblock, dlxtrains.materials.advtrains_driver_cab},
					{dlxtrains.materials.dye_red, dlxtrains.materials.steelblock, dlxtrains.materials.mese_crystal},
					{dlxtrains.materials.advtrains_wheel, "dlxtrains:blueprint", dlxtrains.materials.advtrains_wheel},
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
end
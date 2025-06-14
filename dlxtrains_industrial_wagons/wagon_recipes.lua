
if dlxtrains.crafting_enabled() then
	if dlxtrains.get_config_wagon_crafting_recipe_complexity() == 0 then

		if dlxtrains_industrial_wagons.max_wagon_length >= 8.5 then
			minetest.register_craft({
				output = "dlxtrains_industrial_wagons:container_type1",
				recipe = {
					{"", dlxtrains.materials.steel_ingot, ""},
					{dlxtrains.materials.chest, dlxtrains.materials.steel_ingot, dlxtrains.materials.chest},
					{dlxtrains.materials.advtrains_wheel, "dlxtrains:blueprint", dlxtrains.materials.advtrains_wheel},
				}
			})
		end

		if dlxtrains_industrial_wagons.max_wagon_length >= 4.875 then
			minetest.register_craft({
				output = "dlxtrains_industrial_wagons:container_type2",
				recipe = {
					{"", dlxtrains.materials.tin_ingot, ""},
					{dlxtrains.materials.steel_ingot, dlxtrains.materials.chest, dlxtrains.materials.steel_ingot},
					{dlxtrains.materials.advtrains_wheel, "dlxtrains:blueprint", dlxtrains.materials.advtrains_wheel},
				}
			})
		end

		if dlxtrains_industrial_wagons.max_wagon_length >= 8 then
			minetest.register_craft({
				output = "dlxtrains_industrial_wagons:covered_goods_type1",
				recipe = {
					{dlxtrains.materials.wood, dlxtrains.materials.steel_ingot, dlxtrains.materials.wood},
					{dlxtrains.materials.wood, "", dlxtrains.materials.wood},
					{"dlxtrains:blueprint", "dlxtrains_industrial_wagons:flat_type1", dlxtrains.materials.steel_ingot},
				}
			})
		end

		if dlxtrains_industrial_wagons.max_wagon_length >= 8 then
			minetest.register_craft({
				output = "dlxtrains_industrial_wagons:covered_goods_type2",
				recipe = {
					{dlxtrains.materials.tin_ingot, dlxtrains.materials.steel_ingot, dlxtrains.materials.tin_ingot},
					{dlxtrains.materials.tin_ingot, "", dlxtrains.materials.tin_ingot},
					{"dlxtrains:blueprint", "dlxtrains_industrial_wagons:flat_type1", dlxtrains.materials.steel_ingot},
				}
			})
		end

		if dlxtrains_industrial_wagons.max_wagon_length >= 7 then
			minetest.register_craft({
				output = "dlxtrains_industrial_wagons:covered_goods_type3",
				recipe = {
					{dlxtrains.materials.wood, dlxtrains.materials.steel_ingot, dlxtrains.materials.wood},
					{dlxtrains.materials.tin_ingot, "", dlxtrains.materials.tin_ingot},
					{"", "dlxtrains_industrial_wagons:flat_type1", ""},
				}
			})
		end

		if dlxtrains_industrial_wagons.max_wagon_length >= 6 then
			minetest.register_craft({
				output = "dlxtrains_industrial_wagons:flat_type1",
				recipe = {
					{dlxtrains.materials.wood, dlxtrains.materials.wood, dlxtrains.materials.wood},
					{dlxtrains.materials.steel_ingot, dlxtrains.materials.chest, dlxtrains.materials.steel_ingot},
					{dlxtrains.materials.advtrains_wheel, "dlxtrains:blueprint", dlxtrains.materials.advtrains_wheel},
				}
			})
		end

		if dlxtrains_industrial_wagons.max_wagon_length >= 6 then
			minetest.register_craft({
				output = "dlxtrains_industrial_wagons:flat_type2",
				recipe = {
					{dlxtrains.materials.wood, dlxtrains.materials.wood, dlxtrains.materials.steel_ingot},
					{dlxtrains.materials.steel_ingot, dlxtrains.materials.chest, dlxtrains.materials.steel_ingot},
					{dlxtrains.materials.advtrains_wheel, "dlxtrains:blueprint", dlxtrains.materials.advtrains_wheel},
				}
			})
		end

		if dlxtrains_industrial_wagons.max_wagon_length >= 6 then
			minetest.register_craft({
				output = "dlxtrains_industrial_wagons:hopper_type1",
				recipe = {
					{dlxtrains.materials.steelblock, "", dlxtrains.materials.steelblock},
					{dlxtrains.materials.steel_ingot, dlxtrains.materials.chest, dlxtrains.materials.steel_ingot},
					{dlxtrains.materials.advtrains_wheel, "dlxtrains:blueprint", dlxtrains.materials.advtrains_wheel},
				}
			})
		end

		if dlxtrains_industrial_wagons.max_wagon_length >= 6 then
			minetest.register_craft({
				output = "dlxtrains_industrial_wagons:hopper_type2",
				recipe = {
					{dlxtrains.materials.steel_ingot, dlxtrains.materials.steel_ingot, dlxtrains.materials.steel_ingot},
					{"", "dlxtrains_industrial_wagons:hopper_type1", ""},
				}
			})
		end

		if dlxtrains_industrial_wagons.max_wagon_length >= 6 then
			minetest.register_craft({
				output = "dlxtrains_industrial_wagons:livestock_type1",
				recipe = {
					{dlxtrains.materials.steel_ingot, dlxtrains.materials.steel_ingot, dlxtrains.materials.steel_ingot},
					{dlxtrains.materials.wood, "", dlxtrains.materials.wood},
					{"", "dlxtrains_industrial_wagons:flat_type2", ""},
				}
			})
		end

		if dlxtrains_industrial_wagons.max_wagon_length >= 6 then
			minetest.register_craft({
				output = "dlxtrains_industrial_wagons:open_type1",
				recipe = {
					{dlxtrains.materials.steel_ingot, dlxtrains.materials.wood, dlxtrains.materials.steel_ingot},
					{dlxtrains.materials.steel_ingot, dlxtrains.materials.chest, dlxtrains.materials.steel_ingot},
					{dlxtrains.materials.advtrains_wheel, "dlxtrains:blueprint", dlxtrains.materials.advtrains_wheel},
				}
			})
		end

		if dlxtrains_industrial_wagons.max_wagon_length >= 4.875 then
			minetest.register_craft({
				output = "dlxtrains_industrial_wagons:open_type2",
				recipe = {
					{dlxtrains.materials.glass, "", ""},
					{dlxtrains.materials.wood, "", ""},
					{"", "dlxtrains_industrial_wagons:open_type3", ""},
				}
			})
		end

		if dlxtrains_industrial_wagons.max_wagon_length >= 4.875 then
			minetest.register_craft({
				output = "dlxtrains_industrial_wagons:open_type3",
				recipe = {
					{dlxtrains.materials.wood, "", dlxtrains.materials.wood},
					{dlxtrains.materials.steel_ingot, dlxtrains.materials.chest, dlxtrains.materials.steel_ingot},
					{dlxtrains.materials.advtrains_wheel, "dlxtrains:blueprint", dlxtrains.materials.advtrains_wheel},
				}
			})
		end

		if dlxtrains_industrial_wagons.max_wagon_length >= 6 then
			minetest.register_craft({
				output = "dlxtrains_industrial_wagons:stake_type1",
				recipe = {
					{dlxtrains.materials.steel_ingot, "", dlxtrains.materials.steel_ingot},
					{dlxtrains.materials.steel_ingot, "", dlxtrains.materials.steel_ingot},
					{"", "dlxtrains_industrial_wagons:flat_type1", ""},
				}
			})
		end

		if dlxtrains_industrial_wagons.max_wagon_length >= 4.875 then
			minetest.register_craft({
				output = "dlxtrains_industrial_wagons:tank_type1",
				recipe = {
					{dlxtrains.materials.wood, dlxtrains.materials.bucket_empty, dlxtrains.materials.ladder_steel},
					{dlxtrains.materials.steel_ingot, dlxtrains.materials.chest, dlxtrains.materials.steel_ingot},
					{dlxtrains.materials.advtrains_wheel, "dlxtrains:blueprint", dlxtrains.materials.advtrains_wheel},
				}
			})
		end

		if dlxtrains_industrial_wagons.max_wagon_length >= 4.875 then
			minetest.register_craft({
				output = "dlxtrains_industrial_wagons:tank_type2",
				recipe = {
					{dlxtrains.materials.steel_ingot, dlxtrains.materials.bucket_empty, dlxtrains.materials.ladder_steel},
					{dlxtrains.materials.steel_ingot, dlxtrains.materials.chest, dlxtrains.materials.steel_ingot},
					{dlxtrains.materials.advtrains_wheel, "dlxtrains:blueprint", dlxtrains.materials.advtrains_wheel},
				}
			})
		end

		if dlxtrains_industrial_wagons.max_wagon_length >= 6 then
			minetest.register_craft({
				output = "dlxtrains_industrial_wagons:transition_type1",
				recipe = {
					{"dlxtrains:blueprint", "dlxtrains_industrial_wagons:flat_type1", dlxtrains.materials.steel_ingot},
				}
			})
		end

	elseif dlxtrains.get_config_wagon_crafting_recipe_complexity() == 1 then

		if dlxtrains_industrial_wagons.max_wagon_length >= 8.5 then
			minetest.register_craft({
				output = "dlxtrains_industrial_wagons:container_type1",
				recipe = {
					{"", "dlxtrains_industrial_wagons:container_body_type1", ""},
					{"dlxtrains:coupler_buffer_and_chain", "dlxtrains:wagon_chassis", "dlxtrains:coupler_buffer_and_chain"},
					{"dlxtrains:wheel_set", "", "dlxtrains:wheel_set"},
				}
			})
		end

		if dlxtrains_industrial_wagons.max_wagon_length >= 4.875 then
			minetest.register_craft({
				output = "dlxtrains_industrial_wagons:container_type2",
				recipe = {
					{"", "dlxtrains_industrial_wagons:container_body_type2", ""},
					{"dlxtrains:coupler_buffer_and_chain", "dlxtrains:wagon_chassis", "dlxtrains:coupler_buffer_and_chain"},
					{"dlxtrains:wheel_set", "", "dlxtrains:wheel_set"},
				}
			})
		end

		if dlxtrains_industrial_wagons.max_wagon_length >= 8 then
			minetest.register_craft({
				output = "dlxtrains_industrial_wagons:covered_goods_type1",
				recipe = {
					{"", "dlxtrains_industrial_wagons:covered_goods_body_type1", ""},
					{"dlxtrains:coupler_knuckle", "dlxtrains:wagon_chassis", "dlxtrains:coupler_knuckle"},
					{"dlxtrains:bogie", "", "dlxtrains:bogie"},
				}
			})
		end

		if dlxtrains_industrial_wagons.max_wagon_length >= 8 then
			minetest.register_craft({
				output = "dlxtrains_industrial_wagons:covered_goods_type2",
				recipe = {
					{"", "dlxtrains_industrial_wagons:covered_goods_body_type2", ""},
					{"dlxtrains:coupler_knuckle", "dlxtrains:wagon_chassis", "dlxtrains:coupler_knuckle"},
					{"dlxtrains:bogie", "", "dlxtrains:bogie"},
				}
			})
		end

		if dlxtrains_industrial_wagons.max_wagon_length >= 7 then
			minetest.register_craft({
				output = "dlxtrains_industrial_wagons:covered_goods_type3",
				recipe = {
					{"", "dlxtrains_industrial_wagons:covered_goods_body_type3", ""},
					{"dlxtrains:coupler_buffer_and_chain", "dlxtrains:wagon_chassis", "dlxtrains:coupler_buffer_and_chain"},
					{"dlxtrains:wheel_set", "", "dlxtrains:wheel_set"},
				}
			})
		end

		if dlxtrains_industrial_wagons.max_wagon_length >= 6 then
			minetest.register_craft({
				output = "dlxtrains_industrial_wagons:flat_type1",
				recipe = {
					{"", "dlxtrains_industrial_wagons:flat_body_type1", ""},
					{"dlxtrains:coupler_buffer_and_chain", "dlxtrains:wagon_chassis", "dlxtrains:coupler_buffer_and_chain"},
					{"dlxtrains:bogie", "", "dlxtrains:bogie"},
				}
			})
		end

		if dlxtrains_industrial_wagons.max_wagon_length >= 6 then
			minetest.register_craft({
				output = "dlxtrains_industrial_wagons:flat_type2",
				recipe = {
					{"", "dlxtrains_industrial_wagons:flat_body_type1", dlxtrains.materials.steel_ingot},
					{"dlxtrains:coupler_knuckle", "dlxtrains:wagon_chassis", "dlxtrains:coupler_knuckle"},
					{"dlxtrains:bogie", "", "dlxtrains:bogie"},
				}
			})
		end

		if dlxtrains_industrial_wagons.max_wagon_length >= 6 then
			minetest.register_craft({
				output = "dlxtrains_industrial_wagons:hopper_type1",
				recipe = {
					{"", "dlxtrains_industrial_wagons:hopper_body_type1", ""},
					{"dlxtrains:coupler_knuckle", "dlxtrains:wagon_chassis", "dlxtrains:coupler_knuckle"},
					{"dlxtrains:bogie", "", "dlxtrains:bogie"},
				}
			})
		end

		if dlxtrains_industrial_wagons.max_wagon_length >= 6 then
			minetest.register_craft({
				output = "dlxtrains_industrial_wagons:hopper_type2",
				recipe = {
					{dlxtrains.materials.steel_ingot, dlxtrains.materials.steel_ingot, dlxtrains.materials.steel_ingot},
					{"", "dlxtrains_industrial_wagons:hopper_type1", ""},
				}
			})
		end

		if dlxtrains_industrial_wagons.max_wagon_length >= 6 then
			minetest.register_craft({
				output = "dlxtrains_industrial_wagons:livestock_type1",
				recipe = {
					{"", "dlxtrains_industrial_wagons:livestock_body_type1", ""},
					{"dlxtrains:coupler_knuckle", "dlxtrains:wagon_chassis", "dlxtrains:coupler_knuckle"},
					{"dlxtrains:bogie", "", "dlxtrains:bogie"},
				}
			})
		end

		if dlxtrains_industrial_wagons.max_wagon_length >= 6 then
			minetest.register_craft({
				output = "dlxtrains_industrial_wagons:open_type1",
				recipe = {
					{"", "dlxtrains_industrial_wagons:open_body_type1", ""},
					{"dlxtrains:coupler_knuckle", "dlxtrains:wagon_chassis", "dlxtrains:coupler_knuckle"},
					{"dlxtrains:bogie", "", "dlxtrains:bogie"},
				}
			})
		end

		if dlxtrains_industrial_wagons.max_wagon_length >= 4.875 then
			minetest.register_craft({
				output = "dlxtrains_industrial_wagons:open_type2",
				recipe = {
					{"dlxtrains_industrial_wagons:brakemans_cabin", "dlxtrains_industrial_wagons:open_body_type2", ""},
					{"dlxtrains:coupler_buffer_and_chain", "dlxtrains:wagon_chassis", "dlxtrains:coupler_buffer_and_chain"},
					{"dlxtrains:wheel_set", "", "dlxtrains:wheel_set"},
				}
			})
			minetest.register_craft({
				output = "dlxtrains_industrial_wagons:open_type2",
				type = "shapeless",
				recipe = {
					"dlxtrains_industrial_wagons:open_type3",
					"dlxtrains_industrial_wagons:brakemans_cabin",
				}
			})
		end

		if dlxtrains_industrial_wagons.max_wagon_length >= 4.875 then
			minetest.register_craft({
				output = "dlxtrains_industrial_wagons:open_type3",
				recipe = {
					{"", "dlxtrains_industrial_wagons:open_body_type2", ""},
					{"dlxtrains:coupler_buffer_and_chain", "dlxtrains:wagon_chassis", "dlxtrains:coupler_buffer_and_chain"},
					{"dlxtrains:wheel_set", "", "dlxtrains:wheel_set"},
				}
			})
			minetest.register_craft({
				output = "dlxtrains_industrial_wagons:open_type3",
				type = "shapeless",
				replacements = {{"dlxtrains_industrial_wagons:open_type2", "dlxtrains_industrial_wagons:brakemans_cabin"}},
				recipe = {
					"dlxtrains_industrial_wagons:open_type2",
				}
			})
		end

		if dlxtrains_industrial_wagons.max_wagon_length >= 6 then
			minetest.register_craft({
				output = "dlxtrains_industrial_wagons:stake_type1",
				recipe = {
					{"", "dlxtrains_industrial_wagons:stake_body_type1", ""},
					{"dlxtrains:coupler_buffer_and_chain", "dlxtrains:wagon_chassis", "dlxtrains:coupler_buffer_and_chain"},
					{"dlxtrains:wheel_set", "", "dlxtrains:wheel_set"},
				}
			})
		end

		if dlxtrains_industrial_wagons.max_wagon_length >= 4.875 then
			minetest.register_craft({
				output = "dlxtrains_industrial_wagons:tank_type1",
				recipe = {
					{"dlxtrains_industrial_wagons:brakemans_cabin", "dlxtrains_industrial_wagons:small_tank", dlxtrains.materials.ladder_steel},
					{"dlxtrains:coupler_buffer_and_chain", "dlxtrains:wagon_chassis", "dlxtrains:coupler_buffer_and_chain"},
					{"dlxtrains:wheel_set", "", "dlxtrains:wheel_set"},
				}
			})
			minetest.register_craft({
				output = "dlxtrains_industrial_wagons:tank_type1",
				type = "shapeless",
				replacements = {{"dlxtrains_industrial_wagons:brakemans_cabin", dlxtrains.materials.steel_ingot}},
				recipe = {
					"dlxtrains_industrial_wagons:tank_type2",
					"dlxtrains_industrial_wagons:brakemans_cabin",
				}
			})
		end

		if dlxtrains_industrial_wagons.max_wagon_length >= 4.875 then
			minetest.register_craft({
				output = "dlxtrains_industrial_wagons:tank_type2",
				recipe = {
					{dlxtrains.materials.steel_ingot, "dlxtrains_industrial_wagons:small_tank", dlxtrains.materials.ladder_steel},
					{"dlxtrains:coupler_buffer_and_chain", "dlxtrains:wagon_chassis", "dlxtrains:coupler_buffer_and_chain"},
					{"dlxtrains:wheel_set", "", "dlxtrains:wheel_set"},
				}
			})
			minetest.register_craft({
				output = "dlxtrains_industrial_wagons:tank_type2",
				type = "shapeless",
				replacements = {{dlxtrains.materials.steel_ingot, "dlxtrains_industrial_wagons:brakemans_cabin"}},
				recipe = {
					"dlxtrains_industrial_wagons:tank_type1",
					dlxtrains.materials.steel_ingot,
				}
			})
		end

		if dlxtrains_industrial_wagons.max_wagon_length >= 6 then
			minetest.register_craft({
				output = "dlxtrains_industrial_wagons:transition_type1",
				recipe = {
					{"", "dlxtrains_industrial_wagons:flat_body_type1", ""},
					{"dlxtrains:coupler_buffer_and_chain", "dlxtrains:wagon_chassis", "dlxtrains:coupler_knuckle"},
					{"dlxtrains:bogie", "", "dlxtrains:bogie"},
				}
			})
		end
	end
end
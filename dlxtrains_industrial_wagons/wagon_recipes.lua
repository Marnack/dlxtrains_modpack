
if dlxtrains.get_config_wagon_crafting_recipe_complexity() == 0 then

	if dlxtrains_industrial_wagons.max_wagon_length >= 8.5 then
		minetest.register_craft({
			output = "dlxtrains_industrial_wagons:container_type1",
			recipe = {
				{"", "default:steel_ingot", ""},
				{"default:chest", "default:steel_ingot", "default:chest"},
				{"advtrains:wheel", "dlxtrains:blueprint", "advtrains:wheel"},
			}
		})
	end

	if dlxtrains_industrial_wagons.max_wagon_length >= 4.875 then
		minetest.register_craft({
			output = "dlxtrains_industrial_wagons:container_type2",
			recipe = {
				{"", "default:tin_ingot", ""},
				{"default:steel_ingot", "default:chest", "default:steel_ingot"},
				{"advtrains:wheel", "dlxtrains:blueprint", "advtrains:wheel"},
			}
		})
	end

	if dlxtrains_industrial_wagons.max_wagon_length >= 8 then
		minetest.register_craft({
			output = "dlxtrains_industrial_wagons:covered_goods_type1",
			recipe = {
				{"default:wood", "default:steel_ingot", "default:wood"},
				{"default:wood", "", "default:wood"},
				{"dlxtrains:blueprint", "dlxtrains_industrial_wagons:flat_type1", "default:steel_ingot"},
			}
		})
	end

	if dlxtrains_industrial_wagons.max_wagon_length >= 8 then
		minetest.register_craft({
			output = "dlxtrains_industrial_wagons:covered_goods_type2",
			recipe = {
				{"default:tin_ingot", "default:steel_ingot", "default:tin_ingot"},
				{"default:tin_ingot", "", "default:tin_ingot"},
				{"dlxtrains:blueprint", "dlxtrains_industrial_wagons:flat_type1", "default:steel_ingot"},
			}
		})
	end

	if dlxtrains_industrial_wagons.max_wagon_length >= 7 then
		minetest.register_craft({
			output = "dlxtrains_industrial_wagons:covered_goods_type3",
			recipe = {
				{"default:wood", "default:steel_ingot", "default:wood"},
				{"default:tin_ingot", "", "default:tin_ingot"},
				{"", "dlxtrains_industrial_wagons:flat_type1", ""},
			}
		})
	end

	if dlxtrains_industrial_wagons.max_wagon_length >= 6 then
		minetest.register_craft({
			output = "dlxtrains_industrial_wagons:flat_type1",
			recipe = {
				{"default:wood", "default:wood", "default:wood"},
				{"default:steel_ingot", "default:chest", "default:steel_ingot"},
				{"advtrains:wheel", "dlxtrains:blueprint", "advtrains:wheel"},
			}
		})
	end

	if dlxtrains_industrial_wagons.max_wagon_length >= 6 then
		minetest.register_craft({
			output = "dlxtrains_industrial_wagons:flat_type2",
			recipe = {
				{"default:wood", "default:wood", "default:steel_ingot"},
				{"default:steel_ingot", "default:chest", "default:steel_ingot"},
				{"advtrains:wheel", "dlxtrains:blueprint", "advtrains:wheel"},
			}
		})
	end

	if dlxtrains_industrial_wagons.max_wagon_length >= 6 then
		minetest.register_craft({
			output = "dlxtrains_industrial_wagons:hopper_type1",
			recipe = {
				{"default:steelblock", "", "default:steelblock"},
				{"default:steel_ingot", "default:chest", "default:steel_ingot"},
				{"advtrains:wheel", "dlxtrains:blueprint", "advtrains:wheel"},
			}
		})
	end

	if dlxtrains_industrial_wagons.max_wagon_length >= 6 then
		minetest.register_craft({
			output = "dlxtrains_industrial_wagons:hopper_type2",
			recipe = {
				{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
				{"", "dlxtrains_industrial_wagons:hopper_type1", ""},
			}
		})
	end

	if dlxtrains_industrial_wagons.max_wagon_length >= 6 then
		minetest.register_craft({
			output = "dlxtrains_industrial_wagons:stake_type1",
			recipe = {
				{"default:steel_ingot", "", "default:steel_ingot"},
				{"default:steel_ingot", "", "default:steel_ingot"},
				{"", "dlxtrains_industrial_wagons:flat_type1", ""},
			}
		})
	end

	if dlxtrains_industrial_wagons.max_wagon_length >= 6 then
		minetest.register_craft({
			output = "dlxtrains_industrial_wagons:transition_type1",
			recipe = {
				{"dlxtrains:blueprint", "dlxtrains_industrial_wagons:flat_type1", "default:steel_ingot"},
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
				{"", "dlxtrains_industrial_wagons:flat_body_type1", "default:steel_ingot"},
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
				{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
				{"", "dlxtrains_industrial_wagons:hopper_type1", ""},
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
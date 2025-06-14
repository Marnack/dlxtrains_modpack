
local S = dlxtrains_industrial_wagons.S

if dlxtrains.crafting_enabled() and dlxtrains.get_config_wagon_crafting_recipe_complexity() == 1 then

	if dlxtrains_industrial_wagons.max_wagon_length >= 8.5 then
		minetest.register_craftitem("dlxtrains_industrial_wagons:container_body_type1", {
			description = S("Container Wagon Cargo Mounts"),
			inventory_image = "dlxtrains_industrial_wagons_container_body_type1.png",
		})

		minetest.register_craft({
			output = "dlxtrains_industrial_wagons:container_body_type1",
			recipe = {
				{dlxtrains.materials.dye_black, "dlxtrains:blueprint", dlxtrains.materials.dye_yellow},
				{dlxtrains.materials.steel_ingot, dlxtrains.materials.chest, dlxtrains.materials.steel_ingot},
				{dlxtrains.materials.steel_ingot, dlxtrains.materials.steel_ingot, dlxtrains.materials.steel_ingot},
			}
		})
	end

	if dlxtrains_support_wagons.max_wagon_length >= 4.875 then
		minetest.register_craftitem("dlxtrains_industrial_wagons:brakemans_cabin", {
			description = S("Brakeman's Cabin"),
			inventory_image = "dlxtrains_industrial_wagons_brakemans_cabin.png",
		})

		minetest.register_craft({
			output = "dlxtrains_industrial_wagons:brakemans_cabin",
			recipe = {
				{"dlxtrains:blueprint", dlxtrains.materials.glass},
				{dlxtrains.materials.steel_ingot, dlxtrains.materials.wood},
				{dlxtrains.materials.steel_ingot, dlxtrains.materials.wood},
			}
		})
	end

	if dlxtrains_industrial_wagons.max_wagon_length >= 4.875 then
		minetest.register_craftitem("dlxtrains_industrial_wagons:container_body_type2", {
			description = S("Container Wagon Single Cargo Mount"),
			inventory_image = "dlxtrains_industrial_wagons_container_body_type2.png",
		})

		minetest.register_craft({
			output = "dlxtrains_industrial_wagons:container_body_type2",
			recipe = {
				{dlxtrains.materials.dye_black, "dlxtrains:blueprint", dlxtrains.materials.dye_yellow},
				{"", dlxtrains.materials.chest, ""},
				{dlxtrains.materials.steel_ingot, dlxtrains.materials.steel_ingot, dlxtrains.materials.steel_ingot},
			}
		})
	end

	if dlxtrains_industrial_wagons.max_wagon_length >= 8 then
		minetest.register_craftitem("dlxtrains_industrial_wagons:covered_goods_body_type1", {
			description = S("North American Wooden Boxcar Cargo Housing"),
			inventory_image = "dlxtrains_industrial_wagons_covered_goods_body_type1.png",
		})

		minetest.register_craft({
			output = "dlxtrains_industrial_wagons:covered_goods_body_type1",
			recipe = {
				{dlxtrains.materials.steel_ingot, dlxtrains.materials.wood, dlxtrains.materials.steel_ingot},
				{dlxtrains.materials.wood, dlxtrains.materials.chest, dlxtrains.materials.wood},
				{dlxtrains.materials.wood, "dlxtrains:blueprint", dlxtrains.materials.wood},
			}
		})
	end

	if dlxtrains_industrial_wagons.max_wagon_length >= 8 then
		minetest.register_craftitem("dlxtrains_industrial_wagons:covered_goods_body_type2", {
			description = S("Australian Louver Van Cargo Housing"),
			inventory_image = "dlxtrains_industrial_wagons_covered_goods_body_type2.png",
		})

		minetest.register_craft({
			output = "dlxtrains_industrial_wagons:covered_goods_body_type2",
			recipe = {
				{dlxtrains.materials.steel_ingot, dlxtrains.materials.steel_ingot, dlxtrains.materials.steel_ingot},
				{"", dlxtrains.materials.chest, ""},
				{dlxtrains.materials.steel_ingot, "dlxtrains:blueprint", dlxtrains.materials.steel_ingot},
			}
		})
	end

	if dlxtrains_industrial_wagons.max_wagon_length >= 7 then
		minetest.register_craftitem("dlxtrains_industrial_wagons:covered_goods_body_type3", {
			description = S("European Wooden Covered Goods Wagon Cargo Housing"),
			inventory_image = "dlxtrains_industrial_wagons_covered_goods_body_type3.png",
		})

		minetest.register_craft({
			output = "dlxtrains_industrial_wagons:covered_goods_body_type3",
			recipe = {
				{dlxtrains.materials.steel_ingot, dlxtrains.materials.steel_ingot, dlxtrains.materials.steel_ingot},
				{dlxtrains.materials.tin_ingot, dlxtrains.materials.chest, dlxtrains.materials.tin_ingot},
				{dlxtrains.materials.wood, "dlxtrains:blueprint", dlxtrains.materials.wood},
			}
		})
	end

	if dlxtrains_industrial_wagons.max_wagon_length >= 6 then
		minetest.register_craftitem("dlxtrains_industrial_wagons:flat_body_type1", {
			description = S("Flat Wagon Cargo Deck"),
			inventory_image = "dlxtrains_industrial_wagons_flat_body_type1.png",
		})

		minetest.register_craft({
			output = "dlxtrains_industrial_wagons:flat_body_type1",
			recipe = {
				{"", "dlxtrains:blueprint", ""},
				{"", dlxtrains.materials.chest, ""},
				{dlxtrains.materials.wood, dlxtrains.materials.wood, dlxtrains.materials.wood},
			}
		})
	end

	if dlxtrains_industrial_wagons.max_wagon_length >= 6 then
		minetest.register_craftitem("dlxtrains_industrial_wagons:hopper_body_type1", {
			description = S("Hopper Wagon Cargo Bin"),
			inventory_image = "dlxtrains_industrial_wagons_hopper_body_type1.png",
		})

		minetest.register_craft({
			output = "dlxtrains_industrial_wagons:hopper_body_type1",
			recipe = {
				{"", "dlxtrains:blueprint", ""},
				{dlxtrains.materials.steel_ingot, dlxtrains.materials.chest, dlxtrains.materials.steel_ingot},
				{dlxtrains.materials.steel_ingot, dlxtrains.materials.steel_ingot, dlxtrains.materials.steel_ingot},
			}
		})
	end

	if dlxtrains_industrial_wagons.max_wagon_length >= 6 then
		minetest.register_craftitem("dlxtrains_industrial_wagons:livestock_body_type1", {
			description = S("Australian Cattle Van Cargo Housing"),
			inventory_image = "dlxtrains_industrial_wagons_livestock_body_type1.png",
		})

		minetest.register_craft({
			output = "dlxtrains_industrial_wagons:livestock_body_type1",
			recipe = {
				{dlxtrains.materials.steel_ingot, dlxtrains.materials.steel_ingot, dlxtrains.materials.steel_ingot},
				{dlxtrains.materials.wood, dlxtrains.materials.chest, dlxtrains.materials.wood},
				{dlxtrains.materials.wood, "dlxtrains:blueprint", dlxtrains.materials.wood},
			}
		})
	end

	if dlxtrains_industrial_wagons.max_wagon_length >= 6 then
		minetest.register_craftitem("dlxtrains_industrial_wagons:open_body_type1", {
			description = S("Open Wagon Cargo Deck"),
			inventory_image = "dlxtrains_industrial_wagons_open_body_type1.png",
		})

		minetest.register_craft({
			output = "dlxtrains_industrial_wagons:open_body_type1",
			recipe = {
				{"", "dlxtrains:blueprint", ""},
				{dlxtrains.materials.steel_ingot, dlxtrains.materials.chest, dlxtrains.materials.steel_ingot},
				{dlxtrains.materials.steel_ingot, dlxtrains.materials.wood, dlxtrains.materials.steel_ingot},
			}
		})
	end

	if dlxtrains_support_wagons.max_wagon_length >= 4.875 then
		minetest.register_craftitem("dlxtrains_industrial_wagons:open_body_type2", {
			description = S("Small Open Wagon Cargo Deck"),
			inventory_image = "dlxtrains_industrial_wagons_open_body_type2.png",
		})

		minetest.register_craft({
			output = "dlxtrains_industrial_wagons:open_body_type2",
			recipe = {
				{"", "dlxtrains:blueprint", ""},
				{dlxtrains.materials.wood, dlxtrains.materials.chest, dlxtrains.materials.wood},
				{dlxtrains.materials.wood, dlxtrains.materials.wood, dlxtrains.materials.wood},
			}
		})
	end

	if dlxtrains_support_wagons.max_wagon_length >= 4.875 then
		minetest.register_craftitem("dlxtrains_industrial_wagons:small_tank", {
			description = S("Small Tank"),
			inventory_image = "dlxtrains_industrial_wagons_small_tank.png",
		})

		minetest.register_craft({
			output = "dlxtrains_industrial_wagons:small_tank",
			recipe = {
				{"", "dlxtrains:blueprint", ""},
				{dlxtrains.materials.steel_ingot, dlxtrains.materials.bucket_empty, dlxtrains.materials.steel_ingot},
				{dlxtrains.materials.steel_ingot, dlxtrains.materials.chest, dlxtrains.materials.steel_ingot},
			}
		})
	end

	if dlxtrains_industrial_wagons.max_wagon_length >= 6 then
		minetest.register_craftitem("dlxtrains_industrial_wagons:stake_body_type1", {
			description = S("Stake Wagon Cargo Deck"),
			inventory_image = "dlxtrains_industrial_wagons_stake_body_type1.png",
		})

		minetest.register_craft({
			output = "dlxtrains_industrial_wagons:stake_body_type1",
			recipe = {
				{dlxtrains.materials.steel_ingot, "dlxtrains:blueprint", dlxtrains.materials.steel_ingot},
				{dlxtrains.materials.steel_ingot, dlxtrains.materials.chest, dlxtrains.materials.steel_ingot},
				{dlxtrains.materials.wood, dlxtrains.materials.wood, dlxtrains.materials.wood},
			}
		})
	end
end
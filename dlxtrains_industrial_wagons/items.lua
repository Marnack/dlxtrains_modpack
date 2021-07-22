
local S = dlxtrains_industrial_wagons.S

if dlxtrains.get_config_wagon_crafting_recipe_complexity() == 1 then

	minetest.register_craftitem("dlxtrains_industrial_wagons:container_body_type1", {
		description = S("Container Wagon Cargo Mounts"),
		inventory_image = "dlxtrains_industrial_wagons_container_body_type1.png",
	})

	minetest.register_craftitem("dlxtrains_industrial_wagons:covered_goods_body_type1", {
		description = S("North American Wooden Boxcar Cargo Housing"),
		inventory_image = "dlxtrains_industrial_wagons_covered_goods_body_type1.png",
	})

	minetest.register_craftitem("dlxtrains_industrial_wagons:covered_goods_body_type2", {
		description = S("Australian Louver Van Cargo Housing"),
		inventory_image = "dlxtrains_industrial_wagons_covered_goods_body_type2.png",
	})

	minetest.register_craftitem("dlxtrains_industrial_wagons:covered_goods_body_type3", {
		description = S("European Wooden Covered Goods Wagon Cargo Housing"),
		inventory_image = "dlxtrains_industrial_wagons_covered_goods_body_type3.png",
	})

	minetest.register_craftitem("dlxtrains_industrial_wagons:flat_body_type1", {
		description = S("Flat Wagon Cargo Deck"),
		inventory_image = "dlxtrains_industrial_wagons_flat_body_type1.png",
	})

	minetest.register_craftitem("dlxtrains_industrial_wagons:hopper_body_type1", {
		description = S("Hopper Wagon Cargo Bin"),
		inventory_image = "dlxtrains_industrial_wagons_hopper_body_type1.png",
	})

	minetest.register_craftitem("dlxtrains_industrial_wagons:stake_body_type1", {
		description = S("Stake Wagon Cargo Deck"),
		inventory_image = "dlxtrains_industrial_wagons_stake_body_type1.png",
	})

	minetest.register_craft({
		output = "dlxtrains_industrial_wagons:container_body_type1",
		recipe = {
			{"", "dlxtrains:blueprint", ""},
			{"dye:black", "default:chest", "dye:yellow"},
			{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
		}
	})

	minetest.register_craft({
		output = "dlxtrains_industrial_wagons:covered_goods_body_type1",
		recipe = {
			{"default:steel_ingot", "default:wood", "default:steel_ingot"},
			{"default:wood", "default:chest", "default:wood"},
			{"default:wood", "dlxtrains:blueprint", "default:wood"},
		}
	})

	minetest.register_craft({
		output = "dlxtrains_industrial_wagons:covered_goods_body_type2",
		recipe = {
			{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
			{"", "default:chest", ""},
			{"default:steel_ingot", "dlxtrains:blueprint", "default:steel_ingot"},
		}
	})

	minetest.register_craft({
		output = "dlxtrains_industrial_wagons:covered_goods_body_type3",
		recipe = {
			{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
			{"default:tin_ingot", "default:chest", "default:tin_ingot"},
			{"default:wood", "dlxtrains:blueprint", "default:wood"},
		}
	})

	minetest.register_craft({
		output = "dlxtrains_industrial_wagons:flat_body_type1",
		recipe = {
			{"", "dlxtrains:blueprint", ""},
			{"", "default:chest", ""},
			{"default:wood", "default:wood", "default:wood"},
		}
	})

	minetest.register_craft({
		output = "dlxtrains_industrial_wagons:hopper_body_type1",
		recipe = {
			{"", "dlxtrains:blueprint", ""},
			{"default:steel_ingot", "default:chest", "default:steel_ingot"},
			{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
		}
	})

	minetest.register_craft({
		output = "dlxtrains_industrial_wagons:stake_body_type1",
		recipe = {
			{"default:steel_ingot", "dlxtrains:blueprint", "default:steel_ingot"},
			{"default:steel_ingot", "default:chest", "default:steel_ingot"},
			{"default:wood", "default:wood", "default:wood"},
		}
	})
end
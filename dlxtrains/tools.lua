
local S = dlxtrains.S

minetest.register_tool("dlxtrains:wagon_updater", {
	description = S("DLX Wagon Updater tool\n\nLeft-click: Update DLX wagon to refresh its appearance, typically in case of an inventory change"),
	inventory_image = "dlxtrains_wagon_updater.png",
	wield_image = "dlxtrains_wagon_updater.png",
	stack_max = 1,
})

minetest.register_tool("dlxtrains:age_selector", {
	description = S("DLX Age Selector tool\n\nLeft-click: Toggle age appearance of DLX wagon"),
	inventory_image = "dlxtrains_age_selector.png",
	wield_image = "dlxtrains_age_selector.png",
	stack_max = 1,
})

minetest.register_tool("dlxtrains:livery_selector", {
	description = S("DLX Livery Selector tool\n\nLeft-click: Change DLX wagon to next livery scheme\nSneak+Left-click: Change DLX wagon to previous livery scheme"),
	inventory_image = "dlxtrains_livery_selector.png",
	wield_image = "dlxtrains_livery_selector.png",
	stack_max = 1,
})

minetest.register_craft({
	output = "dlxtrains:wagon_updater",
	recipe = {
		{"default:glass", "default:diamond", "default:glass"},
		{"default:stick", "default:mese", "default:stick"},
		{"default:stick", "dlxtrains:blueprint", "default:stick"},
	}
})

minetest.register_craft({
	output = "dlxtrains:age_selector",
	recipe = {
		{"default:desert_sand", "default:obsidian_glass", "default:steel_ingot"},
		{"default:glass", "dlxtrains:wagon_updater", "default:gold_ingot"},
		{"default:desert_sand", "dlxtrains:blueprint", "default:tin_ingot"},
	}
})

minetest.register_craft({
	output = "dlxtrains:livery_selector",
	recipe = {
		{"dye:grey", "default:obsidian_glass", "default:diamond"},
		{"dye:red", "dlxtrains:wagon_updater", "default:gold_ingot"},
		{"dye:cyan", "dlxtrains:blueprint", "default:bronze_ingot"},
	}
})

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

if dlxtrains.crafting_enabled() then
	minetest.register_craft({
		output = "dlxtrains:wagon_updater",
		recipe = {
			{dlxtrains.materials.glass, dlxtrains.materials.diamond, dlxtrains.materials.glass},
			{dlxtrains.materials.stick, dlxtrains.materials.mese, dlxtrains.materials.stick},
			{dlxtrains.materials.stick, "dlxtrains:blueprint", dlxtrains.materials.stick},
		}
	})

	minetest.register_craft({
		output = "dlxtrains:age_selector",
		recipe = {
			{dlxtrains.materials.desert_sand, dlxtrains.materials.obsidian_glass, dlxtrains.materials.steel_ingot},
			{dlxtrains.materials.glass, "dlxtrains:wagon_updater", dlxtrains.materials.gold_ingot},
			{dlxtrains.materials.desert_sand, "dlxtrains:blueprint", dlxtrains.materials.tin_ingot},
		}
	})

	minetest.register_craft({
		output = "dlxtrains:livery_selector",
		recipe = {
			{dlxtrains.materials.dye_grey, dlxtrains.materials.obsidian_glass, dlxtrains.materials.diamond},
			{dlxtrains.materials.dye_red, "dlxtrains:wagon_updater", dlxtrains.materials.gold_ingot},
			{dlxtrains.materials.dye_cyan, "dlxtrains:blueprint", dlxtrains.materials.bronze_ingot},
		}
	})
end
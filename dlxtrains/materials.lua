
dlxtrains.materials = {}
dlxtrains.sounds = {}
dlxtrains.crafting_enabled = function()
	return dlxtrains.materials.base_game ~= nil
end

local function set_materials_minetest_game()
	dlxtrains.materials = {
		base_game				= "Minetest Game",

		acacia_wood				= "default:acacia_wood",
		advtrains_driver_cab	= "advtrains:driver_cab",
		advtrains_wheel			= "advtrains:wheel",
		bronze_ingot			= "default:bronze_ingot",
		bucket_empty			= minetest.get_modpath("bucket") and "bucket:bucket_empty" or "default:steel_ingot",
		bucket_water			= minetest.get_modpath("bucket") and "bucket:bucket_water" or "default:ice",
		chest					= "default:chest",
		coal_lump				= "default:coal_lump",
		coalblock				= "default:coalblock",
		cobble					= "default:cobble",
		copper_ingot			= "default:copper_ingot",
		copperblock				= "default:copperblock",
		desert_sand				= "default:desert_sand",
		diamond					= "default:diamond",
		dye_black				= "dye:black",
		dye_blue				= "dye:blue",
		dye_cyan				= "dye:cyan",
		dye_grey				= "dye:grey",
		dye_red					= "dye:red",
		dye_yellow				= "dye:yellow",
		furnace					= "default:furnace",
		glass					= "default:glass",
		gold_ingot				= "default:gold_ingot",
		gravel					= "default:gravel",
		group_wool				= "group:wool",
		junglewood				= "default:junglewood",
		ladder_steel			= "default:ladder_steel",
		mese					= "default:mese",
		mese_crystal			= "default:mese_crystal",
		mese_crystal_fragment	= "default:mese_crystal_fragment",
		obsidian				= "default:obsidian",
		obsidian_glass			= "default:obsidian_glass",
		paper					= "default:paper",
		permafrost				= "default:permafrost",
		permafrost_with_stones	= "default:permafrost_with_stones",
		pine_wood				= "default:pine_wood",
		sand					= "default:sand",
		steel_ingot				= "default:steel_ingot",
		steelblock				= "default:steelblock",
		stick					= "default:stick",
		tin_ingot				= "default:tin_ingot",
		wood					= "default:wood",
	}

	dlxtrains.sounds.node_sound_wood_defaults = default.node_sound_wood_defaults
end

local function set_materials_mineclonia()
	-- Mineclonia is currently the same as VoxeLibre/MineClone2 except that it uses "mcl_dyes" instead of "mcl_dye".
	dlxtrains.materials = {
		base_game				= "Mineclonia",

		acacia_wood				= "mcl_core:acaciawood",
		advtrains_driver_cab	= "advtrains:driver_cab",
		advtrains_wheel			= "advtrains:wheel",
		bronze_ingot			= "mcl_core:gold_ingot",		-- bronze is not available
		bucket_empty			= minetest.get_modpath("mcl_buckets") and "mcl_buckets:bucket_empty" or "mcl_core:bowl",
		bucket_water			= minetest.get_modpath("mcl_buckets") and "mcl_buckets:bucket_water" or "mcl_core:packed_ice",
		chest					= minetest.get_modpath("mcl_chests") and "mcl_chests:chest" or "group:wood",
		coal_lump				= "mcl_core:coal_lump",
		coalblock				= "mcl_core:coalblock",
		cobble					= "mcl_core:cobble",
		copper_ingot			= minetest.get_modpath("mcl_copper") and "mcl_copper:copper_ingot" or "mcl_core:gold_ingot",
		copperblock				= minetest.get_modpath("mcl_copper") and "mcl_copper:block" or "mcl_core:goldblock",
		desert_sand				= "mcl_core:sand",				-- desert sand is not available
		diamond					= "mcl_core:diamond",
		dye_black				= "mcl_dyes:black",
		dye_blue				= "mcl_dyes:blue",
		dye_cyan				= "mcl_dyes:cyan",
		dye_grey				= "mcl_dyes:grey",
		dye_red					= "mcl_dyes:red",
		dye_yellow				= "mcl_dyes:yellow",
		furnace					= minetest.get_modpath("mcl_furnaces") and "mcl_furnaces:furnace" or "mcl_core:ironblock",
		glass					= "mcl_core:glass",
		gold_ingot				= "mcl_core:gold_ingot",
		gravel					= "mcl_core:gravel",
		group_wool				= "group:wool",
		junglewood				= "mcl_core:junglewood",
		ladder_steel			= "mcl_core:iron_ingot",		-- A compromise alternative
		mese					= minetest.get_modpath("mesecons_torch") and "mesecons_torch:redstoneblock" or "mcl_core:lapisblock",
		mese_crystal			= minetest.get_modpath("mesecons") and "mesecons:redstone" or "mcl_core:lapis",
		mese_crystal_fragment	= "mcl_core:emerald",			-- mese is not available
		obsidian				= "mcl_core:obsidian",
		obsidian_glass			= "mcl_core:glass_black",		-- obsidian glass is not available
		paper					= "mcl_core:paper",
		permafrost				= "",	-- Node not available
		permafrost_with_stones	= "",	-- Node not available
		pine_wood				= "",	-- Node not available
		sand					= "mcl_core:sand",
		steel_ingot				= "mcl_core:iron_ingot",
		steelblock				= "mcl_core:ironblock",
		stick					= "mcl_core:stick",
		tin_ingot				= "mcl_core:iron_ingot",		-- tin is not available
		wood					= "mcl_core:wood",
	}

	dlxtrains.sounds.node_sound_wood_defaults = mcl_sounds.node_sound_wood_defaults
end

local function set_materials_voxelibre()
	-- VoxeLibre/MineClone2 is currently the same as Mineclonia except that it uses "mcl_dye" instead of "mcl_dyes".
	dlxtrains.materials = {
		base_game				= "VoxeLibre/MineClone2",

		acacia_wood				= "mcl_core:acaciawood",
		advtrains_driver_cab	= "advtrains:driver_cab",
		advtrains_wheel			= "advtrains:wheel",
		bronze_ingot			= "mcl_core:gold_ingot",		-- bronze is not available
		bucket_empty			= minetest.get_modpath("mcl_buckets") and "mcl_buckets:bucket_empty" or "mcl_core:bowl",
		bucket_water			= minetest.get_modpath("mcl_buckets") and "mcl_buckets:bucket_water" or "mcl_core:packed_ice",
		chest					= minetest.get_modpath("mcl_chests") and "mcl_chests:chest" or "group:wood",
		coal_lump				= "mcl_core:coal_lump",
		coalblock				= "mcl_core:coalblock",
		cobble					= "mcl_core:cobble",
		copper_ingot			= minetest.get_modpath("mcl_copper") and "mcl_copper:copper_ingot" or "mcl_core:gold_ingot",
		copperblock				= minetest.get_modpath("mcl_copper") and "mcl_copper:block" or "mcl_core:goldblock",
		desert_sand				= "mcl_core:sand",				-- desert sand is not available
		diamond					= "mcl_core:diamond",
		dye_black				= "mcl_dye:black",
		dye_blue				= "mcl_dye:blue",
		dye_cyan				= "mcl_dye:cyan",
		dye_grey				= "mcl_dye:grey",
		dye_red					= "mcl_dye:red",
		dye_yellow				= "mcl_dye:yellow",
		furnace					= minetest.get_modpath("mcl_furnaces") and "mcl_furnaces:furnace" or "mcl_core:ironblock",
		glass					= "mcl_core:glass",
		gold_ingot				= "mcl_core:gold_ingot",
		gravel					= "mcl_core:gravel",
		group_wool				= "group:wool",
		junglewood				= "mcl_core:junglewood",
		ladder_steel			= "mcl_core:iron_ingot",		-- A compromise alternative
		mese					= minetest.get_modpath("mesecons_torch") and "mesecons_torch:redstoneblock" or "mcl_core:lapisblock",
		mese_crystal			= minetest.get_modpath("mesecons") and "mesecons:redstone" or "mcl_core:lapis",
		mese_crystal_fragment	= "mcl_core:emerald",			-- mese is not available
		obsidian				= "mcl_core:obsidian",
		obsidian_glass			= "mcl_core:glass_black",		-- obsidian glass is not available
		paper					= "mcl_core:paper",
		permafrost				= "",	-- Node not available
		permafrost_with_stones	= "",	-- Node not available
		pine_wood				= "",	-- Node not available
		sand					= "mcl_core:sand",
		steel_ingot				= "mcl_core:iron_ingot",
		steelblock				= "mcl_core:ironblock",
		stick					= "mcl_core:stick",
		tin_ingot				= "mcl_core:iron_ingot",		-- tin is not available
		wood					= "mcl_core:wood",
	}

	dlxtrains.sounds.node_sound_wood_defaults = mcl_sounds.node_sound_wood_defaults
end

local function set_materials_farlands_reloaded()
	-- Farlands Reloaded appears to be only partially complete so several items are using alternates for now.
	dlxtrains.materials = {
		base_game				= "Farlands Reloaded",

		acacia_wood				= "fl_trees:acacia_plank",
		advtrains_driver_cab	= "advtrains:driver_cab",
		advtrains_wheel			= "advtrains:wheel",
		bronze_ingot			= "fl_ores:bronze_ingot",
		bucket_empty			= minetest.get_modpath("fl_bottles") and "fl_bottles:bottle" or "fl_ores:iron_ingot",			-- Bucket crafting is not yet implemented, use an alternative for now.
		bucket_water			= "fl_topsoil:condensed_ice",	-- Bucket crafting is not yet implemented, use an alternative for now.
		chest					= "group:plank",				-- Chest crafting is not yet implemented, use an alternative for now.
		coal_lump				= "fl_ores:coal_ore",
		coalblock				= "fl_ores:coal_block",
		cobble					= "fl_stone:stone_rubble",
		copper_ingot			= "fl_ores:copper_ingot",
		copperblock				= "fl_ores:copper_ingot",		-- Copper block crafting is not yet implemented, use an alternative for now.
		desert_sand				= "fl_stone:desert_sand",
		diamond					= "fl_ores:diamond_ore",
		dye_black				= "fl_dyes:black_dye",
		dye_blue				= "fl_dyes:blue_dye",
		dye_cyan				= "fl_dyes:cyan_dye",
		dye_grey				= "fl_dyes:grey_dye",
		dye_red					= "fl_dyes:red_dye",
		dye_yellow				= "fl_dyes:yellow_dye",
		furnace					= minetest.get_modpath("fl_workshop") and "fl_workshop:furnace" or "fl_stone:stone_rubble",
		glass					= "fl_glass:framed_glass",
		gold_ingot				= "fl_ores:gold_ingot",
		gravel					= "fl_topsoil:gravel",
		group_wool				= "fl_wool:wool",
		junglewood				= "fl_trees:jungletree_plank",
		ladder_steel			= "fl_ores:iron_ingot",			-- A compromise alternative
		mese					= "fl_ores:bronze_ingot",		-- Mithite block crafting is not yet implemented, use an alternative for now.
		mese_crystal			= "fl_ores:mithite_ore",		-- mithite appears to be the equivalent of mese in this game
		mese_crystal_fragment	= "fl_ores:gold_ingot",			-- A compromise alternative
		obsidian				= "fl_ores:bronze_ingot",		-- obsidian is not yet available, use an alternate for now.
		obsidian_glass			= "fl_ores:bronze_ingot",		-- obsidian is not yet available, use an alternate for now.
		paper					= "fl_trees:aspen_leaves",		-- A compromise alternative
		permafrost				= "",	-- Node not available
		permafrost_with_stones	= "",	-- Node not available
		pine_wood				= "fl_trees:pine_plank",
		sand					= "fl_stone:sand",
		steel_ingot				= "fl_ores:iron_ingot",
		steelblock				= "fl_ores:iron_ingot",			-- Iron block crafting is not yet implemented, use an alternative for now.
		stick					= "fl_trees:stick",
		tin_ingot				= "fl_ores:tin_ingot",
		wood					= "fl_trees:apple_plank",
	}

	dlxtrains.sounds.node_sound_wood_defaults = function()
		local sounds = {}
		if minetest.get_modpath("fl_trees") then
			sounds = fl_trees.sounds.wood()
			sounds.dug = sounds.dug or {sounds.footstep.name, gain = 0.9}	-- Add dug sound if missing (currently it is missing)
		end
		return sounds
	end
end

local function set_materials_hades_revisited()
	-- Hades Revisited appears to be only partially complete so several items are using alternates for now.
	dlxtrains.materials = {
		base_game				= "Hades Revisited",

		acacia_wood				= "",	-- Node note available
		advtrains_driver_cab	= "advtrains:driver_cab",
		advtrains_wheel			= "advtrains:wheel",
		bronze_ingot			= "hades_core:bronze_ingot",
		bucket_empty			= minetest.get_modpath("hades_vessels") and "hades_vessels:glass_bottle" or "hades_core:steel_ingot",	-- A compromise alternative
		bucket_water			= "hades_core:cactus",	-- Buckets are not available, use this alternative as a crude source of water for now.
		chest					= minetest.get_modpath("hades_chests") and "hades_chests:chest" or "group:wood",
		coal_lump				= "hades_core:coal_lump",
		coalblock				= "hades_core:coalblock",
		cobble					= "hades_core:cobble",
		copper_ingot			= "hades_core:copper_ingot",
		copperblock				= "hades_core:copperblock",
		desert_sand				= "hades_core:volcanic_sand",		-- A compromise alternative
		diamond					= "hades_core:diamond",
		dye_black				= "hades_dye:black",
		dye_blue				= "hades_dye:blue",
		dye_cyan				= "hades_dye:cyan",
		dye_grey				= "hades_dye:grey",
		dye_red					= "hades_dye:red",
		dye_yellow				= "hades_dye:yellow",
		furnace					= minetest.get_modpath("hades_furnaces") and "hades_furnaces:furnace" or "hades_core:cobble",
		glass					= "hades_core:glass",
		gold_ingot				= "hades_core:gold_ingot",
		gravel					= "hades_core:gravel",
		group_wool				= "group:cloth",					-- cloth is the equivalent of wool in this game
		junglewood				= "hades_trees:jungle_wood",
		ladder_steel			= "hades_core:steel_ingot",			-- A compromise alternative
		mese					= "hades_core:mese",
		mese_crystal			= "hades_core:mese_crystal",
		mese_crystal_fragment	= "hades_core:mese_crystal_fragment",
		obsidian				= "hades_core:obsidian",
		obsidian_glass			= "hades_core:obsidian_glass",
		paper					= "hades_core:paper",
		permafrost				= "",	-- Node not available
		permafrost_with_stones	= "",	-- Node not available
		pine_wood				= "hades_trees:cream_wood",			-- A compromise alternative
		sand					= "hades_core:fertile_sand",		-- fertile sand appears to be the equivalent of sand in this game
		steel_ingot				= "hades_core:steel_ingot",
		steelblock				= "hades_core:steelblock",
		stick					= "hades_core:stick",
		tin_ingot				= "hades_core:tin_ingot",
		wood					= "hades_trees:wood",
	}

	dlxtrains.sounds.node_sound_wood_defaults = hades_sounds.node_sound_wood_defaults
end

if minetest.get_modpath("default") and minetest.get_modpath("dye") then
	-- Detected "Minetest Game" or another game that is based on it.
	set_materials_minetest_game()
elseif minetest.get_modpath("mcl_core") and minetest.get_modpath("mcl_dyes") then
	-- Detected "Mineclonia" or another game that is based on it.
	set_materials_mineclonia()
elseif minetest.get_modpath("mcl_core") and minetest.get_modpath("mcl_dye") then
	-- Detected "VoxeLibre"/"MineClone2" or another game that is based on it.
	set_materials_voxelibre()
elseif minetest.get_modpath("fl_dyes")
	and minetest.get_modpath("fl_glass")
	and minetest.get_modpath("fl_ores")
	and minetest.get_modpath("fl_stone")
	and minetest.get_modpath("fl_topsoil")
	and minetest.get_modpath("fl_trees")
	and minetest.get_modpath("fl_wool") then
	-- Detected "Farlands Reloaded" or another game that is based on it.
	set_materials_farlands_reloaded()
elseif minetest.get_modpath("hades_core")
	and minetest.get_modpath("hades_dye")
	and minetest.get_modpath("hades_trees") then
	-- Detected "Hades Revisited" or another game that is based on it.
	set_materials_hades_revisited()
end

if not dlxtrains.materials.base_game then
	minetest.log("info", "[dlxtrains] A known base game was not detected.  Crafting items and recipes for DlxTrains will not be included.  Wagons, tools and nodes, however, can still be acquired using the give command.")
end


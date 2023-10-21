local mod_name = "dlxtrains_cargo"

dlxtrains_cargo = {}

dlxtrains_cargo.S = minetest.get_translator(mod_name)

local mod_path = minetest.get_modpath(mod_name)
dofile(mod_path.."/items.lua");
dofile(mod_path.."/nodes.lua");
dofile(mod_path.."/functions.lua");

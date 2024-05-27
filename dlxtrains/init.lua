local mod_name = "dlxtrains"

dlxtrains = {}

dlxtrains.S = minetest.get_translator(mod_name)
dlxtrains.use_advtrains_livery_designer = minetest.get_modpath( "advtrains_livery_designer" ) and advtrains_livery_designer

local maximum_wagon_length_enum = minetest.settings:get("dlxtrains_maximum_wagon_length") or "Unlimited"
dlxtrains.max_wagon_length = ({["5m"]=5, ["6m"]=6, ["7m"]=7, ["8m"]=8, ["Unlimited"]=100})[maximum_wagon_length_enum]

local locomotive_sounds_enum = minetest.settings:get("dlxtrains_locomotive_sounds") or "Dynamic"
dlxtrains.locomotive_sounds = ({["Off"]=0, ["Constant"]=1, ["Dynamic"]=2})[locomotive_sounds_enum]

local locomotive_smoke_enum = minetest.settings:get("dlxtrains_locomotive_smoke") or "Dynamic"
dlxtrains.locomotive_smoke = ({["Off"]=0, ["Constant"]=1, ["Dynamic"]=2})[locomotive_smoke_enum]

advtrains.register_coupler_type("knuckle", dlxtrains.S("Knuckle Coupler"))

local mod_path = minetest.get_modpath(mod_name)
dofile(mod_path.."/materials.lua")
dofile(mod_path.."/items.lua")
dofile(mod_path.."/tools.lua")
dofile(mod_path.."/livery_functions.lua")

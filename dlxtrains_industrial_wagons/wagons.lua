
local S = dlxtrains_industrial_wagons.S
local use_attachment_patch = advtrains_attachment_offset_patch and advtrains_attachment_offset_patch.setup_advtrains_wagon
local mod_name = "dlxtrains_industrial_wagons"

local crate_texture_count = dlxtrains_industrial_wagons.crate_texture_count
local shipping_container_livery_count = dlxtrains_industrial_wagons.shipping_container_livery_count
local tank_container_livery_count = dlxtrains_industrial_wagons.tank_container_livery_count

dlxtrains.register_mod(mod_name)

-- ////////////////////////////////////////////////////////////////////////////////////

local livery_scheme_industrial_wagon_container_type1 = {
		filename_prefix = "dlxtrains_industrial_wagons_container_type1",
		[0]={code="dlx"},
		[1]={code="dz"},
		[2]={code="wf"},
		[3]={code="t"},
		[4]={code="zr"},
		count = 5,
	}

local livery_scheme_industrial_wagon_container_type2 = {
		filename_prefix = "dlxtrains_industrial_wagons_container_type2",
		[0]={code="dlx"},
		[1]={code="dz"},
		[2]={code="wf"},
		[3]={code="t"},
		[4]={code="zr"},
		count = 5,
	}

local livery_scheme_industrial_wagon_covered_goods_type1 = {
		filename_prefix = "dlxtrains_industrial_wagons_covered_goods_type1",
		[0]={code="nr"},
		[1]={code="tt"},
		[2]={code="dlx"},
		[3]={code="t"},
		count = 4,
	}

local livery_scheme_industrial_wagon_covered_goods_type2 = {
		filename_prefix = "dlxtrains_industrial_wagons_covered_goods_type2",
		[0]={code="vr"},
		[1]={code="ar"},
		[2]={code="at"},
		[3]={code="t"},
		count = 4,
	}

local livery_scheme_industrial_wagon_covered_goods_type3 = {
		filename_prefix = "dlxtrains_industrial_wagons_covered_goods_type3",
		[0]={code="dz"},
		[1]={code="t"},
		[2]={code="wf"},
		[3]={code="zr"},
		count = 4,
	}

local livery_scheme_industrial_wagon_flat_type1 = {
		filename_prefix = "dlxtrains_industrial_wagons_flat_type1",
		[0]={code="zr"},
		[1]={code="t"},
		[2]={code="dz"},
		[3]={code="wf"},
		count = 4,
	}

local livery_scheme_industrial_wagon_flat_type2 = {
		filename_prefix = "dlxtrains_industrial_wagons_flat_type2",
		[0]={code="ar"},
		[1]={code="at"},
		[2]={code="t"},
		[3]={code="vr"},
		count = 4,
	}

local livery_scheme_industrial_wagon_hopper_type1 = {
		filename_prefix = "dlxtrains_industrial_wagons_hopper_type1",
		[0]={code="dlx"},
		[1]={code="t"},
		[2]={code="tt"},
		[3]={code="nr"},
		count = 4,
	}

local livery_scheme_industrial_wagon_hopper_type2 = {
		filename_prefix = "dlxtrains_industrial_wagons_hopper_type2",
		[0]={code="dlx"},
		[1]={code="t"},
		[2]={code="tt"},
		[3]={code="nr"},
		count = 4,
	}

local livery_scheme_industrial_wagon_open_type1 = {
		filename_prefix = "dlxtrains_industrial_wagons_open_type1",
		[0]={code="ar"},
		[1]={code="at"},
		[2]={code="t"},
		[3]={code="vr"},
		count = 4,
	}

local livery_scheme_industrial_wagon_stake_type1 = {
		filename_prefix = "dlxtrains_industrial_wagons_stake_type1",
		[0]={code="t"},
		[1]={code="dz"},
		[2]={code="wf"},
		[3]={code="zr"},
		count = 4,
	}

local livery_scheme_industrial_wagon_tank_type1 = {
		filename_prefix = "dlxtrains_industrial_wagons_tank_type1",
		[0]={code="dz"},
		[1]={code="t"},
		[2]={code="wf"},
		[3]={code="zr"},
		count = 4,
	}

local livery_scheme_industrial_wagon_tank_type2 = {
		filename_prefix = "dlxtrains_industrial_wagons_tank_type2",
		[0]={code="dz"},
		[1]={code="t"},
		[2]={code="wf"},
		[3]={code="zr"},
		count = 4,
	}

local livery_scheme_industrial_wagon_transition_type1 = {
		filename_prefix = "dlxtrains_industrial_wagons_transition_type1",
		[0]={code="dlx"},
		[1]={code="t"},
		count = 2,
	}

-- ////////////////////////////////////////////////////////////////////////////////////

local livery_templates = {
	["dlxtrains_industrial_wagons:container_type1"] = {
		dlxtrains.init_livery_template(mod_name, 0, dlxtrains.livery_type.standard,		"DL&X",	"container_type1_dlx"),
		dlxtrains.init_livery_template(mod_name, 1, dlxtrains.livery_type.standard,		"DZ",	"container_type1_dz"),
		dlxtrains.init_livery_template(mod_name, 2, dlxtrains.livery_type.standard,		"WF",	"container_type1_wf"),
		dlxtrains.init_livery_template(mod_name, 3, dlxtrains.livery_type.standard,		"T",	"container_type1_t"),
		dlxtrains.init_livery_template(mod_name, 4, dlxtrains.livery_type.standard,		"ZR",	"container_type1_zr"),
	},
	["dlxtrains_industrial_wagons:container_type2"] = {
		dlxtrains.init_livery_template(mod_name, 0, dlxtrains.livery_type.standard,		"DL&X",	"container_type2_dlx"),
		dlxtrains.init_livery_template(mod_name, 1, dlxtrains.livery_type.standard,		"DZ",	"container_type2_dz"),
		dlxtrains.init_livery_template(mod_name, 2, dlxtrains.livery_type.standard,		"WF",	"container_type2_wf"),
		dlxtrains.init_livery_template(mod_name, 3, dlxtrains.livery_type.standard,		"T",	"container_type2_t"),
		dlxtrains.init_livery_template(mod_name, 4, dlxtrains.livery_type.standard,		"ZR",	"container_type2_zr"),
	},
	["dlxtrains_industrial_wagons:covered_goods_type1"] = {
		dlxtrains.init_livery_template(mod_name, 0, dlxtrains.livery_type.early_era,	"NR",	"covered_goods_type1_nr"),
		dlxtrains.init_livery_template(mod_name, 1, dlxtrains.livery_type.early_era,	"TT",	"covered_goods_type1_tt"),
		dlxtrains.init_livery_template(mod_name, 2, dlxtrains.livery_type.early_era,	"DL&X",	"covered_goods_type1_dlx"),
		dlxtrains.init_livery_template(mod_name, 3, dlxtrains.livery_type.early_era,	"T",	"covered_goods_type1_t"),
	},
	["dlxtrains_industrial_wagons:covered_goods_type2"] = {
		dlxtrains.init_livery_template(mod_name, 0, dlxtrains.livery_type.middle_era,	"VR",	"covered_goods_type2_vr"),
		dlxtrains.init_livery_template(mod_name, 1, dlxtrains.livery_type.middle_era,	"AR",	"covered_goods_type2_ar"),
		dlxtrains.init_livery_template(mod_name, 2, dlxtrains.livery_type.middle_era,	"AT",	"covered_goods_type2_at"),
		dlxtrains.init_livery_template(mod_name, 3, dlxtrains.livery_type.standard,		"T",	"covered_goods_type2_t"),
	},
	["dlxtrains_industrial_wagons:covered_goods_type3"] = {
		dlxtrains.init_livery_template(mod_name, 0, dlxtrains.livery_type.middle_era,	"DZ",	"covered_goods_type3_dz"),
		dlxtrains.init_livery_template(mod_name, 1, dlxtrains.livery_type.middle_era,	"T",	"covered_goods_type3_t"),
		dlxtrains.init_livery_template(mod_name, 2, dlxtrains.livery_type.early_era,	"WF",	"covered_goods_type3_wf"),
		dlxtrains.init_livery_template(mod_name, 3, dlxtrains.livery_type.middle_era,	"ZR",	"covered_goods_type3_zr"),
	},
	["dlxtrains_industrial_wagons:flat_type1"] = {
		dlxtrains.init_livery_template(mod_name, 0, dlxtrains.livery_type.standard,		"ZR",	"flat_type1_zr"),
		dlxtrains.init_livery_template(mod_name, 1, dlxtrains.livery_type.standard,		"T",	"flat_type1_t"),
		dlxtrains.init_livery_template(mod_name, 2, dlxtrains.livery_type.standard,		"DZ",	"flat_type1_dz"),
		dlxtrains.init_livery_template(mod_name, 3, dlxtrains.livery_type.standard,		"WF",	"flat_type1_wf"),
	},
	["dlxtrains_industrial_wagons:flat_type2"] = {
		dlxtrains.init_livery_template(mod_name, 0, dlxtrains.livery_type.middle_era,	"AR",	"flat_type2_ar"),
		dlxtrains.init_livery_template(mod_name, 1, dlxtrains.livery_type.middle_era,	"AT",	"flat_type2_at"),
		dlxtrains.init_livery_template(mod_name, 2, dlxtrains.livery_type.standard,		"T",	"flat_type2_t"),
		dlxtrains.init_livery_template(mod_name, 3, dlxtrains.livery_type.middle_era,	"VR",	"flat_type2_vr"),
	},
	["dlxtrains_industrial_wagons:hopper_type1"] = {
		dlxtrains.init_livery_template(mod_name, 0, dlxtrains.livery_type.standard,		"DL&X",	"hopper_type1_dlx"),
		dlxtrains.init_livery_template(mod_name, 1, dlxtrains.livery_type.standard,		"T",	"hopper_type1_t"),
		dlxtrains.init_livery_template(mod_name, 2, dlxtrains.livery_type.middle_era,	"TT",	"hopper_type1_tt"),
		dlxtrains.init_livery_template(mod_name, 3, dlxtrains.livery_type.middle_era,	"NR",	"hopper_type1_nr"),
	},
	["dlxtrains_industrial_wagons:hopper_type2"] = {
		dlxtrains.init_livery_template(mod_name, 0, dlxtrains.livery_type.standard,		"DL&X",	"hopper_type2_dlx"),
		dlxtrains.init_livery_template(mod_name, 1, dlxtrains.livery_type.standard,		"T",	"hopper_type2_t"),
		dlxtrains.init_livery_template(mod_name, 2, dlxtrains.livery_type.standard,		"TT",	"hopper_type2_tt"),
		dlxtrains.init_livery_template(mod_name, 3, dlxtrains.livery_type.middle_era,	"NR",	"hopper_type2_nr"),
	},
	["dlxtrains_industrial_wagons:open_type1"] = {
		dlxtrains.init_livery_template(mod_name, 0, dlxtrains.livery_type.middle_era,	"AR",	"open_type1_ar"),
		dlxtrains.init_livery_template(mod_name, 1, dlxtrains.livery_type.middle_era,	"AT",	"open_type1_at"),
		dlxtrains.init_livery_template(mod_name, 2, dlxtrains.livery_type.standard,		"T",	"open_type1_t"),
		dlxtrains.init_livery_template(mod_name, 3, dlxtrains.livery_type.middle_era,	"VR",	"open_type1_vr"),
	},
	["dlxtrains_industrial_wagons:stake_type1"] = {
		dlxtrains.init_livery_template(mod_name, 0, dlxtrains.livery_type.standard,		"T",	"stake_type1_t"),
		dlxtrains.init_livery_template(mod_name, 1, dlxtrains.livery_type.standard,		"DZ",	"stake_type1_dz"),
		dlxtrains.init_livery_template(mod_name, 2, dlxtrains.livery_type.standard,		"WF",	"stake_type1_wf"),
		dlxtrains.init_livery_template(mod_name, 3, dlxtrains.livery_type.standard,		"ZR",	"stake_type1_zr"),
	},
	["dlxtrains_industrial_wagons:tank_type1"] = {
		dlxtrains.init_livery_template(mod_name, 0, dlxtrains.livery_type.early_era,	"DZ",	"tank_type1_dz"),
		dlxtrains.init_livery_template(mod_name, 1, dlxtrains.livery_type.early_era,	"T",	"tank_type1_t"),
		dlxtrains.init_livery_template(mod_name, 2, dlxtrains.livery_type.early_era,	"WF",	"tank_type1_wf"),
		dlxtrains.init_livery_template(mod_name, 3, dlxtrains.livery_type.early_era,	"ZR",	"tank_type1_zr"),
	},
	["dlxtrains_industrial_wagons:tank_type2"] = {
		dlxtrains.init_livery_template(mod_name, 0, dlxtrains.livery_type.early_era,	"DZ",	"tank_type2_dz"),
		dlxtrains.init_livery_template(mod_name, 1, dlxtrains.livery_type.early_era,	"T",	"tank_type2_t"),
		dlxtrains.init_livery_template(mod_name, 2, dlxtrains.livery_type.early_era,	"WF",	"tank_type2_wf"),
		dlxtrains.init_livery_template(mod_name, 3, dlxtrains.livery_type.early_era,	"ZR",	"tank_type2_zr"),
	},
	["dlxtrains_industrial_wagons:transition_type1"] = {
		dlxtrains.init_livery_template(mod_name, 0, dlxtrains.livery_type.standard,		"DL&X",	"transition_type1_dlx"),
		dlxtrains.init_livery_template(mod_name, 1, dlxtrains.livery_type.standard,		"T",	"transition_type1_t"),
	},
}

-- ////////////////////////////////////////////////////////////////////////////////////

local function is_filled_bucket(stack)
	-- Any liquid registered with the bucket mod will be considered a valid liquid
	for bucket, def in pairs(bucket.liquids) do
		if def.itemname == stack:get_name() then
			return true
		end
	end
	return false
end

local stackable_liquid_proxies = {}

local function register_stackable_liquid_proxy(src_mod_name, item_name)
	if src_mod_name ~= nil and item_name ~= nil then
		if minetest.get_modpath(src_mod_name) then
			table.insert(stackable_liquid_proxies, item_name)
		end
	end
end

local technic_cans = {}
if minetest.get_modpath("technic") then
	if technic.cans ~= nil then
		-- This version of the technic mod has a table of can definitions.
		-- Use it to build the local list of technic can names so that any
		-- changes to the list of cans will be supported automatically.
		for _, def in pairs(technic.cans) do
			technic_cans[def.can_name] = true
		end
	else
		-- This version of the technic mod lacks a table of can definitions.
		-- Define a hard-coded local list. Any changes to the list of cans
		-- will need to be manually updated here.
		technic_cans["technic:water_can"] = true
		technic_cans["technic:lava_can"] = true
		technic_cans["technic:river_water_can"] = true
	end
end

-- Register items defined in other mods that are stackable and that can be
-- considered to be a liquid for the purpose of determining whether it
-- should be shown as being transported in a shipping container or a tank
-- container.  These proxies are typically non-empty liquid containers.
--
-- While liquids in containers are not actually placed in tank containers
-- in the real world, this was done here to make it easier for players to
-- have wagons with tank containers in game when playing in survival mode.
-- Please note, however, that these non-empty liquid containers
-- might not be considered be liquids in a future release of this mod.
--
register_stackable_liquid_proxy("basic_materials", "basic_materials:oil_extract")
register_stackable_liquid_proxy("biofuel", "biofuel:phial_fuel")
register_stackable_liquid_proxy("biofuel", "biofuel:bottle_fuel")
register_stackable_liquid_proxy("biofuel", "biofuel:fuel_can")
register_stackable_liquid_proxy("farming", "farming:bottle_ethanol")
register_stackable_liquid_proxy("farming", "farming:hemp_oil")
register_stackable_liquid_proxy("pipeworks", "homedecor:oil_extract")
register_stackable_liquid_proxy("technic", "technic:cottonseed_oil")
register_stackable_liquid_proxy("technic", "technic:lox")

if minetest.get_modpath("techage") then
	-- Note:
	-- The Techage mod limits the stack size of all of the following items
	-- to one.  Thus, these items cannot be used for specifying the livery
	-- of a container.  However, thay can still be used for triggering the
	-- appearance of ISO tank containers on a container wagon.

	-- Techage liquids:
	register_stackable_liquid_proxy("techage", "techage:bitumen")
	register_stackable_liquid_proxy("techage", "techage:epoxy")
	register_stackable_liquid_proxy("techage", "techage:fueloil")
	register_stackable_liquid_proxy("techage", "techage:gasoline")
	register_stackable_liquid_proxy("techage", "techage:lye")
	register_stackable_liquid_proxy("techage", "techage:naphtha")
	register_stackable_liquid_proxy("techage", "techage:redmud")

	-- Techage gases:
	register_stackable_liquid_proxy("techage", "techage:hydrogen")
	register_stackable_liquid_proxy("techage", "techage:isobutane")
	register_stackable_liquid_proxy("techage", "techage:gas")

	-- Filled Techage Barrels
	register_stackable_liquid_proxy("techage", "techage:ta3_barrel_bitumen")			-- Bitumen
	register_stackable_liquid_proxy("techage", "techage:barrel_epoxy")					-- Epoxide Resin
	register_stackable_liquid_proxy("techage", "techage:ta3_barrel_fueloil")			-- Fuel Oil
	register_stackable_liquid_proxy("techage", "techage:ta3_barrel_gasoline")			-- Gasoline
	register_stackable_liquid_proxy("techage", "techage:barrel_lye")					-- Lye
	register_stackable_liquid_proxy("techage", "techage:ta3_barrel_naphtha")			-- Naphtha
	register_stackable_liquid_proxy("techage", "techage:ta3_barrel_oil")				-- Oil
	register_stackable_liquid_proxy("techage", "techage:barrel_redmud")					-- Red Mud
	register_stackable_liquid_proxy("techage", "techage:barrel_river_water")			-- River Water
	register_stackable_liquid_proxy("techage", "techage:barrel_water")					-- Water

	-- Filled Techage Canisters
	register_stackable_liquid_proxy("techage", "techage:ta3_canister_bitumen")			-- Bitumen
	register_stackable_liquid_proxy("techage", "techage:canister_epoxy")				-- Epoxide Resin
	register_stackable_liquid_proxy("techage", "techage:ta3_canister_fueloil")			-- Fuel Oil
	register_stackable_liquid_proxy("techage", "techage:ta3_canister_gasoline")			-- Gasoline
	register_stackable_liquid_proxy("techage", "techage:canister_lye")					-- Lye
	register_stackable_liquid_proxy("techage", "techage:ta3_canister_naphtha")			-- Naphtha
	register_stackable_liquid_proxy("techage", "techage:ta3_canister_oil")				-- Oil
	register_stackable_liquid_proxy("techage", "techage:canister_redmud")				-- Red Mud

	-- Filled Techage Large Cylinders
	register_stackable_liquid_proxy("techage", "techage:cylinder_large_hydrogen")		-- Hydrogen
	register_stackable_liquid_proxy("techage", "techage:ta4_cylinder_large_isobutane")	-- Isobutane
	register_stackable_liquid_proxy("techage", "techage:ta3_cylinder_large_gas")		-- Propane

	-- Filled Techage Small Cylinders
	register_stackable_liquid_proxy("techage", "techage:cylinder_small_hydrogen")		-- Hydrogen
	register_stackable_liquid_proxy("techage", "techage:ta4_cylinder_small_isobutane")	-- Isobutane
	register_stackable_liquid_proxy("techage", "techage:ta3_cylinder_small_gas")		-- Propane
end

local function is_stackable_liquid_proxy(item_name)
	for _, proxy_name in ipairs(stackable_liquid_proxies) do
		if item_name == proxy_name then
			return true
		end
	end
	return false
end

local function get_liquid_count(stack)
	-- The liquid count is either the count of liquid nodes in the given stack or the
	-- amount of liquid in a liquid container since such containers do not stack.
	local liquid_count = 0
	if is_filled_bucket(stack) then
		-- Filled buckets neither stack nor contain more than one unit of liquid.
		liquid_count = 1
	elseif technic_cans[stack:get_name()] then
		-- Technic cans do not stack so use the quantity of liquid in the container.
		liquid_count = tonumber(stack:get_metadata()) or 0
	else
		local item_def = minetest.registered_items[stack:get_name()]
		if item_def then
			if item_def.groups.liquid or is_stackable_liquid_proxy(stack:get_name()) then
				-- This is a stackable liquid node so use the stack size to get the
				-- liquid count.
				liquid_count = stack:get_count()
			end
		end
	end
	return liquid_count
end

local function is_loose_material(node_def)
	if node_def then
		if node_def.groups.soil
			or node_def.groups.sand
			or node_def.name == "default:gravel"
			or node_def.name == "default:coalblock"
			or node_def.name == "default:permafrost"
			or node_def.name == "default:permafrost_with_stones"
			or node_def.name == "default:cobble" then
			return true
		end
	end
	return false
end

local function get_crate_texture_index(wagon_id, quantity)
	return (wagon_id + quantity) % crate_texture_count
end

local function get_valid_flat_wagon_load_texture(node_def, crate_texture_index)
	-- Return a texture that is appropriate for a flat wagon load.  The default is for the load to
	-- appear as "in a shipping crate".  For instance, sand would not appear as a block since it
	-- would collapse into a pile.  Of course, it would be more appropriate for sand to be placed
	-- in a hopper or open wagon anyway...
	-- Note: Some nodes that would seem valid to appear as themselves on a flat wagon will still
	-- be shown as "in a crate".  This is because only one texture is used for all sides of the
	-- node when rendered as a load on the wagon.  Thus, any node that has more than 2 unique
	-- faces would likely appear obviously incorrect and so will be shown as "in a crate" instead.
	-- Even though two unique faces for a node can result in some loads appearing incorrect, it's
	-- not likely to be very obvious and so it is not shown as "in a crate".

	local texture = "dlxtrains_industrial_wagons_wooden_crate.png"
	if crate_texture_index > 0 and dlxtrains_industrial_wagons.get_crate_texture ~= nil then
		texture = dlxtrains_industrial_wagons.get_crate_texture(crate_texture_index)
	end

	if node_def.drawtype == "normal" and not is_loose_material(node_def) and node_def.tiles then
		if type(node_def.tiles) == "table" and node_def.tiles[1] and not node_def.tiles[3] then
			texture = node_def.tiles[1]
		end
	end
	return dlxtrains.add_modifier_escaping(texture)
end

local function get_shipping_container_livery_id(wagon_id, quantity)
	return (wagon_id + quantity) % shipping_container_livery_count
end

local function get_shipping_container_texture(livery_id)
	if dlxtrains_industrial_wagons.get_shipping_container_texture ~= nil then
		return dlxtrains_industrial_wagons.get_shipping_container_texture(livery_id)
	end
	return "invalid.png"
end

local function get_shipping_container_overlay(livery_id, y)
	local overlay_texture = ""
	if livery_id > 0 then	-- livery_id 0 is reserved for the container livery defined by the current livery of the wagon.
		overlay_texture = ":0,"..y.."="..get_shipping_container_texture(livery_id).."\\^\\[resize\\:216x32"
	end
	return overlay_texture
end

local function get_tank_container_livery_id(wagon_id, quantity)
	return (wagon_id + quantity) % tank_container_livery_count
end

local function get_tank_container_texture(livery_id)
	if dlxtrains_industrial_wagons.get_tank_container_texture ~= nil then
		return dlxtrains_industrial_wagons.get_tank_container_texture(livery_id)
	end
	return "invalid.png"
end

local function get_default_tank_container_texture(livery_code)
	return "dlxtrains_industrial_wagons_default_tank_container_"..livery_code..".png"
end

local function get_tank_container_overlay(livery_id, livery_code, y)
	local overlay_texture = ":0,"..y.."="
	if livery_id > 0 then
		-- Use a tank container livery from the set of extra liveries.
		overlay_texture = overlay_texture..get_tank_container_texture(livery_id)
	else
		-- Use the container livery corresponding to the current livery of the wagon.
		overlay_texture = overlay_texture..get_default_tank_container_texture(livery_code)
	end
	overlay_texture = overlay_texture.."\\^\\[resize\\:232x32"

	return overlay_texture
end

local function update_model_industrial_wagon_container(wagon, data, texture_file, meshes, livery_code)
	local updated_texture = texture_file

	-- Assume the wagon is not loaded
	wagon.object:set_properties({
		mesh = meshes.default
	})

	local inv = minetest.get_inventory({type="detached", name="advtrains_wgn_"..data.id})
	if inv and not inv:is_empty("box") then
		local occupied_slots = 1
		local stack1 = inv:get_stack("box", 1)
		local stack17 = inv:get_stack("box", 17)
		if stack1:get_count() > 0 and stack17:get_count() > 0 then
			occupied_slots = 2
		end

		local liquid_count1 = get_liquid_count(stack1)
		local liquid_count17 = get_liquid_count(stack17)

		-- Update texture to include appropriate shipping and/or tank container overlays
		local overlay_y_offset = {[1]=64, [2]=96}
		updated_texture = "[combine:256x256:0,0=("..texture_file..")"
		if liquid_count1 > 0 or (occupied_slots == 1 and liquid_count17 > 0) then
			-- The first or only container is a tank container
			local livery_id = get_tank_container_livery_id(data.id, liquid_count1)
			if occupied_slots == 1 and stack17:get_count() > 0 then
				-- stack1 is empty but stack17 is not so use it to determine the livery_id
				livery_id = get_tank_container_livery_id(data.id, liquid_count17)
			end
			updated_texture = updated_texture..get_tank_container_overlay(livery_id, livery_code, overlay_y_offset[1])
		else
			-- The first or only container is a shipping container
			local livery_id = get_shipping_container_livery_id(data.id, stack1:get_count())
			if stack1:get_count() == 0 and stack17:get_count() > 0 then
				-- stack1 is empty but stack17 is not so use it to determine the livery_id
				livery_id = get_shipping_container_livery_id(data.id, stack17:get_count())
			end
			updated_texture = updated_texture..get_shipping_container_overlay(livery_id, overlay_y_offset[1])
		end
		if occupied_slots > 1 then
			if liquid_count17 > 0 then
				-- The second container is a tank container
				local livery_id = get_tank_container_livery_id(data.id, liquid_count17)
				updated_texture = updated_texture..get_tank_container_overlay(livery_id, livery_code, overlay_y_offset[2])
			else
				-- The second container is a shipping container
				local livery_id = get_shipping_container_livery_id(data.id, stack17:get_count())
				updated_texture = updated_texture..get_shipping_container_overlay(livery_id, overlay_y_offset[2])
			end
		end

		-- Use a mesh that corresponds to the number of shipping containers/tank containers to be shown.
		-- Since the wagon's inventory is not empty, one of the following cases will apply:
		--
		--		Case										Mesh to use
		--      ----------------------------------			-----------
		--		1 shipping container						load_a
		--		1 shipping container and 1 tank container	load_ab
		--		2 shipping containers						load_aa
		--		1 tank container							load_b
		--		1 tank container and 1 shipping container	load_ba
		--		2 tank containers							load_bb

		local mesh_with_load = meshes.load_a
		if liquid_count1 > 0 or liquid_count17 > 0 then
			mesh_with_load = meshes.load_b
		end
		if occupied_slots > 1 then
			mesh_with_load = meshes.load_aa
			if liquid_count1 > 0 and liquid_count17 > 0 then
				mesh_with_load = meshes.load_bb
			elseif liquid_count1 > 0 then
				mesh_with_load = meshes.load_ba
			elseif liquid_count17 > 0 then
				mesh_with_load = meshes.load_ab
			end
		end
		wagon.object:set_properties({
			mesh = mesh_with_load
		})
	end

	return updated_texture
end

local function update_model_industrial_wagon_flat(wagon, data, texture_file, meshes)
	local updated_texture = texture_file

	-- Assume the wagon is not loaded
	wagon.object:set_properties({
		mesh = meshes.default
	})

	local inv = minetest.get_inventory({type="detached", name="advtrains_wgn_"..data.id})
	if inv and not inv:is_empty("box") then

		-- Show at least one crate as a load on the wagon since the inventory is not empty.
		-- Show additional crates depending on how many selected "target" slots are occupied.
		-- These target slots are currently 1, 9 and 17.  They were chosen because they should
		-- provide a sense of how full the wagon's inventory might be when automatic loading
		-- is used.  Thus, one crate represents the wagon being < 1/3 filled, three crates
		-- represent the wagon being less than 2/3 filled and five crates represent the wagon
		-- being mostly filled.  Alternatively, a player may choose to fill the target slots
		-- manually in order to achieve a specific appearance for the wagon regardless of how
		-- full the wagon may be.  That is an intended feature of this approach.

		local stack1 = inv:get_stack("box", 1)
		local stack2 = inv:get_stack("box", 9)
		local stack3 = inv:get_stack("box", 17)
		local node_def1 = minetest.registered_nodes[stack1:get_name()]
		local node_def2 = minetest.registered_nodes[stack2:get_name()]
		local node_def3 = minetest.registered_nodes[stack3:get_name()]

		local occupied_slots = 0	-- This is only the count of occupied target slots, not the count of all occupied slots
		if not stack1:is_empty() then occupied_slots = occupied_slots + 1 end
		if not stack2:is_empty() then occupied_slots = occupied_slots + 1 end
		if not stack3:is_empty() then occupied_slots = occupied_slots + 1 end

		if occupied_slots > 0 then
			updated_texture = "[combine:256x256:0,0=("..texture_file..")"
			if node_def1 then
				updated_texture = updated_texture..":0,112="..get_valid_flat_wagon_load_texture(node_def1,get_crate_texture_index(data.id,stack1:get_count())).."\\^\\[resize\\:16x16"
			end
			if node_def2 then
				local x = 16
				if stack1:is_empty() then x = 0 end
				updated_texture = updated_texture..":"..x..",112="..get_valid_flat_wagon_load_texture(node_def2,get_crate_texture_index(data.id,stack2:get_count())).."\\^\\[resize\\:16x16"
			end
			if node_def3 then
				local x = 32
				if stack1:is_empty() and stack2:is_empty() then
					x = 0
				elseif stack2:is_empty() then
					x = 16
				end
				updated_texture = updated_texture..":"..x..",112="..get_valid_flat_wagon_load_texture(node_def3,get_crate_texture_index(data.id,stack3:get_count())).."\\^\\[resize\\:16x16"
			end
		end

		-- Use a mesh that corresponds to the number of nodes/crates to be shown.
		local mesh_with_load = meshes.loaded1
		if occupied_slots == 2 then
			mesh_with_load = meshes.loaded3
		elseif occupied_slots == 3 then
			mesh_with_load = meshes.loaded5
		end
		wagon.object:set_properties({
			mesh = mesh_with_load
		})
	end

	return updated_texture
end

local function update_model_industrial_wagon_hopper(wagon, data, texture_file, meshes)

	-- Assume the wagon is not loaded
	wagon.object:set_properties({
		mesh = meshes.default
	})

	local inv = minetest.get_inventory({type="detached", name="advtrains_wgn_"..data.id})
	if inv and not inv:is_empty("box") then
		local stack = inv:get_stack("box", 1)
		local node_def = minetest.registered_nodes[stack:get_name()]
		local item_def = minetest.registered_items[stack:get_name()]
		if node_def or item_def then
			-- Use the "loaded" version of the wagon model even if the inventory isn't appropriate for a hopper wagon.
			-- In such cases, a default texture will be used which will represent a generic load.
			wagon.object:set_properties({
				mesh = meshes.loaded
			})

			-- Use an applicable texture for the load.  Note that in some cases the texture may differ
			-- from the actual item's texture so that it appears reasonable as cargo in the wagon.
			local load_node_name = nil

			if is_loose_material(node_def) then
				load_node_name = node_def.name
			elseif item_def then
				if item_def.name == "default:coal_lump" or item_def.name == "technic:coal_dust" then
					load_node_name = "default:coalblock"
				end
			end

			if load_node_name then
				local load_node_def = minetest.registered_nodes[load_node_name]
				if load_node_def then
					if load_node_def.drawtype == "normal" then
						local texture = load_node_def.tiles or "dlxtrains_mixed_material.png"
						if type(texture) == "table" then
							texture = texture[1] or "dlxtrains_mixed_material.png"
						end
						local texture_clause = dlxtrains.add_modifier_escaping(texture).."\\^\\[resize\\:16x16"
						return "[combine:256x256:0,0=("..texture_file..
								"):128,32="..texture_clause..
								":144,32="..texture_clause..
								":160,32="..texture_clause..
								":176,32="..texture_clause..
								":192,32="..texture_clause..
								":208,32="..texture_clause..
								":128,48="..texture_clause..
								":144,48="..texture_clause..
								":160,48="..texture_clause..
								":176,48="..texture_clause..
								":192,48="..texture_clause..
								":208,48="..texture_clause
					end
				end
			end
		end
	end

	return texture_file
end

local function update_model_industrial_wagon_open(wagon, data, texture_file, meshes)

	-- Assume the wagon is not loaded
	wagon.object:set_properties({
		mesh = meshes.default
	})

	local inv = minetest.get_inventory({type="detached", name="advtrains_wgn_"..data.id})
	if inv and not inv:is_empty("box") then
		local stack = inv:get_stack("box", 1)
		local node_def = minetest.registered_nodes[stack:get_name()]
		local item_def = minetest.registered_items[stack:get_name()]
		if node_def or item_def then
			wagon.object:set_properties({
				mesh = meshes.loaded
			})

			-- Use an applicable texture for the load.  Note that in some cases the texture may differ
			-- from the actual item's texture so that it appears reasonable as cargo in the wagon.
			local load_node_name = nil

			if is_loose_material(node_def) then
				load_node_name = node_def.name
			elseif item_def then
				if item_def.name == "default:coal_lump" or item_def.name == "technic:coal_dust" then
					load_node_name = "default:coalblock"
				end
			end

			if load_node_name then
				-- Note: Only the material in slot 1 can trigger this load representation.
				local load_node_def = minetest.registered_nodes[load_node_name]
				if load_node_def then
					if load_node_def.drawtype == "normal" then
						local texture = load_node_def.tiles or "dlxtrains_mixed_material.png"
						if type(texture) == "table" then
							texture = texture[1] or "dlxtrains_mixed_material.png"
						end
						local texture_clause = dlxtrains.add_modifier_escaping(texture).."\\^\\[resize\\:16x16"
						return "[combine:256x256:0,0=("..texture_file..
								"):80,112="..texture_clause..
								":96,112="..texture_clause..
								":112,112="..texture_clause..
								":128,112="..texture_clause..
								":144,112="..texture_clause..
								":160,112="..texture_clause..
								":80,128="..texture_clause..
								":96,128="..texture_clause..
								":112,128="..texture_clause..
								":128,128="..texture_clause..
								":144,128="..texture_clause..
								":160,128="..texture_clause
					end
				end
			else
				-- The load isn't appropriate for an open wagon (i.e. it's not a loose
				-- material such as coal, dirt or sand), so use another representation.

				-- If inventory slot 1 contains a craft item then use the canvas/tarpaulin covered open wagon.
				if item_def and item_def.type == "craft" and meshes.covered then
					wagon.object:set_properties({
						mesh = meshes.covered
					})
					return texture_file
				end

				-- If inventory slot 1 contains a tree node then show the wagon without doors and loaded with logs.
				if node_def and node_def.groups.tree and meshes.log_load then
					wagon.object:set_properties({
						mesh = meshes.log_load
					})

					local tree_side = "default_tree_top.png"
					local tree_end = "default_tree.png"
					if type(node_def.tiles) == "table" and node_def.tiles[1] and node_def.tiles[3] then
						tree_end = node_def.tiles[1]
						tree_side = node_def.tiles[3]
					end

					local tree_end_texture = dlxtrains.add_modifier_escaping(tree_end).."\\^\\[resize\\:16x16"
					local tree_side_texture = dlxtrains.add_modifier_escaping(tree_side).."\\^\\[resize\\:16x16"
					return "[combine:256x256:0,0=("..texture_file.."):48,112="..tree_end_texture..":64,112="..tree_side_texture
				end

				-- If none of the above is true then handle the load as a flat wagon.
				return update_model_industrial_wagon_flat(wagon, data, texture_file, meshes)
			end
		end
	end

	return texture_file
end

local function update_model_industrial_wagon_stake(wagon, data, texture_file, meshes)
	local updated_texture = texture_file

	-- Assume the wagon is not loaded
	wagon.object:set_properties({
		mesh = meshes.default
	})

	local inv = minetest.get_inventory({type="detached", name="advtrains_wgn_"..data.id})
	if inv and not inv:is_empty("box") then
		local stack = inv:get_stack("box", 1)
		local node_def = minetest.registered_nodes[stack:get_name()]

		-- If inventory slot 1 is not a tree node then handle the load as a flat wagon.
		if not node_def or not node_def.groups.tree then
			return update_model_industrial_wagon_flat(wagon, data, texture_file, meshes)
		end

		if meshes.log_load then
			wagon.object:set_properties({
				mesh = meshes.log_load
			})

			local tree_side = "default_tree_top.png"
			local tree_end = "default_tree.png"
			if type(node_def.tiles) == "table" and node_def.tiles[1] and node_def.tiles[3] then
				tree_end = node_def.tiles[1]
				tree_side = node_def.tiles[3]
			end

			local tree_end_texture = dlxtrains.add_modifier_escaping(tree_end).."\\^\\[resize\\:16x16"
			local tree_side_texture = dlxtrains.add_modifier_escaping(tree_side).."\\^\\[resize\\:16x16"
			return "[combine:256x256:0,0=("..texture_file.."):48,112="..tree_end_texture..":64,112="..tree_side_texture

		end
	end

	return updated_texture
end

local function get_wagon_proprties_button_spec(wagon_id, pname, x, y)
	local button_spec = ""
	if advtrains.wagons[wagon_id].owner == pname then
		button_spec = "button_exit["..x..","..y..";4,1;prop;"..S("Wagon properties").."]"
	end
	return button_spec
end

-- ////////////////////////////////////////////////////////////////////////////////////

local meshes_industrial_wagon_container_type1 = {
		default = "dlxtrains_industrial_wagons_container_type1.b3d",
		load_a  = "dlxtrains_industrial_wagons_container_type1_a.b3d",
		load_aa = "dlxtrains_industrial_wagons_container_type1_aa.b3d",
		load_ab = "dlxtrains_industrial_wagons_container_type1_ab.b3d",
		load_b  = "dlxtrains_industrial_wagons_container_type1_b.b3d",
		load_ba = "dlxtrains_industrial_wagons_container_type1_ba.b3d",
		load_bb = "dlxtrains_industrial_wagons_container_type1_bb.b3d",
		update_model = function(wagon, data, texture_file, meshes)
			return update_model_industrial_wagon_container(wagon, data, texture_file, meshes, livery_scheme_industrial_wagon_container_type1[data.scheme_id or 0].code)
		end,
	}

local meshes_industrial_wagon_container_type2 = {
		default = "dlxtrains_industrial_wagons_container_type2.b3d",
		load_a  = "dlxtrains_industrial_wagons_container_type2_a.b3d",
		load_b  = "dlxtrains_industrial_wagons_container_type2_b.b3d",
		update_model = function(wagon, data, texture_file, meshes)
			return update_model_industrial_wagon_container(wagon, data, texture_file, meshes, livery_scheme_industrial_wagon_container_type2[data.scheme_id or 0].code)
		end,
	}

local meshes_industrial_wagon_covered_goods_type1 = {
		default = "dlxtrains_industrial_wagons_covered_goods_type1.obj",
	}

local meshes_industrial_wagon_covered_goods_type2 = {
		default = "dlxtrains_industrial_wagons_covered_goods_type2.obj",
	}

local meshes_industrial_wagon_covered_goods_type3 = {
		default = "dlxtrains_industrial_wagons_covered_goods_type3.obj",
	}

local meshes_industrial_wagon_flat_type1 = {
		default = "dlxtrains_industrial_wagons_flat_type1.obj",
		loaded1 = "dlxtrains_industrial_wagons_flat_type1_loaded1.obj",
		loaded3 = "dlxtrains_industrial_wagons_flat_type1_loaded3.obj",
		loaded5 = "dlxtrains_industrial_wagons_flat_type1_loaded5.obj",
		update_model = function(wagon, data, texture_file, meshes)
			return update_model_industrial_wagon_flat(wagon, data, texture_file, meshes)
		end,
	}

local meshes_industrial_wagon_flat_type2 = {
		default = "dlxtrains_industrial_wagons_flat_type2.b3d",
		loaded1 = "dlxtrains_industrial_wagons_flat_type2_loaded1.b3d",
		loaded3 = "dlxtrains_industrial_wagons_flat_type2_loaded3.b3d",
		loaded5 = "dlxtrains_industrial_wagons_flat_type2_loaded5.b3d",
		update_model = function(wagon, data, texture_file, meshes)
			return update_model_industrial_wagon_flat(wagon, data, texture_file, meshes)
		end,
	}

local meshes_industrial_wagon_hopper_type1 = {
		default = "dlxtrains_industrial_wagons_hopper_type1.obj",
		loaded = "dlxtrains_industrial_wagons_hopper_type1_loaded.obj",
		update_model = function(wagon, data, texture_file, meshes)
			return update_model_industrial_wagon_hopper(wagon, data, texture_file, meshes)
		end,
	}

local meshes_industrial_wagon_hopper_type2 = {
		default = "dlxtrains_industrial_wagons_hopper_type2.obj",
	}

local meshes_industrial_wagon_open_type1 = {
		default = "dlxtrains_industrial_wagons_open_type1.b3d",
		loaded = "dlxtrains_industrial_wagons_open_type1_loaded.b3d",
		loaded1 = "dlxtrains_industrial_wagons_open_type1_loaded1.b3d",
		loaded3 = "dlxtrains_industrial_wagons_open_type1_loaded3.b3d",
		loaded5 = "dlxtrains_industrial_wagons_open_type1_loaded5.b3d",
		covered = "dlxtrains_industrial_wagons_open_type1_covered.b3d",
		log_load = "dlxtrains_industrial_wagons_open_type1_logs.b3d",
		update_model = function(wagon, data, texture_file, meshes)
			return update_model_industrial_wagon_open(wagon, data, texture_file, meshes)
		end,
	}

local meshes_industrial_wagon_stake_type1 = {
		default = "dlxtrains_industrial_wagons_stake_type1.obj",
		loaded1 = "dlxtrains_industrial_wagons_stake_type1_loaded1.obj",
		loaded3 = "dlxtrains_industrial_wagons_stake_type1_loaded3.obj",
		loaded5 = "dlxtrains_industrial_wagons_stake_type1_loaded5.obj",
		log_load = "dlxtrains_industrial_wagons_stake_type1_logs.obj",
		update_model = function(wagon, data, texture_file, meshes)
			return update_model_industrial_wagon_stake(wagon, data, texture_file, meshes)
		end,
	}

local meshes_industrial_wagon_tank_type1 = {
		default = "dlxtrains_industrial_wagons_tank_type1.b3d",
	}

local meshes_industrial_wagon_tank_type2 = {
		default = "dlxtrains_industrial_wagons_tank_type2.b3d",
	}

local meshes_industrial_wagon_transition_type1 = {
		default = "dlxtrains_industrial_wagons_transition_type1.obj",
		loaded1 = "dlxtrains_industrial_wagons_transition_type1_loaded1.obj",
		loaded3 = "dlxtrains_industrial_wagons_transition_type1_loaded3.obj",
		loaded5 = "dlxtrains_industrial_wagons_transition_type1_loaded5.obj",
		update_model = function(wagon, data, texture_file, meshes)
			return update_model_industrial_wagon_flat(wagon, data, texture_file, meshes)
		end,
	}

-- ////////////////////////////////////////////////////////////////////////////////////

if dlxtrains_industrial_wagons.max_wagon_length >= 8.5 then
	local wagon_type = "dlxtrains_industrial_wagons:container_type1"

	dlxtrains.register_livery_templates(wagon_type, mod_name, livery_templates)

	advtrains.register_wagon(wagon_type, {
		mesh = meshes_industrial_wagon_container_type1.default,
		textures = {dlxtrains.get_init_texture()},
		set_textures = function(wagon, data)
			dlxtrains.set_textures_for_livery_scheme(wagon, data, livery_scheme_industrial_wagon_container_type1, meshes_industrial_wagon_container_type1)
		end,
		custom_may_destroy = function(wagon, puncher, time_from_last_punch, tool_capabilities, direction)
			return not dlxtrains.update_livery(wagon, puncher, livery_scheme_industrial_wagon_container_type1)
		end,
		seats = {},
		drives_on={default=true},
		max_speed=20,
		visual_size = {x=1, y=1},
		wagon_span=4.25,
		wheel_positions = {2.6875, -2.6875},
		collisionbox = {-1.0,-0.5,-1.0,1.0,2.5,1.0},
		coupler_types_front = {chain=true},
		coupler_types_back = {chain=true},
		drops={"default:steelblock"},
		has_inventory = true,
		get_inventory_formspec = function(wagon, pname, invname)
			return "size[8,9]"..
				"box[0,0;.8,.88;#077]"..	-- Highlight slots that impact visible loads
				"box[0,2;.8,.88;#077]"..
				"list["..invname..";box;0,0;8,4;]"..
				"list[current_player;main;0,5;8,4;]"..
				"listring[]"..
				get_wagon_proprties_button_spec(wagon.id, pname, 2, 4)
		end,
		inventory_list_sizes = {
			box=8*4,
		},
	}, S("European Container Wagon"), "dlxtrains_industrial_wagons_container_type1_inv.png")
end

if dlxtrains_industrial_wagons.max_wagon_length >= 4.875 then
	local wagon_type = "dlxtrains_industrial_wagons:container_type2"

	dlxtrains.register_livery_templates(wagon_type, mod_name, livery_templates)

	advtrains.register_wagon(wagon_type, {
		mesh = meshes_industrial_wagon_container_type2.default,
		textures = {dlxtrains.get_init_texture()},
		set_textures = function(wagon, data)
			dlxtrains.set_textures_for_livery_scheme(wagon, data, livery_scheme_industrial_wagon_container_type2, meshes_industrial_wagon_container_type2)
		end,
		custom_may_destroy = function(wagon, puncher, time_from_last_punch, tool_capabilities, direction)
			return not dlxtrains.update_livery(wagon, puncher, livery_scheme_industrial_wagon_container_type2)
		end,
		seats = {},
		drives_on={default=true},
		max_speed=20,
		visual_size = {x=1, y=1},
		wagon_span=2.4375,
		wheel_positions = {1.5, -1.5},
		collisionbox = {-1.0,-0.5,-1.0,1.0,2.5,1.0},
		coupler_types_front = {chain=true},
		coupler_types_back = {chain=true},
		drops={"default:steelblock"},
		has_inventory = true,
		get_inventory_formspec = function(wagon, pname, invname)
			return "size[8,7]"..
				"box[0,0;.8,.88;#077]"..	-- Highlight slots that impact visible loads
				"list["..invname..";box;0,0;8,2;]"..
				"list[current_player;main;0,3;8,4;]"..
				"listring[]"..
				get_wagon_proprties_button_spec(wagon.id, pname, 2, 2)
		end,
		inventory_list_sizes = {
			box=8*2,
		},
	}, S("European Single Container Wagon"), "dlxtrains_industrial_wagons_container_type2_inv.png")
end

if dlxtrains_industrial_wagons.max_wagon_length >= 8 then
	local wagon_type = "dlxtrains_industrial_wagons:covered_goods_type1"

	dlxtrains.register_livery_templates(wagon_type, mod_name, livery_templates)

	advtrains.register_wagon(wagon_type, {
		mesh = meshes_industrial_wagon_covered_goods_type1.default,
		textures = {dlxtrains.get_init_texture()},
		set_textures = function(wagon, data)
			dlxtrains.set_textures_for_livery_scheme(wagon, data, livery_scheme_industrial_wagon_covered_goods_type1, meshes_industrial_wagon_covered_goods_type1)
		end,
		custom_may_destroy = function(wagon, puncher, time_from_last_punch, tool_capabilities, direction)
			return not dlxtrains.update_livery(wagon, puncher, livery_scheme_industrial_wagon_covered_goods_type1)
		end,
		seats = {},
		drives_on={default=true},
		max_speed=25,
		visual_size = {x=1, y=1},
		wagon_span=4,
		wheel_positions = {3.0, -3.0},
		collisionbox = {-1.0,-0.5,-1.0,1.0,2.5,1.0},
		coupler_types_front = {knuckle=true},
		coupler_types_back = {knuckle=true},
		drops={"default:steelblock"},
		has_inventory = true,
		get_inventory_formspec = function(wagon, pname, invname)
			return "size[8,10]"..
				"list["..invname..";box;0,0;8,5;]"..
				"list[current_player;main;0,6;8,4;]"..
				"listring[]"..
				get_wagon_proprties_button_spec(wagon.id, pname, 2, 5)
		end,
		inventory_list_sizes = {
			box=8*5,
		},
	}, S("North American Wooden Boxcar"), "dlxtrains_industrial_wagons_covered_goods_type1_inv.png")
end

if dlxtrains_industrial_wagons.max_wagon_length >= 8 then
	local wagon_type = "dlxtrains_industrial_wagons:covered_goods_type2"

	dlxtrains.register_livery_templates(wagon_type, mod_name, livery_templates)

	advtrains.register_wagon(wagon_type, {
		mesh = meshes_industrial_wagon_covered_goods_type2.default,
		textures = {dlxtrains.get_init_texture()},
		set_textures = function(wagon, data)
			dlxtrains.set_textures_for_livery_scheme(wagon, data, livery_scheme_industrial_wagon_covered_goods_type2, meshes_industrial_wagon_covered_goods_type2)
		end,
		custom_may_destroy = function(wagon, puncher, time_from_last_punch, tool_capabilities, direction)
			return not dlxtrains.update_livery(wagon, puncher, livery_scheme_industrial_wagon_covered_goods_type2)
		end,
		seats = {},
		drives_on={default=true},
		max_speed=25,
		visual_size = {x=1, y=1},
		wagon_span=4,
		wheel_positions = {2.8, -2.8},
		collisionbox = {-1.0,-0.5,-1.0,1.0,2.5,1.0},
		coupler_types_front = {knuckle=true},
		coupler_types_back = {knuckle=true},
		drops={"default:steelblock"},
		has_inventory = true,
		get_inventory_formspec = function(wagon, pname, invname)
			return "size[8,10]"..
				"list["..invname..";box;0,0;8,5;]"..
				"list[current_player;main;0,6;8,4;]"..
				"listring[]"..
				get_wagon_proprties_button_spec(wagon.id, pname, 2, 5)
		end,
		inventory_list_sizes = {
			box=8*5,
		},
	}, S("Australian Louver Van"), "dlxtrains_industrial_wagons_covered_goods_type2_inv.png")
end

if dlxtrains_industrial_wagons.max_wagon_length >= 7 then
	local wagon_type = "dlxtrains_industrial_wagons:covered_goods_type3"

	dlxtrains.register_livery_templates(wagon_type, mod_name, livery_templates)

	advtrains.register_wagon(wagon_type, {
		mesh = meshes_industrial_wagon_covered_goods_type3.default,
		textures = {dlxtrains.get_init_texture()},
		set_textures = function(wagon, data)
			dlxtrains.set_textures_for_livery_scheme(wagon, data, livery_scheme_industrial_wagon_covered_goods_type3, meshes_industrial_wagon_covered_goods_type3)
		end,
		custom_may_destroy = function(wagon, puncher, time_from_last_punch, tool_capabilities, direction)
			return not dlxtrains.update_livery(wagon, puncher, livery_scheme_industrial_wagon_covered_goods_type3)
		end,
		seats = {},
		drives_on={default=true},
		max_speed=20,
		visual_size = {x=1, y=1},
		wagon_span=3.5,
		wheel_positions = {2.0, -2.0},
		collisionbox = {-1.0,-0.5,-1.0,1.0,2.5,1.0},
		coupler_types_front = {chain=true},
		coupler_types_back = {chain=true},
		drops={"default:steelblock"},
		has_inventory = true,
		get_inventory_formspec = function(wagon, pname, invname)
			return "size[8,9]"..
				"list["..invname..";box;0,0;8,4;]"..
				"list[current_player;main;0,5;8,4;]"..
				"listring[]"..
				get_wagon_proprties_button_spec(wagon.id, pname, 2, 4)
		end,
		inventory_list_sizes = {
			box=8*4,
		},
	}, S("European Wooden Covered Goods Wagon"), "dlxtrains_industrial_wagons_covered_goods_type3_inv.png")
end

-- ////////////////////////////////////////////////////////////////////////////////////

if dlxtrains_industrial_wagons.max_wagon_length >= 6 then
	local wagon_type = "dlxtrains_industrial_wagons:flat_type1"

	dlxtrains.register_livery_templates(wagon_type, mod_name, livery_templates)

	advtrains.register_wagon(wagon_type, {
		mesh = meshes_industrial_wagon_flat_type1.default,
		textures = {dlxtrains.get_init_texture()},
		set_textures = function(wagon, data)
			dlxtrains.set_textures_for_livery_scheme(wagon, data, livery_scheme_industrial_wagon_flat_type1, meshes_industrial_wagon_flat_type1)
		end,
		custom_may_destroy = function(wagon, puncher, time_from_last_punch, tool_capabilities, direction)
			return not dlxtrains.update_livery(wagon, puncher, livery_scheme_industrial_wagon_flat_type1)
		end,
		seats = {},
		drives_on={default=true},
		max_speed=20,
		visual_size = {x=1, y=1},
		wagon_span=3,
		wheel_positions = {2.0, -2.0},
		collisionbox = {-1.0,-0.5,-1.0,1.0,2.5,1.0},
		coupler_types_front = {chain=true},
		coupler_types_back = {chain=true},
		drops={"default:steelblock"},
		has_inventory = true,
		get_inventory_formspec = function(wagon, pname, invname)
			return "size[8,8]"..
				"box[0,0;.8,.88;#077]"..	-- Highlight slots that impact visible loads
				"box[0,1;.8,.88;#077]"..
				"box[0,2;.8,.88;#077]"..
				"list["..invname..";box;0,0;8,3;]"..
				"list[current_player;main;0,4;8,4;]"..
				"listring[]"..
				get_wagon_proprties_button_spec(wagon.id, pname, 2, 3)
		end,
		inventory_list_sizes = {
			box=8*3,
		},
	}, S("European Flat Wagon"), "dlxtrains_industrial_wagons_flat_type1_inv.png")
end

-- ////////////////////////////////////////////////////////////////////////////////////

if dlxtrains_industrial_wagons.max_wagon_length >= 6 then
	local wagon_type = "dlxtrains_industrial_wagons:flat_type2"

	dlxtrains.register_livery_templates(wagon_type, mod_name, livery_templates)

	advtrains.register_wagon(wagon_type, {
		mesh = meshes_industrial_wagon_flat_type2.default,
		textures = {dlxtrains.get_init_texture()},
		set_textures = function(wagon, data)
			dlxtrains.set_textures_for_livery_scheme(wagon, data, livery_scheme_industrial_wagon_flat_type2, meshes_industrial_wagon_flat_type2)
		end,
		custom_may_destroy = function(wagon, puncher, time_from_last_punch, tool_capabilities, direction)
			return not dlxtrains.update_livery(wagon, puncher, livery_scheme_industrial_wagon_flat_type2)
		end,
		seats = {},
		drives_on={default=true},
		max_speed=20,
		visual_size = {x=1, y=1},
		wagon_span=3,
		wheel_positions = {2.0, -2.0},
		collisionbox = {-1.0,-0.5,-1.0,1.0,2.5,1.0},
		coupler_types_front = {knuckle=true},
		coupler_types_back = {knuckle=true},
		drops={"default:steelblock"},
		has_inventory = true,
		get_inventory_formspec = function(wagon, pname, invname)
			return "size[8,8]"..
				"box[0,0;.8,.88;#077]"..	-- Highlight slots that impact visible loads
				"box[0,1;.8,.88;#077]"..
				"box[0,2;.8,.88;#077]"..
				"list["..invname..";box;0,0;8,3;]"..
				"list[current_player;main;0,4;8,4;]"..
				"listring[]"..
				get_wagon_proprties_button_spec(wagon.id, pname, 2, 3)
		end,
		inventory_list_sizes = {
			box=8*3,
		},
	}, S("Australian Flat Wagon"), "dlxtrains_industrial_wagons_flat_type2_inv.png")
end

-- ////////////////////////////////////////////////////////////////////////////////////

if dlxtrains_industrial_wagons.max_wagon_length >= 6 then
	local wagon_type = "dlxtrains_industrial_wagons:hopper_type1"

	dlxtrains.register_livery_templates(wagon_type, mod_name, livery_templates)

	advtrains.register_wagon(wagon_type, {
		mesh = meshes_industrial_wagon_hopper_type1.default,
		textures = {dlxtrains.get_init_texture()},
		set_textures = function(wagon, data)
			dlxtrains.set_textures_for_livery_scheme(wagon, data, livery_scheme_industrial_wagon_hopper_type1, meshes_industrial_wagon_hopper_type1)
		end,
		custom_may_destroy = function(wagon, puncher, time_from_last_punch, tool_capabilities, direction)
			return not dlxtrains.update_livery(wagon, puncher, livery_scheme_industrial_wagon_hopper_type1)
		end,
		seats = {},
		drives_on={default=true},
		max_speed=25,
		visual_size = {x=1, y=1},
		wagon_span=3,
		wheel_positions = {2.0, -2.0},
		collisionbox = {-1.0,-0.5,-1.0,1.0,2.5,1.0},
		coupler_types_front = {knuckle=true},
		coupler_types_back = {knuckle=true},
		drops={"default:steelblock"},
		has_inventory = true,
		get_inventory_formspec = function(wagon, pname, invname)
			return "size[8,8]"..
				"box[0,0;.8,.88;#077]"..	-- Highlight slots that impact visible loads
				"list["..invname..";box;0,0;8,3;]"..
				"list[current_player;main;0,4;8,4;]"..
				"listring[]"..
				get_wagon_proprties_button_spec(wagon.id, pname, 2, 3)
		end,
		inventory_list_sizes = {
			box=8*3,
		},
	}, S("North American Hopper Wagon"), "dlxtrains_industrial_wagons_hopper_type1_inv.png")
end

-- ////////////////////////////////////////////////////////////////////////////////////

if dlxtrains_industrial_wagons.max_wagon_length >= 6 then
	local wagon_type = "dlxtrains_industrial_wagons:hopper_type2"

	dlxtrains.register_livery_templates(wagon_type, mod_name, livery_templates)

	advtrains.register_wagon(wagon_type, {
		mesh = meshes_industrial_wagon_hopper_type2.default,
		textures = {dlxtrains.get_init_texture()},
		set_textures = function(wagon, data)
			dlxtrains.set_textures_for_livery_scheme(wagon, data, livery_scheme_industrial_wagon_hopper_type2, meshes_industrial_wagon_hopper_type2)
		end,
		custom_may_destroy = function(wagon, puncher, time_from_last_punch, tool_capabilities, direction)
			return not dlxtrains.update_livery(wagon, puncher, livery_scheme_industrial_wagon_hopper_type2)
		end,
		seats = {},
		drives_on={default=true},
		max_speed=25,
		visual_size = {x=1, y=1},
		wagon_span=3,
		wheel_positions = {2.0, -2.0},
		collisionbox = {-1.0,-0.5,-1.0,1.0,2.5,1.0},
		coupler_types_front = {knuckle=true},
		coupler_types_back = {knuckle=true},
		drops={"default:steelblock"},
		has_inventory = true,
		get_inventory_formspec = function(wagon, pname, invname)
			return "size[8,8]"..
				"list["..invname..";box;0,0;8,3;]"..
				"list[current_player;main;0,4;8,4;]"..
				"listring[]"..
				get_wagon_proprties_button_spec(wagon.id, pname, 2, 3)
		end,
		inventory_list_sizes = {
			box=8*3,
		},
	}, S("North American Covered Hopper Wagon"), "dlxtrains_industrial_wagons_hopper_type2_inv.png")
end

-- ////////////////////////////////////////////////////////////////////////////////////

if dlxtrains_industrial_wagons.max_wagon_length >= 6 then
	local wagon_type = "dlxtrains_industrial_wagons:open_type1"

	dlxtrains.register_livery_templates(wagon_type, mod_name, livery_templates)

	advtrains.register_wagon(wagon_type, {
		mesh = meshes_industrial_wagon_open_type1.default,
		textures = {dlxtrains.get_init_texture()},
		set_textures = function(wagon, data)
			dlxtrains.set_textures_for_livery_scheme(wagon, data, livery_scheme_industrial_wagon_open_type1, meshes_industrial_wagon_open_type1)
		end,
		custom_may_destroy = function(wagon, puncher, time_from_last_punch, tool_capabilities, direction)
			return not dlxtrains.update_livery(wagon, puncher, livery_scheme_industrial_wagon_open_type1)
		end,
		seats = {},
		drives_on={default=true},
		max_speed=20,
		visual_size = {x=1, y=1},
		wagon_span=3,
		wheel_positions = {2.0, -2.0},
		collisionbox = {-1.0,-0.5,-1.0,1.0,2.5,1.0},
		coupler_types_front = {knuckle=true},
		coupler_types_back = {knuckle=true},
		drops={"default:steelblock"},
		has_inventory = true,
		get_inventory_formspec = function(wagon, pname, invname)
			return "size[8,8]"..
				"box[0,0;.8,.88;#077]"..	-- Highlight slots that impact visible loads
				"box[0,1;.8,.88;#077]"..
				"box[0,2;.8,.88;#077]"..
				"list["..invname..";box;0,0;8,3;]"..
				"list[current_player;main;0,4;8,4;]"..
				"listring[]"..
				get_wagon_proprties_button_spec(wagon.id, pname, 2, 3)
		end,
		inventory_list_sizes = {
			box=8*3,
		},
	}, S("Australian Open Wagon"), "dlxtrains_industrial_wagons_open_type1_inv.png")
end

-- ////////////////////////////////////////////////////////////////////////////////////

if dlxtrains_industrial_wagons.max_wagon_length >= 6 then
	local wagon_type = "dlxtrains_industrial_wagons:stake_type1"

	dlxtrains.register_livery_templates(wagon_type, mod_name, livery_templates)

	advtrains.register_wagon(wagon_type, {
		mesh = meshes_industrial_wagon_stake_type1.default,
		textures = {dlxtrains.get_init_texture()},
		set_textures = function(wagon, data)
			dlxtrains.set_textures_for_livery_scheme(wagon, data, livery_scheme_industrial_wagon_stake_type1, meshes_industrial_wagon_stake_type1)
		end,
		custom_may_destroy = function(wagon, puncher, time_from_last_punch, tool_capabilities, direction)
			return not dlxtrains.update_livery(wagon, puncher, livery_scheme_industrial_wagon_stake_type1)
		end,
		seats = {},
		drives_on={default=true},
		max_speed=20,
		visual_size = {x=1, y=1},
		wagon_span=3,
		wheel_positions = {2.0, -2.0},
		collisionbox = {-1.0,-0.5,-1.0,1.0,2.5,1.0},
		coupler_types_front = {chain=true},
		coupler_types_back = {chain=true},
		drops={"default:steelblock"},
		has_inventory = true,
		get_inventory_formspec = function(wagon, pname, invname)
			return "size[8,8]"..
				"box[0,0;.8,.88;#077]"..	-- Highlight slots that impact visible loads
				"box[0,1;.8,.88;#077]"..
				"box[0,2;.8,.88;#077]"..
				"list["..invname..";box;0,0;8,3;]"..
				"list[current_player;main;0,4;8,4;]"..
				"listring[]"..
				get_wagon_proprties_button_spec(wagon.id, pname, 2, 3)
		end,
		inventory_list_sizes = {
			box=8*3,
		},
	}, S("European Stake Wagon"), "dlxtrains_industrial_wagons_stake_type1_inv.png")
end

-- ////////////////////////////////////////////////////////////////////////////////////

if dlxtrains_industrial_wagons.max_wagon_length >= 4.875 then
	local wagon_type = "dlxtrains_industrial_wagons:tank_type1"

	dlxtrains.register_livery_templates(wagon_type, mod_name, livery_templates)

	local wagon_def = {
		mesh = meshes_industrial_wagon_tank_type1.default,
		textures = {dlxtrains.get_init_texture()},
		set_textures = function(wagon, data)
			dlxtrains.set_textures_for_livery_scheme(wagon, data, livery_scheme_industrial_wagon_tank_type1, meshes_industrial_wagon_tank_type1)
		end,
		custom_may_destroy = function(wagon, puncher, time_from_last_punch, tool_capabilities, direction)
			return not dlxtrains.update_livery(wagon, puncher, livery_scheme_industrial_wagon_tank_type1)
		end,
		seats = {
			{
				name = "Seat in Brakeman's Cabin",
				attach_offset = use_attachment_patch and {x=0, y=1, z=-18.0} or {x=0, y=1, z=-18.0},
				view_offset = use_attachment_patch and {x=0, y=0, z=0} or {x=0, y=6.5, z=0},
				advtrains_attachment_offset_patch_attach_rotation = use_attachment_patch and {x=0, y=180, z=0} or nil,
				group = "cabin",
			},
		},
		seat_groups = {
			cabin={
				name = "Brakeman's Cabin",
				access_to = {},
				require_doors_open = false,
			},
		},
		assign_to_seat_group = {"cabin"},
		drives_on={default=true},
		max_speed=15,
		visual_size = {x=1, y=1},
		wagon_span=2.4375,
		wheel_positions = {1.3, -1.0},
		collisionbox = {-1.0,-0.5,-1.0,1.0,2.5,1.0},
		coupler_types_front = {chain=true},
		coupler_types_back = {chain=true},
		drops={"default:steelblock"},
		has_inventory = true,
		get_inventory_formspec = function(wagon, pname, invname)
			return "size[8,8]"..
				"list["..invname..";box;0,0;8,3;]"..
				"list[current_player;main;0,4;8,4;]"..
				"listring[]"..
				get_wagon_proprties_button_spec(wagon.id, pname, 2, 3)
		end,
		inventory_list_sizes = {
			box=8*3,
		},
		techage_liquid_capacity = 1000,
	}

	if use_attachment_patch then
		advtrains_attachment_offset_patch.setup_advtrains_wagon(wagon_def);
	end

	advtrains.register_wagon(wagon_type, wagon_def, S("European Small Tank Wagon with Brakeman's Cabin"), "dlxtrains_industrial_wagons_tank_type1_inv.png")
end

-- ////////////////////////////////////////////////////////////////////////////////////

if dlxtrains_industrial_wagons.max_wagon_length >= 4.875 then
	local wagon_type = "dlxtrains_industrial_wagons:tank_type2"

	dlxtrains.register_livery_templates(wagon_type, mod_name, livery_templates)

	advtrains.register_wagon(wagon_type, {
		mesh = meshes_industrial_wagon_tank_type2.default,
		textures = {dlxtrains.get_init_texture()},
		set_textures = function(wagon, data)
			dlxtrains.set_textures_for_livery_scheme(wagon, data, livery_scheme_industrial_wagon_tank_type2, meshes_industrial_wagon_tank_type2)
		end,
		custom_may_destroy = function(wagon, puncher, time_from_last_punch, tool_capabilities, direction)
			return not dlxtrains.update_livery(wagon, puncher, livery_scheme_industrial_wagon_tank_type2)
		end,
		seats = {},
		drives_on={default=true},
		max_speed=15,
		visual_size = {x=1, y=1},
		wagon_span=2.4375,
		wheel_positions = {1.3, -1.0},
		collisionbox = {-1.0,-0.5,-1.0,1.0,2.5,1.0},
		coupler_types_front = {chain=true},
		coupler_types_back = {chain=true},
		drops={"default:steelblock"},
		has_inventory = true,
		get_inventory_formspec = function(wagon, pname, invname)
			return "size[8,8]"..
				"list["..invname..";box;0,0;8,3;]"..
				"list[current_player;main;0,4;8,4;]"..
				"listring[]"..
				get_wagon_proprties_button_spec(wagon.id, pname, 2, 3)
		end,
		inventory_list_sizes = {
			box=8*3,
		},
		techage_liquid_capacity = 1000,
	}, S("European Small Tank Wagon"), "dlxtrains_industrial_wagons_tank_type2_inv.png")
end

-- ////////////////////////////////////////////////////////////////////////////////////

if dlxtrains_industrial_wagons.max_wagon_length >= 6 then
	local wagon_type = "dlxtrains_industrial_wagons:transition_type1"

	dlxtrains.register_livery_templates(wagon_type, mod_name, livery_templates)

	advtrains.register_wagon(wagon_type, {
		mesh = meshes_industrial_wagon_transition_type1.default,
		textures = {dlxtrains.get_init_texture()},
		set_textures = function(wagon, data)
			dlxtrains.set_textures_for_livery_scheme(wagon, data, livery_scheme_industrial_wagon_transition_type1, meshes_industrial_wagon_transition_type1)
		end,
		custom_may_destroy = function(wagon, puncher, time_from_last_punch, tool_capabilities, direction)
			return not dlxtrains.update_livery(wagon, puncher, livery_scheme_industrial_wagon_transition_type1)
		end,
		seats = {},
		drives_on={default=true},
		max_speed=20,
		visual_size = {x=1, y=1},
		wagon_span=3,
		wheel_positions = {2.0, -2.0},
		collisionbox = {-1.0,-0.5,-1.0,1.0,2.5,1.0},
		coupler_types_front = {chain=true},
		coupler_types_back = {knuckle=true},
		drops={"default:steelblock"},
		has_inventory = true,
		get_inventory_formspec = function(wagon, pname, invname)
			return "size[8,8]"..
				"box[0,0;.8,.88;#077]"..	-- Highlight slots that impact visible loads
				"box[0,1;.8,.88;#077]"..
				"box[0,2;.8,.88;#077]"..
				"list["..invname..";box;0,0;8,3;]"..
				"list[current_player;main;0,4;8,4;]"..
				"listring[]"..
				get_wagon_proprties_button_spec(wagon.id, pname, 2, 3)
		end,
		inventory_list_sizes = {
			box=8*3,
		},
	}, S("Buffer/Knuckle Transition Wagon"), "dlxtrains_industrial_wagons_transition_type1_inv.png")
end

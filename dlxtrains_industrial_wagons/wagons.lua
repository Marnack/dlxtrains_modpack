
local S = dlxtrains_industrial_wagons.S

local crate_texture_count = dlxtrains_industrial_wagons.crate_texture_count
local shipping_container_livery_count = dlxtrains_industrial_wagons.shipping_container_livery_count
local tank_container_livery_count = dlxtrains_industrial_wagons.tank_container_livery_count

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
		count = 3,
	}

local livery_scheme_industrial_wagon_covered_goods_type2 = {
		filename_prefix = "dlxtrains_industrial_wagons_covered_goods_type2",
		[0]={code="vr"},
		[1]={code="ar"},
		[2]={code="at"},
		count = 3,
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

local livery_scheme_industrial_wagon_stake_type1 = {
		filename_prefix = "dlxtrains_industrial_wagons_stake_type1",
		[0]={code="t"},
		[1]={code="dz"},
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

local function register_stackable_liquid_proxy(mod_name, item_name)
	if mod_name ~= nil and item_name ~= nil then
		if minetest.get_modpath(mod_name) then
			table.insert(stackable_liquid_proxies, item_name)
		end
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

local function is_stackable_liquid_proxy(item_name)
	for _, proxy_name in ipairs(stackable_liquid_proxies) do
		if item_name == proxy_name then
			return true
		end
	end
	return false
end

local function get_liquid_count(stack)
	-- The liquid count is either the cound of liquid nodes in the given stack or the
	-- amount of liquid in a liquid container since such containers do not stack.
	local liquid_count = 0
	if is_filled_bucket(stack) then
		-- Filled buckets neither stack nor contain more than one unit of liquid.
		liquid_count = 1
	elseif minetest.get_modpath("technic") and technic.cans[stack:get_name()] then
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

local function is_hopper_load_material(node_def)
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
	-- in a hopper wagon anyway...
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

	if node_def.drawtype == "normal" and not is_hopper_load_material(node_def) and node_def.tiles then
		if type(node_def.tiles) == "table" and node_def.tiles[1] and not node_def.tiles[3] then
			texture = node_def.tiles[1]
		end
	end
	return dlxtrains.make_safe_string(texture)
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
			-- from the actual item's texture so that it appears reasonable as cargo in the hopper.
			local load_node_name = nil

			if is_hopper_load_material(node_def) then
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
						local texture_clause = dlxtrains.make_safe_string(texture).."\\^\\[resize\\:16x16"
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

			local tree_end_texture = dlxtrains.make_safe_string(tree_end).."\\^\\[resize\\:16x16"
			local tree_side_texture = dlxtrains.make_safe_string(tree_side).."\\^\\[resize\\:16x16"
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
	advtrains.register_wagon("dlxtrains_industrial_wagons:container_type1", {
		mesh = meshes_industrial_wagon_container_type1.default,
		textures = {"dlxtrains_industrial_wagon_container_type1.png"},
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
	advtrains.register_wagon("dlxtrains_industrial_wagons:container_type2", {
		mesh = meshes_industrial_wagon_container_type2.default,
		textures = {"dlxtrains_industrial_wagon_container_type2.png"},
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
	advtrains.register_wagon("dlxtrains_industrial_wagons:covered_goods_type1", {
		mesh = meshes_industrial_wagon_covered_goods_type1.default,
		textures = {"dlxtrains_industrial_wagon_covered_goods_type1.png"},
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
	advtrains.register_wagon("dlxtrains_industrial_wagons:covered_goods_type2", {
		mesh = meshes_industrial_wagon_covered_goods_type2.default,
		textures = {"dlxtrains_industrial_wagon_covered_goods_type2.png"},
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
	advtrains.register_wagon("dlxtrains_industrial_wagons:covered_goods_type3", {
		mesh = meshes_industrial_wagon_covered_goods_type3.default,
		textures = {"dlxtrains_industrial_wagon_covered_goods_type3.png"},
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
	advtrains.register_wagon("dlxtrains_industrial_wagons:flat_type1", {
		mesh = meshes_industrial_wagon_flat_type1.default,
		textures = {"dlxtrains_industrial_wagon_flat_type1.png"},
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
	advtrains.register_wagon("dlxtrains_industrial_wagons:hopper_type1", {
		mesh = meshes_industrial_wagon_hopper_type1.default,
		textures = {"dlxtrains_industrial_wagon_hopper_type1.png"},
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
	advtrains.register_wagon("dlxtrains_industrial_wagons:hopper_type2", {
		mesh = meshes_industrial_wagon_hopper_type2.default,
		textures = {"dlxtrains_industrial_wagon_hopper_type2.png"},
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
	advtrains.register_wagon("dlxtrains_industrial_wagons:stake_type1", {
		mesh = meshes_industrial_wagon_stake_type1.default,
		textures = {"dlxtrains_industrial_wagon_stake_type1.png"},
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

if dlxtrains_industrial_wagons.max_wagon_length >= 6 then
	advtrains.register_wagon("dlxtrains_industrial_wagons:transition_type1", {
		mesh = meshes_industrial_wagon_transition_type1.default,
		textures = {"dlxtrains_industrial_wagon_transition_type1.png"},
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

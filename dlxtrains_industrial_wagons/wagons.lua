
local S = dlxtrains_industrial_wagons.S

local crate_texture_count = dlxtrains_industrial_wagons.crate_texture_count
local shipping_container_livery_count = dlxtrains_industrial_wagons.shipping_container_livery_count

-- ////////////////////////////////////////////////////////////////////////////////////

local livery_scheme_industrial_wagon_container_type1 = {
		[0]="dlxtrains_industrial_wagons_container_type1_black.png",
		[1]="dlxtrains_industrial_wagons_container_type1_red.png",
		count = 2,
	}

local livery_scheme_industrial_wagon_container_type2 = {
		[0]="dlxtrains_industrial_wagons_container_type2_black.png",
		[1]="dlxtrains_industrial_wagons_container_type2_red.png",
		count = 2,
	}

local livery_scheme_industrial_wagon_covered_goods_type1 = {
		[0]="dlxtrains_industrial_wagons_covered_goods_type1_red.png",
		[1]="dlxtrains_industrial_wagons_covered_goods_type1_red2.png",
		[2]="dlxtrains_industrial_wagons_covered_goods_type1_red3.png",
		count = 3,
	}

local livery_scheme_industrial_wagon_covered_goods_type2 = {
		[0]="dlxtrains_industrial_wagons_covered_goods_type2_grey.png",
		[1]="dlxtrains_industrial_wagons_covered_goods_type2_red.png",
		[2]="dlxtrains_industrial_wagons_covered_goods_type2_green2.png",
		count = 3,
	}

local livery_scheme_industrial_wagon_covered_goods_type3 = {
		[0]="dlxtrains_industrial_wagons_covered_goods_type3_red.png",
		[1]="dlxtrains_industrial_wagons_covered_goods_type3_brown.png",
		count = 2,
	}

local livery_scheme_industrial_wagon_flat_type1 = {
		[0]="dlxtrains_industrial_wagons_flat_type1_yellow.png",
		[1]="dlxtrains_industrial_wagons_flat_type1_brown.png",
		count = 2,
	}

local livery_scheme_industrial_wagon_hopper_type1 = {
		[0]="dlxtrains_industrial_wagons_hopper_type1_black.png",
		[1]="dlxtrains_industrial_wagons_hopper_type1_brown.png",
		count = 2,
	}

local livery_scheme_industrial_wagon_stake_type1 = {
		[0]="dlxtrains_industrial_wagons_stake_type1_brown.png",
		[1]="dlxtrains_industrial_wagons_stake_type1_red.png",
		[2]="dlxtrains_industrial_wagons_stake_type1_green.png",
		count = 3,
	}

local livery_scheme_industrial_wagon_transition_type1 = {
		[0]="dlxtrains_industrial_wagons_transition_type1_black.png",
		[1]="dlxtrains_industrial_wagons_transition_type1_brown.png",
		count = 2,
	}

-- ////////////////////////////////////////////////////////////////////////////////////

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

local function update_model_industrial_wagon_container(wagon, data, texture_file, meshes)
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

		-- Update texture to include alternate shipping container(s)
		updated_texture = "[combine:256x256:0,0=("..texture_file..")"
		local livery_id = get_shipping_container_livery_id(data.id, stack1:get_count())
		if livery_id > 0 then	-- livery_id 0 is reserved for the container livery defined by the current livery of the wagon.
			updated_texture = updated_texture..":0,64="..get_shipping_container_texture(livery_id).."\\^\\[resize\\:216x32"
		end
		if occupied_slots > 1 then
			livery_id = get_shipping_container_livery_id(data.id, stack17:get_count())
			if livery_id > 0 then
				updated_texture = updated_texture..":0,96="..get_shipping_container_texture(livery_id).."\\^\\[resize\\:216x32"
			end
		end

		-- Use a mesh that corresponds to the number of containers to be shown.
		local mesh_with_load = meshes.loaded1
		if occupied_slots > 1 then
			mesh_with_load = meshes.loaded2
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

-- ////////////////////////////////////////////////////////////////////////////////////

local meshes_industrial_wagon_container_type1 = {
		default = "dlxtrains_industrial_wagons_container_type1.obj",
		loaded1 = "dlxtrains_industrial_wagons_container_type1_loaded1.obj",
		loaded2 = "dlxtrains_industrial_wagons_container_type1_loaded2.obj",
		update_model = function(wagon, data, texture_file, meshes)
			return update_model_industrial_wagon_container(wagon, data, texture_file, meshes)
		end,
	}

local meshes_industrial_wagon_container_type2 = {
		default = "dlxtrains_industrial_wagons_container_type2.obj",
		loaded1 = "dlxtrains_industrial_wagons_container_type2_loaded.obj",
		update_model = function(wagon, data, texture_file, meshes)
			return update_model_industrial_wagon_container(wagon, data, texture_file, meshes)
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
		collisionbox = {-1.0,-0.5,-1.0,1.0,2.5,1.0},
		drops={"default:steelblock"},
		has_inventory = true,
		get_inventory_formspec = function(wagon, pname, invname)
			return "size[8,9]"..
				"box[0,0;.8,.88;#077]"..	-- Highlight slots that impact visible loads
				"box[0,2;.8,.88;#077]"..
				"list["..invname..";box;0,0;8,4;]"..
				"list[current_player;main;0,5;8,4;]"..
				"listring[]"
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
		collisionbox = {-1.0,-0.5,-1.0,1.0,2.5,1.0},
		drops={"default:steelblock"},
		has_inventory = true,
		get_inventory_formspec = function(wagon, pname, invname)
			return "size[8,9]"..
				"box[0,0;.8,.88;#077]"..	-- Highlight slots that impact visible loads
				"list["..invname..";box;0,0;8,2;]"..
				"list[current_player;main;0,5;8,4;]"..
				"listring[]"
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
		collisionbox = {-1.0,-0.5,-1.0,1.0,2.5,1.0},
		drops={"default:steelblock"},
		has_inventory = true,
		get_inventory_formspec = function(wagon, pname, invname)
			return "size[8,10]"..
				"list["..invname..";box;0,0;8,5;]"..
				"list[current_player;main;0,6;8,4;]"..
				"listring[]"
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
		collisionbox = {-1.0,-0.5,-1.0,1.0,2.5,1.0},
		drops={"default:steelblock"},
		has_inventory = true,
		get_inventory_formspec = function(wagon, pname, invname)
			return "size[8,10]"..
				"list["..invname..";box;0,0;8,5;]"..
				"list[current_player;main;0,6;8,4;]"..
				"listring[]"
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
		collisionbox = {-1.0,-0.5,-1.0,1.0,2.5,1.0},
		drops={"default:steelblock"},
		has_inventory = true,
		get_inventory_formspec = function(wagon, pname, invname)
			return "size[8,9]"..
				"list["..invname..";box;0,0;8,4;]"..
				"list[current_player;main;0,5;8,4;]"..
				"listring[]"
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
		collisionbox = {-1.0,-0.5,-1.0,1.0,2.5,1.0},
		drops={"default:steelblock"},
		has_inventory = true,
		get_inventory_formspec = function(wagon, pname, invname)
			return "size[8,8]"..
				"box[0,0;.8,.88;#077]"..	-- Highlight slots that impact visible loads
				"box[0,1;.8,.88;#077]"..
				"box[0,2;.8,.88;#077]"..
				"list["..invname..";box;0,0;8,3;]"..
				"list[current_player;main;0,4;8,4;]"..
				"listring[]"
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
		collisionbox = {-1.0,-0.5,-1.0,1.0,2.5,1.0},
		drops={"default:steelblock"},
		has_inventory = true,
		get_inventory_formspec = function(wagon, pname, invname)
			return "size[8,8]"..
				"box[0,0;.8,.88;#077]"..	-- Highlight slots that impact visible loads
				"list["..invname..";box;0,0;8,3;]"..
				"list[current_player;main;0,4;8,4;]"..
				"listring[]"
		end,
		inventory_list_sizes = {
			box=8*3,
		},
	}, S("North American Hopper Wagon"), "dlxtrains_industrial_wagons_hopper_type1_inv.png")
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
		collisionbox = {-1.0,-0.5,-1.0,1.0,2.5,1.0},
		drops={"default:steelblock"},
		has_inventory = true,
		get_inventory_formspec = function(wagon, pname, invname)
			return "size[8,8]"..
				"box[0,0;.8,.88;#077]"..	-- Highlight slots that impact visible loads
				"box[0,1;.8,.88;#077]"..
				"box[0,2;.8,.88;#077]"..
				"list["..invname..";box;0,0;8,3;]"..
				"list[current_player;main;0,4;8,4;]"..
				"listring[]"
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
		collisionbox = {-1.0,-0.5,-1.0,1.0,2.5,1.0},
		drops={"default:steelblock"},
		has_inventory = true,
		get_inventory_formspec = function(wagon, pname, invname)
			return "size[8,8]"..
				"box[0,0;.8,.88;#077]"..	-- Highlight slots that impact visible loads
				"box[0,1;.8,.88;#077]"..
				"box[0,2;.8,.88;#077]"..
				"list["..invname..";box;0,0;8,3;]"..
				"list[current_player;main;0,4;8,4;]"..
				"listring[]"
		end,
		inventory_list_sizes = {
			box=8*3,
		},
	}, S("Buffer/Knuckle Transition Wagon"), "dlxtrains_industrial_wagons_transition_type1_inv.png")
end

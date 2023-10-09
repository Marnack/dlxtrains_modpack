
local S = dlxtrains_diesel_locomotives.S
local use_attachment_patch = advtrains_attachment_offset_patch and advtrains_attachment_offset_patch.setup_advtrains_wagon

-- ////////////////////////////////////////////////////////////////////////////////////

local livery_type1_unit_number_info = {
		[0] = {	{x = 205, y = 117, spacing = 1, justify = 1, digit_width =  3, digit_height =  5, font_id = 1, color1 = "#848C8B", color2 = "#787B78"}, },
		[1] = {	{x = 133, y = 133, spacing = 5, justify = 0, digit_width =  9, digit_height = 14, font_id = 2, color1 = "#938731", color2 = "#948839"},
				{x = 281, y = 133, spacing = 5, justify = 2, digit_width =  9, digit_height = 14, font_id = 2, color1 = "#938731", color2 = "#948839"}, },
		[2] = {	{x = 356, y =  19, spacing = 1, justify = 2, digit_width =  3, digit_height =  5, font_id = 1, color1 = "#C3C3C3", color2 = "#B9B8B8"}, },
		[3] = {	{x = 205, y = 103, spacing = 1, justify = 1, digit_width =  3, digit_height =  5, font_id = 1, color1 = "#2A2A2A", color2 = "#474443"}, },
	}

local livery_type2_unit_number_info = {
		[0] = {	{x = 278, y =  80, spacing = 1, justify = 1, digit_width =  3, digit_height =  5, font_id = 1, color1 = "#C3C3C3", color2 = "#B9B8B8"},
				{x = 356, y =  80, spacing = 1, justify = 1, digit_width =  3, digit_height =  5, font_id = 1, color1 = "#C3C3C3", color2 = "#B9B8B8"}, },
		[1] = {	{x =  48, y = 114, spacing = 3, justify = 0, digit_width =  7, digit_height = 10, font_id = 3, color1 = "#938731", color2 = "#948839"},
				{x =  47, y =  59, spacing = 3, justify = 2, digit_width =  7, digit_height = 10, font_id = 3, color1 = "#938731", color2 = "#948839"}, },
		[2] = {	{x = 277, y =  83, spacing = 1, justify = 1, digit_width =  4, digit_height =  7, font_id = 5, color1 = "#C3C3C3", color2 = "#B9B8B8"},
				{x = 354, y =  83, spacing = 1, justify = 1, digit_width =  4, digit_height =  7, font_id = 5, color1 = "#C3C3C3", color2 = "#B9B8B8"}, },
		[3] = {	{x = 277, y =  81, spacing = 1, justify = 1, digit_width =  4, digit_height =  7, font_id = 5, color1 = "#C3C3C3", color2 = "#B9B8B8"},
				{x = 354, y =  81, spacing = 1, justify = 1, digit_width =  4, digit_height =  7, font_id = 5, color1 = "#C3C3C3", color2 = "#B9B8B8"}, },
	}

local livery_type3_unit_number_info = {
		[0] = {	{x = 192, y =  17, spacing = 1, justify = 2, digit_width =  3, digit_height =  5, font_id = 1, color1 = "#636363", color2 = "#595858"},
				{x = 248, y = 100, spacing = 1, justify = 0, digit_width =  2, digit_height =  2, font_id = 4, color1 = "#C3C3C3", color2 = "#B9B8B8"},
				{x = 295, y = 100, spacing = 1, justify = 0, digit_width =  2, digit_height =  2, font_id = 4, color1 = "#C3C3C3", color2 = "#B9B8B8"}, },
		[1] = {	{x =  83, y = 130, spacing = 1, justify = 1, digit_width =  3, digit_height =  5, font_id = 1, color1 = "#938731", color2 = "#9E913B"},
				{x = 126, y = 175, spacing = 1, justify = 1, digit_width =  3, digit_height =  5, font_id = 1, color1 = "#938731", color2 = "#9E913B"}, },
		[2] = {	{x =  83, y = 137, spacing = 1, justify = 1, digit_width =  3, digit_height =  5, font_id = 1, color1 = "#848C8B", color2 = "#787B78"},
				{x = 126, y = 182, spacing = 1, justify = 1, digit_width =  3, digit_height =  5, font_id = 1, color1 = "#848C8B", color2 = "#787B78"}, },
		[3] = {	{x = 192, y = 122, spacing = 1, justify = 1, digit_width =  3, digit_height =  5, font_id = 1, color1 = "#2A2A2A", color2 = "#474443"},
				{x = 192, y = 167, spacing = 1, justify = 1, digit_width =  3, digit_height =  5, font_id = 1, color1 = "#2A2A2A", color2 = "#474443"}, },
	}

local function GetDigitOverlay(livery_unit_number_info, x, d, alt_scheme)
	local digit_font_name = "dlxtrains_diesel_locomotives_font"..livery_unit_number_info.font_id.."_digit_"

	-- Colorize the digit based on the age appearance of the locomotive.
	local color = livery_unit_number_info.color1
	if alt_scheme then color = livery_unit_number_info.color2 end

	return ":"..x..","..livery_unit_number_info.y
			.."="..digit_font_name..d
			..".png\\^\\[resize\\:"
			..livery_unit_number_info.digit_width.."x"
			..livery_unit_number_info.digit_height
			.."\\^\\[colorize\\:"..color.."\\:255"
end

local function Get_unit_number_overlays(livery_unit_number_info, wagon_number, unit_number, alt_scheme)
	-- Assumes the given wagon_number is a string representation of a positive whole number, possibly
	-- with leading zeros, < 1000 and that unit_number is the integer value of that number.  Leading
	-- spaces will be converted into leading zeros.

	-- Determine value of each digit
	local d1 = math.floor(unit_number / 100)
	local d2 = math.floor((unit_number - (d1 * 100)) / 10)
	local d3 = math.floor(unit_number - (d1 * 100 + d2 * 10))

	local overlays = ""
	local digit_count = #wagon_number	-- Use length of wagon_number string to allow for leading zeros
	if digit_count > 3 then digit_count = 3 end
	for i, unit_number_info in pairs(livery_unit_number_info) do
		local increment = unit_number_info.digit_width + unit_number_info.spacing

		-- Determine the starting x position of the first digit overlay based on the value of
		-- unit_number_info.justify: 1 == Centered, 2 = Right justify, anything else == Left justify
		local pos_offset = 0
		if unit_number_info.justify == 1 then
			if digit_count == 1 then
				pos_offset = increment
			elseif digit_count == 2 then
				pos_offset = increment / 2
			end
		elseif unit_number_info.justify == 2 then
			if digit_count == 1 then
				pos_offset = increment * 2
			elseif digit_count == 2 then
				pos_offset = increment
			end
		end

		-- Calculate the x position of each digit
		local x1 = unit_number_info.x + pos_offset
		local x2 = x1 + increment
		local x3 = x2 + increment

		-- Get the digit overlays
		if digit_count == 3 then
			overlays = overlays
					 ..GetDigitOverlay(unit_number_info, x1, d1, alt_scheme)
					 ..GetDigitOverlay(unit_number_info, x2, d2, alt_scheme)
					 ..GetDigitOverlay(unit_number_info, x3, d3, alt_scheme)
		elseif digit_count == 2 then
			overlays = overlays
					 ..GetDigitOverlay(unit_number_info, x1, d2, alt_scheme)
					 ..GetDigitOverlay(unit_number_info, x2, d3, alt_scheme)
		else
			overlays = overlays
					 ..GetDigitOverlay(unit_number_info, x1, d3, alt_scheme)
		end
	end

	return overlays
end

local livery_scheme_diesel_locomotive_type1 = {
		filename_prefix = "dlxtrains_diesel_locomotives_locomotive_type1",
		[0]={code="wf"},
		[1]={code="t"},
		[2]={code="dz"},
		[3]={code="zr"},
		count = 4,
		on_update_texture = function(wagon, data, texture)
			local new_texture = texture
			if texture ~= nil then
				local overlays = nil

				-- Update lights
				local white_light = "dlxtrains_diesel_locomotives_white_light.png\\^\\[resize\\:10x10"
				local red_light = "dlxtrains_diesel_locomotives_red_light.png\\^\\[resize\\:10x10"
				if data.light_config == 1 then
					-- Short hood end of locomotive is moving forward
					overlays = (overlays or "")..":363,161="..white_light..":374,172="..red_light
				elseif data.light_config == 2 then
					-- Long hood end of locomotive is moving forward
					overlays = (overlays or "")..":374,161="..white_light..":363,172="..red_light
				end

				-- Update cooling fans
				if data.light_config == 1 or data.light_config == 2 then
					-- Show cooling fan in spinning state
					overlays = (overlays or "")..":270,85=".."dlxtrains_diesel_locomotives_spinning_fan.png\\^\\[resize\\:17x17"
				end

				-- Update unit number
				local wagon_number = data.roadnumber
				local unit_number = tonumber(wagon_number)
				if unit_number ~= nil and unit_number >= 0 and unit_number < 1000 and string.find(wagon_number, "[,%.]") == nil then
					overlays = (overlays or "")..Get_unit_number_overlays(livery_type1_unit_number_info[data.scheme_id or 0], wagon_number, unit_number, data.alt_scheme)
				end

				-- Update the texture if any overlays were created
				if overlays ~= nil then
					new_texture = "[combine:384x384:0,0=("..texture..")"..overlays
				end
			end
			return new_texture
		end,
	}

local livery_scheme_diesel_locomotive_type2 = {
		filename_prefix = "dlxtrains_diesel_locomotives_locomotive_type2",
		[0]={code="dlx"},
		[1]={code="t"},
		[2]={code="nr"},
		[3]={code="tt"},
		count = 4,
		on_update_texture = function(wagon, data, texture)
			local new_texture = texture
			if texture ~= nil then
				local overlays = nil

				-- Update lights
				local white_light = "dlxtrains_diesel_locomotives_white_light.png\\^\\[resize\\:10x10"
				local red_light = "dlxtrains_diesel_locomotives_red_light.png\\^\\[resize\\:10x10"
				if data.light_config == 1 or data.light_config == 2 then
					-- Turn on running lights
					overlays = (overlays or "")..":374,168="..white_light
				end

				-- Update unit number
				local wagon_number = data.roadnumber
				local unit_number = tonumber(wagon_number)
				if unit_number ~= nil and unit_number >= 0 and unit_number < 1000 and string.find(wagon_number, "[,%.]") == nil then
					overlays = (overlays or "")..Get_unit_number_overlays(livery_type2_unit_number_info[data.scheme_id or 0], wagon_number, unit_number, data.alt_scheme)
				end

				-- Update the texture if any overlays were created
				if overlays ~= nil then
					new_texture = "[combine:384x384:0,0=("..texture..")"..overlays
				end
			end
			return new_texture
		end,
	}

local livery_scheme_diesel_locomotive_type3 = {
		filename_prefix = "dlxtrains_diesel_locomotives_locomotive_type3",
		[0]={code="dz"},
		[1]={code="t"},
		[2]={code="wf"},
		[3]={code="zr"},
		count = 4,
		on_update_texture = function(wagon, data, texture)
			local new_texture = texture
			if texture ~= nil then
				local overlays = nil

				-- Update lights
				local white_light = "dlxtrains_diesel_locomotives_white_light.png\\^\\[resize\\:10x10"
				local red_light = "dlxtrains_diesel_locomotives_red_light.png\\^\\[resize\\:10x10"
				if data.light_config == 1 then
					-- Cab1 end of locomotive is moving forward
					overlays = (overlays or "")..":363,161="..white_light..":374,172="..red_light
				elseif data.light_config == 2 then
					-- Cab2 end of locomotive is moving forward
					overlays = (overlays or "")..":374,161="..white_light..":363,172="..red_light
				end

				-- Update cooling fans
				if data.light_config == 1 or data.light_config == 2 then
					-- Show cooling fan in spinning state
					overlays = (overlays or "")..":345,174=".."dlxtrains_diesel_locomotives_spinning_fan.png\\^\\[resize\\:17x17"
				end

				-- Update unit number
				local wagon_number = data.roadnumber
				local unit_number = tonumber(wagon_number)
				if unit_number ~= nil and unit_number >= 0 and unit_number < 1000 and string.find(wagon_number, "[,%.]") == nil then
					overlays = (overlays or "")..Get_unit_number_overlays(livery_type3_unit_number_info[data.scheme_id or 0], wagon_number, unit_number, data.alt_scheme)
				end

				-- Update the texture if any overlays were created
				if overlays ~= nil then
					new_texture = "[combine:384x384:0,0=("..texture..")"..overlays
				end
			end
			return new_texture
		end,
	}

-- ////////////////////////////////////////////////////////////////////////////////////

local meshes_diesel_locomotive_type1 = {
		default = "dlxtrains_diesel_locomotives_locomotive_type1.b3d",
		chimneys = {
			{x=0.27, y=2.4, z=0.60}
		},
		audio_loop_name = "dlxtrains_diesel_locomotives_locomotive_type1_loop",
		audio_loop_gain = .3
	}

local meshes_diesel_locomotive_type2 = {
		default = "dlxtrains_diesel_locomotives_locomotive_type2.b3d",
		chimneys = {
			{x=0.0, y=2.4, z= 0.90},
			{x=0.0, y=2.4, z=-0.30}
		},
		audio_loop_name = "dlxtrains_diesel_locomotives_locomotive_type1_loop",	-- Using locomotive_type1 audio for now.
		audio_loop_gain = .3
	}

local meshes_diesel_locomotive_type3 = {
		default = "dlxtrains_diesel_locomotives_locomotive_type3.b3d",
		chimneys = {
			{x=-0.29, y=2.6, z=1.80, type="left"},
			{x= 0.29, y=2.6, z=1.80, type="right"}
		},
		audio_loop_name = "dlxtrains_diesel_locomotives_locomotive_type1_loop",	-- Using locomotive_type1 audio for now.
		audio_loop_gain = .3
	}

-- ////////////////////////////////////////////////////////////////////////////////////

local function Get_diesel_smoke_particle_def(type)
	local index = type or "default"
	local burst_defs = {
			default = {
				amount = 10,
				time = 0,
				minvel = {x=-0.2, y=1.8, z=-0.2},
				maxvel = {x=0.2, y=2, z=0.2},
				minacc = {x=0, y=-0.1, z=0},
				maxacc = {x=0, y=-0.3, z=0},
				minexptime = 2,
				maxexptime = 4,
				minsize = 1,
				maxsize = 5,
				collisiondetection = true,
				vertical = false,
				texture = "dlxtrains_diesel_locomotives_smoke_puff.png",
			},
			left = {
				amount = 10,
				time = 0,
				minvel = {x=-0.8, y=1.8, z=-0.2},
				maxvel = {x=-1.2, y=2, z=0.2},
				minacc = {x=0.3, y=-0.3, z=0},
				maxacc = {x=0.1, y=-0.1, z=0},
				minexptime = 2,
				maxexptime = 4,
				minsize = 1,
				maxsize = 5,
				collisiondetection = true,
				vertical = false,
				texture = "dlxtrains_diesel_locomotives_smoke_puff.png",
			},
			right = {
				amount = 10,
				time = 0,
				minvel = {x=0.8, y=1.8, z=-0.2},
				maxvel = {x=1.2, y=2, z=0.2},
				minacc = {x=-0.3, y=-0.3, z=0},
				maxacc = {x=-0.1, y=-0.1, z=0},
				minexptime = 2,
				maxexptime = 4,
				minsize = 1,
				maxsize = 5,
				collisiondetection = true,
				vertical = false,
				texture = "dlxtrains_diesel_locomotives_smoke_puff.png",
			},
		}
	return burst_defs[index]
end

local function Terminate_locomotive_sound(wagon)
	if wagon.sound_loop_handle then
		minetest.sound_stop(wagon.sound_loop_handle)
		wagon.sound_loop_handle = nil
	end
	wagon.sound_loop_tmr = nil
	wagon.sound_loop_idx = nil
end

local function Update_locomotive_sound(wagon, time_expired, audio_loop_name, audio_loop_gain)
	local locomotive_sound_idx = 7
	if dlxtrains.locomotive_sounds == 2 then
		if wagon:train().velocity < 20 then
			locomotive_sound_idx = math.floor(wagon:train().velocity/2)
		else
			locomotive_sound_idx = 9
		end
	end
	if time_expired or locomotive_sound_idx ~= wagon.sound_loop_idx then
		Terminate_locomotive_sound(wagon)
		wagon.sound_loop_idx = locomotive_sound_idx
		wagon.sound_loop_handle = minetest.sound_play({name=audio_loop_name..locomotive_sound_idx, gain=audio_loop_gain}, {object=wagon.object})
		wagon.sound_loop_tmr = 3.0 -- This is slightly shorter than the audio clip in order to minimize audio dropouts if there is some system lag. (i.e. the sound will keep playing briefly after the timer has expired while this function is yet to be called)
	end
end

local function Update_locomotive_smoke(data, wagon, chimneys, old_velocity, new_velocity)
	if dlxtrains.locomotive_smoke > 0 and chimneys ~= nil then
		-- If dynamic smoke is enabled, add extra smoke puffs when accelerating
		if dlxtrains.locomotive_smoke == 2 and new_velocity > old_velocity then
			local dynamic_amount = 4 - new_velocity
			if #chimneys > 1 then dynamic_amount = dynamic_amount/#chimneys end
			if dynamic_amount < 1 then dynamic_amount = 1 end
			for _, chimney_pos in pairs(chimneys) do
				local smoke_def = Get_diesel_smoke_particle_def(chimney_pos.type)
				smoke_def.time = 1					-- Automatically end after a unit of time.
				smoke_def.amount = dynamic_amount
				smoke_def.minpos = chimney_pos
				smoke_def.maxpos = chimney_pos
				smoke_def.attached = wagon.object
				minetest.add_particlespawner(smoke_def)
			end
		end

		-- Compute the amount of smoke based on velocity and length of train. (This will be used later if dynamic smoke is enabled)
		local dynamic_amount = new_velocity + #(wagon:train().trainparts) - 1
		if #chimneys > 1 then dynamic_amount = dynamic_amount/#chimneys end
		if dynamic_amount < 1 then
			dynamic_amount = 1
		elseif dynamic_amount > 12 then
			dynamic_amount = 12
		end

		data.particle_spawner_ids = {}
		for _, chimney_pos in pairs(chimneys) do
			local smoke_def = Get_diesel_smoke_particle_def(chimney_pos.type)
			if dlxtrains.locomotive_smoke == 2 then
				-- If dynamic smoke is enabled, define smoke stream based on velocity and length of train
				smoke_def.amount = dynamic_amount
			else
				if #chimneys > 1 then
					smoke_def.amount = smoke_def.amount/#chimneys
					if smoke_def.amount < 1 then
						smoke_def.amount = 1
					end
				end	
			end
			smoke_def.minpos = chimney_pos
			smoke_def.maxpos = chimney_pos
			smoke_def.attached = wagon.object
			table.insert(data.particle_spawner_ids, minetest.add_particlespawner(smoke_def))
		end
	end
end

-- ////////////////////////////////////////////////////////////////////////////////////

if dlxtrains_diesel_locomotives.max_wagon_length >= 7.35 then
	local wagon_def = {
		mesh = meshes_diesel_locomotive_type1.default,
		textures = {"dlxtrains_diesel_locomotives_type1.png"},
		set_textures = function(wagon, data)
			dlxtrains.set_textures_for_livery_scheme(wagon, data, livery_scheme_diesel_locomotive_type1, meshes_diesel_locomotive_type1)
		end,
		custom_may_destroy = function(wagon, puncher, time_from_last_punch, tool_capabilities, direction)
			return not dlxtrains.update_livery(wagon, puncher, livery_scheme_diesel_locomotive_type1)
		end,
		seats = {
			{
				name = "Driver Stand",
				attach_offset={x=2.8, y=2.8, z=12},
				view_offset = use_attachment_patch and {x=0, y=0, z=0} or {x=0, y=3.6, z=0},
				driving_ctrl_access = true,
				group = "cabin",
			}
		},
		seat_groups = {
			cabin={
				name = "Cabin",
				access_to = {},
				require_doors_open = false,
				driving_ctrl_access = true,
			},
		},
		assign_to_seat_group = {"cabin"},
		drives_on={default=true},
		max_speed=25,
		visual_size = {x=1, y=1},
		wagon_span=3.675,
		wheel_positions = {1.8, -1.8},
		is_locomotive=true,
		collisionbox = {-0.5,-0.5,-0.5,0.5,2.5,0.5},
		coupler_types_front = {chain=true},
		coupler_types_back = {chain=true},
		drops={"default:steelblock 2"},
		horn_sound = "advtrains_industrial_horn",
		has_inventory = false,
		custom_on_step=function(wagon, dtime)
			if dlxtrains.locomotive_sounds > 0 and wagon:train().velocity > 0 then
				if not wagon.sound_loop_tmr or wagon.sound_loop_tmr <= 0 then
					Update_locomotive_sound(wagon, true, meshes_diesel_locomotive_type1.audio_loop_name, meshes_diesel_locomotive_type1.audio_loop_gain)
				end
				wagon.sound_loop_tmr = wagon.sound_loop_tmr - dtime
			else
				Terminate_locomotive_sound(wagon)
			end
		end,
		custom_on_velocity_change = function(wagon, velocity, old_velocity)
			if velocity ~= old_velocity then
				local data = advtrains.wagons[wagon.id]
				local light_config = data.light_config

				-- Keep the following for legacy locomotives (Remove after 2023?)
				if data.particle_spawner_id ~= nil then
					minetest.delete_particlespawner(data.particle_spawner_id)
					data.particle_spawner_id = nil
				end 

				if data.particle_spawner_ids ~= nil then
					for _, particle_spawner_id in ipairs(data.particle_spawner_ids) do
						if particle_spawner_id ~= nil then
							minetest.delete_particlespawner(particle_spawner_id)
						end
					end
					data.particle_spawner_ids = nil
				end

				if velocity > 0 then
					-- Set light configuration based on direction of travel
					light_config = 1
					if data.wagon_flipped then
						light_config = 2
					end

					Update_locomotive_smoke(data, wagon, meshes_diesel_locomotive_type1.chimneys, old_velocity, velocity)
				else
					light_config = 0
				end
				if light_config ~= data.light_config then
					data.light_config = light_config
					wagon:set_textures(data)
				end

				if dlxtrains.locomotive_sounds == 2 then
					Update_locomotive_sound(wagon, false, meshes_diesel_locomotive_type1.audio_loop_name, meshes_diesel_locomotive_type1.audio_loop_gain)
				end
			end
		end,
	}

	if use_attachment_patch then
		advtrains_attachment_offset_patch.setup_advtrains_wagon(wagon_def);
	end

	advtrains.register_wagon("dlxtrains_diesel_locomotives:locomotive_type1", wagon_def, S("European G1206 Diesel Locomotive"), "dlxtrains_diesel_locomotives_locomotive_type1_inv.png")
end

if dlxtrains_diesel_locomotives.max_wagon_length >= 6.80725 then
	local wagon_def = {
		mesh = meshes_diesel_locomotive_type2.default,
		textures = {"dlxtrains_diesel_locomotives_type2.png"},
		set_textures = function(wagon, data)
			dlxtrains.set_textures_for_livery_scheme(wagon, data, livery_scheme_diesel_locomotive_type2, meshes_diesel_locomotive_type2)
		end,
		custom_may_destroy = function(wagon, puncher, time_from_last_punch, tool_capabilities, direction)
			return not dlxtrains.update_livery(wagon, puncher, livery_scheme_diesel_locomotive_type2)
		end,
		seats = {
			{
				name = "Driver Stand",
				attach_offset={x=3.6, y=4.2, z=-21.2},
				view_offset = use_attachment_patch and {x=0, y=0, z=0} or {x=1.3, y=6.5, z=0},
				driving_ctrl_access = true,
				group = "cabin",
			}
		},
		seat_groups = {
			cabin={
				name = "Cabin",
				access_to = {},
				require_doors_open = false,
				driving_ctrl_access = true,
			},
		},
		assign_to_seat_group = {"cabin"},
		drives_on={default=true},
		max_speed=25,
		visual_size = {x=1, y=1},
		wagon_span=3.403625,
		wheel_positions = {1.5625, -1.5625},
		is_locomotive=true,
		collisionbox = {-0.5,-0.5,-0.5,0.5,2.5,0.5},
		coupler_types_front = {knuckle=true},
		coupler_types_back = {knuckle=true},
		drops={"default:steelblock 2"},
		horn_sound = "advtrains_industrial_horn",
		has_inventory = false,
		custom_on_step=function(wagon, dtime)
			if dlxtrains.locomotive_sounds > 0 and wagon:train().velocity > 0 then
				if not wagon.sound_loop_tmr or wagon.sound_loop_tmr <= 0 then
					Update_locomotive_sound(wagon, true, meshes_diesel_locomotive_type1.audio_loop_name, meshes_diesel_locomotive_type1.audio_loop_gain) -- Using locomotive_type1 audio for now.
				end
				wagon.sound_loop_tmr = wagon.sound_loop_tmr - dtime
			else
				Terminate_locomotive_sound(wagon)
			end
		end,
		custom_on_velocity_change = function(wagon, velocity, old_velocity)
			if velocity ~= old_velocity then
				local data = advtrains.wagons[wagon.id]
				local light_config = data.light_config

				if data.particle_spawner_ids ~= nil then
					for _, particle_spawner_id in ipairs(data.particle_spawner_ids) do
						if particle_spawner_id ~= nil then
							minetest.delete_particlespawner(particle_spawner_id)
						end
					end
					data.particle_spawner_ids = nil
				end

				if velocity > 0 then
					-- Set light configuration based on direction of travel
					light_config = 1
					if data.wagon_flipped then
						light_config = 2
					end

					Update_locomotive_smoke(data, wagon, meshes_diesel_locomotive_type2.chimneys, old_velocity, velocity)
				else
					light_config = 0
				end
				if light_config ~= data.light_config then
					data.light_config = light_config
					wagon:set_textures(data)
				end

				if dlxtrains.locomotive_sounds == 2 then
					Update_locomotive_sound(wagon, false, meshes_diesel_locomotive_type1.audio_loop_name, meshes_diesel_locomotive_type1.audio_loop_gain) -- Using locomotive_type1 audio for now.
				end
			end
		end,
	}

	if use_attachment_patch then
		advtrains_attachment_offset_patch.setup_advtrains_wagon(wagon_def);
	end

	advtrains.register_wagon("dlxtrains_diesel_locomotives:locomotive_type2", wagon_def, S("North American SW1500 Diesel Locomotive"), "dlxtrains_diesel_locomotives_locomotive_type2_inv.png")

end

if dlxtrains_diesel_locomotives.max_wagon_length >= 8.2 then
	local wagon_def = {
		mesh = meshes_diesel_locomotive_type3.default,
		textures = {"dlxtrains_diesel_locomotives_type3.png"},
		set_textures = function(wagon, data)
			dlxtrains.set_textures_for_livery_scheme(wagon, data, livery_scheme_diesel_locomotive_type3, meshes_diesel_locomotive_type3)
		end,
		custom_may_destroy = function(wagon, puncher, time_from_last_punch, tool_capabilities, direction)
			return not dlxtrains.update_livery(wagon, puncher, livery_scheme_diesel_locomotive_type3)
		end,
		seats = {
			{
				name = "Cab 1 Driver Stand",
				attach_offset={x=2.8, y=2.8, z=30},
				view_offset = use_attachment_patch and {x=0, y=0, z=0} or {x=0, y=9.65, z=0},
				driving_ctrl_access = true,
				group = "cab_1",
			},
			{
				name = "Cab 2 Driver Stand",
				attach_offset={x=-2.8, y=2.8, z=-30},
				view_offset = use_attachment_patch and {x=0, y=0, z=0} or {x=0, y=9.65, z=0},
				advtrains_attachment_offset_patch_attach_rotation = {x=0, y=180, z=0},
				driving_ctrl_access = true,
				group = "cab_2",
			}
		},
		seat_groups = {
			cab_1={
				name = "Cab 1",
				access_to = {"cab_2"},
				require_doors_open = false,
				driving_ctrl_access = true,
			},
			cab_2={
				name = "Cab 2",
				access_to = {"cab_1"},
				require_doors_open = false,
				driving_ctrl_access = true,
			},
		},
		assign_to_seat_group = {"cab_1"},
		drives_on={default=true},
		max_speed=25,
		visual_size = {x=1, y=1},
		wagon_span=4.1,
		wheel_positions = {1.8, -1.8},
		is_locomotive=true,
		collisionbox = {-0.5,-0.5,-0.5,0.5,2.5,0.5},
		coupler_types_front = {chain=true},
		coupler_types_back = {chain=true},
		drops={"default:steelblock 2"},
		horn_sound = "advtrains_industrial_horn",
		has_inventory = false,
		custom_on_step=function(wagon, dtime)
			if dlxtrains.locomotive_sounds > 0 and wagon:train().velocity > 0 then
				if not wagon.sound_loop_tmr or wagon.sound_loop_tmr <= 0 then
					Update_locomotive_sound(wagon, true, meshes_diesel_locomotive_type1.audio_loop_name, meshes_diesel_locomotive_type1.audio_loop_gain)
				end
				wagon.sound_loop_tmr = wagon.sound_loop_tmr - dtime
			else
				Terminate_locomotive_sound(wagon)
			end
		end,
		custom_on_velocity_change = function(wagon, velocity, old_velocity)
			if velocity ~= old_velocity then
				local data = advtrains.wagons[wagon.id]
				local light_config = data.light_config

				if data.particle_spawner_ids ~= nil then
					for _, particle_spawner_id in ipairs(data.particle_spawner_ids) do
						if particle_spawner_id ~= nil then
							minetest.delete_particlespawner(particle_spawner_id)
						end
					end
					data.particle_spawner_ids = nil
				end

				if velocity > 0 then
					-- Set light configuration based on direction of travel
					light_config = 1
					if data.wagon_flipped then
						light_config = 2
					end

					Update_locomotive_smoke(data, wagon, meshes_diesel_locomotive_type3.chimneys, old_velocity, velocity)
				else
					light_config = 0
				end
				if light_config ~= data.light_config then
					data.light_config = light_config
					wagon:set_textures(data)
				end

				if dlxtrains.locomotive_sounds == 2 then
					Update_locomotive_sound(wagon, false, meshes_diesel_locomotive_type3.audio_loop_name, meshes_diesel_locomotive_type3.audio_loop_gain)
				end
			end
		end,
	}

	if use_attachment_patch then
		advtrains_attachment_offset_patch.setup_advtrains_wagon(wagon_def);
	end

	advtrains.register_wagon("dlxtrains_diesel_locomotives:locomotive_type3", wagon_def, S("European BR218 Diesel Locomotive"), "dlxtrains_diesel_locomotives_locomotive_type3_inv.png")

end

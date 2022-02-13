
local S = dlxtrains_diesel_locomotives.S

-- ////////////////////////////////////////////////////////////////////////////////////

local livery_scheme_diesel_locomotive_type1 = {
		[0]="dlxtrains_diesel_locomotives_locomotive_type1_green1.png",
		[1]="dlxtrains_diesel_locomotives_locomotive_type1_brown1.png",
		[2]="dlxtrains_diesel_locomotives_locomotive_type1_red1.png",
		[3]="dlxtrains_diesel_locomotives_locomotive_type1_yellow1.png",
		count = 4,
		on_update_texture = function(wagon, data, texture)
			local new_texture = texture
			if texture ~= nil then
				local white_light = "dlxtrains_diesel_locomotives_white_light.png\\^\\[resize\\:10x10"
				local red_light = "dlxtrains_diesel_locomotives_red_light.png\\^\\[resize\\:10x10"
				if data.light_config == 1 then
					-- Short hood end of locomotive is moving forward
					new_texture = "[combine:384x384:0,0=("..texture.."):363,161="..white_light..":374,172="..red_light
				elseif data.light_config == 2 then
					-- Long hood end of locomotive is moving forward
					new_texture = "[combine:384x384:0,0=("..texture.."):374,161="..white_light..":363,172="..red_light
				end
				if data.light_config == 1 or data.light_config == 2 then
					-- Show cooling fan in spinning state
					new_texture = new_texture..":270,85=".."dlxtrains_diesel_locomotives_spinning_fan.png\\^\\[resize\\:17x17"
				end
			end
			return new_texture
		end,
	}

-- ////////////////////////////////////////////////////////////////////////////////////

local meshes_diesel_locomotive_type1 = {
		default = "dlxtrains_diesel_locomotives_locomotive_type1.b3d",
		smoke_pos = {x=0.27, y=2.4, z=0.60},
		audio_loop_name = "dlxtrains_diesel_locomotives_locomotive_type1_loop",
		audio_loop_gain = .3
	}

-- ////////////////////////////////////////////////////////////////////////////////////

local function Get_diesel_smoke_particle_burst_def()
	return {
		amount = 10,
		time = 1,
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
	}
end

local function Get_diesel_smoke_particle_stream_def()
	return {
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
	}
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

local function Update_locomotive_smoke(data, wagon, smoke_pos, old_velocity, new_velocity)
	if dlxtrains.locomotive_smoke > 0 then
		-- If dynamic smoke is enabled, add extra smoke puffs when accelerating
		if dlxtrains.locomotive_smoke == 2 and new_velocity > old_velocity then
			local smoke_def = Get_diesel_smoke_particle_burst_def()
			smoke_def.amount = 4 - new_velocity
			if smoke_def.amount < 1 then smoke_def.amount = 1 end
			smoke_def.minpos = smoke_pos
			smoke_def.maxpos = smoke_pos
			smoke_def.attached = wagon.object
			minetest.add_particlespawner(smoke_def)
		end

		local smoke_def = Get_diesel_smoke_particle_stream_def()
		if dlxtrains.locomotive_smoke == 2 then
			-- If dynamic smoke is enabled, define smoke stream based on velocity and length of train
			smoke_def.amount = new_velocity + #(wagon:train().trainparts) - 1
			if smoke_def.amount < 1 then
				smoke_def.amount = 1
			elseif smoke_def.amount > 12 then
				smoke_def.amount = 12
			end
		end
		smoke_def.minpos = smoke_pos
		smoke_def.maxpos = smoke_pos
		smoke_def.attached = wagon.object
		data.particle_spawner_id = minetest.add_particlespawner(smoke_def)
	end
end

-- ////////////////////////////////////////////////////////////////////////////////////

if dlxtrains_diesel_locomotives.max_wagon_length >= 7.35 then
	advtrains.register_wagon("dlxtrains_diesel_locomotives:locomotive_type1", {
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
				view_offset={x=0, y=3.6, z=0},
				driving_ctrl_access = true,
				group = "cabin",
			},
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
		is_locomotive=true,
		collisionbox = {-0.5,-0.5,-0.5,0.5,2.5,0.5},
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

				if data.particle_spawner_id ~= nil then
					minetest.delete_particlespawner(data.particle_spawner_id)
					data.particle_spawner_id = nil
				end 

				if velocity > 0 then
					-- Set light configuration based on direction of travel
					light_config = 1
					if data.wagon_flipped then
						light_config = 2
					end

					Update_locomotive_smoke(data, wagon, meshes_diesel_locomotive_type1.smoke_pos, old_velocity, velocity)
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
	}, S("European G1206 Diesel Locomotive"), "dlxtrains_diesel_locomotives_locomotive_type1_inv.png")
end

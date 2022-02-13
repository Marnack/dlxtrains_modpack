
local S = dlxtrains_support_wagons.S

-- ////////////////////////////////////////////////////////////////////////////////////

local livery_scheme_support_wagon_caboose_type1 = {
		[0]="dlxtrains_support_wagons_caboose_type1_brown.png",
		[1]="dlxtrains_support_wagons_caboose_type1_red1.png",
		[2]="dlxtrains_support_wagons_caboose_type1_red2.png",
		count = 3,
	}

local livery_scheme_support_wagon_escort_type1 = {
		[0]="dlxtrains_support_wagons_escort_type1_green.png",
		[1]="dlxtrains_support_wagons_escort_type1_brown.png",
		[2]="dlxtrains_support_wagons_escort_type1_red.png",
		count = 3,
	}

-- ////////////////////////////////////////////////////////////////////////////////////

local meshes_support_wagon_caboose_type1 = {
		default = "dlxtrains_support_wagons_caboose_type1.obj",
	}

local meshes_support_wagon_escort_type1 = {
		default = "dlxtrains_support_wagons_escort_type1.obj",
	}

-- ////////////////////////////////////////////////////////////////////////////////////

if dlxtrains_support_wagons.max_wagon_length >= 6 then
	advtrains.register_wagon("dlxtrains_support_wagons:caboose_type1", {
		mesh = meshes_support_wagon_caboose_type1.default,
		textures = {"dlxtrains_support_wagon_caboose_type1.png"},
		set_textures = function(wagon, data)
			dlxtrains.set_textures_for_livery_scheme(wagon, data, livery_scheme_support_wagon_caboose_type1, meshes_support_wagon_caboose_type1)
		end,
		custom_may_destroy = function(wagon, puncher, time_from_last_punch, tool_capabilities, direction)
			return not dlxtrains.update_livery(wagon, puncher, livery_scheme_support_wagon_caboose_type1)
		end,
		drives_on={default=true},
		seats = {
			{
				name = "Left seat in cabin",
				attach_offset = {x=-3.5, y=-2, z=-19.5},
				view_offset = {x=0, y=-3, z=0},
				group = "cabin",
			},
			{
				name = "Right seat in cabin",
				attach_offset = {x=3.5, y=-2, z=-19.5},
				view_offset = {x=0, y=-3, z=0},
				group = "cabin",
			},
			{
				name = "Left seat in Cupola",
				attach_offset = {x=-3.8, y=6, z=-2},
				view_offset = {x=-3.9, y=7, z=-1.5},
				group = "cupola",
			},
			{
				name = "Right seat in Cupola",
				attach_offset = {x=3.8, y=6, z=-2},
				view_offset = {x=3.9, y=7, z=-1.5},
				group = "cupola",
			},
		},
		seat_groups = {
			cabin={
				name = "Cabin",
				access_to = {"cupola"},
				require_doors_open = false,
			},
			cupola={
				name = "Cupola",
				access_to = {"cabin"},
				require_doors_open = false,
			},
		},
		assign_to_seat_group = {"cabin", "cupola"},
		max_speed=25,
		visual_size = {x=1, y=1},
		wagon_span=3,
		wheel_positions = {1.625, -1.625},
		collisionbox = {-1.0,-0.5,-1.0,1.0,2.5,1.0},
		coupler_types_front = {knuckle=true},
		coupler_types_back = {knuckle=true},
		drops={"default:steelblock"},
		has_inventory = false,
	}, S("Wooden Caboose with Cupola"), "dlxtrains_support_wagons_caboose_type1_inv.png")
end

if dlxtrains_support_wagons.max_wagon_length >= 4.875 then
	advtrains.register_wagon("dlxtrains_support_wagons:escort_type1", {
		mesh = meshes_support_wagon_escort_type1.default,
		textures = {"dlxtrains_support_wagon_escort_type1.png"},
		set_textures = function(wagon, data)
			dlxtrains.set_textures_for_livery_scheme(wagon, data, livery_scheme_support_wagon_escort_type1, meshes_support_wagon_escort_type1)
		end,
		custom_may_destroy = function(wagon, puncher, time_from_last_punch, tool_capabilities, direction)
			return not dlxtrains.update_livery(wagon, puncher, livery_scheme_support_wagon_escort_type1)
		end,
		seats = {
			{
				name = "Rear right seat in cabin",
				attach_offset = {x=3.2, y=-2, z=-5.6},
				view_offset = {x=0, y=-3, z=0},
				group = "cabin",
			},
			{
				name = "Front left seat in cabin",
				attach_offset = {x=-3.2, y=-2, z=4},
				view_offset = {x=0, y=-3, z=0},
				group = "cabin",
			},
			{
				name = "On propane cabinet on veranda",
				attach_offset = {x=-2.6, y=-2, z=-13},
				view_offset = {x=2.6, y=-3, z=13},
				group = "veranda",
			},
		},
		seat_groups = {
			cabin={
				name = "Cabin",
				access_to = {"veranda"},
				require_doors_open = false,
			},
			veranda={
				name = "Veranda",
				access_to = {"cabin"},
				require_doors_open = false,
			},
		},
		assign_to_seat_group = {"cabin", "veranda"},
		drives_on={default=true},
		max_speed=20,
		visual_size = {x=1, y=1},
		wagon_span=2.4375,
		wheel_positions = {1.2, -1.2},
		collisionbox = {-1.4,-0.5,-1.4,1.4,2.5,1.4},
		coupler_types_front = {chain=true},
		coupler_types_back = {chain=true},
		drops={"default:steelblock"},
		has_inventory = false,
	}, S("European Escort Wagon"), "dlxtrains_support_wagons_escort_type1_inv.png")
end



local S = dlxtrains.S

-- ////////////////////////////////////////////////////////////////////////////////////

local function get_config_random_livery()
	local use_random_livery = minetest.settings:get_bool("dlxtrains_random_liveries")
	if use_random_livery == nil then use_random_livery = true end
	return use_random_livery
end

local function get_config_default_age_appearance()
	local default_age_appearance_enum = minetest.settings:get("dlxtrains_default_age_appearance") or "Random"
	return ({["New"]=0, ["Random"]=1, ["Used"]=2})[default_age_appearance_enum]
end

function dlxtrains.make_safe_string(str)
	return str:gsub("[%[%()^:]", "\\%1")
end

function dlxtrains.set_textures_for_livery_scheme(wagon, data, livery_schemes, meshes)
	local livery_count = livery_schemes.count or 0

	if livery_count > 0 then
		-- Use wagon.id as a pseudo random number.
		local rnd = wagon.id or 0

		if data.alt_scheme == nil then
			local default_age_appearance = get_config_default_age_appearance()
			if default_age_appearance == 1 then
				data.alt_scheme = rnd%2 > 0
			elseif default_age_appearance == 2 then
				data.alt_scheme = true	
			end
		end

		if data.scheme_id == nil and get_config_random_livery() then
			data.scheme_id = math.floor(rnd/10)%livery_count
			wagon:set_textures(data)
		end
	end

	local texture = livery_schemes[data.scheme_id or 0]
	if data.alt_scheme then
		texture = texture.."^[transformR180"
	end

	-- Modify texture (and possibly the model/mesh) for wagons that could have visible loads
	if meshes and meshes.update_model then
		texture = meshes.update_model(wagon, data, texture, meshes)
	end

	wagon.object:set_properties({
		textures={texture}
	})
end

function dlxtrains.update_livery(wagon, puncher, livery_schemes)
	local itemstack = puncher:get_wielded_item()
	local item_name = itemstack:get_name()
	if item_name == "dlxtrains:wagon_updater" or item_name == "dlxtrains:age_selector" or item_name == "dlxtrains:livery_selector" then
		local livery_count = livery_schemes.count or 0
		if livery_count > 0 then
			local data = advtrains.wagons[wagon.id]

			if item_name == "dlxtrains:wagon_updater" then
				minetest.sound_play("dlxtrains_wagon_updater_tool", {object = wagon.object, gain = 0.6, max_hear_distance = 11})
			else
				local alt_scheme = data.alt_scheme or false
				local scheme_id = data.scheme_id or 0

				if item_name == "dlxtrains:age_selector" then
					data.alt_scheme = not alt_scheme;
					minetest.sound_play("dlxtrains_age_selection_tool", {object = wagon.object, gain = 0.8, max_hear_distance = 11})
				elseif livery_count > 1 then
					local pc = puncher:get_player_control()
					local reverse = pc.sneak
					local increment = 1
					if pc.sneak then
						increment = -1
					end
					data.scheme_id = (scheme_id + increment)%livery_count
					minetest.sound_play("dlxtrains_livery_selection_tool", {object = wagon.object, gain = 0.6, max_hear_distance = 11})
				end
			end
			wagon:set_textures(data)

			return true
		end
	end

	return false
end

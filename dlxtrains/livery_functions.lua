local S = dlxtrains.S

local registered_livery_templates = {}

local function get_config_random_livery()
	local use_random_livery = minetest.settings:get_bool("dlxtrains_random_liveries")
	if use_random_livery == nil then use_random_livery = true end
	return use_random_livery
end

local function get_config_default_age_appearance()
	local default_age_appearance_enum = minetest.settings:get("dlxtrains_default_age_appearance") or "Random"
	return ({["New"]=0, ["Random"]=1, ["Used"]=2})[default_age_appearance_enum]
end

local function is_valid_wagon(wagon)
	return wagon and wagon.id and advtrains.wagons[wagon.id] and advtrains.wagons[wagon.id].type
end

local function play_tool_sound(tool_sound, wagon)
	minetest.sound_play(tool_sound, {object = wagon.object, gain = 0.06, max_hear_distance = 11})
end

local function notify_puncher(puncher, wagon, message)
	minetest.sound_play("dlxtrains_notification", {object = wagon.object, gain = 0.06, max_hear_distance = 11})
	minetest.chat_send_player(puncher:get_player_name(), message);
end

function dlxtrains.add_modifier_escaping(str)
	return string.gsub(str, ".", {["\\"] = "\\\\", ["^"] = "\\^", [":"] = "\\:"})
end

function dlxtrains.remove_modifier_escaping(str)
	local new_str = str
	new_str = string.gsub(new_str, "\\:", ":")
	new_str = string.gsub(new_str, "\\^", "^")
	new_str = string.gsub(new_str, "\\\\", "\\")
	return new_str
end

function dlxtrains.get_init_texture()
	return "dlxtrains_none"
end

-- Define livery types for DlxTrains based on an approximate scale relative to the age
-- of the fictional company.  These are intentionally vague and do not correspond to
-- specific years or common train eras/epochs. Thus, the early era for one company
-- might not align with the early area of another.
dlxtrains.livery_type = {
	standard	= 1,	-- This is the default/latest livery for the fictional company.
	middle_era	= 2,	-- If used, this represents some time between early era and standard.
	early_era	= 3,	-- The livery used in the earliest days of the fictional company.
}

function dlxtrains.init_livery_template(wagon_mod, scheme_id, livery_type, company_abbr, wagon_texture_suffix)
	local livery_template = {
		scheme_id = scheme_id,
		base_texture = wagon_mod.."_"..wagon_texture_suffix..".png",
	}

	if livery_type == dlxtrains.livery_type.early_era then
		livery_template.name = S("@1 Early Era", company_abbr)
		livery_template.notes = S("This is an old livery used by the fictional @1 company in its early days.", company_abbr)
	elseif livery_type == dlxtrains.livery_type.middle_era then
		livery_template.name = S("@1 Middle Era", company_abbr)
		livery_template.notes = S("This is a livery used by the fictional @1 company before it adopted its current standard.", company_abbr)
	else
		livery_template.name = S("@1 Standard", company_abbr)
		livery_template.notes = S("This is the current standard livery for the fictional @1 company.", company_abbr)
	end

	return livery_template
end

-- ////////////////////////////////////////////////////////////////////////////////////
-- Begin support code for external access to livery information

-- The following is provided to support easier and safer access to internal livery
-- information by external tools such as advtrains-doc-integration. Please note,
-- however, that these functions will likey become deprecated once dlxtrains is fully
-- transitioned to using AdvTrains Livery Database in place of its current internal
-- livery database.

-- This function will return the count of internally defined liveries for a given wagon
-- type. Any additional liveries that may have been added externally for the wagon type
-- via AdvTrains Livery Database will not be included. Note that wagons types that are
-- excluded due to dlxtrains' mod settings or are in disabled dlx mods will also be
-- excluded in the count.
function dlxtrains.get_livery_count(wagon_type)
	assert(wagon_type, "Missing wagon type")

	if registered_livery_templates[wagon_type] then
		return #registered_livery_templates[wagon_type]
	end

	return 0
end

-- This function will return the livery information for a given 1-based index for a
-- given wagon type. Any additional liveries that may have been added externally for
-- the wagon type via AdvTrains Livery Database will not be included.  Note that the
-- default livery for a given wagon type is determined dynamically at runtime. Thus,
-- the livery information at index 1 can be assumed to be the default livery for
-- documentation purposes. Also note that wagons types that are excluded due to
-- dlxtrains' mod settings or are in disabled dlx mods will also be excluded here.
function dlxtrains.get_livery_info(wagon_type, index) -- index is 1 based
	assert(wagon_type, "Missing wagon type")
	assert(index and index > 0, "Invalid index")

	if registered_livery_templates[wagon_type] and index <= #registered_livery_templates[wagon_type] then
		return {
			-- Only return the internal livery template information that is suitable for external use.
			name = registered_livery_templates[wagon_type][index].name,
			base_texture = registered_livery_templates[wagon_type][index].base_texture,
			notes = registered_livery_templates[wagon_type][index].notes,
		}
	end

	return nil
end

-- End of support code for external access to livery information
-- ////////////////////////////////////////////////////////////////////////////////////

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
			local wagon_properties = wagon.object:get_properties()
			local wagon_texture = (wagon_properties and wagon_properties.textures and wagon_properties.textures[1]) or "<nil>"
			if wagon_texture == dlxtrains.get_init_texture() then
				-- Only set the scheme id if the wagon has not yet been fully initialized
				data.scheme_id = math.floor(rnd/10)%livery_count
			end
		end
	end

	-- Force out-of-range scheme IDs into range.  (Protection for deleted test data.)
	if data.scheme_id ~= nil and data.scheme_id >= livery_count then
		data.scheme_id = 0
	end

	local texture = livery_schemes.filename_prefix.."_"..livery_schemes[data.scheme_id or 0].code..".png"
	if data.alt_scheme then
		texture = texture.."^[transformR180"
	end

	-- Allow for livery scheme specific dynamic customization of the texture
	if livery_schemes.on_update_texture ~= nil then
		texture = livery_schemes.on_update_texture(wagon, data, texture)
	end

	-- Modify texture (and possibly the model/mesh) for wagons that could have visible loads
	if meshes and meshes.update_model then
		texture = meshes.update_model(wagon, data, texture, meshes)
	end

	wagon.object:set_properties({textures={texture}})
end

function dlxtrains.update_livery(wagon, puncher, livery_schemes)
	local itemstack = puncher:get_wielded_item()
	local item_name = itemstack:get_name()
	if item_name == "dlxtrains:wagon_updater" or item_name == "dlxtrains:age_selector" or item_name == "dlxtrains:livery_selector" then
		local data = advtrains.wagons[wagon.id]
		if item_name == "dlxtrains:wagon_updater" then
			play_tool_sound("dlxtrains_wagon_updater_tool", wagon)
		else
			local alt_scheme = data.alt_scheme or false
			local scheme_id = data.scheme_id or 0

			if item_name == "dlxtrains:age_selector" then
				data.alt_scheme = not alt_scheme;
				play_tool_sound("dlxtrains_age_selection_tool", wagon)
			else
				local livery_count = livery_schemes.count or 0
				if livery_count > 1 then
					local pc = puncher:get_player_control()
					local increment = 1
					if pc.sneak then
						increment = -1
					end
					data.scheme_id = (scheme_id + increment)%livery_count
					play_tool_sound("dlxtrains_livery_selection_tool", wagon)
				else
					notify_puncher(puncher, wagon, S("This wagon does not have any other liveries available."))
				end
			end
		end
		wagon:set_textures(data)
		return true
	elseif dlxtrains.use_advtrains_livery_designer and item_name == advtrains_livery_designer.tool_name and is_valid_wagon(wagon) then
		local wagon_type = advtrains.wagons[wagon.id].type
		local wagon_mod_name = advtrains_livery_database.get_wagon_mod_name(wagon_type)
		if wagon_mod_name then
			advtrains_livery_designer.activate_tool(puncher, wagon, wagon_mod_name)
			return true
		end
	end

	return false
end

-- ////////////////////////////////////////////////////////////////////////////////////
-- Begin support code for AdvTrains Livery Tools

if dlxtrains.use_advtrains_livery_designer then
	-- Notify player if a newer version of AdvTrains Livery Tools is available or needed.
	if not advtrains_livery_designer.is_compatible_mod_version or
	   not advtrains_livery_designer.is_compatible_mod_version({major = 0, minor = 9, patch = 0}) then
		minetest.log("warning", "[DlxTrains] An old version of AdvTrains Livery Tools was detected. Consider updating to the latest version.")
		-- Version 0.9.0 is not currently required so just log an informational message.
	end
end

local default_template_designer = "Marnack"
local default_texture_license = "CC-BY-SA-3.0"
local default_texture_creator = "Marnack"

function dlxtrains.register_livery_templates(target_wagon_type, livery_mod_name, livery_templates)
	assert(target_wagon_type, "Missing target wagon type")
	assert(livery_mod_name, "Missing livery mod name")
	assert(livery_templates, "Missing livery templates")

	for wagon_type, wagon_livery_templates in pairs(livery_templates) do
		if wagon_type == target_wagon_type then
			if dlxtrains.use_advtrains_livery_designer then
				advtrains_livery_database.register_wagon(wagon_type, livery_mod_name)
			end
			for _, livery_template in ipairs(wagon_livery_templates) do

				-- Build internal table of registered livery templates.
				if not registered_livery_templates[wagon_type] then
					registered_livery_templates[wagon_type] = {}
				end
				table.insert(registered_livery_templates[wagon_type], livery_template)

				-- Add livery template to advtrains_livery_database.
				if dlxtrains.use_advtrains_livery_designer then
					advtrains_livery_database.add_livery_template(
						wagon_type,
						livery_template.name,
						{livery_template.base_texture},
						livery_mod_name,
						(livery_template.overlays and #livery_template.overlays) or 0,
						livery_template.designer or default_template_designer,
						livery_template.texture_license or default_texture_license,
						livery_template.texture_creator or default_texture_creator,
						livery_template.notes
					)
					if livery_template.overlays then
						for overlay_id, overlay in ipairs(livery_template.overlays) do
							advtrains_livery_database.add_livery_template_overlay(
								wagon_type,
								livery_template.name,
								overlay_id,
								overlay.name,
								overlay.slot_idx or 1,
								overlay.texture,
								overlay.alpha
							)
						end
					end
				end
			end
		end
	end
end

local function remove_dlxtrains_livery_enhancements(livery_texture)
	local base_texture = livery_texture

	-- Remove any overlays for loads, lighting, fans, road numbers, etc.
	if string.sub(base_texture, 1, 9) == "[combine:" then
		local a = string.find(base_texture, "(", 1, true)
		local b = #base_texture
		if a then
			a = a + 1
			local nesting_level = 1
			for i = a, #base_texture do
				local c = string.sub(base_texture, i, i)
				if c == "(" then
					nesting_level = nesting_level + 1
				elseif c == ")" then
					nesting_level = nesting_level - 1
					if nesting_level == 0 then
						b = i - 1
						break
					end
				end
			end
			base_texture = base_texture:sub(a,b)
		end

		-- Remove escape sequences added because of "[combine:"
		base_texture = dlxtrains.remove_modifier_escaping(base_texture)
	end

	-- Remove trailing rotation transform, if present.
	if string.sub(base_texture, -15, -1) == "^[transformR180" then
		base_texture = string.sub(base_texture, 1, -16)
	end

	return base_texture
end

local function get_livery_scheme_id(wagon_type, texture)
	local base_texture = remove_dlxtrains_livery_enhancements(texture)
	for wgn_type, wagon_livery_templates in pairs(registered_livery_templates) do
		if wgn_type == wagon_type then
			for _, livery_template in ipairs(wagon_livery_templates) do
				if livery_template.base_texture == base_texture then
					return livery_template.scheme_id
				end
			end
		end
	end

	return nil
end

-- This function is intended to be called by the advtrains_livery_designer tool
-- whenever the player activates the "Apply" button.
function dlxtrains.apply_wagon_livery_textures(player, wagon, textures)
	if wagon and textures and textures[1] then
		local data = advtrains.wagons[wagon.id]
		data.scheme_id = get_livery_scheme_id(data.type, textures[1])
		data.livery = textures[1]
		wagon:set_textures(data)
	end
end

function dlxtrains.on_pre_get_livery_design_from_textures(wagon_type, livery_textures, wagon_id, livery_design)
	-- For wagons and locomotives that add overlays for loads, lighting, fans,
	-- road numbers, etc., this implementation will extract and return the
	-- "base texture" without such overlays.
	if livery_textures and livery_textures[1] then
		local base_texture = remove_dlxtrains_livery_enhancements(livery_textures[1])
		if base_texture then
			livery_textures[1] = base_texture
		end
	end

	return livery_textures
end

local optional_callback_functions = {
	on_pre_get_livery_design_from_textures = dlxtrains.on_pre_get_livery_design_from_textures,
}

function dlxtrains.register_mod(mod_name)
	if dlxtrains.use_advtrains_livery_designer then
		-- Register the mod and the dlxtrains livery functions with the advtrains_livery_designer tool.
		advtrains_livery_designer.register_mod(mod_name, dlxtrains.apply_wagon_livery_textures, optional_callback_functions)
	end
end

-- End of support code for AdvTrains Livery Tools
-- ////////////////////////////////////////////////////////////////////////////////////

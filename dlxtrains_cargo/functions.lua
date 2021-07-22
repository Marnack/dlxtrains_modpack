
local S = dlxtrains_cargo.S

-- ////////////////////////////////////////////////////////////////////////////////////

function dlxtrains_cargo.get_crate_texture_count()
	return 3
end

function dlxtrains_cargo.get_crate_texture(index)
	local crate_textures = {
		"dlxtrains_cargo_wooden_crate_acacia_wood.png",
		"dlxtrains_cargo_wooden_crate_junglewood.png",
		"dlxtrains_cargo_wooden_crate_pine_wood.png",
	}

	local texture = crate_textures[1]
	if index > 1 and index <= dlxtrains_cargo.get_crate_texture_count() then
		texture = crate_textures[index]
	end

	return dlxtrains.make_safe_string(texture)
end

function dlxtrains_cargo.get_shipping_container_livery_count()
	return 18
end

function dlxtrains_cargo.get_shipping_container_texture(livery_id)
	texture = "dlxtrains_cargo_shipping_container_livery_"..livery_id..".png"
	return dlxtrains.make_safe_string(texture)
end
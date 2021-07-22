
local S = dlxtrains_cargo.S

minetest.register_node("dlxtrains_cargo:corrugated_box", {
	description = S("Corrugated Box"),
	paramtype2 = "facedir",
	tiles = { "dlxtrains_cargo_corrugated_box_top.png",
			  "dlxtrains_cargo_corrugated_box_bottom.png",
			  "dlxtrains_cargo_corrugated_box_side_plain.png",
			  "dlxtrains_cargo_corrugated_box_side_plain.png",
			  "dlxtrains_cargo_corrugated_box_side_taped.png",
			  "dlxtrains_cargo_corrugated_box_side_taped.png" },
	is_ground_content = false,
	groups = {snappy = 3, oddly_breakable_by_hand = 2, flammable = 3},
	sounds = {
		footstep = {name="dlxtrains_cargo_corrugated_box_footstep", gain=0.6, max_hear_distance=7},
		place = {name="dlxtrains_cargo_corrugated_box_footstep", gain=0.3, max_hear_distance=13},
		dig = {name="dlxtrains_cargo_corrugated_box_dig", gain=0.8, max_hear_distance=11},
		dug = {name="dlxtrains_cargo_corrugated_box_dug", gain=0.7, max_hear_distance=13},
	},
})

minetest.register_craft({
	output = "dlxtrains_cargo:corrugated_box",
	recipe = {
		{ "dlxtrains_cargo:corrugated_fiberboard", "dlxtrains_cargo:corrugated_fiberboard", "dlxtrains_cargo:corrugated_fiberboard" },
		{ "dlxtrains_cargo:corrugated_fiberboard", "", "dlxtrains_cargo:corrugated_fiberboard" },
		{ "dlxtrains_cargo:corrugated_fiberboard", "dlxtrains_cargo:corrugated_fiberboard", "dlxtrains_cargo:corrugated_fiberboard" },
	}
})

minetest.register_craft({
	type = "fuel",
	recipe = "dlxtrains_cargo:corrugated_box",
	burntime = 6,
})

local crate_woods = {
		{ "default",	"pine_wood",	"Pine Wood" },
		{ "default",	"acacia_wood",	"Acacia Wood" },
		{ "default",	"junglewood",	"Jungle Wood" },
}

for i in ipairs(crate_woods) do
	local mod_name			= crate_woods[i][1]
	local technical_name	= crate_woods[i][2]
	local display_name		= crate_woods[i][3]
	local wood_name			= mod_name..":"..technical_name
	local crate_name		= "dlxtrains_cargo:crate_"..technical_name

	minetest.register_node(crate_name, {
		description = S(display_name.." Crate"),
		paramtype2 = "facedir",
		tiles = { "dlxtrains_cargo_wooden_crate_"..technical_name..".png" },
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
		sounds = default.node_sound_wood_defaults(),
	})

	minetest.register_craft({
		output = crate_name,
		recipe = {
			{ "default:stick", wood_name, "default:stick" },
			{ wood_name, "", wood_name },
			{ wood_name, wood_name, wood_name },
		}
	})

	minetest.register_craft({
		type = "fuel",
		recipe = crate_name,
		burntime = 8,
	})
end
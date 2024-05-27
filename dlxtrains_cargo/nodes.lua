
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

if dlxtrains.crafting_enabled() then
	minetest.register_craft({
		output = "dlxtrains_cargo:corrugated_box",
		recipe = {
			{ "dlxtrains_cargo:corrugated_fiberboard", "dlxtrains_cargo:corrugated_fiberboard", "dlxtrains_cargo:corrugated_fiberboard" },
			{ "dlxtrains_cargo:corrugated_fiberboard", "", "dlxtrains_cargo:corrugated_fiberboard" },
			{ "dlxtrains_cargo:corrugated_fiberboard", "dlxtrains_cargo:corrugated_fiberboard", "dlxtrains_cargo:corrugated_fiberboard" },
		}
	})
end

minetest.register_craft({
	type = "fuel",
	recipe = "dlxtrains_cargo:corrugated_box",
	burntime = 6,
})

local crate_defs = {
	{
		name = "dlxtrains_cargo:crate_pine_wood",
		desc = S("Pine Wood Crate"),
		texture = "dlxtrains_cargo_wooden_crate_pine_wood.png",
		wood = dlxtrains.materials.pine_wood
	},
	{
		name = "dlxtrains_cargo:crate_acacia_wood",
		desc = S("Acacia Wood Crate"),
		texture = "dlxtrains_cargo_wooden_crate_acacia_wood.png",
		wood = dlxtrains.materials.acacia_wood
	},
	{
		name = "dlxtrains_cargo:crate_junglewood",
		desc = S("Jungle Wood Crate"),
		texture = "dlxtrains_cargo_wooden_crate_junglewood.png",
		wood = dlxtrains.materials.junglewood
	},
}

for _, crate_def in ipairs(crate_defs) do
	minetest.register_node(crate_def.name, {
		description = crate_def.desc,
		paramtype2 = "facedir",
		tiles = { crate_def.texture },
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
		sounds = dlxtrains.sounds.node_sound_wood_defaults and dlxtrains.sounds.node_sound_wood_defaults(),
	})

	if dlxtrains.crafting_enabled() and crate_def.wood and crate_def.wood ~= ""then
		minetest.register_craft({
			output = crate_def.name,
			recipe = {
				{ dlxtrains.materials.stick, crate_def.wood, dlxtrains.materials.stick },
				{ crate_def.wood, "", crate_def.wood },
				{ crate_def.wood, crate_def.wood, crate_def.wood },
			}
		})
	end

	minetest.register_craft({
		type = "fuel",
		recipe = crate_def.name,
		burntime = 8,
	})
end
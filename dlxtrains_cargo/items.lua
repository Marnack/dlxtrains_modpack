
local S = dlxtrains_cargo.S

if dlxtrains.crafting_enabled() then
	minetest.register_craftitem("dlxtrains_cargo:corrugated_fiberboard", {
		description = S("Corrugated Fiberboard"),
		inventory_image = "dlxtrains_cargo_corrugated_fiberboard.png",
		groups = {flammable = 3},
	})

	minetest.register_craft({
		output = "dlxtrains_cargo:corrugated_fiberboard",
		recipe = {
			{dlxtrains.materials.paper, dlxtrains.materials.paper, dlxtrains.materials.paper},
			{"", dlxtrains.materials.paper, ""},
			{dlxtrains.materials.paper, dlxtrains.materials.paper, dlxtrains.materials.paper},
		}
	})

	minetest.register_craft({
		type = "fuel",
		recipe = "dlxtrains_cargo:corrugated_fiberboard",
		burntime = 4,
	})
end
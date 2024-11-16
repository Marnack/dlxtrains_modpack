dlxtrains_animal_sounds = {}

-- The set of sounds for supported animals.  Additional sounds will be added for supported animals from enabled mods.
-- Some default sounds are provided in case animal mods don't have any sounds.  The index is animal type.  A given
-- animal type can have more than one sound in the table.
local animal_sounds = {
	["cow"] = {},
	["horse"] = {
		{ name = "dlxtrains_animals_horse_snort-01",	gain = 60, },
		{ name = "dlxtrains_animals_horse_snort-02",	gain = 60, },
		{ name = "dlxtrains_animals_horse_snort-03",	gain = 60, },
		{ name = "dlxtrains_animals_horse_snort-04",	gain = 60, },
		{ name = "dlxtrains_animals_horse_snort-05",	gain = 60, },
		{ name = "dlxtrains_animals_horse_snort-06",	gain = 50, },
		{ name = "dlxtrains_animals_horse_whinny-01",	gain = 60, },
		{ name = "dlxtrains_animals_horse_whinny-02",	gain = 60, },
	},
	["pig"] = {},
	["sheep"] = {},
	["warthog"] = {},
}

if minetest.get_modpath("mobs_animal") then
	table.insert(animal_sounds["cow"], {name = "mobs_cow", gain = 40})
	table.insert(animal_sounds["sheep"], {name = "mobs_sheep", gain = 20})
	table.insert(animal_sounds["warthog"], {name = "mobs_pig", gain = 50})
end

--[[
if minetest.get_modpath("mob_horse") then
	-- No sounds available from mob_horse. Built-in sounds are provided instead.
end
--]]

if minetest.get_modpath("animalia") then
	table.insert(animal_sounds["cow"], {name = "animalia_cow", gain = 20, })
	table.insert(animal_sounds["horse"], {name = "animalia_horse_idle", gain = 50})
	table.insert(animal_sounds["pig"], {name = "animalia_pig", gain = 50})
	table.insert(animal_sounds["sheep"], {name = "animalia_sheep_idle", gain = 40})
end

function dlxtrains_animal_sounds.get_sounds(animal_type)
	return animal_sounds[animal_type]
end

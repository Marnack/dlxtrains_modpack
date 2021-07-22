
dlxtrains_cargo = {}

-- Support localized strings if intllib mod is installed.
if minetest.get_modpath( "intllib" ) and intllib then
	dlxtrains_cargo.S = intllib.Getter()
else
	dlxtrains_cargo.S = function(s) return s end
end

-- Add nodes
dofile(minetest.get_modpath("dlxtrains_cargo").."/items.lua");
dofile(minetest.get_modpath("dlxtrains_cargo").."/nodes.lua");
dofile(minetest.get_modpath("dlxtrains_cargo").."/functions.lua");

-- Cleanup
dlxtrains_cargo.S = nil;

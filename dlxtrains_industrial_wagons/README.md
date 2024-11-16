# DlxTrains Industrial Wagons

This mod adds AdvTrains compatible industrial wagons to Minetest.  These wagons are loosely modeled on real world wagons from different geographies and eras.

![](screenshot.png)

Note: DLX is used here to denote items, tools and wagons defined in the DlxTrains ModPack.

## Craft Items

The following craft items are defined and added to the game if the "Complexity of DLX wagon crafting recipes" setting defined in DlxTrains is set to "Standard".  They are not added to the game if it is set to "Basic".  The default value for the setting is "Standard".

- **Australian Cattle Van Cargo Housing** - This item is used to craft cattle vans of the type built in Australia.
- **Australian Louver Van Cargo Housing** - This item is used to metal louver vans of the type built in Australia.
- **Brakeman's Cabin** - This item is used to craft some early European wagons.
- **Container Wagon Cargo Mounts** - This item is used to craft shipping container wagons.
- **Container Wagon Single Cargo Mount** - This item is used to craft smaller shipping container wagons
- **European Wooden Covered Goods Wagon Cargo Housing** - This item is used to craft wooden box wagons of the type built in Europe.
- **Flat Wagon Cargo Deck** - This item is used to craft flat wagons.
- **Hopper Wagon Cargo Bin** - This item is used to craft hopper wagons.
- **North American Wooden Boxcar Cargo Housing** - This item is used to craft wooden boxcars of the type built in North America.
- **Open Wagon Cargo Deck** - This item is used to craft open wagons.
- **Small Tank with Mount** - This item is used to craft small tank wagons.
- **Stake Wagon Cargo Deck** - This item is used to craft stake wagons.

## Wagons

The following table summarizes the full set of DlxTrains Industrial Wagons.

Icon|Wagon Name|Length (m)|Coupler Type|Inventory Size|Max Speed (m/s)|Livery Options
:---:|---|:---:|---|:---:|:---:|:---:
![](textures/inventory/dlxtrains_industrial_wagons_livestock_type1_inv.png)|Australian Cattle Van|6|Knuckle|16|20|4
![](textures/inventory/dlxtrains_industrial_wagons_flat_type2_inv.png)|Australian Flat Wagon|6|Knuckle|24|20|4
![](textures/inventory/dlxtrains_industrial_wagons_covered_goods_type2_inv.png)|Australian Louver Van|8|Knuckle|40|25|4
![](textures/inventory/dlxtrains_industrial_wagons_open_type1_inv.png)|Australian Open Wagon|6|Knuckle|24|20|4
![](textures/inventory/dlxtrains_industrial_wagons_transition_type1_inv.png)|Buffer/Knuckle Transition Wagon|6|Buffer & Chain / Knuckle|24|20|2
![](textures/inventory/dlxtrains_industrial_wagons_container_type1_inv.png)|European Container Wagon|8.5|Buffer & Chain|32|20|5
![](textures/inventory/dlxtrains_industrial_wagons_flat_type1_inv.png)|European Flat Wagon|6|Buffer & Chain|24|20|4
![](textures/inventory/dlxtrains_industrial_wagons_container_type2_inv.png)|European Single Container Wagon|4.9|Buffer & Chain|16|20|5
![](textures/inventory/dlxtrains_industrial_wagons_tank_type2_inv.png)|European Small Tank Wagon|4.9|Buffer & Chain|24|15|4
![](textures/inventory/dlxtrains_industrial_wagons_tank_type1_inv.png)|European Small Tank Wagon with Brakeman's Cabin|4.9|Buffer & Chain|24|15|4
![](textures/inventory/dlxtrains_industrial_wagons_stake_type1_inv.png)|European Stake Wagon|6|Buffer & Chain|24|20|4
![](textures/inventory/dlxtrains_industrial_wagons_covered_goods_type3_inv.png)|European Wooden Covered Goods Wagon|7|Buffer & Chain|32|20|4
![](textures/inventory/dlxtrains_industrial_wagons_hopper_type2_inv.png)|North American Covered Hopper Wagon|6|Knuckle|24|25|4
![](textures/inventory/dlxtrains_industrial_wagons_hopper_type1_inv.png)|North American Hopper Wagon|6|Knuckle|24|25|4
![](textures/inventory/dlxtrains_industrial_wagons_covered_goods_type1_inv.png)|North American Wooden Boxcar|8|Knuckle|40|25|3

Note that some wagons may not be available in-game if the "Longest DLX wagon to include in game" setting defined in **DlxTrains** is set to a value other than "Unlimited".  That setting will use the lengths shown in the table when determining the wagons to be excluded.

### Australian Cattle Van

This livestock wagon is loosely based on cattle vans that were used in southern Australia in the mid twentieth century.  These particular wagons were removed from service in the 1980's when the transport of cattle by rail was phased out.

In game, these wagons can be used to transport more than just cattle.  The wagons will display animals from the following mods:

- [Animalia](https://content.luanti.org/packages/ElCeejo/animalia/): Cow, Horse, Pig and Sheep
- [Mobs Animal](https://content.luanti.org/packages/TenPlus1/mobs_animal/): Cow, Sheep and Warthog
- [Mob Horse](https://content.luanti.org/packages/TenPlus1/mob_horse/): Horse

	Note: The animals shown on these wagons have a slightly different appearance from their mob representation since different models and textures were created to represent them.

Animals that are not listed above will be represented as being in a crate.  Also, similar to the European Flat Wagon, if the cargo is a node that can be simply rendered, it will be shown as itself.  In all other cases, the cargo will be shown as being in a crate.

If the wagon is loaded with animals from the above list, an applicable animal sound will be emitted at random intervals from the wagon.  Increasing the number of animals in the highlighted inventory slot of the wagon increases the frequency at which these sounds are emitted.  These animal sounds can be disabled in the **DlxTrains** mod settings by setting "DLX Wagon sounds" to false.

### Australian Flat Wagon

This wagon is loosely based on an early Australian bogie flat wagon that entered service in southern Australia in the mid 1920's.

It features visible loads in game using the same mechanism as the European Flat Wagon (see below).

### Australian Louver Van

This is an Australian wagon loosely modeled on a louver van which first saw service in southern Australia in the late 1920's.  Although initially built with buffer and chain couplers, the wagons were later retrofitted with knuckle couplers.  Since they seem to have been equipped with knuckle couplers for a majority of their service life, they are the couplers used in this mod's version of the wagon. 

### Australian Open Wagon

This wagon is loosely based on an early Australian bogie open wagon that entered service in southern Australia in the mid 1920's.  These versatile wagons have two pairs of removable doors on each side of the wagon that allow for a wide variety of loads to be carried.

In game, these wagons have seven possible load configurations that are determined by the wagon's inventory: Empty, Filled with "loose" material (dirt, gravel, sand, or coal), covered by a canvas or tarpaulin, doors removed and loaded with logs, and three load configurations with crates or nodes similar to the European Flat Wagon (see below).

### Buffer/Knuckle Transition Wagon

Transition wagons, also known as barrier wagons or match wagons, are used to connect wagons that have different coupler types.  Flat wagons are typically used for this purpose in the real world since they are usually the lightest wagon available.  Aside from coupler differences, the Buffer/Knuckle Transition Wagon is functionally identical to the European Flat Wagon.

Note that AdvTrains versions 2.4.0 and later support requiring that the type of couplers should match when coupling wagons.  DlxTrains_modpack versions after 1.4.0 enable that requirement.

### European Container Wagon

Modeled after a mid to late 20th century European container wagon, this wagon can appear in one of three load configurations.  When its inventory is empty it will have no visible containers and players will be able to view the entire framework of this relatively lightweight wagon.  When a small amount of inventory is present, one container will be visible, centered in the middle of the wagon.  When the wagon has significant inventory, a second container will be visible.  (See the *Wagon Inventory Management* section below for the items that will cause a tank container to appear on the wagon.)  The livery of the containers will match the livery of the wagon.  However, if the **DlxTrains Cargo** mod is enabled, additional shipping and tank container liveries will become available.  The livery of each container will then be pseudo-randomly selected from the set of available liveries.

### European Flat Wagon

Although not the first wagon to use bogies in Europe, this early 20th century freight wagon allowed significant versatility for large and oddly shaped loads.

In game, these wagons have four load configurations: no load, light load, medium load and large load.  When the wagon is lightly loaded, a single node will appear on the wagon as its cargo.  If the cargo is applicable for a flat wagon and can be simply rendered, it will be shown as itself.  Otherwise it will be shown as a crate.  For a moderately full inventory, three nodes will be rendered as the cargo.  As with the previous case, one of the additional nodes with be rendered as itself or a crate.  The third node will always be shown as a crate.  In the case of a large load, five nodes with be shown on the wagon, all of them either as one or more of the inventory items or as a crate.   If the DlxTrains Cargo mod is enabled, additional wooden crates will become available.  These additional crates will then be pseudo-randomly selected from the set of available crates.

### European Single Container Wagon

This fictional wagon is a shortened version of the European Container Wagon that may be better suited for some railways in Minetest.  It has two load configurations, empty and with a single shipping or tank container whenever the applicable inventory is present.  (See the *Wagon Inventory Management* section below for the items that will cause a tank container to appear on the wagon.)  Like the larger container wagon, the livery of the container will match the livery of the wagon.  However, if the **DlxTrains Cargo** mod is enabled, additional shipping and tank container liveries will become available.  The livery of the container will then be pseudo-randomly selected from the set of available liveries.

### European Small Tank Wagon

By the mid 20th century, brakemen were no longer needed to ride wagons and operate their brakes.  Thus, brakeman's cabins were removed from older wagons and newer wagons were built without them.  This wagon represents such early to mid 20th century tank wagons.

If [Advanced Trains TechAge addons](https://content.minetest.net/packages/orwell/advtrains_techage/) is installed and enabled, and [Advanced Trains](https://content.minetest.net/packages/orwell/advtrains/) is running at version 2.4.3 or later then this wagon can also be used to transport up to 1000 units of liquid.

### European Small Tank Wagon with Brakeman's Cabin

This wagon is based on late 19th and early 20th century tank wagons used in Europe.  It features a brakeman's cabin that provides shelter for the brakemen who were needed at the time to ride the wagons and operate their brakes.

In game, a player can ride the wagon in the brakeman's cabin.  However, actual braking control is not available.

If [Advanced Trains TechAge addons](https://content.minetest.net/packages/orwell/advtrains_techage/) is installed and enabled, and [Advanced Trains](https://content.minetest.net/packages/orwell/advtrains/) is running at version 2.4.3 or later then this wagon can also be used to transport up to 1000 units of liquid.

### European Stake Wagon

The design of this wagon is based on similar wagons used in Europe in the mid 20th century.  Although commonly used in the logging industry, this wagon could be used in other situations as well.  Thus, when this DLX wagon is not carrying logs, it will display cargo similar to a flat wagon.

### European Wooden Covered Goods Wagon

This wooden freight wagon was modeled on one of the main covered goods wagons used in Europe in the early to mid 20th century.  Perhaps its most recognizable feature are the four vent covers on each side of the wagon.  These vents enabled the wagons to carry a greater diversity of cargo types and, in some situations, were even used for loading the wagon.

### North American Covered Hopper Wagon

This is the covered version of the early 20th century North American hopper wagon listed below.  This type of wagon was used when loose bulk commodities being transported needed to be protected from the weather, such as when transporting grain, sugar or fertilizer.  The wagon includes a roof with 8 loading hatches and a steel mesh "roof walk" that was common for the era.

### North American Hopper Wagon

This wagon is modeled on an early 20th century two bay hopper wagon that was used in North America.  Although larger three bay hopper wagons eventually replaced these, this all-steel design played a key role in the industrial era of North America.

In game, these wagons will display a visible load whenever the inventory is not empty.  If the load is applicable to a hopper wagon, such as dirt, sand, gravel or coal, the corresponding load will be visible.  Otherwise, a generic "mixed materials" texture will be shown to indicate that the inventory is not empty but the cargo is likely not appropriate for a hopper wagon.

### North American Wooden Boxcar

This wagon is modeled after the early to mid 20th century boxcars used in North America.  Most boxcars of this era were painted "boxcar red" which was not a single distinct color but any hue from a range of colors spanning red-brown to orange-brown.  Another feature of boxcars from this era was the presence of a "roof walk".  This was a wooden walkway that was constructed on the roof of the boxcars to allow the brakemen to quickly move from wagon to wagon to turn each wagon's brake wheel when needed.  This was of course a dangerous occupation and so "roof walks" were banned in the 1960's, with the last remaining ones finally eliminated in the 1980's.

## Wagon Inventory Management

*Note: The following information is optional and may be skipped by players who are content with the visible cargo being managed automatically.*

For those DLX wagons that can display visible cargo or cargo containers, DlxTrains will use a pseudo-random algorithm to display the cargo or containers.  However, for players that are interested in specifying exactly which cargo or container is visible on a wagon, that can be accomplished by managing the arrangement and quantities of items and nodes in the wagon's inventory.

When viewing the inventory formspec of DLX wagons that have the ability to display their cargo, one or more of the wagon's inventory slots will be highlighted with a blue-green color.  Adjusting the type or quantities of items in those particular slots will cause a change in the displayed cargo or containers.  (Tip: Use the **DLX Wagon Updater Tool** to quickly confirm the change after adjusting the inventory.) Although each type of DLX wagon that supports visible loads may behave slightly differently, adding or removing one item from these special slots will allow a player to select the next or previous container (crate, shipping container or tank container).  In the case of loads where the item is visible as itself, any non-zero quantity is equivalent.

The Australian Open Wagon will display a visible load based on the state of the wagon's three highlighted inventory slots.  If the first slot is filled with a "loose" material such as dirt, sand, gravel or coal (blocks, lumps or dust), the corresponding load will be visible as piles of the material within the wagon.  If the first slot is filled with one or more craft items of any type then the wagon will appear with a canvas or tarpaulin covered load.  If the first slot is filled with one or more tree trunks then the wagon will appear with its doors removed and loaded with logs of the applicable type.  If none of those conditions are met and at least one of the three highlighted wagon inventory slots is not empty then it will display cargo similar to the European Flat Wagon.

The Australian Cattle Van will display loads based on the items placed in the first highlighted inventory slot.  These visible loads include crates, simple nodes and a select set of animals.  See the wagon's description above for details.

The European Stake Wagon will only show logs as its cargo when one or more tree nodes are placed in the first (upper-left) inventory slot, otherwise it will display its cargo similar to a flat wagon.

For container wagons, the load will appear as a shipping container unless the load placed in the highlighted slot is either a liquid, such as a water source node, or a non-empty liquid container, such as a water bucket.  For non-stackable liquid containers that can store multiple units of liquid, the number of units of liquid in the container rather than the number of items in the inventory slot will determine the tank container's livery.

The following nodes from other optional mods will cause a tank container to appear on the wagon rather then a shipping container when they are placed in a highlighted inventory slot of a container wagon:

Mod|Items
---|---
bucket (from Minetest Game)|any non-empty bucket
[Basic Materials](https://content.minetest.net/packages/VanessaE/basic_materials/)|oil_extract
[Biofuel](https://content.minetest.net/packages/Lokrates/biofuel/)|phial_fuel, bottle_fuel, fuel_can
[Farming Redo](https://content.minetest.net/packages/TenPlus1/farming/)|bottle_ethanol, hemp_oil
[Pipeworks](https://content.minetest.net/packages/VanessaE/pipeworks/)|oil_extract
[Technic](https://content.minetest.net/packages/RealBadAngel/technic/)|cottonseed_oil, lox, any non-empty can
[Techage](https://content.minetest.net/packages/joe7575/techage_modpack/)|source nodes and their relevant containers (barrels, canisters, and gas cylinders) for the following materials: bitumen, epoxide resin, fuel oil, gasoline, hydrogen, lye, naphtha, oil, propane, red mud, river water, and water

While liquids in containers are not actually placed in tank containers in the real world, this was done here to make it easier for players to have wagons loaded with tank containers in game when playing in survival mode.  Please note, however, that this could change in a future release of this mod.

## Licenses

Copyright © 2021-2024 Marnack

- DlxTrains Industrial Wagons code is licensed under the GNU AGPL version 3 license.
- Unless otherwise specified, DlxTrains Industrial Wagons media (models, textures and sounds) are licensed under [CC BY-SA 3.0 Unported](https://creativecommons.org/licenses/by-sa/3.0/).

### Attributions

The following textures from prior art where included in whole or in part in some of the textures for this mod:

- From the game for Minetest named "mintest_game"
	- default_pine_wood.png (CC BY-SA 3.0 by paramat)
	- default_tree.png (CC BY-SA 3.0 by Cisoun)
	- default_tree_top.png (CC BY-SA 3.0 by Cisoun)
	- default_wood.png (CC BY-SA 3.0 by BlockMen)

- From the mod for Minetest named "farming":
	- farming_hemp_rope.png (CC BY-SA 3.0 by TenPlus1)

The following sounds from freesound.org were used to create sounds included in DlxTrains:

- [Horse](https://freesound.org/s/184503/) ([CC0](https://creativecommons.org/publicdomain/zero/1.0/) by madklown) was renamed and modified to create the following file:
	- dlxtrains_animals_horse_snort-01.ogg

- [horse snort.wav](https://freesound.org/s/538697/) ([CC0](https://creativecommons.org/publicdomain/zero/1.0/) by bruno.auzet) was renamed and modified to create the following files:
	- dlxtrains_animals_horse_snort-02.ogg
	- dlxtrains_animals_horse_snort-03.ogg
	- dlxtrains_animals_horse_snort-04.ogg
	- dlxtrains_animals_horse_snort-05.ogg
	- dlxtrains_animals_horse_snort-06.ogg

- [Horse Whinny 1.wav](https://freesound.org/s/322445/) ([CC by Attribution 3.0 Unported](https://creativecommons.org/licenses/by/3.0/) by GoodListener) was renamed and modified to create the following file:
	- dlxtrains_animals_horse_whinny-01.ogg (This file is CC by Attribution 3.0 Unported by GoodListener and Marnack)

- [horse neigh shortened.wav](https://freesound.org/s/269571/) ([CC0](https://creativecommons.org/publicdomain/zero/1.0/) by shadoWisp) was renamed to create the following file:
	- dlxtrains_animals_horse_whinny-02.ogg

# DlxTrains ModPack

DlxTrains ModPack is an extension for AdvTrains that adds train related content for Minetest train operations.  Features of the modpack include:

- Detailed wagons whose livery and age appearance can be selected by the owning player.
- 10 industrial freight wagons, including some that have visible loads that reflect the wagon's inventory.
- 2 support wagons, including an escort wagon and a caboose.

Note: This modpack does not currently include any locomotives.  Please use another mod to get those, such as [AdvTrains Basic Trains](https://content.minetest.net/packages/orwell/basic_trains/).

![](screenshot.png)

## Included mods

Please see the README file in each of the included mod folders for important additional information.

- **DlxTrains** - This is the base mod needed by all other DlxTrains related mods.  It contains common craft items and tools for the modpack plus utilities needed by the other DlxTrains mods.
- **DlxTrains Cargo** - This is an optional mod that adds some cargo nodes as well as additional cargo related textures that can be used by the DlxTrains Industrial Wagons mod.
- **DlxTrains Industrial Wagons** - This mod provides freight wagons that feature selectable liveries and, in some cases, visible cargo.
- **DlxTrains Support Wagons** - This mod provides support wagons, including an escort wagon and a caboose, both of which provide additional seating for train crew members.  These wagons also feature selectable liveries.

## Liveries

All of the liveries in DlxTrains are intended to be fictional.  The following table summarizes the set of currently available liveries, including their colors and the count of wagons of a given category that uses the livery.

Logo|Livery Code|Primary Color|Secondary Color|Industrial Wagons|Support Wagons
:---:|---|---|---|:---:|:---:
![](dlxtrains/textures/dlxtrains_logo_ar.png)|AR|Red|Yellow|1|0
![](dlxtrains/textures/dlxtrains_logo_at.png)|AT|Light Green|Yellow|1|0
![](dlxtrains/textures/dlxtrains_logo_dlx.png)|DL&X|Black|Light Grey|6|1
![](dlxtrains/textures/dlxtrains_logo_dz.png)|DZ|Red|Light Grey|4|1
![](dlxtrains/textures/dlxtrains_logo_nr.png)|NR|n/a*|n/a*|1|1
![](dlxtrains/textures/dlxtrains_logo_t.png)|T|Brown|Yellow|6|2
![](dlxtrains/textures/dlxtrains_logo_tt.png)|TT|n/a*|n/a*|1|0
![](dlxtrains/textures/dlxtrains_logo_vr.png)|VR|Light Grey|Red|1|0
![](dlxtrains/textures/dlxtrains_logo_wf.png)|WF|Green|Grey|1|1
![](dlxtrains/textures/dlxtrains_logo_zr.png)|ZR|Yellow|Black|1|0

\* These liveries are currently only used on wagons from earlier eras before distinctive railway color schemes were established.  These colors will be defined in a future release of DlxTrains if the livery is applied to a later era wagon.

## Author's Notes

1) All of the wagons in this modpack will function properly on any of the AdvTrains track.  However, the appearance of some of the longer wagons in this modpack will be more realistic if they are only used on track that is built with large radius curves and shallow slopes.  This is not deemed to be a significant problem since it also happens in the real world that there are some trains that can only run on track that is constructed to accommodate their requirements.  However, players wanting to limit the inclusion of longer DLX wagons in game should consult the DlxTrains mod's README.md file for details on how to accomplish that using that mod's settings.

2) The wagons in this mod are modeled with some additional detail to highlight a few of their distinct characteristics.  The goal was to achieve a reasonable balance between additional detail while still maintaining an overall appearance appropriate for Minetest.

## Acknowledgments

This modpack would not exist without the prior efforts of the following people:

- **orwell**, creator of [AdvTrains](http://advtrains.de/wiki/doku.php), upon which this modpack depends.
- **rubberduck**, creator of the [moretrains](https://forum.minetest.net/viewtopic.php?f=9&t=24112) modpack for AdvTrains and whose excellent models were an inspiration for starting this project.
- **gpcf**, whose technical work to enable players to paint wagons ([JR E231 Series](https://advtrains.de/wiki/doku.php?id=usage:trains:advtrains_train_jre231)) and wagons to have visible cargo based on their inventory content (see [forum posts](https://forum.minetest.net/viewtopic.php?f=9&t=24112&start=25)) was an inspiration for the texture and model manipulation features of this modpack.

## Licenses

Copyright © 2021 Marnack

- DlxTrains ModPack code is licensed under the GNU AGPL version 3 license, see [LICENSE.txt](LICENSE.txt) for details.
- Unless otherwise specified, DlxTrains ModPack media (models, textures and sounds) are licensed under [CC BY-SA 3.0 Unported](https://creativecommons.org/licenses/by-sa/3.0/).

### Attributions

The following textures from prior art where included in whole or in part in some of the textures for this ModPack:

- From the game for Minetest named "mintest_game":
	- default_acacia_wood.png (CC BY-SA 3.0 by paramat)
	- default_junglewood.png (CC BY-SA 3.0 by paramat)
	- default_pine_wood.png (CC BY-SA 3.0 by paramat)
	- default_tree.png (CC BY-SA 3.0 by Cisoun)
	- default_tree_top.png (CC BY-SA 3.0 by Cisoun)
	- default_wood.png (CC BY-SA 3.0 by BlockMen)

- From the mod for Minetest named "farming":
	- farming_hemp_rope.png (CC BY-SA 3.0 by TenPlus1)

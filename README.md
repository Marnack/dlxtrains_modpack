# DlxTrains ModPack

DlxTrains ModPack is an extension for AdvTrains that adds train related content for Minetest train operations.  Features of the modpack include:

- Detailed locomotives and wagons whose livery and age appearance can be selected by the owning player.
- 3 diesel locomotives with dynamic sound, smoke and texture effects.
- 14 industrial freight wagons, including some that have visible loads that reflect the wagon's inventory.
- 2 support wagons, including an escort wagon and a caboose.
- Basic support for [AdvTrains Livery Tools](https://content.minetest.net/packages/Marnack/advtrains_livery_tools/).

Note: This modpack does not currently include passenger wagons. For those, consider using [AdvTrains Basic Trains](https://content.minetest.net/packages/orwell/basic_trains/), [Moretrains](https://content.minetest.net/packages/gpcf/moretrains/) or [Classic Coaches](https://content.minetest.net/packages/Marnack/classic_coaches/), all of which are available on [ContentDB](https://content.minetest.net/).
![](screenshot.png).

## Included mods

Please see the README file in each of the included mod folders for important additional information.

- **DlxTrains** - This is the base mod needed by all other DlxTrains related mods.  It contains common craft items and tools for the modpack plus utilities needed by the other DlxTrains mods.
- **DlxTrains Cargo** - This is an optional mod that adds some cargo nodes as well as additional cargo related textures that can be used by the DlxTrains Industrial Wagons mod.
- **DlxTrains Diesel Locomotives** - This mod provides three diesel locomotives in multiple liveries.  Players can optionally customize the exterior of these locomotives with a visible unit number that is unique to each locomotive.
- **DlxTrains Industrial Wagons** - This mod provides freight wagons that feature selectable liveries and, in some cases, visible cargo.
- **DlxTrains Support Wagons** - This mod provides support wagons, including an escort wagon and a caboose, both of which provide additional seating for train crew members.  These wagons also feature selectable liveries.

## Liveries

All of the liveries in DlxTrains are intended to be fictional.  The following table summarizes the set of currently defined fictional railways and their liveries plus the count of locomotives and wagons of a given category for each railway.  Note that wagons from earlier eras can have color schemes and logos that vary from their modern livery.

Railway Code|Logo(s)|Primary Color|Secondary Color|Diesel Locomotives|Industrial Wagons|Support Wagons
---|:---:|---|---|:---:|:---:|:---:
AR|![](dlxtrains/textures/dlxtrains_logo_ar.png)|Red|Yellow|0|3|0
AT|![](dlxtrains/textures/dlxtrains_logo_at.png)|Light Green|Yellow|0|3|0
DL&X|![](dlxtrains/textures/dlxtrains_logo_dlx.png)|Black|Light Grey|1|6|1
DZ|![](dlxtrains/textures/dlxtrains_logo_dz.png)|Red|Light Grey|2|7|1
NR|![](dlxtrains/textures/dlxtrains_logo_nr.png)|Blue|Light Grey|1|3|1
T|![](dlxtrains/textures/dlxtrains_logo_t_2.png) ![](dlxtrains/textures/dlxtrains_logo_t.png)|Brown|Yellow|3|14|2
TT|![](dlxtrains/textures/dlxtrains_logo_tt.png) ![](dlxtrains/textures/dlxtrains_logo_tt_2.png)|Green|Cyan|1|3|1
VR|![](dlxtrains/textures/dlxtrains_logo_vr.png)|Light Grey|Red|0|3|0
WF|![](dlxtrains/textures/dlxtrains_logo_wf.png)|Green|Grey|2|7|1
ZR|![](dlxtrains/textures/dlxtrains_logo_zr_2.png) ![](dlxtrains/textures/dlxtrains_logo_zr.png)|Yellow|Black|2|7|1

## Author's Notes

1) All of the locomotives and wagons in this modpack will function properly on any of the AdvTrains track.  However, the appearance of some of the longer wagons in this modpack will be more realistic if they are only used on track that is built with large radius curves and shallowest slopes.  This is not deemed to be a significant problem since it also happens in the real world that there are some trains that can only run on track that is constructed to accommodate their requirements.  However, players wanting to limit the inclusion of longer DLX wagons in game should consult the DlxTrains mod's README.md file for details on how to accomplish that using that mod's settings.

2) The locomotives and wagons in this mod are modeled with some additional detail to highlight a few of their distinct characteristics.  The goal was to achieve a reasonable balance between additional detail while still maintaining an overall appearance appropriate for Minetest.

3) The use of AdvTrains Livery Tools is optional and its functionality is currently limited to livery selection.  More advanced functionality normally enabled by AdvTrains Livery Tools such as customizing liveries and supporting livery packs is not yet available.

## Acknowledgments

This modpack would not exist without the prior efforts of the following people:

- **orwell**, creator of [AdvTrains](http://advtrains.de/wiki/doku.php), upon which this modpack depends.
- **rubberduck**, creator of the [moretrains](https://forum.minetest.net/viewtopic.php?f=9&t=24112) modpack for AdvTrains and whose excellent models were an inspiration for starting this project.
- **gpcf**, whose technical work to enable players to paint wagons ([JR E231 Series](https://advtrains.de/wiki/doku.php?id=usage:trains:advtrains_train_jre231)) and wagons to have visible cargo based on their inventory content (see [forum posts](https://forum.minetest.net/viewtopic.php?f=9&t=24112&start=25) and gcpf's enhancements in [Moretrains](https://content.minetest.net/packages/gpcf/moretrains/)) was an inspiration for the texture and model manipulation features of this modpack.

## Licenses

Copyright © 2021-2024 Marnack

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

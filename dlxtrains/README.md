# DlxTrains

DlxTrains is the base mod which is required for all other DlxTrains related mods.  It provides some shared utilities used by other DlxTrains mods as well as some common craft items and tools for players.

![](screenshot.png)

Note: DLX is used here to denote items, tools, wagons amd locomotives defined in the DlxTrains ModPack.

## Mod settings

DlxTrains has the following settings.  These settings will also apply to other DlxTrains mods that define additional wagons and locomotives.

- **Complexity of DLX wagon crafting recipes** (Standard, Basic) - The Standard setting requires that DLX wagons and locomotives are crafted from intermediate craft items that represent various wagon and locomotive parts such as couplers, bogies, wheel sets, etc.  The Basic setting simplifies the recipes and reduces the number of craft items added to the game.  It also thereby reduces the overall cost to craft the wagons and locomotives.  The default is "Standard".

	*NOTE: Switching this setting from "Standard" to "Basic" after players have created DLX items can result in "Unknown Items" appearing in the game.*

- **Use a random livery when placing wagons** (Enabled/Disabled) - If enabled, a random livery will be selected for the wagon or locomotive when it is placed.  Otherwise, each wagon or locomotive will always be placed using a default livery defined for that type of unit.  A player can change the livery later by using the **DLX Livery Selector Tool**.  The default is "Enabled".

- **Default age appearance for newly placed wagons** (New, Random, Used) - Specifies the initial apparent age of a DLX wagon or locomotive when it is placed.  A player can change the apparent age later by using the **DLX Age Selector Tool**.  The default is "Random".

- **Longest DLX wagon to include in game** (5m, 6m, 7m, 8m, Unlimited) - This specifies the maximum overall length in meters of the DLX wagons and locomotives to be included in the game.  It will also prevent any craft item from being added to the game if the item is only needed for excluded wagons or locomotives.  The default is "Unlimited".

	*NOTE: Switching this setting from a less restrictive setting to a more restrictive setting after players have created DLX items, wagons or locomotives can result in "Unknown Items" appearing in the game and warning messages from AdvTrains about missing wagon definitions.*

- **DLX Locomotive sounds** (Dynamic, Constant, Off) - This specifies how the main sound effect loop for a DLX locomotive is handled.  The "Dynamic" setting will cause the sound to vary based on the locomotive's velocity.  The "Constant" setting will cause the sound to be constant regardless of the locomotive's velocity.  The default is "Dynamic".

- **DLX Locomotive smoke** (Dynamic, Constant, Off) - This specifies how smoke for a DLX locomotive will be generated, when applicable.  The "Dynamic" setting will cause the smoke to vary based on the locomotive's acceleration, velocity and length of its train.  The "Constant" setting will cause the smoke to be constant regardless of the locomotive's acceleration, velocity or length of its train.  The default is "Dynamic".


## Craft Items

These items are typically needed for crafting DLX wagons, locomotives and tools.  The "DLX Blueprint" is always defined and added to the game.  The others are only defined when the "**Complexity of DLX wagon crafting recipes**" setting is set to "Standard".

- **DLX Blueprint** - This is a "design document" that is needed to craft many of the items, tools, wagons and locomotives defined in the DlxTrains ModPack.
- **Bogie** - This is a pair of wheel sets that are connected by a framework that can turn independently of the wagon that it supports.  It is also known as a "truck".
- **Coupler, Buffer & Chain** - This is one of the common early forms of a wagon coupler and is the default coupling system used by AdvTrains.
- **Coupler, Knuckle** - This a common style of wagon coupler that is used in many parts of the world.  This item is a generic representation of the many variations of knuckle coupler.
- **Wagon Chassis** - This is the underframe of the wagon.
- **Wheel Set** - This is a pair of wheels connected by an axle.

## Tools

DLX Tools only work with DLX wagons and locomotives.  Click near the center (i.e. on the selection box) of the wagon or locomotive in order for the tool to have an effect.  These tools do not wear out or need to be recharged.  Only the wagon or locomotive owner can use these tools on the wagon or locomotive.

- **DLX Age Selector Tool** - This tool is used to toggle the age appearance of DLX wagons and locomotives between "nearly new" and "used/weathered".  The amount of "weathering" will differ by livery.  That is to say, the amount of weathering for one livery can be significantly different from that of another livery for the same type of wagon or locomotive.  This was done intentionally in order to provide more variety to the appearance of trains.  As a side effect, this tool will also update any visible cargo if it is out of sync with the wagon's inventory.
- **DLX Livery Selector Tool** - This tool is used to select the livery of DLX wagons and locomotives.  A livery in this case is more than just a color scheme.  It also includes markings and logos and occasionally other minor cosmetic variations.  Each DLX wagon and locomotive will have two or more liveries from which to choose.  Left-clicking (punching) on a DLX wagon or locomotive with this tool changes it to the next livery.  Holding the sneak key while left-clicking on a DLX wagon or locomotive changes it to the previous livery.  As a side effect, this tool will also update any visible cargo if it is out of sync with the wagon's inventory.
- **DLX Wagon Updater Tool** - This tool is used to immediately update a DLX wagon's visible cargo in case it is out of sync with its inventory.  Although the visible cargo of a DLX wagon will automatically update the next time the area of the map is reloaded or the game is restarted, this tool can be used to force an immediate update without leaving the area or the game.   Thus, it can be useful to confirm or update a DLX wagon's visible cargo when the inventory of the wagon has just been changed, either manually or automatically via load and unload tracks.

## Licenses

Copyright © 2021-2022 Marnack

- DlxTrains code is licensed under the GNU AGPL version 3 license.
- Unless otherwise specified, DlxTrains media (models, textures and sounds) are licensed under [CC BY-SA 3.0 Unported](https://creativecommons.org/licenses/by-sa/3.0/).

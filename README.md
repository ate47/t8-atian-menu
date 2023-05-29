# Atian menu

[![YouTube](https://img.shields.io/badge/ate48-%23FF0000.svg?style=for-the-badge&logo=YouTube&logoColor=white)](https://www.youtube.com/user/wilate48) [![Discord](https://img.shields.io/badge/ATESab-%237289DA.svg?style=for-the-badge&logo=discord&logoColor=white)](https://discord.gg/wNH73Sg) [![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white)](https://github.com/ate47)

Mod menu for T8 (Black ops 4) GSC scripts.

Using the compiler: https://github.com/shiversoftdev/t7-compiler

Using the sources: https://github.com/ate47/t8-src

- [Atian menu](#atian-menu)
  - [Posts](#posts)
  - [Config](#config)
  - [Features](#features)
  - [Dev tools](#dev-tools)
    - [Color](#color)
    - [Hash lookup](#hash-lookup)
    - [Create menu](#create-menu)


## Posts

Posts or videos I've made using these scripts or the sources:

- [Reddit - Camo we can't buy anymore](https://www.reddit.com/r/Blackops4/comments/10y963t/if_someone_wants_to_see_the_camos_we_cant_buy/)
- [Reddit - Stats for the care packages](https://www.reddit.com/r/Blackops4/comments/nhonhu/if_you_had_ever_wondered_the_probabilities_in_the/)
- [Blackout Quaknarok](https://www.youtube.com/watch?v=XphuwHYtSjk)
- [GSC Weapon tool](https://www.youtube.com/watch?v=hPBZrQQ7u4c)

## Config

You can config the mod keys in the [`scripts/keyconfig.gsc`](scripts/keyconfig.gsc) file, by default you open it with ADS+Melee.

You can config the mod menu in the [`scripts/config.gsc`](scripts/config.gsc) file, current tools:

- general
  - Force character skin
  - Force weapon camo
  - Enable options at startup
- blackout
  - Force mode
  - Force map
  - Set the zombies spawner types (brutus, avogadro or zombies)
  - Spawn the Icarus
  - Quaknarok
  - Set the health of the avogadro
  - Spawn waterballons
  - Spawn snowballs
- zombies
  - Custom mutation like config to setup your own zombies

## Features

This tool can be paired with the [t8-custom-ee mod](https://github.com/ate47/t8-custom-ee/tree/main) to run EE in custom mutation, casual or offline.

- Tools
  - 3rd person
  - max ammo
  - fly mode (+config for the speeds)
  - no damage
  - Kill all zombies
  - max points (Zombies)
  - max revive (Zombies)
  - set zombies' speed (Zombies)
  - set round (Zombies)
  - ignore me (Zombies)
  - End contracts (Zombies)
- Give weapons
  - All base weapons + upgraded in zombies
  - Wunderwaffe (BO3) (Zombies/Tag der Totten)
  - Tempest/Minigun (BO3) (Multiplayer)
  - Hell retriver, Waterballoons and Snowballs (Blackout)
  - Spectre's Blade (Blackout)
  - Prototypes and remnant from BO3
- Gun tool ([Demo](https://www.youtube.com/watch?v=hPBZrQQ7u4c))
  - Drop weapon
  - TP gun
  - Rocket man
  - Rocket gun
  - Armageddon
  - A10 rocket/minigun, Mantis rocket, Hellstorm rocket, Dart (MP)
  - Elephant riders (IX)
  - Gegenees shot (AE)
  - Darts (BoTD)
  - Nova shot (AO)
- Teleport tool
  - Waypoint tp (Blackout) : TP using the map (need fix for the main map)
  - tp to hot location in your map (wip, not all the maps are available)
- Loading
  - set map
  - set gametype
- Customization
  - set characters
  - Set character skin (+unreleased skin)
  - set skin palette
  - set skin warpaint
  - set skin decals
  - Set weapon camo
  - Set weapon reticle
  - Set weapon mastercraft
- Internal tools
  - GSC system list (+ignored)
  - Loaded EEs list (Zombies)
  - Basic hash_lookup method
  - Entity tp

## Dev tools

### Color

Using `iprintln`: `^0`: red, `^1`: cyan, but only for the whole line.

Using `iprintlnbold`:
- `^0` black (hide)
- `^1` red
- `^2` green
- `^3` yellow
- `^4` blue
- `^5` cyan
- `^6` pink
- `^7` bright yellow

### Hash lookup

The `hash_lookup(hash_str)` function can be used to look for unhashed values, to add a string to this function,
add it to the [`lookup.txt`](lookup.txt) file and run the [`build_lookup.ps1`](build_lookup.ps1) script.

You can create your own version by creating a file named lookup_big.txt and by running `.\build_lookup.ps1 -Big .\lookup_big.txt`, it won't be add to the repo.

If the lookup is too big, the game won't start. TODO: split the switch.

### Create menu

The menu descriptions are usually put in the [`scripts/menu/menu_items.gsc`](scripts/menu/menu_items.gsc) script.

To register a menu, you can call this method:

```gsc
<player> add_menu(menu_id, menu_name, parent_id, create_menu = false, menuenterfunc = undefined);
```

- ``menu_id`` is the id of your menu.
- ``menu_name`` is the name of your menu.
- ``parent_id`` is the parent of your menu, ie: the menu openned if you go the previous menu in your menu. Can be `""` for no parent.
- ``create_menu`` is creating the menu link from the parent to the menu
- ``menuenterfunc`` is the *optional* function to when the used is entering your menu, it will call it with self set to the player and the menu as an argument.

You can then add elements to your menu using

```gsc
<player> add_menu_item(menu_id, item_name, action, actiondata = undefined, actiondata2 = undefined, actiondata3 = undefined, actiondata4 = undefined, actiondata5 = undefined);
<player> add_menu_item_menuswitch(menu_id, item_name, new_menu_id);
<player> add_menu_item_modswitch(menu_id, item_name, mod_name);
```

- `add_menu_item`, add an item with the name `item_name` in the menu `menu_id`, the action is a function, it will be called with the player as self, the item as a 1st parameter and then the actiondataX as 2nd to 6th parameter.
- `add_menu_item_menuswitch`, add an item with the name `item_name` in the menu `menu_id`, it will open the menu `new_menu_id`
- `add_menu_item_modswitch`, add an item with the name `item_name` in the menu `menu_id`, it will toggle the mod `mod_name` and set the menu item to activated by putting on/off on it

You can use this function to check if a mod is activated:

```gsc
<player> is_mod_activated(mod_name);
```
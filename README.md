# Atian menu

[![YouTube](https://img.shields.io/badge/ate48-%23FF0000.svg?style=for-the-badge&logo=YouTube&logoColor=white)](https://www.youtube.com/user/wilate48) [![Discord](https://img.shields.io/badge/ATESab-%237289DA.svg?style=for-the-badge&logo=discord&logoColor=white)](https://discord.gg/wNH73Sg) [![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white)](https://github.com/ate47)

[![Compile scripts](https://github.com/ate47/t8-atian-menu/actions/workflows/compile.yml/badge.svg?branch=master)](https://github.com/ate47/t8-atian-menu/actions/workflows/compile.yml)

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
    - [Functions](#functions)
    - [Create menu](#create-menu)
    - [Key manager](#key-manager)


## Posts

Posts or videos I've made using these scripts or the sources:

- [Reddit - Camo we can't buy anymore](https://www.reddit.com/r/Blackops4/comments/10y963t/if_someone_wants_to_see_the_camos_we_cant_buy/)
- [Reddit - Stats for the care packages](https://www.reddit.com/r/Blackops4/comments/nhonhu/if_you_had_ever_wondered_the_probabilities_in_the/)
- [Blackout Quaknarok](https://www.youtube.com/watch?v=XphuwHYtSjk)
- [GSC Weapon tool](https://www.youtube.com/watch?v=hPBZrQQ7u4c)

## Config

If you don't want to use the menu and only use particular functions from the mod, you can set the value of `no_menu` to `true` in [scripts/config.gsc](scripts/config.gsc).

If the config function is empty, nothing will happen in game.

```c++
self.no_menu = true;
```

You can config the mod keys in the [`scripts/keyconfig.gsc`](scripts/keyconfig.gsc) file, by default you open it with ADS+Melee.

You can config the mod menu in the [`scripts/config.gsc`](scripts/config.gsc) file, current tools:

- general
  - Force character skin
  - Force weapon camo
  - Enable options at startup
  - Set random skin and camo on bots
- blackout
  - Force mode
  - Force map
  - Set the zombies spawner types (brutus, avogadro or zombies)
  - Spawn the Icarus
  - Quaknarok
  - Set the health of the avogadro
  - Spawn waterballons
  - Spawn snowballs
  - Zombies eyes
- multiplayer
  - set draft time
- zombies
  - Allow EEs in custom mutation
  - Custom mutation like config to setup your own zombies
  - Set XP multiplier
  - Quaknarok
  - Open narrative rooms

## Features

This tool can be paired with the [t8-custom-ee mod](https://github.com/ate47/t8-custom-ee/tree/main) to run EE in casual or offline, you don't need it for custom mutations.

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
  - Set XP multiplier (Zombies)
- Give weapons
  - All base weapons + upgraded in zombies
  - Killstreaks
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

### Symbols

You can config the compilation using these options:

- `-DATIAN_MENU_LOOKUP_BIG` : Big lookup structure in array explorer
- `-DATIAN_MENU_DEV` : Run my dev configs

### Error codes

This section is about the error codes you might have while working on GSC scripts, only the fist code is important:

*Note that it's a guess from the way I resolve them and not a true answer*

- `1661383768`, `3559732046`, `2782299909`, `3456527393` or `325402485` - Stack overflow (max is 62)
- `512306404`, `2538360978` - not a pointer (call function/method)
- `3021194485` - Internal Stack overflow
- `3014377421` - Error linking script
- `1670707254` - Error while linking the script, 
  - call of an unknown function/method
  - call of a dev function
  - too many parameters for a call
- `2006839707` - Call of array::add using a undefined or bad array
- `4173088841` - xpak file does not contain a valid header
- `3126405504` - Server script error (set only host to false, open structs)
- `541000416` - unknown (remove config function)
- `5409914266` - unknown
- `5410000416` - unknown (dectop)
- `2658987327` - Corrupt or invalid string reference
- `2681972741` - bad clientfield for name
- `3367037665` - Cannot call SetWorldClientField on 'counter' type clientfield
- `1609894461` - bad entity
- `2104587190` - bad clientfield for name 
- `3523382186` - Event handler is full, can't register event
- `2448966512` - Error plus operation, string too long (max 8192)
- `2873910834` - string with len < 3 with ConvertToString
- `3042707823` - unencrypted string with ConvertToString
- `647662103` - can't be converted to const string (only string,int,float,vector)
- `Whiskey 110 Late tiger` - accessing array like a struct (or not)
- `kilo 45 gold dove` - usage of unset local var
- `Delta 320 Monster Tornado` - unknown
- `Zulu 523 Electric Lion` - unknown

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
add it to the [`lookup/lookup.txt`](lookup/lookup.txt) file and run the [`build_lookup.ps1`](shell_scripts/build_lookup.ps1) script. The array explorer tool is using the [`lookup/lookup_structs.txt`](lookup/lookup_structs.txt) file to search for structure elements.

If the lookup is too big, the game won't start. TODO: split the switch.

You can explore CSV files from the game using the method `get_known_csv_files()` in [enums.gsc](scripts/enums/enums.gsc).

### Functions

```c++
// object type of obj
get_object_type(obj);
// iprintbold msg if the dev mod is activated
<player> debugln(msg);
// test if the dev mod
is_dev_mode();
// test if we are in blackout
is_warzone();
// test if we are in zombies
is_zombies();
// test if we are in multiplayer
is_multiplayer();
```

### Create menu

The menu descriptions are usually put in the [`scripts/core_common/ui/menu_items.gsc`](scripts/core_common/ui/menu_items.gsc) script.

To register a menu, you can call this method:

```c++
<player> add_menu(menu_id, menu_name, parent_id, create_menu = false, menuenterfunc = undefined);
```

- ``menu_id`` is the id of your menu.
- ``menu_name`` is the name of your menu.
- ``parent_id`` is the parent of your menu, ie: the menu openned if you go the previous menu in your menu. Can be `""` for no parent.
- ``create_menu`` is creating the menu link from the parent to the menu
- ``menuenterfunc`` is the *optional* function to when the used is entering your menu, it will call it with self set to the player and the menu as an argument.

You can then add elements to your menu using

```c++
<player> add_menu_item(menu_id, item_name, action, actiondata = undefined, actiondata2 = undefined, actiondata3 = undefined, actiondata4 = undefined, actiondata5 = undefined);
<player> add_menu_item_menuswitch(menu_id, item_name, new_menu_id);
<player> add_menu_item_modswitch(menu_id, item_name, mod_name);
```

- `add_menu_item`, add an item with the name `item_name` in the menu `menu_id`, the action is a function, it will be called with the player as self, the item as a 1st parameter and then the actiondataX as 2nd to 6th parameter.
- `add_menu_item_menuswitch`, add an item with the name `item_name` in the menu `menu_id`, it will open the menu `new_menu_id`
- `add_menu_item_modswitch`, add an item with the name `item_name` in the menu `menu_id`, it will toggle the mod `mod_name` and set the menu item to activated by putting on/off on it

You can use this function to check if a mod is activated:

```c++
<player> is_mod_activated(mod_name);
```

### Key manager

The key manager is in the [`scripts/core_common/key_mgr.gsc`](scripts/core_common/key_mgr.gsc) script.

You can register a key binding in the `key_mgr_init()` function, the syntax is:

```c++
<player> key_mgr_compile_key(hash key_name, undefined|string config, array<string>|string default_config);
```

- `key_name` is the hashed name of the key
- `config` is the config from the user, it follows the same syntax as explained in [scripts/keyconfig.gsc](scripts/keyconfig.gsc).
- `default_config` is the default config, it can be an array or a single key

You can then use the key as you want using these 2 functions:

```c++
// get the key config for this player (work with console controller)
<player> key_mgr_get_key_str(hash key_name) -> string;

// test if a key is pressed and if asked, wait until its release
<player> key_mgr_has_key_pressed(hash key_name, bool wait_release = false) -> bool;
```

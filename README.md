# Atian menu

[![YouTube](https://img.shields.io/badge/ate48-%23FF0000.svg?style=for-the-badge&logo=YouTube&logoColor=white)](https://www.youtube.com/user/wilate48) [![Discord](https://img.shields.io/badge/ATESab-%237289DA.svg?style=for-the-badge&logo=discord&logoColor=white)](https://discord.gg/wNH73Sg) [![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white)](https://github.com/ate47)

[![Compile scripts](https://github.com/ate47/t8-atian-menu/actions/workflows/compile.yml/badge.svg?branch=master)](https://github.com/ate47/t8-atian-menu/actions/workflows/compile.yml)

Mod menu and notes for T8 (Black ops 4).

Using the compiler: https://github.com/shiversoftdev/t7-compiler (Some required features might not be implemented yet)

Using the sources: https://github.com/ate47/t8-src

- [Atian menu](#atian-menu)
  - [Posts](#posts)
  - [Config](#config)
  - [Features](#features)
  - [Dev tools](#dev-tools)
    - [Symbols](#symbols)
    - [Error codes](#error-codes)
    - [Color](#color)
    - [Hash lookup](#hash-lookup)
    - [Functions](#functions)
    - [Create menu](#create-menu)
    - [Key manager](#key-manager)
    - [Advanced compiler features](#advanced-compiler-features)
      - [Lazy links](#lazy-links)
      - [Detours](#detours)
      - [Event function](#event-function)


## Posts

Posts or videos I've made using these scripts, notes or the sources:

- [Reddit - Stats for the care packages](https://www.reddit.com/r/Blackops4/comments/nhonhu/if_you_had_ever_wondered_the_probabilities_in_the/)
- [Blackout Quaknarok](https://www.youtube.com/watch?v=XphuwHYtSjk)
- [GSC Weapon tool](https://www.youtube.com/watch?v=hPBZrQQ7u4c)
- [Some changes of the Black Ops 4 Fandom](https://callofduty.fandom.com/wiki/Cut_Content/Call_of_Duty:_Black_Ops_4)
- [t8-custom-ee](https://github.com/ate47/t8-custom-ee) - A tool to enable EEs in custom mutations, offline or casual
- [atian-cod-tools](https://github.com/ate47/atian-cod-tools) - Some tools related to Call of Duty (with [bo4-source](https://github.com/ate47/bo4-source))

## Config

If you don't want to use the menu and only use particular functions from the mod, you can set the value of `no_menu` to `true` in [scripts/config/global.gsc](scripts/config/global.gsc).

If the config function is empty, nothing will happen in game.

```c++
self.no_menu = true;
```

You can config the mod keys in the [`scripts/config/keys.gsc`](scripts/config/keys.gsc) file, by default you open it with ADS+Melee.

You can config the mod menu in the [`scripts/config`](scripts/config) directory, current tools:

- General
  - Force character skin
  - Force weapon camo
  - Enable options at startup
  - Set random skin and camo on bots
- Blackout
  - Force mode
  - Force map
  - Spawn vehicles
  - Set the zombies spawner types (brutus, avogadro or zombies)
  - Spawn the Icarus (config)
  - Quaknarok
  - Set the health of the avogadro
  - Spawn waterballons
  - Spawn snowballs
  - Zombies eyes
  - Give items
- Multiplayer
  - set draft time
  - Give killstreaks
- Zombies
  - Allow EEs in custom mutation
  - Custom mutation like config to setup your own zombies
  - Set XP multiplier
  - Quaknarok
  - Open narrative rooms
  - Give perks
  - Give powerups

(and others)

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

My notes are in the [notes](notes/) directory.

You also have a doc about the game itself in the [doc](doc/) directory.

Some features might require some modification on the t8-compiler, you can get them [here](https://github.com/ate47/t7-compiler) (search the latest branch).

### Symbols

You can config the compilation using these options:

- `-DATIAN_MENU_LOOKUP_BIG` : Big lookup structure in array explorer
- `-DATIAN_MENU_DEV` : Run my dev configs

### Error codes

This section is about the error codes you might have while working on GSC scripts:

*Note that it's a guess from the way I resolve them and not a true answer*

- `1661383768`, `3559732046`, `2782299909`, `3456527393`, `325402485`, `655503056` - Stack overflow (max is 62)
- `512306404`, `2538360978` - not a pointer (call function/method)
- `3021194485` - Internal Stack overflow
- `3014377421` - Error linking script
- `1670707254` - Error while linking the script, 
  - Unresolved external (call of an unknown function/method)
  - call of a dev function
  - too many parameters for a call
- `1427704235` - add to struct with a non pointer/struct value.
- `1461218623`, `753299086` - Usage of `[index]` on a string/vector with `index >= size(element)` (3 for vector)
- `3314084408`, `3446625973` - Usage of `[index]` on a string/vector with index not an integer.
- `2942156629`, `3488519410` - Usage of the `[]` operator without using a string/vector/array.
- `4106063796` - Usage of the `[index]` operator without on an array without `type(index)=HASH|INTEGER`.
- `2572009355` - usage of `vectorscale(vector,scale)` with a non vector for the vector.
- `2269096660` - usage of `vectorscale(vector,scale)` with a non float/int for the scale factor.
- `2751867714` - usage of `self` as an object, but wasn't.
- `3410121757` - usage of `if`, `||` or `&&` without float|int object
- `3797948576`, `285416523`, `1642120921` - usage of `notify` without a pointer/object(param0) hash/string(param1).
- `2006839707` - Call of array::add using a undefined or bad array.
- `4126096467` - Var ByRef only supported for array types
- `4048135393` - Cannot create a new local variable in the debugger
- `829015102` - var type isn't a field object
- `4173088841` - xpak file does not contain a valid header.
- `3126405504` - Server script error. (set only host to false, open structs)
- `541000416` - unknown (remove config function)
- `5409914266` - unknown
- `5410083603` - unknown (use openluimenu csc/frontend)
- `5410000416` - unknown (dectop)
- `2658987327` - Corrupt or invalid string reference, Can't allocate more string .(VM_OP_GetString)
- `3222417139` - Usage of .size outside of a string or array.
- `2681972741` - bad clientfield for name.
- `3367037665` - Cannot call SetWorldClientField on 'counter' type clientfield.
- `1609894461` - bad entity.
- `2104587190` - bad clientfield for name .
- `3523382186` - Event handler is full, can't register event.
- `2448966512` - Error plus operation, string too long. (max 8192)
- `2873910834` - string with len < 3 with ConvertToString.
- `3042707823` - unencrypted string with ConvertToString.
- `483405794` - Unexpected string type in stringtable.
- `3654063291` - ScrEvent map is full, unable to register new event.
- `1190254947` - waittill must have at least one valid argument.
- `1601358697`, `4032788023` - waittill used without passing a pointer/object value.
- `2346900383`, `1668598749` - waittillmatchtimeout used without passing a pointer/object as param1.
- `369972438` - waittillmatchtimeout used without passing a pointer/struct as param2.
- `240121690` - waittillmatchtimeout must have at least one valid argument.
- `3875481145` - waittillmatch used without passing a pointer/struct as param2.
- `2379198149` - waittillmatch must have at least one valid argument.
- `647662103` - can't be converted to const string (only string,int,float,vector)
- `179749049` - usage of VM_OP_JumpOnTrue with non float/int value
- `2489324310` - Usage of switch with var string|hash|int
- `245612264` - Usage of a foreach using something that isn't an array
- `754846421` - spawnvehicle with bad origin
- `4104994143` - Can't allocate more script variables
- `897625509` - unknown
- `Whiskey 110 Late tiger` - accessing array like a struct (or not)
- `Echo 828 Hurst Scorpio` - tool many vehicles
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

If the lookup is too big, the game won't start.

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
// dynamic version of #ifdef _CSC
is_client();
// log message using compiler::nprintln or using the menu log system.
am_log(str);
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

### Advanced compiler features

Some features are used in this project, I wasn't able to find any explanation outside the ZBR codebase and the t8-compiler code, so here are some explanations.

#### Lazy links

Defined by the symbol `_SUPPORTS_LAZYLINK`, it allows to search at runtime for a function, this is useful to avoid having to include a script to your includes,
in my menu it's mostly to make it cross-compatible between the modes (zm/mp/bo). It can also allow to avoid crashing when a script isn't linked in the frontend,
for example the item-related scripts of Blackout.

**Syntax**
```c++
function_ptr = @TARGET_NAMESPACE<TARGET_SCRIPT>::TARGET_FUNCTION;

[[ function_ptr ]](...);
```

**Example**
```c++
award_melee_weapon = @zm_melee_weapon<scripts\zm_common\zm_melee_weapon.gsc>::award_melee_weapon;

<player> [[ award_melee_weapon ]](#"bowie_knife");
```

#### Detours

Defined by the symbol `_SUPPORTS_DETOURS` (bo4), it allows to replace a function/method it is called, it can have multiple advantages:

- Add callback to a function
- Replace a function behaviors

The detours can't be applied to functions called using autoexec due to the linker.

**Syntax**
```c++
autoexec __init__system__() {
    // apply detours
    compiler::detour();

    // rest of your function
}

detour TARGET_NAMESPACE<TARGET_SCRIPT>::TARGET_FUNCTION() {
    // replace code of the target function
    
    // you can call the function when you want, note that the target script isn't included 
    // by default, so you need to include the script or by using a lazy link.
    
    TARGET_NAMESPACE::TARGET_FUNCTION();
}
```

**Example** (Equivalent of [t8-custom-ee](https://github.com/ate47/t8-custom-ee/))
```c++
detour zm_utility<scripts\zm_common\zm_utility.gsc>::is_ee_enabled() {
    return true;
}
```

#### Event functions

Defined by the symbol `_SUPPORTS_EVENTFUNC`, it allows to listen to an internal game event, most of them are handled by the callbacks core module, but you may want to add yours.

**Syntax**
```c++
// this function will be called using YOUR_EVENT as the event, 
// if you don't know the unhashed name, you can use <event_ffffff> where ffffff is the 32bits hash.
event<YOUR_EVENT> func_name(eventstruct) {
    // your code
}
```

**Example**
```c++
event<player_connect> codecallback_player_co(eventstruct) {
    // called every time a player is connected
    
    // self is the player
}
```

#### Thread endon calls

Defined by the symbol `_SUPPORTS_THREADENDON`, these special calls allow to call a function using thread, but by keeping the current function endon list, so if the current function receive an endon event, the called function will also receive it. You only need to replace the `thread` in your call to `threadendon`


**Example**
```gsc

demo_threadendon() {
    // using this function as example
    self iprintln("start");
    self thread primary_function();

    // we wait 5s
    wait 5.1;
    self iprintln("send notify");
    self notify(#"demo_endonevent");
    wait 5.1;

    self iprintln("end");
}

primary_function() {
    self endon(#"demo_endonevent");

    // using threadendon, secondary will keep the #"demo_endonevent" endon.
    self threadendon secondary_function();
    
    for (i = 0; i < 10; i++) {
        self iprintln("Hello from primary " + i);
        wait 1;
    }
}

secondary_function() {
    // we don't need to write an endon because it is made in the threadendon

    for (i = 0; i < 10; i++) {
        self iprintln("Hello from secondary " + i);
        wait 1;
    }
}
```

The output is 

```
start
Hello from secondary 0
Hello from primary 0
Hello from secondary 1
Hello from primary 1
Hello from secondary 2
Hello from primary 2
Hello from secondary 3
Hello from primary 3
Hello from secondary 4
Hello from primary 4
send notify
end
```

Notice that both functions stop after the notify, by doing the experiment again with a `thread` instead of a `threadendon` the output is different

```
start
Hello from secondary 0
Hello from primary 0
Hello from secondary 1
Hello from primary 1
Hello from secondary 2
Hello from primary 2
Hello from secondary 3
Hello from primary 3
Hello from secondary 4
Hello from primary 4
send notify
Hello from secondary 5
Hello from secondary 6
Hello from secondary 7
Hello from secondary 8
Hello from secondary 9
end
```
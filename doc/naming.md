[Black ops 4 (T8) information...](index.md)

# Naming

- [Naming](#naming)
  - [Global](#global)
    - [Maps](#maps)
    - [Gametypes](#gametypes)
  - [Core](#core)
  - [Multiplayer and Blackout/Warzone](#multiplayer-and-blackoutwarzone)
    - [Killstreaks](#killstreaks)
    - [Gadgets](#gadgets)
    - [Weapons](#weapons)
  - [Zombies](#zombies)
    - [AI](#ai)
    - [Perk](#perk)
    - [AAT](#aat)
    - [Elixirs (bgbs)](#elixirs-bgbs)
    - [Talisman](#talisman)
    - [Trial challenges](#trial-challenges)
    - [Powerup](#powerup)
    - [Weapons](#weapons-1)


## Global

Black Ops 4 is named T8 for Treyarch 8 (8th game)

The internal names of the mode are:

- `cp` - Campaign, Career (cut)
- `mp` - Multiplayer
- `zm` - Zombies
- `wz` - Blackout (Warzone)

### Maps

The map scripts are in the files `scripts/GAMEMODE/MAP_SCRIPT_NAME.[gc]sc`

the `GAMEMODE` is the one described in the previous section and the `MAP_SCRIPT_NAME` is the script name, it can be found in the CASC database or in game using `level.script`.

### Gametypes

The gametype scripts are in the files `scripts/GAMEMODE/gametypes/GAMETYPE_SCRIPT_NAME.[gc]sc`

the `GAMEMODE` is the one described in the previous section and the `GAMETYPE_SCRIPT_NAME` is the script name, using `level.gametype`.

## Core

## Multiplayer and Blackout/Warzone

### Killstreaks

- `scripts/killstreaks/mp/NAME.[gc]sc`

### Gadgets

- `scripts/abilities/gadgets/gadget_NAME.[gc]sc`
- `scripts/abilities/mp/gadgets/gadget_NAME.[gc]sc`
- `scripts/abilities/wz/gadgets/gadget_NAME.[gc]sc`

### Weapons

- `scripts/weapons/NAME.[gc]sc`
- `scripts/weapons/mp/NAME.[gc]sc`
  
## Zombies

All of the names starts with `zm_`

### AI

- `scripts/zm/ai/zm_ai_NAME.[gc]sc` (archetype)
- `scripts/zm/archetype/archetype_NAME.[gc]sc` (archetype)
- `scripts/zm/ai/zm_ai_NAME_interface.[gc]sc` (archetype interface)
- `scripts/zm/archetype/archetype_NAME_interface.[gc]sc` (archetype interface)


### Perk

- `scripts/zm/perk/zm_perk_NAME.[gc]sc`

### AAT

- `scripts/zm_common/aats/zm_aat_NAME.[gc]sc`

### Elixirs (bgbs)

- `scripts/zm_common/bgbs/zm_bgb_NAME.[gc]sc`

### Talisman

- `scripts/zm_common/talisman/zm_talisman_NAME.[gc]sc`

### Trial challenges

- `scripts/zm_common/trials/zm_trial_(MAP_)?NAME.[gc]sc`

the MAP can be the zombies map, example `zm_trial_mansion_billiards` for `zm_mansion` (dotn)

### Powerup

- `scripts/zm/powerup/zm_powerup_NAME.[gc]sc`

### Weapons

- `scripts/zm/weapons/zm_weap_NAME.[gc]sc`

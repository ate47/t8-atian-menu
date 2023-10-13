[...home](README.md)

- [API calls](#api-calls)
  - [Parameters](#parameters)
    - [platform](#platform)
    - [title](#title)
    - [username](#username)
    - [unoId](#unoid)
    - [locale](#locale)
    - [item](#item)
    - [slot](#slot)
    - [preference](#preference)
    - [gameMode](#gamemode)


# API calls

You can find the extracted URLs from the COD companion app in the [apicall.csv](apicall.csv) file.

## Parameters

In the API calls, you can find different parameters.

### platform

Platform of the user

**Value**: 

- `xbl`: Xbox Live
- `battle`: Battle net
- `psn`: PlayStation Network
- `steam`: Steam
- `uno`: Activision

### title

Game title

**Value**: 

- `bo3`: Call of Duty: Black Ops 3
- `bo4`: Call of Duty: Black Ops 4
- `cw`: Call of Duty: Black Ops Cold War
- `vg`: Call of Duty: Vanguards
- `mw`: Call of Duty: Modern Warfare 2019
- `mw2`: Call of Duty: Modern Warfare 2022
- `iw`: Call of Duty: Infinite Warfare
- `ww2`: Call of Duty: World War 2


### username

Username/identifier of the user

**Value**: Your username, with the `#` for uno/battle

### unoId

Uno ID of an user

**Value**: Uno ID

### locale

The asked locale, aka the language/dialect

**Value**: example: `en` for English, `fr` for French, etc.

### item

Show item

**Value**: item

### slot

Loadout slot id

**Value**: slot id

### preference

Loadout preference id

**Value**: preference id

### gameMode

Depends on the previous path parameter

- type (Multiplayer/BR/Zombies)
- gameType (TDM,FFA,etc.), if it is asked for a gameType, 

**Value**: Gamemodes

- `mp`: Multiplayer
- `wz`: Blackout(BO4)/Warzone(MW19/22)/Fireteam(CW) (Blackout/fireteam's internal name is Warzone)
- `zm`: Zombies


**Value**: Gametypes

*This list can be long, here are the gamemode for BO4 as an example: hc = Hardcore, cwl = Cod World League*

- `conf`: Kill confirm
- `conf_hc`: Kill confirm HC
- `ctf`: Capture the flag
- `dm`: Demolition
- `dm_hc`: Demolition HC
- `dom`: Domination
- `dom_hc`: Domination HC
- `dom_snipe_bb`: Domination Sniper only
- `dom_bb`: Domination long
- `dom_bb_hc`: Domination long HC
- `dom_dm`: Domination deathmatch
- `gun`: Gun game
- `gun_hc`: Gun game HC
- `koth`: Hardpoint
- `koth_bb`: Hardpoint long
- `koth_cwl`: Hardpoint CWL
- `infect`: Infected
- `infect_hc`: Infected HC
- `prop`: Prophunt
- `prop_hc`: Prophunt HC
- `sd`: Search and destroy
- `sd_bb`: Search and destroy ???
- `sd_hc`: Search and destroy HC
- `sd_cwl`: Search and destroy CWL
- `tdm`: Team deathmatch
- `tdm_hc`: Team deathmatch HC
- `tdm_bb`: Team deathmatch long
- `tdm_bb_hc`: Team deathmatch long HC
- `tdm_snipe_bb`: Team deathmatch Sniper only
- `control`: Control 
- `control_hc`: Control HC
- `control_cwl`: Control CWL
- `bounty`: ???
- `bounty_hc`: ??? HC
- `escort`: Escort
- `escort_hc`: Escort HC
- `oic`: ???
- `clean`: ???
- `sas`: Stick and stones
- `sas_hc`: Stick and stones HC
- `warzone_solo`: Blackout solo
- `warzone_duo`: Blackout duo
- `warzone_quad`: Blackout quad
- `warzone_escape_duo_dbno`: Blackout alcatraz duo
- `warzone_escape_quad_dbno`: Blackout alcatraz quad
- `warzone_hot_pursuit`: Blackout hot pursuit

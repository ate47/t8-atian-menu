[Black ops 4 (T8) information...](index.md)

# Maps and gametypes

- [Maps and gametypes](#maps-and-gametypes)
  - [Maps](#maps)
    - [Multiplayer](#multiplayer)
    - [Blackout](#blackout)
    - [Zombies](#zombies)
  - [Gametypes](#gametypes)
    - [Multiplayer](#multiplayer-1)
      - [Modes crashing the game](#modes-crashing-the-game)
    - [Blackout](#blackout-1)
    - [Zombies](#zombies-1)


You can load a map with the function

```c++
map(string map_name);
```

it will set the map with the same gametype,

but you can also using the switchmap functions, it will load the map with a particular gametype, the wait is important, I don't know why.

```c++
switchmap_load(string map, string gametype);
wait(1);
switchmap_switch();
```

## Maps

### Multiplayer

- `mp_austria` - Der Schatten
- `mp_cairo` - Havana
- `mp_casino` - Casino
- `mp_cosmodrome` - Launch
- `mp_elevation` - Elevation
- `mp_embassy` - Masquerade
- `mp_firingrange2` - Firing Range
- `mp_firingrange2_alt` - Firing Range Night
- `mp_frenetic` - Frequency
- `mp_geothermal` - Artifact
- `mp_gridlock` - Gridlock
- `mp_grind` - Grind
- `mp_hacienda` - Hacienda
- `mp_hacienda_alt` - Hacienda Twilight
- `mp_icebreaker` - Icebreaker
- `mp_jungle2` - Jungle
- `mp_jungle2_alt` - Jungle Flooded
- `mp_madagascar` - Madagascar
- `mp_maldives` - Lair
- `mp_militia` - Militia
- `mp_morocco` - Morroco
- `mp_mountain2` - Summit
- `mp_nuketown_4` - Nuketown (Иuk3toши)
- `mp_offshore` - Contraband
- `mp_offshore_alt` - Contraband Hurricane
- `mp_russianbase` - WMD
- `mp_seaside` - Seaside
- `mp_seaside_alt` - Seaside Sunset
- `mp_silo` - Payload
- `mp_slums2` - Slums
- `mp_station` - Lockup
- `mp_urban` - Arsenal 
- `mp_urban_alt` - Arsenal Sandstorm (Crash the game, no start video)
- `mp_zombie_museum` - Remnant


### Blackout

- `wz_open_skyscrapers` - Blackout Core Map
- `wz_open_skyscrapers_alt` - Blackout Core Map Alternative version (Crash the game, no start video)
- `wz_escape` - Alcatraz
- `wz_escape_alt` - Alcatraz Night

### Zombies

- `zm_zodt8` - Voyage of Despair
- `zm_towers` - IX
- `zm_escape` - Blood of the Dead
- `zm_office` - Classified
- `zm_mansion` - Dead of the Night
- `zm_red` - Ancient Evil
- `zm_white` - Alpha Omega
- `zm_orange` - Tag der Toten

## Gametypes

### Multiplayer

**Info**

- (BB) ??
- (CWL) Cod World League rules
- (HC) Hardcore

**Modes**

- `conf` - KC
- `conf_hc` - KC (HC)
- `ctf` - Capture the flag
- `ctf_hc`- Capture the flag (HC)
- `ctf_bb` - Capture the flag (BB)
- `ctf_bb_hc` - Capture the flag (BB HC)
- `dom` - Domination
- `dom_hc` - Domination (HC)
- `dom_snipe_bb` - Domination sniper only
- `dom_bb` - Domination (BB)
- `dom_bb_hc` - Domination (BB HC)
- `dom_dm` - Domination team deathmatch
- `dom_cwl` - Domination (CWL)
- `gun` - Gun games
- `gun_hc` - Gun games (HC)
- `koth` - Hardpoint
- `koth_hc` - Hardpoint (HC)
- `koth_bb` - Hardpoint (BB)
- `koth_cwl` - Hardpoint (CWL)
- `infect` - Infected
- `infect_hc` - Infected (HC)
- `prop` - Prop hunt
- `prop_hc` - Prop hunt (HD)
- `sd` - Search and destroy
- `sd_bb` - Search and destroy (BB)
- `sd_hc` - Search and destroy (HC)
- `sd_cwl` - Search and destroy (CWL)
- `tdm` - Team deathmatch
- `tdm_hc` - Team deathmatch (HC)
- `tdm_bb` - Team deathmatch (BB)
- `tdm_bb_hc` - Team deathmatch (BB HC)
- `tdm_snipe_bb` - Team deathmatch sniper only (BB)
- `control` - Control
- `control_bb` - Control (BB)
- `control_hc` - Control (HC)
- `control_cwl` - Control (CWL)
- `escort` - Escort
- `escort_hc` - Escort (HC)
- `sas` - Sticks and stones
- `sas_hc` - Sticks and stones (HC)
- `oic` - One in the chamber
- `bounty` - bounty
- `bounty_hc` - bounty_hc
- `clean` - clean

#### Modes crashing the game

- `dm` - Demolition
- `dm_hc` - Demolition (HC)

### Blackout

- `warzone_solo` - solo
- `warzone_duo` - duo
- `warzone_quad` - quad
- `warzone_escape_duo_dbno` - alcatraz portal duo
- `warzone_escape_quad_dbno` - alcatraz portal quad
- `warzone_hot_pursuit` - hot pursuit
- `warzone_heavy_metal_heroes` - heavy metal heroes
- `warzone_hardcore_solo` - hardcore solo
- `warzone_hardcore_duo` - hardcore duo
- `warzone_hardcore_quad` - hardcore quad
- `warzone_escape_solo` - escape solo
- `warzone_bigteam_dbno_quad` - Ground war
- `warzone_pandemic_quad` - pandemic (**script error with alcatraz, only for the base map**)
- `warzone_ambush_solo` - Ambush solo (**script error**)
- `warzone_ambush_duo` - Ambush duo (**script error**)
- `warzone_ambush_quads` - Ambush quads (**script error**)
- `warzone_heavy_metal` - heavy metal (no heroes) (**script error**)
- `warzone_spectre_rising` - spectre rising DLC (**crash the game**)
### Zombies

- `zclassic` - Classic mode
- `zstandard` - Rush mode
- `ztrials` - trials
- `ztutorial` - tutorial
- `ztcm_towers` - ?
- `ztcm_escape` - ?
- `ztcm_zod` - ?
- `ztcm` - ?

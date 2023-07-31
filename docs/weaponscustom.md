[Black ops 4 (T8) information...](index.md)

# Weapon customization

- [Weapon customization](#weapon-customization)
  - [Camos](#camos)
    - [Multiplayer](#multiplayer)
    - [Blackout](#blackout)
    - [Zombies](#zombies)
    - [Mastery](#mastery)
    - [Pack a punch](#pack-a-punch)
    - [Black market (Reactive)](#black-market-reactive)
    - [Black market](#black-market)
  - [Reticles](#reticles)
  - [Mastercraft / MK2](#mastercraft--mk2)


You can customize a weapon when giving it using weapon options, you can build them using the method

```c++
<player> calcweaponoptions(int camo_id, int reticle_id = 0, int mastercraft_id = 0, bool unknown4 = false, bool unknown5 = false) -> int;
```

- `camo_id` is the camo ID, 0 for default
- `reticle_id` is the mastercraft ID, 0 for default
- `mastercraft_id` is the reticle ID, 0 for default
  - **Warning**: a bad camo or reticle id is fine, but a bad mastercraft id will **crash your game**!
- `unknown4` i don't know (yet), but it's a boolean
- `unknown5` i don't know (yet), but it's a boolean

then you add it while giving the weapon

```c++
<player> giveweapon(Weapon weapon, int weapon_options);
```

you can also set the camo of a weapon without the weapon options using the method, it will bypass the reactive camo scripts.

```c++
<player> setcamo(Weapon weapon, int camo_id);
```

A weapon_options is an int (all the numbers will be shown using base 16)

by default this number is `x = 0x400000000`

- Then the camo ID is applied using `x | camo_id`, example for `camo_id=0xC4`: `0x4000000C4`

- The reticle ID is applied using `x | (reticle_id << 14)`, example for `reticle_id=0x01`: `0x400004000`

- The mastercraft ID is applied using `x | (mastercraft_id << 41)`, example for `mastercraft_id=0x02`: `0x40400000000`

- The unknown4 boolean is applied using `x | (unknown4 << 45)`, example for `mastercraft_id=0x02`: `0x200400000000`

- The unknown5 boolean is applied using `x | (unknown5 << 22)`, example for `mastercraft_id=0x02`: `0x400400000`


## Camos

### Multiplayer

| name | id |
|------|----|
| generic mp 1 | 1 |
| generic mp 2 | 4 |
| generic mp 3 | 7 |
| generic mp 4 | 10 |
| generic mp 5 | 13 |
| generic mp 6 | 16 |
| generic mp 7 | 19 |
| generic mp 8 | 22 |
| generic mp 9 | 25 |
| generic mp 10 | 28 |
| generic mp 11 | 31 |
| generic mp 12 | 34 |
| generic mp 13 | 37 |
| generic mp 14 | 40 |

### Blackout

| name | id |
|------|----|
| generic blk 1 | 2 |
| generic blk 2 | 5 |
| generic blk 3 | 8 |
| generic blk 4 | 11 |
| generic blk 5 | 14 |
| generic blk 6 | 17 |
| generic blk 7 | 20 |
| generic blk 8 | 23 |
| generic blk 9 | 26 |
| generic blk 10 | 29 |
| generic blk 11 | 32 |
| generic blk 12 | 35 |
| generic blk 13 | 38 |
| generic blk 14 | 41 |

### Zombies

| name | id |
|------|----|
| generic zm 1 | 3 |
| generic zm 2 | 6 |
| generic zm 3 | 9 |
| generic zm 4 | 12 |
| generic zm 5 | 15 |
| generic zm 6 | 18 |
| generic zm 7 | 21 |
| generic zm 8 | 24 |
| generic zm 9 | 27 |
| generic zm 10 | 30 |
| generic zm 11 | 33 |
| generic zm 12 | 36 |
| generic zm 13 | 39 |
| generic zm 14 | 42 |

### Mastery

| name | id |
|------|----|
| Gold | 43 |
| Diamond | 44 |
| Dark matter | 45 |
| Diamond (Last tier) | 199 |
| Dark matter (Last tier) | 192 |

### Pack a punch

You don't need to be in Zombies to use these camos.

| name | id |
|------|----|
| Voyage of despair purple | 146 |
| Voyage of despair red | 147 |
| Voyage of despair green | 148 |
| Voyage of despair yellow | 149 |
| Voyage of despair pink | 150 |
| IX blue | 151 |
| IX red | 152 |
| IX green | 153 |
| IX purple | 154 |
| IX orange | 155 |
| Blood of the Dead yellow | 156 |
| Blood of the Dead red | 157 |
| Blood of the Dead yellow | 158 |
| Blood of the Dead green | 159 |
| Blood of the Dead purple | 160 |
| Classified 1 | 161 |
| Classified 2 | 162 |
| Classified 3 | 163 |
| Classified 4 | 164 |
| Classified 5 | 165 |
| Dead of the night green | 280 |
| Dead of the night purple | 281 |
| Dead of the night red | 282 |
| Dead of the night blue | 283 |
| Dead of the night orange | 284 |
| Ancien Evil purple | 74 |
| Ancien Evil blue | 75 |
| Ancien Evil orange | 76 |
| Ancien Evil yellow | 77 |
| Ancien Evil green | 78 |
| Alpha Omega | 345 |
| Tag der toten | 394 |

### Black market (Reactive)

I'm French and my game isn't in English so I don't have access to the English name, I tried my best to translate them, but it's still a weird mix between French and English-Translated names, sorry.

| name | id |
|------|----|
| D-Day | 298 |
| Roadtrip | 300 |
| Masked | 310 |
| Bobine | 52 |
| Search | 57 |
| Strip | 62 |
| Rave | 67 |
| Nebula | 89 |
| After life | 90 |
| Postluminescence | 119 |
| 115 | 129 |
| Grey matter | 131 |
| Denied access (waifu) | 167 |
| Skull | 168 |
| Solar eruption | 381 |
| Vision of the future | 387 |
| Pestilence | 389 |
| Crypted | 286 |
| Judas | 357 |
| Incandescent | 359 |
| Encoded | 363 |

### Black market

I'm French and my game isn't in English so I don't have access to the English name, so it's a weird mix between French and English-Translated names, sorry.


| name | id |
|------|----|
| Twitch 1 | 79 |
| Twitch 2 | 118 |
| $ | 46 |
| Green course | 47 |
| Blue | 48 |
| Kiss | 49 |
| Fortuna | 50 |
| Donuts | 51 |
| Serment | 80 |
| Imbu | 81 |
| Megalodon | 82 |
| Surf | 83 |
| Goinfre | 84 |
| Chrysalide | 86 |
| Locker | 87 |
| Bacon | 117 |
| Dead time | 120 |
| Dirty buble | 121 |
| Heaven | 122 |
| Pique nique royal | 123 |
| Mai Tai Zombie | 124 |
| Heaven | 122 |
| Colonne piégée | 126 |
| Derezzed | 134 |
| Steam explosion | 135 |
| Goinfre | 136 |
| Arabesque | 137 |
| Se sentir visé | 166 |
| Rampage | 170 |
| Soul eater | 171 |
| Marathon | 172 |
| Avant garde | 173 |
| Plasma | 293 |
| Air fight | 305 |
| Cherry | 314 |
| Gigakiller | 315 |
| Flicker | 316 |
| Rocket box | 317 |
| USA | 346 |
| Juicy | 347 |
| Glyph | 348 |
| Gratte-gratte | 350 |
| Flocon | 351 |
| Vertige | 353 |
| High tension | 354 |
| Gluant | 355 |


## Reticles

Tested with the base reflex.

Some reticles have variants, you can add to the id 1..number_variants to get it.

|Name|Id|Number of variants|
|-|-|-|
| Dot | 0 | 4 |
| Dot+ | 5 | 4 |
| Nord | 10 | 4 |
| Echelon | 15 | 4 |
| Clamp | 20 | 4 |
| Circle | 25 | 4 |
| Cross | 30 | 4 |
| Mustache | 35 | 4 |
| Square | 40 | 4 |
| Cross | 45 | 4 |
| King | 50 | 0 |
| Circle | 51 | 4 |
| Clamp | 56 | 4 |
| Circle | 61 | 4 |
| Treyarch | 66 | 0 |
| Anchor | 67 | 0 |

## Mastercraft / MK2

|weapon id|mastercraft Id|description|
|---------|--------------|-----------|
| `ar_accurate_t8` | 1 | MK2 |
| `ar_accurate_t8` | 2 | MC 1 |
| `ar_accurate_t8` | 3 | MC 2 |
| `ar_damage_t8` | 1 | MK2 |
| `ar_damage_t8` | 2 | MC |
| `ar_fastfire_t8` | 1 | MK2 |
| `ar_fastfire_t8` | 2 | MC |
| `ar_modular_t8` | 1 | MK2 |
| `ar_modular_t8` | 2 | MC |
| `ar_modular_t8` | 3 | MC |
| `ar_stealth_t8` | 3 | MK2 |
| `ar_stealth_t8` | 2 | MC VAmPiRe |
| `ar_peacekeeper_t8` | 1 | MK2 |
| `ar_standard_t8` | 1 | MK2 |
| `ar_standard_t8` | 2 | MC |
| `lmg_standard_t8` | 1 | MK2 |
| `lmg_standard_t8` | 2 | MC |
| `lmg_heavy_t8` | 3 | MK2 |
| `lmg_heavy_t8` | 2 | MC |
| `lmg_spray_t8` | 1 | MC |
| `lmg_stealth_t8` | 1 | MK2 |
| `pistol_standard_t8` | 1 | MK2 |
| `pistol_standard_t8` | 2 | MC |
| `pistol_burst_t8` | 2 | MC |
| `pistol_revolver_t8` | 3 | MK2 |
| `pistol_revolver_t8` | 2 | MC |
| `pistol_fullauto_t8` | 1 | MK2 |
| `pistol_fullauto_t8` | 2 | MC |
| `shotgun_pump_t8` | 2 | MK2 |
| `shotgun_pump_t8` | 3 | MC |
| `shotgun_semiauto_t8` | 1 | MK2 |
| `shotgun_semiauto_t8` | 2 | MC |
| `shotgun_fullauto_t8` | 1 | MK2 |
| `shotgun_fullauto_t8` | 2 | MC |
| `smg_accurate_t8` | 1 | MK2 |
| `smg_accurate_t8` | 2 | MC 1 |
| `smg_accurate_t8` | 2 | MC 2 |
| `smg_capacity_t8` | 2 | MK2 |
| `smg_capacity_t8` | 3 | MC |
| `smg_fastfire_t8` | 3 | MK2 |
| `smg_fastfire_t8` | 2 | MC |
| `smg_handling_t8` | 3 | MK2 |
| `smg_handling_t8` | 2 | MC |
| `smg_standard_t8` | 1 | MK2 |
| `smg_standard_t8` | 2 | MC |
| `smg_fastburst_t8` | 1 | MK2 |
| `smg_fastburst_t8` | 2 | MC |
| `smg_folding_t8` | 1 | MK2 |
| `sniper_fastrechamber_t8` | 2 | MC |
| `sniper_mini14_t8` | 1 | MK2 |
| `sniper_powerbolt_t8` | 3 | MK2 |
| `sniper_powerbolt_t8` | 2 | MC |
| `sniper_powersemi_t8` | 2 | MC |
| `sniper_quickscope_t8` | 1 | MK2 |
| `sniper_quickscope_t8` | 2 | MC |
| `tr_flechette_t8` | 2 | MK2 |
| `tr_flechette_t8` | 1 | MC |
| `tr_longburst_t8` | 3 | MK2 |
| `tr_longburst_t8` | 2 | MC |
| `tr_midburst_t8` | 3 | MK2 |
| `tr_midburst_t8` | 2 | MC |

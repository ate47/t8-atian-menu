[...home](README.md)

- [CDN](#cdn)
  - [Items](#items)
  - [Maps](#maps)
  - [Squad icons](#squad-icons)
  - [Banners](#banners)
    - [The default banner](#the-default-banner)
    - [Mode banner](#mode-banner)
    - [Season pass banner](#season-pass-banner)
  - [Ranks](#ranks)
    - [BO4](#bo4)
    - [Modern Warfare 2019](#modern-warfare-2019)
    - [Cold War / Vanguard](#cold-war--vanguard)
  - [Mode images](#mode-images)
  - [Pegi](#pegi)
  - [Random URIs](#random-uris)


# CDN

The CDN URL is:

- `https://mblcdn-callofduty-com.akamaized.net/cod/cdn/app`
- `https://www.callofduty.com/cdn/app` (redirection)

## Items

```
https://www.callofduty.com/cdn/app/icons/{{title}}/combatrecord/{{itemName}}.png
```

Fetch the item `{{itemName}}` image

**Example**

```
https://www.callofduty.com/cdn/app/icons/bo4/combatrecord/melee_slaybell_t8.png
https://www.callofduty.com/cdn/app/icons/bo4/combatrecord/ww_freezegun_t8.png
https://www.callofduty.com/cdn/app/icons/bo4/combatrecord/shotgun_semiauto_t8.png
```

<img src="https://www.callofduty.com/cdn/app/icons/bo4/combatrecord/melee_slaybell_t8.png" width="200" alt="BO4 Slaybell" /> <img src="https://www.callofduty.com/cdn/app/icons/bo4/combatrecord/ww_freezegun_t8.png" width="200" alt="BO4 Slaybell" /> <img src="https://www.callofduty.com/cdn/app/icons/bo4/combatrecord/shotgun_semiauto_t8.png" width="200" alt="BO4 SG12" />


## Maps

Like explained in [maps](maps.md), you can fetch the map images via the URI

```
https://www.callofduty.com/cdn/app/base-maps/{{title}}/{{mapName}}.jpg
```

You can also have the HUD interface, the image might need the `-inverted` suffix.

```
https://www.callofduty.com/cdn/app/maps/{{title}}/hud_minimap_{{mapName}}.jpg
https://www.callofduty.com/cdn/app/maps/{{title}}/hud_minimap_{{mapName}}-inverted.jpg
```

**Example**

```
https://www.callofduty.com/cdn/app/base-maps/bo4/wz_open_skyscrapers.jpg
https://www.callofduty.com/cdn/app/base-maps/bo4/mp_urban_alt.jpg
https://my.callofduty.com/cdn/app/base-maps/cw/wz_sanatorium.jpg

https://www.callofduty.com/cdn/app/maps/bo4/hud_minimap_wz_open_skyscrapers.jpg
https://www.callofduty.com/cdn/app/maps/bo4/hud_minimap_mp_urban-inverted.jpg
https://www.callofduty.com/cdn/app/maps/cw/hud_minimap_wz_sanatorium.jpg
```

<img src="https://www.callofduty.com/cdn/app/base-maps/bo4/wz_open_skyscrapers.jpg" width="250" alt="Blackout core map BO4" /> <img src="https://www.callofduty.com/cdn/app/base-maps/bo4/mp_urban_alt.jpg" width="250" alt="Arsenal Sandstorm BO4" /> <img src="https://www.callofduty.com/cdn/app/base-maps/cw/wz_sanatorium.jpg" width="250" alt="Sanatorium CW" />

<img src="https://www.callofduty.com/cdn/app/maps/bo4/hud_minimap_wz_open_skyscrapers.jpg" width="250" alt="Blackout core map BO4 HUD" /> <img src="https://www.callofduty.com/cdn/app/maps/bo4/hud_minimap_mp_urban-inverted.jpg" width="250" alt="Arsenal Sandstorm BO4 HUD" /> <img src="https://www.callofduty.com/cdn/app/maps/cw/hud_minimap_wz_sanatorium.jpg" width="250" alt="Sanatorium CW HUD" />

## Squad icons

Basic icons for the squads

```
https://www.callofduty.com/cdn/app/squads/icons/squad-icon{1-10}.png
```
```
https://www.callofduty.com/cdn/app/squads/icons/squad-icon1.png
https://www.callofduty.com/cdn/app/squads/icons/squad-icon2.png
https://www.callofduty.com/cdn/app/squads/icons/squad-icon3.png
https://www.callofduty.com/cdn/app/squads/icons/squad-icon4.png
https://www.callofduty.com/cdn/app/squads/icons/squad-icon5.png
https://www.callofduty.com/cdn/app/squads/icons/squad-icon6.png
https://www.callofduty.com/cdn/app/squads/icons/squad-icon7.png
https://www.callofduty.com/cdn/app/squads/icons/squad-icon8.png
https://www.callofduty.com/cdn/app/squads/icons/squad-icon9.png
https://www.callofduty.com/cdn/app/squads/icons/squad-icon10.png
```

<img src="https://www.callofduty.com/cdn/app/squads/icons/squad-icon1.png" width="100" alt="Squad icon 1" /> <img src="https://www.callofduty.com/cdn/app/squads/icons/squad-icon2.png" width="100" alt="Squad icon 2" /> <img src="https://www.callofduty.com/cdn/app/squads/icons/squad-icon3.png" width="100" alt="Squad icon 3" /> <img src="https://www.callofduty.com/cdn/app/squads/icons/squad-icon4.png" width="100" alt="Squad icon 4" /> <img src="https://www.callofduty.com/cdn/app/squads/icons/squad-icon5.png" width="100" alt="Squad icon 5" /> <img src="https://www.callofduty.com/cdn/app/squads/icons/squad-icon6.png" width="100" alt="Squad icon 6" /> <img src="https://www.callofduty.com/cdn/app/squads/icons/squad-icon7.png" width="100" alt="Squad icon 7" /> <img src="https://www.callofduty.com/cdn/app/squads/icons/squad-icon8.png" width="100" alt="Squad icon 8" /> <img src="https://www.callofduty.com/cdn/app/squads/icons/squad-icon9.png" width="100" alt="Squad icon 9" /> <img src="https://www.callofduty.com/cdn/app/squads/icons/squad-icon10.png" width="100" alt="Squad icon 10" />

## Banners

Current career banner image, image to display a mode in a game,

### The default banner

```
https://www.callofduty.com/cdn/app/banners/combatrecord/career_default.png
```

<img src="https://www.callofduty.com/cdn/app/banners/combatrecord/career_default.png" width="300" alt="Career image" />

### Mode banner

```
https://www.callofduty.com/cdn/app/banners/combatrecord/career_{{title}}_{{gameMode}}.png
```

**Example**


```
https://www.callofduty.com/cdn/app/banners/combatrecord/career_cw_zm.png
https://www.callofduty.com/cdn/app/banners/combatrecord/career_cw_wz.png
https://www.callofduty.com/cdn/app/banners/combatrecord/career_mw_wz.png
https://www.callofduty.com/cdn/app/banners/combatrecord/career_vg_mp.png
```

<img src="https://www.callofduty.com/cdn/app/banners/combatrecord/career_cw_zm.png" width="200" alt="Career image" /> <img src="https://www.callofduty.com/cdn/app/banners/combatrecord/career_cw_wz.png" width="200" alt="Career image" /> <img src="https://www.callofduty.com/cdn/app/banners/combatrecord/career_mw_wz.png" width="200" alt="Career image" /> <img src="https://www.callofduty.com/cdn/app/banners/combatrecord/career_vg_mp.png" width="200" alt="Career image" />

### Season pass banner

Season pass, was introduced during MW19, might not work for all the seasons

```
https://my.callofduty.com/cdn/app/banners/battle_pass/{{title}}/battle_pass_billboard_{{season_id}}.jpg
```

```
https://my.callofduty.com/cdn/app/banners/battle_pass/cw/battle_pass_billboard_1.jpg
https://my.callofduty.com/cdn/app/banners/battle_pass/cw/battle_pass_billboard_2.jpg
https://my.callofduty.com/cdn/app/banners/battle_pass/cw/battle_pass_billboard_3.jpg
https://my.callofduty.com/cdn/app/banners/battle_pass/cw/battle_pass_billboard_4.jpg
https://my.callofduty.com/cdn/app/banners/battle_pass/cw/battle_pass_billboard_5.jpg
https://my.callofduty.com/cdn/app/banners/battle_pass/cw/battle_pass_billboard_6.jpg
https://my.callofduty.com/cdn/app/banners/battle_pass/vg/battle_pass_billboard_1.jpg
https://my.callofduty.com/cdn/app/banners/battle_pass/vg/battle_pass_billboard_2.jpg
https://my.callofduty.com/cdn/app/banners/battle_pass/vg/battle_pass_billboard_3.jpg
https://my.callofduty.com/cdn/app/banners/battle_pass/vg/battle_pass_billboard_4.jpg
https://my.callofduty.com/cdn/app/banners/battle_pass/vg/battle_pass_billboard_5.jpg
```

<img src="https://my.callofduty.com/cdn/app/banners/battle_pass/cw/battle_pass_billboard_1.jpg" width="200" alt="Career image" /> <img src="https://my.callofduty.com/cdn/app/banners/battle_pass/cw/battle_pass_billboard_2.jpg" width="200" alt="Career image" /> <img src="https://my.callofduty.com/cdn/app/banners/battle_pass/cw/battle_pass_billboard_3.jpg" width="200" alt="Career image" /> <img src="https://my.callofduty.com/cdn/app/banners/battle_pass/cw/battle_pass_billboard_4.jpg" width="200" alt="Career image" /> <img src="https://my.callofduty.com/cdn/app/banners/battle_pass/cw/battle_pass_billboard_5.jpg" width="200" alt="Career image" /> <img src="https://my.callofduty.com/cdn/app/banners/battle_pass/cw/battle_pass_billboard_6.jpg" width="200" alt="Career image" /> <img src="https://my.callofduty.com/cdn/app/banners/battle_pass/vg/battle_pass_billboard_1.jpg" width="200" alt="Career image" /> <img src="https://my.callofduty.com/cdn/app/banners/battle_pass/vg/battle_pass_billboard_2.jpg" width="200" alt="Career image" /> <img src="https://my.callofduty.com/cdn/app/banners/battle_pass/vg/battle_pass_billboard_3.jpg" width="200" alt="Career image" /> <img src="https://my.callofduty.com/cdn/app/banners/battle_pass/vg/battle_pass_billboard_4.jpg" width="200" alt="Career image" /> <img src="https://my.callofduty.com/cdn/app/banners/battle_pass/vg/battle_pass_billboard_5.jpg" width="200" alt="Career image" />


## Ranks

The rank or prestige number should be padded with a 0 to have 2 numbers, `1` -> `01`, `35` -> `35`. Sometimes you will have the large icon by adding `_large`, sometimes not, same without it, it's also not the same URIs depending on the title.

### BO4

```
https://www.callofduty.com/cdn/app/icons/bo4/ranks/{{mode}}/ui_icon_rank_mp_level{{rank}}_large.png
https://www.callofduty.com/cdn/app/icons/bo4/prestige/{{mode}}/ui_icon_mp_prestige_{{prestige}}_large.png
```


```
https://www.callofduty.com/cdn/app/icons/bo4/ranks/mp/ui_icon_rank_mp_level55.png
https://www.callofduty.com/cdn/app/icons/bo4/prestige/wz/ui_icon_wz_prestige_08_large.png
https://www.callofduty.com/cdn/app/icons/bo4/prestige/zm/ui_icon_zm_prestige_11_large.png
https://www.callofduty.com/cdn/app/icons/bo4/ranks/wz/ui_icon_rank_wz_level80_large.png
https://www.callofduty.com/cdn/app/icons/bo4/ranks/zm/ui_icon_rank_zm_level42_large.png
```
<img src="https://www.callofduty.com/cdn/app/icons/bo4/ranks/mp/ui_icon_rank_mp_level55_large.png" width="150" alt="Multiplayer rank 55" /> <img src="https://www.callofduty.com/cdn/app/icons/bo4/prestige/wz/ui_icon_wz_prestige_08_large.png" width="150" alt="Blackout prestige 8" /> <img src="https://www.callofduty.com/cdn/app/icons/bo4/prestige/zm/ui_icon_zm_prestige_11_large.png" width="150" alt="Zombies prestige 11" /> <img src="https://www.callofduty.com/cdn/app/icons/bo4/ranks/wz/ui_icon_rank_wz_level80_large.png" width="150" alt="Blackout level 80" /> <img src="https://www.callofduty.com/cdn/app/icons/bo4/ranks/zm/ui_icon_rank_zm_level42_large.png" width="150" alt="Zombies level 42" />

### Modern Warfare 2019

```
https://www.callofduty.com/cdn/app/icons/mw/officer/mp/icon_rank_officer_{{officerRank}}.png
https://www.callofduty.com/cdn/app/icons/mw/ranks/mp/icon_rank_{{rank}}.png
```

```
https://www.callofduty.com/cdn/app/icons/mw/officer/mp/icon_rank_officer_01.png
https://www.callofduty.com/cdn/app/icons/mw/ranks/mp/icon_rank_55.png
https://www.callofduty.com/cdn/app/icons/mw/officer/mp/icon_rank_officer_20.png
https://www.callofduty.com/cdn/app/icons/mw/officer/mp/icon_rank_officer_15.png
https://www.callofduty.com/cdn/app/icons/mw/ranks/mp/icon_rank_03.png
```
<img src="https://www.callofduty.com/cdn/app/icons/mw/officer/mp/icon_rank_officer_01.png" width="150" alt="Office rank 1" /> <img src="https://www.callofduty.com/cdn/app/icons/mw/ranks/mp/icon_rank_55.png" width="150" alt="Level 55" /> <img src="https://www.callofduty.com/cdn/app/icons/mw/officer/mp/icon_rank_officer_20.png" width="150" alt="Officer rank 20" /> <img src="https://www.callofduty.com/cdn/app/icons/mw/officer/mp/icon_rank_officer_15.png" width="150" alt="Officer rank 15" /> <img src="https://www.callofduty.com/cdn/app/icons/mw/ranks/mp/icon_rank_03.png" width="150" alt="Level 3" />

### Cold War / Vanguard

```
https://www.callofduty.com/cdn/app/icons/{{title}}/ranks/mp/icon_rank_{{rank}}.png
https://www.callofduty.com/cdn/app/icons/{{title}}/prestige/mp/ui_icon_mp_prestige_{{prestige}}.png
```

```
https://www.callofduty.com/cdn/app/icons/cw/ranks/mp/icon_rank_55.png
https://www.callofduty.com/cdn/app/icons/cw/prestige/mp/ui_icon_mp_prestige_04.png
https://www.callofduty.com/cdn/app/icons/vg/ranks/mp/icon_rank_55.png
https://www.callofduty.com/cdn/app/icons/vg/prestige/mp/ui_icon_mp_prestige_27.png
https://www.callofduty.com/cdn/app/icons/vg/prestige/mp/ui_icon_mp_prestige_01.png
```


<img src="https://www.callofduty.com/cdn/app/icons/cw/ranks/mp/icon_rank_55.png" width="150" alt="Cold war level 55" /> <img src="https://www.callofduty.com/cdn/app/icons/cw/prestige/mp/ui_icon_mp_prestige_04.png" width="150" alt="Cold war prestige 4" /> <img src="https://www.callofduty.com/cdn/app/icons/vg/ranks/mp/icon_rank_55.png" width="150" alt="Vanguard level 55" /> <img src="https://www.callofduty.com/cdn/app/icons/vg/prestige/mp/ui_icon_mp_prestige_27.png" width="150" alt="Vanguard prestige 27" /> <img src="https://www.callofduty.com/cdn/app/icons/vg/prestige/mp/ui_icon_mp_prestige_01.png" width="150" alt="Vanguard prestige 1" />

## Mode images

```
https://my.callofduty.com/cdn/app/icons/{{title}}/modes/{{mode}}_{{gametype}}.png
```

```
https://my.callofduty.com/cdn/app/icons/cw/modes/mp_sas.png
https://my.callofduty.com/cdn/app/icons/cw/modes/mp_tdm.png
https://my.callofduty.com/cdn/app/icons/vg/modes/mp_ffa.png
https://my.callofduty.com/cdn/app/icons/mw/modes/mp_ctf.png
https://my.callofduty.com/cdn/app/icons/mw/modes/mp_tdm.png
```

<img src="https://my.callofduty.com/cdn/app/icons/cw/modes/mp_sas.png" width="150" alt="CW mode sticks and stones" /> <img src="https://my.callofduty.com/cdn/app/icons/cw/modes/mp_tdm.png" width="150" alt="CW mode tdm" /> <img src="https://my.callofduty.com/cdn/app/icons/vg/modes/mp_dom.png" width="150" alt="VG mode ffa" /> <img src="https://my.callofduty.com/cdn/app/icons/mw/modes/mp_ctf.png" width="150" alt="MW mode ctf" /> <img src="https://my.callofduty.com/cdn/app/icons/mw/modes/mp_tdm.png" width="150" alt="MW mode tdm" />


## Pegi

You can find the Pegi icons, why would they need the 3,7 and 12, I don't know.

```
https://imgs.callofduty.com/content/dam/atvi/global/ratings/pegi/pegi-3.jpg
https://imgs.callofduty.com/content/dam/atvi/global/ratings/pegi/pegi-7.jpg
https://imgs.callofduty.com/content/dam/atvi/global/ratings/pegi/pegi-12.jpg
https://imgs.callofduty.com/content/dam/atvi/global/ratings/pegi/pegi-16.jpg
https://imgs.callofduty.com/content/dam/atvi/global/ratings/pegi/pegi-18.jpg
```


<img src="https://imgs.callofduty.com/content/dam/atvi/global/ratings/pegi/pegi-3.jpg" width="75" alt="pegi 3" /> <img src="https://imgs.callofduty.com/content/dam/atvi/global/ratings/pegi/pegi-7.jpg" width="75" alt="pegi 7" /> <img src="https://imgs.callofduty.com/content/dam/atvi/global/ratings/pegi/pegi-12.jpg" width="75" alt="pegi 12" /> <img src="https://imgs.callofduty.com/content/dam/atvi/global/ratings/pegi/pegi-16.jpg" width="75" alt="pegi 16" /> <img src="https://imgs.callofduty.com/content/dam/atvi/global/ratings/pegi/pegi-18.jpg" width="75" alt="pegi 18" />


## Random URIs

Some URIs I'm not sure

```
https://www.callofduty.com/cdn/app/icons/mw/bc/bootcamp-banner-en.jpg
```
<img src="https://www.callofduty.com/cdn/app/icons/mw/bc/bootcamp-banner-en.jpg" width="200" alt="Bootcamp banner" />

```
https://www.callofduty.com/cdn/app/configs/prod/statnames/mapping.json
```
[...home](README.md)

# Maps

- [Maps](#maps)
  - [Maps with game mode per title](#maps-with-game-mode-per-title)
  - [Get map data](#get-map-data)
  - [Map image](#map-image)
  - [Minmap image](#minmap-image)
  - [Stats](#stats)


## Maps with game mode per title

To get map information, this API query give map information for a title:

**URI**

```
https://my.callofduty.com/api/papi-client/ce/v1/title/${title}/platform/xbl/gameType/mp/communityMapData/availability
```

**Params**

- `title`: Game title, ex: `bo4`

**Return schema**

```javascript
{
  "status": "success|error",
  "data": {
    "mapName": [
        "gameModeName"
    ]
  }
}
```
- `mapName`: id of the map
- `gameModeName`: available mode for this map

**Example**

https://my.callofduty.com/api/papi-client/ce/v1/title/bo4/platform/xbl/gameType/mp/communityMapData/availability

## Get map data

You can get map data

**URI**

```
https://www.callofduty.com/api/papi-client/ce/v1/title/${title}/platform/xbl/gameType/mp/map/${map}/mode/${gamemode}/communityMapData
```

**Params**

- `title`: Game title, ex: `bo4`
- `map`: Map id
- `gamemode`: Gamemode id (**not the mode, the gamemode, example: koth**


**Return schema**

```javascript
{
  "status": "success|error",
  "data": {
    "map": {
      "mapId": "mapName",
      "imageUrl": "mapImageUrl",
      "left": mapImageLocationLeft,
      "right": mapImageLocationRight,
      "top": mapImageLocationTop,
      "bottom": mapImageLocationBottom,
      "rotation": null
    },
    "mode": "gamemode",
    "matchesCount": matchesCount,
    "scale": mapImageScale",
    "yShift": mapImageYShift",
    "xShift": mapImageXShift",
    "histogramWidth": histogramWidth,
    "histogramHeight": histogramHeight,
    "date": lastDataTimestamp,
    "simpleHistogramLayers": { "kills": [[killMatrix]] }
  }
}
```
- `mapName`: map id, same as the URI param
- `gamemode`: game mode, same as the URI param
- `lastDataTimestamp`: date of the returned data
- `matchesCount`: count of matches on this map before lastDataTimestamp
- `mapImageUrl`: url of the minimap image
- `mapImageScale`: scale of the minimap image
- `mapImageYShift`: scaled y shift of the image
- `mapImageXShift`: scaled x shift of the image
- `mapImageLocationLeft`: scaled location of the left of the image
- `mapImageLocationRight`: scaled location of the right of the image
- `mapImageLocationTop`: scaled location of the top of the image
- `mapImageLocationBottom`: scaled location of the bottom of the image
- `killMatrix`: matrix of kills, probably (i,j) = pixel (x,y)
- `histogramWidth`: ???
- `histogramHeight`: ???

**Example**

https://www.callofduty.com/api/papi-client/ce/v1/title/bo4/platform/xbl/gameType/mp/map/mp_urban_alt/mode/tdm/communityMapData

## Map image

**URI**

```
https://www.callofduty.com/cdn/app/base-maps/${title}/${map}.jpg
```

**Params**

- `title`: Game title, ex: `bo4`
- `map`: Map id

**Example**

```
https://www.callofduty.com/cdn/app/base-maps/bo4/mp_urban_alt.jpg
```


<img src="https://www.callofduty.com/cdn/app/base-maps/bo4/mp_urban_alt.jpg" width="500" alt="Arsenal sandstorm BO4" />

## Minmap image

**URI**

```
https://www.callofduty.com/cdn/app/maps/${title}/${imageURL}
```

**Params**

- `title`: Game title, ex: `bo4`
- `imageURL`: Minimap image url, `mapImageUrl` in [Get map data](#get-map-data)

**Example**

```
https://www.callofduty.com/cdn/app/maps/bo4/hud_minimap_mp_urban-inverted.jpg
```


<img src="https://www.callofduty.com/cdn/app/maps/bo4/hud_minimap_mp_urban-inverted.jpg" width="500" alt="Arsenal sandstorm BO4 Minimap" />


For some reasons, some maps have the -inverted suffix

```
https://www.callofduty.com/cdn/app/maps/bo4/hud_minimap_mp_urban.jpg
```

<img src="https://www.callofduty.com/cdn/app/maps/bo4/hud_minimap_mp_urban.jpg" width="500" alt="Arsenal sandstorm not inverted BO4 Minimap" />

## Stats

See profile stats to get map stats per profile.
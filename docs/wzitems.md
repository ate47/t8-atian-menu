[Black ops 4 (T8) information...](index.md)

# Blackout item

- [Blackout item](#blackout-item)
  - [Metadata](#metadata)
  - [Using the items](#using-the-items)
    - [Create item point](#create-item-point)
    - [Give item](#give-item)
    - [Spawn vehicle](#spawn-vehicle)

Each thing you can find on the ground in Blackout is an item (Armors, Attachments, Quest items, Vehicles, Weapons, etc.).

## Metadata

An item is described by its id, name, rarity and type.

**Rarity**

- `None` - Ammo, Armor, Armor_shard, Attachment, Backpack, Cash, Equipment, Generic, Killstreak, Quest, Resource, Vehicle, Weapon
- `Common` - Weapon, Health, Attachment, Equipment
- `Rare` - Unused, but can be seen in the code
- `Epic` - Gold weapons
- `Legendary` - Operator weapons

**Type**

- `ammo` - Ammos
- `armor` - Armors
- `armor_shard` - Armor shards
- `attachment` - Attachments
- `backpack` - Backpack (only one element)
- `cash` - Cash (only one element, unused)
- `equipment` - Equipments
- `generic` - Perks
- `health` - Health items
- `killstreak` - Killstreak items (Recon car)
- `quest` - Quest items
- `resource` - Resources (Paint cans and Blackjack key)
- `vehicle` - Vehicles
- `weapon` - Weapons (Heros, WWs, Gold, Operator, Wallbuy or Other)

## Using the items

### Create item point

To use an item, you need to create an item point from it, an item point is describing an instance of this item in the world.

```c++
struct ItemPoint {
    // item id
    int id;
    // item id (same)
    int var_bd027dd9;
    // item angle in the world
    vector angles = (0, 0, 0);
    // item origin in the world
    vector origin = (0, 0, -64000);
    // item information, if undefined the item doesn't exist
    ItemInfo var_a6762160;
}
struct ItemInfo {
    // item name
    string name;
    // amount by default
    int amount;
    // item type
    string itemtype;
    // item rarity
    string rarity;
    // unknown
    string type = "itemspawnentry";
    // the weapon if this item is a weapon
    Weapon? weapon;
    // the vehicle name if this item is a vehicle
    string? vehicle;
}
```

To create an item point you can use the item id or the item name. You have 2 functions,

```c++
// create an item point from a hash
function_4ba8fde(hash name)->ItemPoint;

// create an item point from an id
function_b1702735(int id)->ItemPoint;
```

If you want to get all the items, the id is starting from 0 to the value returned by this function (exclusive)

```c++
// get the count of items
function_8322cf16()->int;
```

### Give item

The items are complex structures, you can't use them without using the in-game functions.

You have 3 main functions, 

```c++
#using scripts\wz_common\wz_loadouts.gsc;
#using scripts\mp_common\item_inventory.gsc;
#using scripts\mp_common\item_world.gsc;

// get the item point, same as function_4ba8fde, but apply the fixup
wz_loadouts::_get_item(hash item_id)->ItemPoint;
// get the slot id of an item point in the player inventory
<player> item_inventory::function_e66dcff5(ItemPoint itempoint)->int;
// give to a player an item into a slot
item_world::function_de2018e3(ItemPoint itempoint, Player player, int slotid);
```

### Spawn vehicle

TODO
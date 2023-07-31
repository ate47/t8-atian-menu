

warzone_solo 35F8EE90CBFFA9E7
warzone_duo 327338A0B51BD1E4
warzone_quad 14de0f7fa012b74f
warzone_hot_pursuit FB4C2B9CE4E66802
wz_open_skyscrapers 2a0c04b4bcbed100
wz_escape 4023b088683398e2
wz_escape_alt 6c4fd4af9da9e4ca


f0_local0.EModeData = {
	[Enum.eModes[0x83EBA96F36BC4E5]] = {
		assetName = 0x9E82E6A2962DD60
	},
	[Enum.eModes[0x3723205FAE52C4A]] = {
		assetName = 0x9CA2B6A2949DAB8
	},
	[Enum.eModes[0xBF1DCC8138A9D39]] = {
		assetName = 0x9D4406A295252EC
	}

What can cause a crash:

- Bad function call : 1670707254 
- bad name? 
- forgot [[ func ]] to call a function pointer?
- using array::add(arr, val) with isarray(arr) = false
- err 3126405504 BA592980 blackops4.exe+3c3c12b // 5C8B4810
- braker 917 brute goodnight
- 2006839707 -> array:add in bad ptr
- Whiskey 110 Late tiger -> accessing array like a struct?
- kilo 45 gold dove, usage of unset local var

3126405504 = 0xba592980,server script error
Baker 917 Brute Goodnight
[6316b397dd0fa158.3647551301.54:3031] (bytecode offset)
[124cecff7280be52.1668193592.54:161951] (bytecode offset)
[124cecff7280be52.1668193592.54:185255] (bytecode offset)
[124cecff7280be52.1668193592.54:54343] (bytecode offset)
[3a7e21b450c1b143.1111601229.54:13826] (bytecode offset)
[3a7e21b450c1b143.1111601229.54:11359] (bytecode offset)
[07c165117833e69f.1825947448.54:1375] (bytecode offset)
[07c165117833e69f.1825947448.54:343] (bytecode offset)
[70c2381177705442.480043486.54:3655] (bytecode offset)
[70c2381177705442.480043486.54:3607] (bytecode offset)

 ,0,server script error
Baker 917 Brute Goodnight
[6316b397dd0fa158.3647551301.54:3031] (bytecode offset)
[124cecff7280be52.1668193592.54:161951] (bytecode offset)
[124cecff7280be52.1668193592.54:185255] (bytecode offset)
[124cecff7280be52.1668193592.54:54343] (bytecode offset)
[3a7e21b450c1b143.1111601229.54:13826] (bytecode offset)
[3a7e21b450c1b143.1111601229.54:11359] (bytecode offset)
[07c165117833e69f.1825947448.54:1375] (bytecode offset)
[07c165117833e69f.1825947448.54:343] (bytecode offset)
[70c2381177705442.480043486.54:3655] (bytecode offset)
[70c2381177705442.480043486.54:3607] (bytecode offset)

0x779df19b,server script error
Zebra 112 Vicious Stallion
[124cecff7280be52.1668193592.54:141309] (bytecode offset)
[39c5d5881cc195b0.857104942.54:686] (bytecode offset)
[39c5d5881cc195b0.857104942.54:1335] (bytecode offset)
[07c165117833e69f.1825947448.54:9727] (bytecode offset)
[07c165117833e69f.1825947448.54:9703] (bytecode offset) 

// 124cecff7280be52 scripts/core_common/clientids_shared.gsc
// 39c5d5881cc195b0 scripts/core_common/system_shared.gsc
// 07c165117833e69f scripts/core_common/callbacks_shared.gsc

// 487d0473700e6140,scripts/core_common/clientfield_shared.gsc
// 124cecff7280be52,scripts/core_common/clientids_shared.gsc

```c++
// GSC datatypes
enum ScrVarType_t : unsigned __int32
{
  TYPE_UNDEFINED = 0x0,
  TYPE_POINTER = 0x1,
  TYPE_STRING = 0x2,
  TYPE_VECTOR = 0x3,
  TYPE_HASH = 0x4,
  TYPE_FLOAT = 0x5,
  TYPE_INTEGER = 0x6,
  TYPE_UINTPTR = 0x7,
  TYPE_ENTITY_OFFSET = 0x8,
  TYPE_CODEPOS = 0x9,
  TYPE_PRECODEPOS = 0xA,
  TYPE_API_FUNCTION = 0xB,
  TYPE_SCRIPT_FUNCTION = 0xC,
  TYPE_STACK = 0xD,
  TYPE_THREAD = 0xE,
  TYPE_NOTIFY_THREAD = 0xF,
  TYPE_TIME_THREAD = 0x10,
  TYPE_FRAME_THREAD = 0x11,
  TYPE_CHILD_THREAD = 0x12,
  TYPE_CLASS = 0x13,
  TYPE_SHARED_STRUCT = 0x14,
  TYPE_STRUCT = 0x15,
  TYPE_REMOVED_ENTITY = 0x16,
  TYPE_ENTITY = 0x17,
  TYPE_ARRAY = 0x18,
  TYPE_REMOVED_THREAD = 0x19,
  TYPE_FREE = 0x1a,
  TYPE_THREAD_LIST = 0x1b,
  TYPE_ENT_LIST = 0x1c
};


```c++
Alistair's Folly - hash_138efe2bb30be63c
Chaos Theory - hash_138f012bb30beb55
Alistair's Annihilator - hash_138f002bb30be9a2

Richtofen Matryoshka Dolls - hash_291e1c117ebbf5e6
Demspey Matryoshka Dolls - hash_7a42b57be462143f
Nikolai Matryoshka Dolls - hash_7264d6f24a950a5b
Takeo Matryoshka Dolls - hash_579652e2459b8c74

",
	"error_type":"Script Runtime Error

wzHideSpectatorsUI
wzHidePlayersAliveUI
wzHideKillsUI
wzHideCleanupsUI

kill: 50
melee_kill: 100

- Rush
  - Players
    - 1 : 55%
    - 2 : 75%
    - 3 : 90%
    - 4 : 110%
  - Difficulty
    - Easy: 1
    - Normal: 1
    - Hard: 1.25
    - Insane: 1.5
- Normal
  - Players
    - 1 : 63%
    - 2 : 75%
    - 3 : 80%
    - 4 : 95%
  - Difficulty
    - Easy: 1
    - Normal: 1
    - Hard: 1.25
    - Insane: 1.5

level.scoreinfo[#"melee_kill"]
level.scoreinfo[#"kill"]

mozu op: hash_6e237d1aec5ebae2

var_c3bb4e09=zone_prespawn
var_f1fbce84=maxcount
var_aeae9f59 = var_f1fbce84 + zone_prespawn, maxcount = zombie_count, zone_prespawn = zombie_count|0(special)

var_7aa3cde7 -> count_zombies

var_c3bb4e09=zone_prespawn 
var_84b8298c=alive count
var_aeae9f59=totalspawn -> random() = var_ce8df1c9
var_10f73408=maxcount -> random() = var_b66547bd
function_4b95d880() spawnzombies()

gamemodeismode(int mode)->bool
- 0=public
- 1=private
- 2=default
- 5=freerun
- 6=league
- 7=theater
- default=false


		self rotateyaw(360 * spin_dir, spin_rate); hash_6cf5f53d1fbb1066:add_trails (wz)
#"hash_5e9c3f9821e1ee0a" // paint can item

level.var_79a3ba26 = [#"hash_6e237d1aec5ebae2":1, #"hash_28fb7b6581fc57fb":1, #"hash_6c2f4d31b7682613":1, #"hash_5a5408262448eb77":1, #"hash_714bee6de3dc1fd7":1, #"hash_2fa6d3d57c82720c":1, #"hash_2f614bc6ce414164":1, #"hash_2cee20f0ab20f5d5":1, #"hash_3e6f00dcaccdb98e":1, #"hash_7f4ee068772cc5aa":1, #"hash_3458fd4dff2bd9e8":1, #"hash_6075c220f6315daf":1];
		level.var_f290f0ba = [#"hash_78f8f730158519ff":30, #"hospital_stash":29, #"hash_62810f3ef5d7c53b":28, #"hash_468067e2be6e3cfd":27, #"hash_4b49cb98f0fd776a":26, #"hash_6dea2e4afc816818":25, #"hash_2783dbab1f862606":24, #"hash_2141ecb8d2d86b22":23, #"hash_678a1efded2b597a":22, #"hash_1b83b702bbaae298":21, #"hash_7d028af90dad72ae":20, #"hash_a211476d10546c":19, #"hash_308758c2f91807aa":18, #"hash_550872d1d1938f94":17, #"hash_408b3ed7db6f9401":16, #"hash_734bf5054445e0df":15, #"hash_2a93e93b275c38ed":14, #"hash_75cc919e81dc8b19":13, #"hash_779cba7072600ad1":12, #"hash_47a63bc4a605b45f":11, #"hash_4ee6deffa30cc6e2":10, #"hash_ca8b234ad1fea38":9, #"hash_66f790c2630deace":8, #"hash_49e8a607ea22e650":7, #"hash_43647ef7af66f82f":6, #"hash_61373b747c6a21fd":5, #"hash_3ad3de90342f2d4b":4, #"hash_2b546c0315159617":3, #"hash_33f7121f70c3065f":2, #"hash_6a0d13acf3e5687d":1];
ISsue while reading 000002B4CCDF37E8 Failed to read data of size 0000000000001152 from address 0x000002AA6445E460

it would be fun to test if the 3rd value is right:

- `"wzplayerinsertiontypeindex"` - Respawn type, 0=helicopter,1=portals,2=direct freefall??
- self playsound(localclientnum, #"uin_unavailable_charging");
- zm_gametype::zm_map_restart()


e = bullettrace()
p = physicstrace()
g = groundtrace()
sightconetrace() = float
e[#"position"]
e[#"normal"]
e[#"entity"]
e[#"fraction"]
e[#"dynent"]
p[#"walkable"] = bool
g[#"waterdepth"]
g[#"waterbottom"]
g[#"surfacetype"] = 
"none", 
"default", 
"dirt", 
"water", 
"watershallow",
"ladder", 
"glasscar", 
"rock", 
"metal", 
"metalcar", 
"glass"


- `140721066683308`
- client script error
- Sail 543 Earth Whisper
- [28b411118a61e00b.3056485193.54:369] (bytecode offset)
- [28b411118a61e00b.3056485193.54:12623] (bytecode offset)
- [28b411118a61e00b.3056485193.54:12583] (bytecode offset)

28b411118a61e00b scripts/core_common/callbacks_shared.csc

4EED340     gVmOpJumpTable[0x1000]
4EF5340     gVmErrRecoveryJumpTable[0x3000]



4F0D340

8000

VM_OP_GetFunctionSpoofOpCode = 0x41;
INT16 ScriptDetours::VM_OP_GetAPIFunctionSpoofOpCode = 0x43;
INT16 ScriptDetours::VM_OP_ScriptFunctionCallSpoofOpCode = 0x48;
INT16 ScriptDetours::VM_OP_ScriptMethodCallSpoofOpCode = 0x4f;
INT16 ScriptDetours::VM_OP_ScriptThreadCallSpoofOpCode = 0x50


, "-DATIAN_MENU_DLL", "-DDETOURS", "-DLAZYLINK", "-DATIANMENU_SYSTEMS"

2733174671

2006839707

-> 5410000416

140729189868824

ScrVar_CastString -> string/int/float/vector

Function name	Segment	Start	Length	Locals	Arguments	R	F	L	M	S	B	T	=
ScrStr_ConvertToString	.text	0000000002759030	000000EE	00001038		R	.	.	.	.	.	T	.
ScrVar_CastString	.text	000000000275C170	000000FB	00000028	00000010	R	.	.	.	.	.	T	.

drop_item ]](undefined, 1, 1, item_id, self GetOrigin()); 3e52e5

Fixup locations:

- ambush `script_730972fad7fffcf8.csc script_5283c6fac62ed56c.gsc`
- heavymetalheroes `script_1ce69b7b3b848fb4.csc script_3d6c077b4d554a80.gsc`
- heavymetal `script_3cef0194bec3c4d3.csc script_19029594aa0e2e07.gsc`
- spectrerising `script_2c787723af076323.csc script_bf1cb239d348897.gsc`
- bigteam `script_3a52c137b9090406.csc script_5ad86d37cada2b92.gsc`
- hardcore `script_4c228700945748f2.csc script_2835db007fa14566.gsc`
- weaponstest `script_372d9bb5ff3b27f1.csc script_5b1947b613ef787d.gsc`
- hash_232750b87390cbff `script_2c290bc0b594991c.csc script_5014b7c0ca48e9a8.gsc`
- hash_3109a8794543000f `script_4a8c0c251efe117c.csc script_6e78b82533b41508.gsc`
- hot pursuit `script_761c28389965b406.csc script_16a1d438ab36db92.gsc`
- infection `script_23c7980e18b44cc7.csc script_47b4040e2d69e393.gsc`
- shamrock event `script_7d8d9a7dbeb7b6a7.csc script_217a067dd36d4d73.gsc`
- vehicles `script_7ec566c942981bbd.csc script_5e3ebac930c54131.gsc`
- empty `script_5ba6c084b03e7a1.csc script_264018085cd50f2d.gsc`

function_bbc0b67f()

var_a12b4736 = &item_world_fixup::function_96ff7b88(item); level.var_ee46a98d[item] = ""
var_87d0eef8 = &item_world_fixup::remove_item(item); level.itemreplacement[item] = ""

var_d2223309 = &item_world_fixup::function_261ab7f5(item, replacement_item); level.var_ee46a98d[item] = replacement_item
var_74257310 = &item_world_fixup::add_item_replacement(item, replacement_item); level.itemreplacement[item] = replacement_item

var_b5014996 = &item_world_fixup::function_19089c75(a,b); level.var_db0e7b82[a] = b
var_f8a4c541 = &item_world_fixup::function_6991057(a,b); level.var_ee110db8[a] = b

level.var_4afb8f5a = (reset ? level.itemreplacement : level.var_ee46a98d); // -> used when spawning or getting an item
level.var_fb9a8536 = (reset ? level.var_ee110db8 : level.var_db0e7b82); // -> map bundle

eModes v9 = ZM=0, MP=1, CP=2, WZ=3


2985
3023 38
                "-DATIANMENU_DETOURS",
                "-DATIANMENU_COMPILER_OPT",
                
                // modifier
	level._custom_perks[str_perk].alias = str_alias;
	level._custom_perks[str_perk].var_60e3692f = var_771fabd4;
	level._custom_perks[str_perk].n_cost = n_cost;
  
                // basic
	level._custom_perks[str_perk].alias = str_alias;
	level._custom_perks[str_perk].cost = n_perk_cost;
	level._custom_perks[str_perk].hint_string = str_hint_string;
	level._custom_perks[str_perk].perk_bottle_weapon = w_perk_bottle_weapon;
	level._custom_perks[str_perk].var_66de8d1c = var_1408cd4c;

```
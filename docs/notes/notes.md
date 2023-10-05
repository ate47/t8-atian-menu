

warzone_solo 35F8EE90CBFFA9E7
warzone_duo 327338A0B51BD1E4
warzone_quad 14de0f7fa012b74f
warzone_hot_pursuit FB4C2B9CE4E66802
wz_open_skyscrapers 2a0c04b4bcbed100
wz_escape 4023b088683398e2
wz_escape_alt 6c4fd4af9da9e4ca

.rdata:00000000049612D0     ; const BuiltinFunctionDef stru_49612D0
.rdata:00000000049612D0     stru_49612D0    dd 68A76B47h            ; [0].canonId
.rdata:00000000049612D0                                             ; DATA XREF: sub_6A2460↑o
.rdata:00000000049612D0                                             ; sub_6A24B0+25↑o
.rdata:00000000049612D0                     dd 1                    ; [0].min_args ; BGScr_EnumerateWeapons(scriptInstance_t)
.rdata:00000000049612D0                     dd 1                    ; [0].max_args
.rdata:00000000049612D0                     db 0                    ; 0
.rdata:00000000049612D0                     db 0                    ; 0
.rdata:00000000049612D0                     db 0                    ; 0
.rdata:00000000049612D0                     db 0                    ; 0
.rdata:00000000049612D0                     dq offset _ZL22BGScr_EnumerateWeapons16scriptInstance_t; [0].actionFunc
.rdata:00000000049612D0                     dd 1                    ; [0].type
.rdata:00000000049612D0                     db 0                    ; 0
.rdata:00000000049612D0                     db 0                    ; 0
.rdata:00000000049612D0                     db 0                    ; 0
.rdata:00000000049612D0                     db 0                    ; 0
.rdata:00000000049612D0                     dd 0A16A090Dh           ; [1].canonId
.rdata:00000000049612D0                     dd 1                    ; [1].min_args
.rdata:00000000049612D0                     dd 1                    ; [1].max_args
.rdata:00000000049612D0                     db 0                    ; 1
.rdata:00000000049612D0                     db 0                    ; 1
.rdata:00000000049612D0                     db 0                    ; 1
.rdata:00000000049612D0                     db 0                    ; 1
.rdata:00000000049612D0                     dq offset sub_6A1C30    ; [1].actionFunc
.rdata:00000000049612D0                     dd 1                    ; [1].type <<---- to test
.rdata:00000000049612D0                     db 0                    ; 1
.rdata:00000000049612D0                     db 0                    ; 1
.rdata:00000000049612D0                     db 0                    ; 1
.rdata:00000000049612D0                     db 0                    ; 1
.rdata:00000000049612D0                     dd 0F2C99E09h           ; [2].canonId
.rdata:00000000049612D0                     dd 1                    ; [2].min_args
.rdata:00000000049612D0                     dd 1                    ; [2].max_args
.rdata:00000000049612D0                     db 0                    ; 2
.rdata:00000000049612D0                     db 0                    ; 2
.rdata:00000000049612D0                     db 0                    ; 2
.rdata:00000000049612D0                     db 0                    ; 2
.rdata:00000000049612D0                     dq offset sub_6A1C60    ; [2].actionFunc 
.rdata:00000000049612D0                     dd 0                    ; [2].type
.rdata:00000000049612D0                     db 0                    ; 2
.rdata:00000000049612D0                     db 0                    ; 2
.rdata:00000000049612D0                     db 0                    ; 2
.rdata:00000000049612D0                     db 0                    ; 2
.rdata:00000000049612D0                     dd 1242E467h            ; [3].canonId
.rdata:00000000049612D0                     dd 1                    ; [3].min_args
.rdata:00000000049612D0                     dd 1                    ; [3].max_args

556f98c49d3271e2

N:\bo4hash\t8-src\
N:\bo4hash\t8wip\bo4-source\
H:\Vuze Downloads\GSC\Default Project\

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

ZMHudGlobal.trials.gameState
2876dc918cc6666,zmshowtimer
Hud_ZM_Timer

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

mp error:
Can't read pooled buffer at address 1276a281ea0 of size 10460 for file scriptparsetree/hashed-2/script_131d10be788.gscbin
Can't read pooled buffer at address 1276a287b40 of size 4224 for file scriptparsetree/hashed-1/script_131d10be928.gscbin
Can't read pooled buffer at address 1276a2a0580 of size 96 for file scriptparsetree/hashed-3/script_131d10c2248.gscbin

PRECODEPOS:

EvalLocalVariableCachedSafe -> Push PRECODEPOS before
CheckClearParams -> Convert top PRECODEPOST to CODEPOS or error
ClearParams -> Clear params until find CODEPOS or PRECODEPOS
SafeDecTop -> ignore if top->type == CODEPOS (but seem unused)
SetLocalVariableCachedOnStack -> set undefined if == CODEPOS (but seem unused)
Notify -> if stack[-2] isn't a pointer allocstruct, stack[-2] seem to be created by PreScriptCall (PRECODEPOS)
PreScriptCall -> Push PRECODEPOS -> Before sending information to vm, done by:
  - script calls(+pointer), can be paired f1(f2(2)) -> PSC;PSC;GC(2)
  - notify

struct __declspec(align(8)) VmContext
{
  ScrVarIndex_t fieldValueId;
  ScrVarIndex_t objectId;
  //bool fieldValueRemoveOk;
  byte *lastGoodPos;
  ScrVarValue_t *lastGoodTop;
  OP_TYPE breakOpcode;
  OP_TYPE localOpcode;
};

0000000004EED230 ; ScrClassStruct_t *gScrClassMap[2]

```c++
// GSC datatypes
// 0x4EED240 char *var_typename[29]
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


, "-DATIAN_MENU_DLL", "-DDETOURS", "-DLAZYLINK"

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

// 3126405504
        "-D_SUPPORTS_DETOURS",
        "-D_SUPPORTS_BUILTINS",
        "'-Cdll.builtins=true'",
        "'-Cdll.detours=true'"

function_4ba8fde(#"allistairs_folly_t8_item") = {
    #angles: (0, 0, 0),
    #id: 160, // index
    #origin: (0, 0, -64000),
    #var_bd027dd9: 160, // also the index
    #var_a6762160: {
        #amount: 1,
        #itemtype: "weapon",
        #name: "allistairs_folly_t8_item",
        #rarity: "Common",
        #type: "itemspawnentry",
        #weapon: getweapon("...")
    }
}

5410000416

// sub_3E5100(sinst_t inst, ulong* value)
ulong pool = *(ulong*)(qword_B2232A0 + 80 + 8 * inst);
ulong[2]* data = (ulong*)(pool + 0x80008);
// sub_3E5230(int inst, int data_index)


2985
3023 38
                "-D_SUPPORTS_DETOURS",
                "-D_SUPPORTS_BUILTINS",
                
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
menus:

current 0x59F1B30

Black_Ops_4_Cut_Minigun_Hud.png
Black_Ops_4_Cut_Minigun_No_Hud.png
Black_Ops_4_Cut_Molotov_Hud.png
Black_Ops_4_Cut_Molotov_No_Hud.png
Black_Ops_4_Cut_Riot_Shield_Drop_Back.png
Black_Ops_4_Cut_Riot_Shield_Drop.png
Black_Ops_4_Cut_Riot_Shield_Hud.png
Black_Ops_4_Cut_Riot_Shield_No_Hud.png
Black_Ops_4_Cut_Tesla_Gun_Hud.png
Black_Ops_4_Cut_Tesla_Gun_No_Hud.png
Black_Ops_4_Cut_Tesla_Gun_Upgraded_Hud.png
Black_Ops_4_Cut_Tesla_Gun_Upgraded_No_Hud.png

scrVmPub_t scrVmPub // 10 shifted
000008307aa0 0x0     void* unknown1;
000008307aa8 0x8     void* unknown2;
000008307ab0 0x10    void* executionQueueHeap;
000008307ab8 0x18    void* timeByValueQueue;
000008307ac0 0x20    void* timeByThreadQueue[1024];
000008309ac0 0x2020  void* frameByValueQueue;
000008309ac8 0x2028  void* frameByThreadQueue[1024];
00000830bac8 0x4028  void* timeoutByValueList;
00000830bad0 0x4030  void* timeoutByThreadList[1024];
00000830dad0 0x6030  void* notifyByObjectQueue[1024];
00000830fad0 0x8030  void* notifyByThreadQueue[1024];
000008311ad0 0xa030  void* endonByObjectList[1024];
000008313ad0 0xc030  void* endonByThreadList[1024];
000008315ad0 0xe030  ScrVarIndex_t* localVars;
000008315ad8 0xe038  ScrVarValue_t* maxstack;
000008315ae0 0xe040  function_frame_t* function_frame;
000008315ae8 0xe048  ScrVarValue_t* top;
000008315af0 0xe050  function_frame_t function_frame_start[64] = 0x800 / 64 = 0x20
0000083162f0 0xe850  ScrVarValue_t stack[2048] = [..., 7FF623C462F8 7FF623C46300 7FF623C46308 ?? ];
00000831e2f0 0x16850 uint time;
00000831e2f4 0x16854 uint frame;
00000831e2f8 0x16858 int  function_count;
00000831e2fc 0x1685C uint  inparamcount;
00000831e300 0x16860 uint outparamcount;
00000831e304 0x16864 bool showError;
00000831e305 0x16866 bool systemInitialized;

0000082EFCD0 objFileInfo_t gObjFileInfo[2][650];
0000082F76B0 uint32_t gObjFileInfoCount[2];

59F5930     encryptiontable
11c
1f

GSCOBJ
0x00 byte magic[8]
0x08 int32 crc;
0x10 int64 name
0x18 int32 include_offset -> uint64[]
0x1C uint16 string_count
0x1E uint16 exports_count
0x20 int32 ukn
0x24 int32 string_offset -> GSC_STRINGTABLE_ITEM[]
0x28 int16 imports_count
0x2A uint16 fixup_count
0x2c int32 ukn2c
0x30 int32 export_table_offset -> GSC_EXPORT_ITEM[]
0x34 int32 ukn34
0x38 int32 imports_offset -> GSC_IMPORT_ITEM[]
0x3C uint16 globalvar_count
0x40 int32 fixup_offset -> GSC_FIXUP_ITEM[]
0x44 int32 globalvar_offset -> GSC_GLOBALVAR_ITEM[]
0x48 int32 script_size;
0x4C int32_t ukn4c -> hash uint64[]
0x50 int32_t ukn50
0x54 int32_t ukn54
0x58 uint16 include_count
0x5b int8 ukn_4c_count // sub_2748240

global vars: level, game, classes, mission, anim, world, memory

                "'-Cdll.builtins=true'",
GSCOBJ_export* export table = object_data + (int32)object_data[0x30]

export size 

uint64* includes = object_data + (int32)object_data[0x18]

export flags: 

0x86 = Class def?

HGFEDCBA
- A 0x01 linked
- B 0x02 autoexec
- C 0x04 private
- D 0x08 class_member
- E 0x10 class_destructor
- F 0x20 ve
- G 0x40 event
- H 0x80 class_linked

import flags:
HGFEAAAA
- AAAA 0x0F
  - 1: getfunction/getmethod 
  - 2: function
  - 3: function_thread
  - 4: function_childthread
  - 5: method
  - 6: method_thread
  - 7: method_childthread
  - default: error linking
- E 0x10 dev import
- F 0x20 to resolve import ; api import namespace "sys" or "" or using the same namespace
- G 0x40 unk40
- H 0x80 unk80

0000000007D9BC10     ; SCREVENT_MAP g_ScrEventMapPoolBuffer[2][512]
SCREVENT_MAP 0x18
{
  SCREVENT_MAP* next; // 0x08
  SCREVENT_HANDLER *handler; // 0x10
  uint32 eventName; // 0x14
  bool gameSideRegistered; // 0x15
  bool pad0; // 0x16
  short pad02; // 0x18
}

Abort
AutoBreakpoint
Breakpoint
ErrorBreakpoint
ThreadEndBreakpoint
WatchBreakpoint
GetIString

New
NextArrayKey
SafeDecTop
PushEntityVar
PushVar
SafeSetWaittillVariableFieldCached
SelfEvalFieldVariable
SelfEvalFieldVariableRef

struct __declspec(align(8)) scrVarPub_t
{
  const char *fieldBuffer;
  const char *error_message;
  byte *programBuffer;
  byte *endScriptBuffer;
  HunkUser *programHunkUser;
  scrVarGlobalVars_t globalVars[16];
  ScrVarNameIndex_t entFieldNameIndex;
  ScrVarIndex_t freeEntList;
  ScrVarIndex_t tempVariable;
  unsigned int checksum;
  unsigned int entId;
  unsigned int varHighWatermark;
  unsigned int numScriptThreads;
  unsigned int numVarAllocations;
  //int varHighWatermarkId;
  //bool developer;
  //bool evaluate;
};



strings:

object_data + object_data[str.string] = ENCRYPTED_STRING
str.type = 0x00 or error(483405794)

----linking function:

-------imports:

foreach import -> check address and 


fixup on linking

offset 0x59F1B08


						player function_cce105c8(#"tier_skip", 1, 1, 2, modeindex);


entity type:


6: weapon


weird stuff

script_39347d985163e17::function_ebd0491e() (t8-src decompilation)
script_31e56101095f174b.gsc::_planprocessstack() (a continue in a switch)

fetch root thread

VM_ArchiveStack(scriptInstance_t,ScrVarValue_t *,ScrVarValue_t *,uchar *,uint,uint *,bool)	.text	0000000002753410	00000152	00000048	00000030	R	.	.	.	.	.	T	.

ScrVarIndex_t __fastcall ScrVar_RootThread(scriptInstance_t inst, ScrVarIndex_t id)
{
  ScrVarIndex_t parentId; // r9d
  __int64 v3; // r8
  scrVarGlob_t *v4; // r10
  ScrVarType_t type; // eax

  parentId = id;
  v3 = inst;
  v4 = &gScrVarGlob[v3];
  type = gScrVarGlob[v3].scriptValues[id].type;
  while ( type == TYPE_CHILD_THREAD || type == TYPE_REMOVED_THREAD )
  {
    type = gScrVarGlob[v3].scriptValues[v4->scriptVariables[parentId].parentId].type;
    if ( type - 14 > 4 && type != TYPE_REMOVED_THREAD )
      break;
    parentId = v4->scriptVariables[parentId].parentId;
  }
  return parentId;
}


Archive stack:

allocate ScrVarStackBuffer object, buffer[object->size * 9]

buffer[i] = {
  // 0x0
  union {
    BYTE* codePos; // if type == TYPE_CODEPOS
    ScrVar var; // otherwise
  } val;
  // 0x8
  BYTE type;
}

Put the allocated object inside a scriptValue of type TYPE_STACK
```
scrvar sizes:

Function name	Segment	Start	Length	Locals	Arguments	R	F	L	M	S	B	T	=
ScrVar_Init(scriptInstance_t)	.text	000000000275FCF0	0000019D	00000058	00000020	R	.	.	.	.	.	T	.
ScrVar_InitVariables(scriptInstance_t)	.text	000000000275FF80	000001AD	00000028	00000020	R	.	.	.	.	.	T	.
ScrVar_InitVariables(scriptInstance_t)	.text	0000000002761840	00000005	00000000		R	.	.	.	.	.	T	.


| name                        | server  | client  | decl type           | itemsize |
|-----------------------------|---------|---------|---------------------|----------|
| scriptVariables             | 160000  | 100000  | ScrVar_t            | 32       |
| scriptNameSearchHashList    | 0x80000 | 0x80000 | ScrVarIndex_t       | 4        |
| scriptVariablesObjectInfo1  | 160000  | 100000  | ScrVarObjectInfo1_t | 8        |
| scriptVariablesObjectInfo2  | 160000  | 100000  | ScrVarObjectInfo2_t | 4        |
| scriptValues                | 80000   | 50000   | ScrVarValue_t       | 32       |

BlackOps4.exe+f99b188,hash_2072776920646d63,20646d630a302032???
```c++
70D75463B2B9CA00 bool
3D9919379A615120 int 500k

0000000004ECC1D0 s_loadoutNames

enum loadoutClass_t : __int32
  CLASS_INVALID = 0xFFFFFFFF,
weapon_smg
weapon_assault
weapon_tactical
weapon_cqb
weapon_lmg
weapon_sniper
weapon_pistol
weapon_launcher
weapon_knife
weapon_special
weapon_shotgun
weapon_explosive
weapon_grenade
weapon_masterkey
weapon_grenadelauncher
weapon_flamethrower
specialty
talisman
specialgrenade
miscweapon
feature
bonuscard
killstreak
hero
talent
bubblegum
bubblegum_consumable
character

  CUSTOM_CLASS_1 = 0x0,
  CUSTOM_CLASS_FIRST = 0x0,
  CUSTOM_CLASS_2 = 0x1,
  CUSTOM_CLASS_3 = 0x2,
  CUSTOM_CLASS_4 = 0x3,
  CUSTOM_CLASS_5 = 0x4,
  BASIC_CUSTOM_CLASS_COUNT = 0x5,
  CUSTOM_CLASS_6 = 0x5,
  FIELD_OPS_CLASS_FIRST = 0x5,
  CUSTOM_CLASS_7 = 0x6,
  CUSTOM_CLASS_8 = 0x7,
  CUSTOM_CLASS_9 = 0x8,
  FIELD_OPS_CLASS_LAST = 0x8,
  CUSTOM_CLASS_10 = 0x9,
  CUSTOM_CLASS_COUNT = 0xA,
  DEFAULT_CLASS_FIRST = 0xA,
  DEFAULT_CLASS_SMG = 0xA,
  DEFAULT_CLASS_CQB = 0xB,
  DEFAULT_CLASS_ASSAULT = 0xC,
  DEFAULT_CLASS_LMG = 0xD,
  DEFAULT_CLASS_SNIPER = 0xE,
  DEFAULT_CLASS_LAST = 0xE,
  TOTAL_CLASS_COUNT = 0xF,
};

enum loadoutSlot_t : __int32 {
  LOADOUTSLOT_INVALID = 0xFFFFFFFF,
  LOADOUTSLOT_FIRST = 0x0,
  LOADOUTSLOT_PRIMARY_WEAPON = 0x0,
  LOADOUTSLOT_PRIMARY_ATTACHMENT1 = 0x1,
  LOADOUTSLOT_PRIMARY_ATTACHMENT2 = 0x2,
  LOADOUTSLOT_PRIMARY_ATTACHMENT3 = 0x3,
  LOADOUTSLOT_PRIMARY_ATTACHMENT4 = 0x4,
  LOADOUTSLOT_PRIMARY_ATTACHMENT5 = 0x5,
  LOADOUTSLOT_PRIMARY_ATTACHMENT6 = 0x6,
  LOADOUTSLOT_PRIMARY_ATTACHMENT7 = 0x7,
  LOADOUTSLOT_PRIMARY_CAMO = 0x8,
  LOADOUTSLOT_PRIMARY_RETICLE = 0x9,
  LOADOUTSLOT_PRIMARY_PAINTJOB_SLOT = 0xa,
  LOADOUTSLOT_PRIMARY_WEAPON_MODEL_SLOT = 0xb,
  LOADOUTSLOT_PRIMARY_CHARM = 0xc,
  LOADOUTSLOT_PRIMARY_DEATHFX = 0xd,
  LOADOUTSLOT_SECONDARY_WEAPON = 0xe,
  LOADOUTSLOT_SECONDARY_ATTACHMENT1 = 0xf,
  LOADOUTSLOT_SECONDARY_ATTACHMENT2 = 0x10,
  LOADOUTSLOT_SECONDARY_ATTACHMENT3 = 0x11,
  LOADOUTSLOT_SECONDARY_ATTACHMENT4 = 0x12,
  LOADOUTSLOT_SECONDARY_ATTACHMENT5 = 0x13,
  LOADOUTSLOT_SECONDARY_ATTACHMENT6 = 0x14,
  LOADOUTSLOT_SECONDARY_ATTACHMENT7 = 0x15,
  LOADOUTSLOT_SECONDARY_CAMO = 0x16,
  LOADOUTSLOT_SECONDARY_RETICLE = 0x17,
  LOADOUTSLOT_SECONDARY_PAINTJOB_SLOT = 0x18,
  LOADOUTSLOT_SECONDARY_WEAPON_MODEL_SLOT = 0x19,
  LOADOUTSLOT_SECONDARY_CHARM = 0x1a,
  LOADOUTSLOT_SECONDARY_DEATHFX = 0x1b,
  LOADOUTSLOT_PRIMARY_GRENADE = 0x1c,
  LOADOUTSLOT_PRIMARY_GRENADE_COUNT = 0x1d,
  LOADOUTSLOT_SPECIAL_GRENADE = 0x1e,
  LOADOUTSLOT_SPECIAL_GRENADE_COUNT = 0x1f,
  LOADOUTSLOT_HERO_GADGET = 0x20,
  LOADOUTSLOT_SPECIALTY1 = 0x21,
  LOADOUTSLOT_SPECIALTY2 = 0x22,
  LOADOUTSLOT_SPECIALTY3 = 0x23,
  LOADOUTSLOT_SPECIALTY4 = 0x24,
  LOADOUTSLOT_SPECIALTY5 = 0x25,
  LOADOUTSLOT_SPECIALTY6 = 0x26,
  LOADOUTSLOT_TALISMAN1 = 0x27,
  LOADOUTSLOT_TACTICALGEAR = 0x28,
  LOADOUTSLOT_TALENT1 = 0x29,
  LOADOUTSLOT_TALENT2 = 0x2a,
  LOADOUTSLOT_TALENT3 = 0x2b,
  LOADOUTSLOT_TALENT4 = 0x2c,
  LOADOUTSLOT_TALENT5 = 0x2d,
  LOADOUTSLOT_TALENT6 = 0x2e,
  LOADOUTSLOT_BONUSCARD1 = 0x2f,
  LOADOUTSLOT_BONUSCARD2 = 0x30,
  LOADOUTSLOT_BONUSCARD3 = 0x31,
  LOADOUTSLOT_EQUIPPED_BUBBLE_GUM_PACK = 0x32,
  LOADOUTSLOT_KILLSTREAK1 = 0x33,
  LOADOUTSLOT_KILLSTREAK2 = 0x34,
  LOADOUTSLOT_KILLSTREAK3 = 0x35,
  LOADOUTSLOT_KILLSTREAK4 = 0x36,
  LOADOUTSLOT_FIRST_SELECTED_CHARACTER_INDEX = 0x37,
  LOADOUTSLOT_COUNT = 0x38,

csv reader: (STRINGTABLE assets)

// ????

struct __declspec(align(8)) StringTableCell
{
  const char *string;
  const char *hash;
};

/*
item size ... 40
count ....... dc
*/


struct StringTable {
  UINT64 name;
  int unk8;
  int unk10;
  int columnCount;
  int rowCount;
  int cellscount;
  int unk24;
  StringTableCell *cells;
  StringTableCell *values;
};

00000090F8AFC _ZL17sSessionModeState

sSessionModeState.val << 28 >> 28 == mode

MODE_ZOMBIES = 0x0,
MODE_MULTIPLAYER = 0x1,
MODE_CAMPAIGN = 0x2,
MODE_WARZONE = 0x3,


41d51c19898976f = #hash_44588d37c7fe1bf3+_control.csv

missing csv file to search (later): #"hash_287942b71dbfe24f"
gamedata/loot/mplootemblems.csv
gamedata/loot/mpUnreleasedLoot.csv
gamedata/tables/common/music_player.csv
gamedata/events/reserve_deals_schedule_xbox.csv
gamedata/events/reserve_deals_schedule_ps4.csv
gamedata/loot/mplootitems.csv
gamedata/tables/cp/cp_vehicleHacks.csv
gamedata/tables/common/consumables.csv
gamedata/events/itemshop_slot_1_ps4.csv
gamedata/events/itemshop_slot_2_ps4.csv
gamedata/events/itemshop_slot_3_ps4.csv
gamedata/events/itemshop_slot_4_ps4.csv
gamedata/events/itemshop_slot_5_ps4.csv
gamedata/events/itemshop_slot_6_ps4.csv
gamedata/events/itemshop_slot_1_xbox.csv
gamedata/events/itemshop_slot_2_xbox.csv
gamedata/events/itemshop_slot_3_xbox.csv
gamedata/events/itemshop_slot_4_xbox.csv
gamedata/events/itemshop_slot_5_xbox.csv
gamedata/events/itemshop_slot_6_xbox.csv


sub_289C720(a1, code, false)
->sub_289C8A0(a1, code, words=4u, false)

fetch 4 words:

log2_size = {6, 10, 8, 8}[word_set]
row=code_format & ((1 << log2_size) - 1)

word string tables

46D538729ABE6952
2A06FE632CCB5067
59A56450857003D8
4BD2C66723787045

// fast file:

.ff : header[2112]
.fd : header[4264]

// fd patch the ff file

byte magic[8]:  ()
uint32 version: 
struct XFile
{
  uint8_t magic[8]; // = 0x3030303066664154 "0000ffAT"
  uint32_t version; // = 0x27F
  uint8_t server;   // server only?
  uint8_t compression;
  uint8_t platform; // 0 = pc?
  uint8_t encrypted;
  uint64_t timestamp;
  uint32_t changelist;
  uint32_t archiveChecksum[4]; // checksum test
  char builder[32];
  uint32_t metaVersion;
  char mergeFastfile[64];
  char missionFastFiles[16][64];
  uint64_t size;
  uint64_t externalSize;
  uint64_t memMappedOffset;
  uint64_t blockSize[8];
  int8_t fastfileName[64]; // 6F0
  uint8_t signature[256];
  uint8_t aesIV[16];
};

season 1 -> file_4627c92be5fdcdd0.csv

```
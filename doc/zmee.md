[Black ops 4 (T8) information...](index.md)

# Zombies step EEs

- [Zombies step EEs](#zombies-step-ees)
  - [Quest logic](#quest-logic)
    - [Register](#register)
    - [Life of a quest](#life-of-a-quest)
      - [Setup](#setup)
      - [Cleanup](#cleanup)
      - [Next](#next)
      - [Record stats](#record-stats)
  - [EE per map](#ee-per-map)
    - [Global](#global)
      - [`#"music_sq"` (Music / Chaos storyline)](#music_sq-music--chaos-storyline)
    - [Voyage (`zm_zodt8`)](#voyage-zm_zodt8)
      - [`#"main_quest"` (Main quest)](#main_quest-main-quest)
      - [`#"hash_634eee6c99fa32d6"` (shield frost upgrade)](#hash_634eee6c99fa32d6-shield-frost-upgrade)
      - [`#"sea_walkers"`](#sea_walkers)
      - [`#"vomit_blade"`](#vomit_blade)
      - [`#"fishy_offering"` (free perk)](#fishy_offering-free-perk)
      - [`#"portal_pass"`](#portal_pass)
      - [`#"hash_68677a02650cad00"`](#hash_68677a02650cad00)
      - [`#"hash_61a8ff6c7866b2d4"`](#hash_61a8ff6c7866b2d4)
      - [`#"boss_fight"` (eye boss fight)](#boss_fight-eye-boss-fight)
      - [`#"hash_1222a3e832bad772"`](#hash_1222a3e832bad772)
    - [IX (`zm_towers`)](#ix-zm_towers)
      - [`#"main_quest"` (Main quest)](#main_quest-main-quest-1)
      - [`#"ww_quest"` (ww quest)](#ww_quest-ww-quest)
      - [`#"hash_7848e22b4305215c"`](#hash_7848e22b4305215c)
      - [`#"hash_39d41ab4004ca686"`](#hash_39d41ab4004ca686)
      - [`#"hash_1da6434ce50c3713"`](#hash_1da6434ce50c3713)
    - [Blood of the Dead (`zm_escape`)](#blood-of-the-dead-zm_escape)
      - [`#"paschal_quest"` (Main quest)](#paschal_quest-main-quest)
      - [`#"jump_scare"` (catwalk sniper scope event)](#jump_scare-catwalk-sniper-scope-event)
      - [`#"drawings"` (drawing ee)](#drawings-drawing-ee)
      - [`#"narrative_room"`](#narrative_room)
      - [`#"hash_e1a54725ab6e00b"`](#hash_e1a54725ab6e00b)
      - [`#"monkey_bomb"` (free monkey\_bomb)](#monkey_bomb-free-monkey_bomb)
      - [`#"laundry_day"` (free monkey\_bomb)](#laundry_day-free-monkey_bomb)
      - [`#"hash_670bd51cc2f6cb9b"`](#hash_670bd51cc2f6cb9b)
    - [Classifier (`zm_office`)](#classifier-zm_office)
      - [`#"main_quest"` (main quest)](#main_quest-main-quest-2)
      - [`#"hash_5a9580406af2d773"`](#hash_5a9580406af2d773)
      - [`#"hash_63dc1e557f49595f"`](#hash_63dc1e557f49595f)
      - [`#"hash_6039fc2dd130edf5"`](#hash_6039fc2dd130edf5)
      - [`#"jump_scare"` (Richtofen jumpscare)](#jump_scare-richtofen-jumpscare)
      - [`#"narrative_room"`](#narrative_room-1)
    - [Dead of the Night (`zm_mansion`)](#dead-of-the-night-zm_mansion)
      - [`#"zm_mansion_impaler"` (Impaler ww quest)](#zm_mansion_impaler-impaler-ww-quest)
      - [`#"zm_jordans_painting"`](#zm_jordans_painting)
      - [`#"zm_jordans_reward"`](#zm_jordans_reward)
      - [`#"zm_mansion_triad"` (stones/pap)](#zm_mansion_triad-stonespap)
      - [`#"zm_mansion_pap_quest"`](#zm_mansion_pap_quest)
      - [`#"zm_mansion_silver_bullet"` (silver bullets)](#zm_mansion_silver_bullet-silver-bullets)
      - [`#"hash_331f9ba64e2c2478"`](#hash_331f9ba64e2c2478)
      - [`#"hash_4c0e5e4b34877996"`](#hash_4c0e5e4b34877996)
      - [`#"hash_65636bbec86da22c"`](#hash_65636bbec86da22c)
      - [`#"zm_storage_billiards"`](#zm_storage_billiards)
      - [`#"hash_578d0d7709a00e6e"`](#hash_578d0d7709a00e6e)
      - [`#"hash_559b7237b8acece2"`](#hash_559b7237b8acece2)
    - [Ancien Evil (`zm_red`)](#ancien-evil-zm_red)
      - [`#"boss_battle"`](#boss_battle)
      - [`#"main_quest"`](#main_quest)
      - [`#"prophecy"`](#prophecy)
      - [`#"light"`](#light)
      - [`#"narrative_room"`](#narrative_room-2)
    - [Alpha Omega (`zm_white`)](#alpha-omega-zm_white)
      - [`#"zm_white_main_quest"` (main quest)](#zm_white_main_quest-main-quest)
      - [`#"hash_26a9aef6e9be5b86"` (Crawler step)](#hash_26a9aef6e9be5b86-crawler-step)
      - [`#"hash_75f9f80c2256f3d3"` (Canister step)](#hash_75f9f80c2256f3d3-canister-step)
      - [`#"hash_19d484735f237f45"` (Circuit step)](#hash_19d484735f237f45-circuit-step)
      - [`#"hash_ab36ea0a749269d"` (main quest related)](#hash_ab36ea0a749269d-main-quest-related)
      - [`#"zm_white_mq_mannequin"` (main quest related)](#zm_white_mq_mannequin-main-quest-related)
      - [`#"mee_projectile"`](#mee_projectile)
      - [`#"mee_melee"`](#mee_melee)
      - [`#"mee_mixed"`](#mee_mixed)
      - [`#"mee_galvaknuckle"`](#mee_galvaknuckle)
      - [`#"jump_scare"`](#jump_scare)
      - [`#"private_mannequin_program"`](#private_mannequin_program)
      - [`#"boss_battle"`](#boss_battle-1)
      - [`#"hash_7b3ce20f6b2317db"`](#hash_7b3ce20f6b2317db)
      - [`#"insanity_mode"`](#insanity_mode)
    - [Tag (`zm_orange`)](#tag-zm_orange)
      - [`#"main_quest"` (Main quest)](#main_quest-main-quest-3)
      - [`#"ww_quest"` (Wunderwaffe quest)](#ww_quest-wunderwaffe-quest)
      - [`#"hash_12114abc7407913b"`](#hash_12114abc7407913b)
      - [`#"hash_5e38e846ce88405b"`](#hash_5e38e846ce88405b)
      - [`#"hash_729a1e4eb041be9b"`](#hash_729a1e4eb041be9b)
      - [`#"edge_of_the_world"`](#edge_of_the_world)
      - [`#"hash_3a6788f4daed8c33"`](#hash_3a6788f4daed8c33)
      - [`#"ee_tundragun"` (tundragun)](#ee_tundragun-tundragun)
      - [`#"yellow_snowballs"` (yellow snowballs)](#yellow_snowballs-yellow-snowballs)
      - [`#"pap_rock"` (pap)](#pap_rock-pap)
      - [`#"freeze_mode"`](#freeze_mode)
      - [`#"hash_3e4c279707a5abe5"`](#hash_3e4c279707a5abe5)
      - [`#"hash_66685502a7dee586"`](#hash_66685502a7dee586)
    - [Unknown steps](#unknown-steps)
      - [`#"hash_6bd65802877ef7e0"` (zm\_orange?)](#hash_6bd65802877ef7e0-zm_orange)
      - [`#"hash_22d9cdbaac99885"` (zm\_office?)](#hash_22d9cdbaac99885-zm_office)


## Quest logic

The main logic behind zombies' step EEs is in the [zm_sq.gsc](https://github.com/ate47/t8-src/blob/main/scripts/zm_common/zm_sq.gsc) in the `register()` and `start()` methods.

### Register

A quest is registered first using this method, each step must be registered in the order they want to be executed, registering a step is the same as registering an EE.

```c++
zm_sq::register(
    hash name, 
    hash step_name, 
    hash step_flag_name, 
    func setup_func, 
    func cleanup_func, 
    bool record_stat = undefined, 
    func record_stat_func = undefined
);
```

- `name` : hash of the ee name
- `step_name` : hash of the ee step name
- `step_flag_name` : hash flag of the step ee
- `setup_func` : function called when the step starts
- `cleanup_func` : function called when the step ends
- `record_stat` : record the stat when the ee is completed
- `record_stat_func` : function called after the stats are recorded after the ee completion (only one per ee, first defined is used)

This function will register 2 flags,

- `name + "_completed"` if it wasn't already registered
- `step_flag_name + "_completed"`

The structure of the functions are:

```c++
setup_func(bool skip_to_step);
cleanup_func(bool skip_to_step, bool ended_early);
<player> record_stat_func();
```

The `skip_to_step` is a debug value only available with the dev blocks, by default this value is false, to be true the step should have been skip to this one, it can be useful when reading the script to know how to skip to this step.

The `ended_early` is a utility value only set to false by default, it is set to true when the step is skipped notifying the `level` by the `step_flag_name + "_ended_early"` event. Not all the steps can be skipped so you can bypass all the steps.

An EE is stored in the `level._ee[name]` object and each EE step is stored in the `level._ee[name].steps[step_id]` (`step_id` is an integer) the structure is

```c++
struct ee {
    // name of the ee
    hash name = name;
    // (debug only) skip to a particular step
    int skip_to_step = -1;
    // current step
    uint current_step = 0;
    // list of the steps
    array<ee_step> steps = array();
    // is the ee started
    bool started = false;
    // is the ee completed
    bool completed = false;
    // do we need to record the stat
    bool record_stat = undefined;
    // after stat record callback
    func var_35ccab99 = undefined;
}
struct ee_step {
    // parent ee object
    ee ee = parent_ee;
    // name of the step ee
    hash name = step_name;
    // is the step ee cleanup
    bool cleaned_up = false;
    // is the step ee completed
    bool completed = false;
    // is the step started
    bool started = false;
    // step ee flag name
    hash var_e788cdd7 = step_flag_name;
    // step ee cleanup function
    func cleanup_func = cleanup_func;
    // step ee setup function
    func setup_func = setup_func;
    // the next step after this step
    ee_step next_step = undefined;
}
```

### Life of a quest

Once a quest is registered, it needs to be started, it is done using this function

```c++
zm_sq::start(
    hash name,
    bool is_available_casual_offline = false
);
```

- `name` : hash of the ee name
- `is_available_casual_offline` : is if the quest is available offline or in casual

A quest can't be started more than once, even after its completion, so you can start it by yourself safely (if nothing is required)

#### Setup

It'll run the setup function in a new **thread** and wait for one of these 2 events on the level object:

- `step_flag_name + "_ended_early"`
- `step_flag_name + "_setup_completed"`

In the new thread, the setup function will call the event `step_flag_name + "_started"`, call the ee step setup function, once done set `step.completed = true` and call the event `step_flag_name + "_setup_completed"` on the level object. 

This process is cancelled if the **step** object receive the event `"end_early"`, it'll set `step.completed = true` and call the event `step_flag_name + "_ended_early"` on the level object.

#### Cleanup

Once the setup is done, the cleanup function is started (unlike the setup function, it can't be cancelled), it set `step.cleaned_up = true` and the flag `step_flag_name + "_completed"`

#### Next

If the step has a next step, it will do:

**Dev mode only**, check if the `skip_to_step` is above the current step id, wait 0.5s

It'll increase the `ee.current_step` by 1 and call in a new **thread** the next step.

#### Record stats

If the step doesn't have a next step, it will do:

set `ee.completed = true`

set the flag `name + "_completed"`

if the game is an online game and if `ee.record_stat` is `true` it'll do for each player:

- set the stat `main_quest_completed` to true
- the stat `FASTEST_QUEST_COMPLETION_TIME` to the current elapsed time
- process the score event `#"main_ee"`
- if `record_stat_func` is defined, calling it for each player

## EE per map

### Global

#### `#"music_sq"` (Music / Chaos storyline)

**steps**

  - name: `#"first_location"`, flag name: `#"hash_3531cfab5aa57f4b"`

### Voyage (`zm_zodt8`)

#### `#"main_quest"` (Main quest)

**steps**

  - name: `#"step_1"`, flag name: `#"main_quest_step_1"`
  - name: `#"step_2"`, flag name: `#"main_quest_step_2"`
  - name: `#"step_3"`, flag name: `#"main_quest_step_3"`
  - name: `#"step_4"`, flag name: `#"main_quest_step_4"`
  - name: `#"step_5"`, flag name: `#"main_quest_step_5"`
  - name: `#"step_6"`, flag name: `#"main_quest_step_6"`
  - name: `#"step_7"`, flag name: `#"main_quest_step_7"`
  - name: `#"step_8"`, flag name: `#"main_quest_step_8"`
  - name: `#"step_9"`, flag name: `#"main_quest_step_9"`
  - name: `#"outro_igc"`, flag name: `#"main_quest_step_10"`

#### `#"hash_634eee6c99fa32d6"` (shield frost upgrade)

**steps**

  - name: `#"step_1"`, flag name: `#"hash_33e48ffbaa9e7729"`
  - name: `#"step_2"`, flag name: `#"hash_33e48cfbaa9e7210"`
  - name: `#"step_3"`, flag name: `#"hash_33e48dfbaa9e73c3"`
  - name: `#"step_4"`, flag name: `#"hash_33e492fbaa9e7c42"`

#### `#"sea_walkers"`

**steps**

  - name: `#"step_1"`, flag name: `#"sea_walkers_step_1"`

#### `#"vomit_blade"`

**steps**

  - name: `#"step_1"`, flag name: `#"vomit_blade_step_1"`

#### `#"fishy_offering"` (free perk)

**steps**

  - name: `#"step_1"`, flag name: `#"hash_189536bc9c5850f1"`
  - name: `#"step_2"`, flag name: `#"hash_189533bc9c584bd8"`

#### `#"portal_pass"`

**steps**

  - name: `#"step_1"`, flag name: `#"portal_pass_step_1"`
  - name: `#"step_2"`, flag name: `#"portal_pass_step_2"`

#### `#"hash_68677a02650cad00"`

**steps**

  - name: `#"step_1"`, flag name: `#"hash_4ba91dee7d31240b"`
  - name: `#"step_2"`, flag name: `#"hash_4ba91eee7d3125be"`

#### `#"ships_engineer"`

**steps**

  - name: `#"step_1"`, flag name: `#"ships_engineer_step_1"`
  - name: `#"step_2"`, flag name: `#"ships_engineer_step_2"`
  - name: `#"step_3"`, flag name: `#"ships_engineer_step_3"`

#### `#"boss_fight"` (eye boss fight)

**steps**

  - name: `#"step_1"`, flag name: `#"hash_29b25d86ddeb7d44"`
  - name: `#"step_2"`, flag name: `#"hash_29b26086ddeb825d"`
  - name: `#"step_3"`, flag name: `#"hash_29b25f86ddeb80aa"`
  - name: `#"step_4"`, flag name: `#"hash_29b25a86ddeb782b"`
  - name: `#"step_5"`, flag name: `#"hash_29b25986ddeb7678"`

#### `#"hash_1222a3e832bad772"`

**steps**

  - name: `#"hash_2725edd09b4bb1b6"`, flag name: `#"hash_13b316981d67e1ad"`
  - name: `#"hash_6cc4f52e0ed36f92"`, flag name: `#"hash_13b313981d67dc94"`
  - name: `#"hash_575b4d3faca8bf2e"`, flag name: `#"hash_13b314981d67de47"`
  - name: `#"hash_1d89a5560669ab60"`, flag name: `#"hash_13b311981d67d92e"`

### IX (`zm_towers`)

TODO

#### `#"main_quest"` (Main quest)

**steps**

  - name: `#"hash_616226b026783ca3"`, flag name: `#"hash_616226b026783ca3"`
  - name: `#"collect_ingredients"`, flag name: `#"collect_ingredients"`
  - name: `#"mix_fertilizer"`, flag name: `#"mix_fertilizer"`
  - name: `#"place_fertilizer"`, flag name: `#"place_fertilizer"`
  - name: `#"hash_c165871a3fda034"`, flag name: `#"hash_c165871a3fda034"`
  - name: `#"activate_bulls"`, flag name: `#"activate_bulls"`
  - name: `#"activate_puzzle"`, flag name: `#"activate_puzzle"`
  - name: `#"hash_1cf74a26bf73d769"`, flag name: `#"hash_1cf74a26bf73d769"`
  - name: `#"hash_73c85b5a7924fcfb"`, flag name: `#"hash_73c85b5a7924fcfb"`
  - name: `#"activate_lightning_balls"`, flag name: `#"activate_lightning_balls"`
  - name: `#"gladiator_round"`, flag name: `#"gladiator_round"`
  - name: `#"maelstrom_completed"`, flag name: `#"maelstrom_completed"`
  - name: `#"light_runes"`, flag name: `#"light_runes"`
  - name: `#"pressure_plate"`, flag name: `#"pressure_plate"`
  - name: `#"trilane_defend"`, flag name: `#"trilane_defend"`
  - name: `#"boss_battle"`, flag name: `#"boss_battle"`

#### `#"ww_quest"` (ww quest)

**steps**

  - name: `#"destroy_wall"`, flag name: `#"destroy_wall"`
  - name: `#"knock_brazier"`, flag name: `#"knock_brazier"`
  - name: `#"hash_32b57ffc37ccf79a"`, flag name: `#"hash_32b57ffc37ccf79a"`
  - name: `#"hash_2e681afa5f81f37"`, flag name: `#"hash_2e681afa5f81f37"`
  - name: `#"hash_27967f916a97a057"`, flag name: `#"hash_27967f916a97a057"`
  - name: `#"hash_34d18772151ea4fa"`, flag name: `#"hash_34d18772151ea4fa"`
  - name: `#"hash_2e126c422fbf5654"`, flag name: `#"hash_2e126c422fbf5654"`
  - name: `#"hash_396293edac63aa6f"`, flag name: `#"hash_396293edac63aa6f"`
  - name: `#"hash_776efec5f9b03a68"`, flag name: `#"hash_776efec5f9b03a68"`
  - name: `#"hash_7e929133c03a391b"`, flag name: `#"hash_7e929133c03a391b"`
  - name: `#"hash_1ab84b282c179562"`, flag name: `#"hash_1ab84b282c179562"`
  - name: `#"hash_530b93342f7f39ae"`, flag name: `#"hash_530b93342f7f39ae"`
  - name: `#"hash_38a9bcd55c0565ca"`, flag name: `#"hash_38a9bcd55c0565ca"`
  - name: `#"hash_2512f1281c5c7237"`, flag name: `#"hash_2512f1281c5c7237"`
  - name: `#"hash_4e767f415b51d0a1"`, flag name: `#"hash_4e767f415b51d0a1"`

#### `#"hash_7848e22b4305215c"`

**steps**

  - name: `#"collect_charcoal"`, flag name: `#"collect_charcoal"`

#### `#"hash_39d41ab4004ca686"`

**steps**

  - name: `#"hash_1c34d1cbe7a35ae1"`, flag name: `#"hash_1c34d1cbe7a35ae1"`

#### `#"hash_1da6434ce50c3713"`

**steps**

  - name: `#"collect_dung"`, flag name: `#"collect_dung"`

### Blood of the Dead (`zm_escape`)

TODO

#### `#"paschal_quest"` (Main quest)

**steps**

  - name: `#"1"`, flag name: `#"paschal_quest_step_1"`
  - name: `#"2"`, flag name: `#"paschal_quest_step_2"`
  - name: `#"3"`, flag name: `#"paschal_quest_step_3"`
  - name: `#"4"`, flag name: `#"paschal_quest_step_4"`
  - name: `#"5"`, flag name: `#"paschal_quest_step_5"`
  - name: `#"6"`, flag name: `#"paschal_quest_step_6"`
  - name: `#"7"`, flag name: `#"paschal_quest_step_7"`
  - name: `#"outro"`, flag name: `#"hash_4b2d3fa2839cfcf8"`

#### `#"jump_scare"` (catwalk sniper scope event)

**steps**

  - name: `#"1"`, flag name: `#"hash_3203b932029a4e0b"`

#### `#"drawings"` (drawing ee)

**steps**

  - name: `#"1"`, flag name: `#"drawings_quest"`

#### `#"narrative_room"`

**steps**

  - name: `#"1"`, flag name: `#"hash_64d6af5ddc324d26"`
  - name: `#"2"`, flag name: `#"hash_3f567f217222e5b2"`

#### `#"hash_e1a54725ab6e00b"`

**steps**

  - name: `#"hash_66e936afdcdd5d4d"`, flag name: `#"hash_574005386f679cf6"`
  - name: `#"hash_385585cb6cbead68"`, flag name: `#"hash_574004386f679b43"`
  - name: `#"hash_42a50f35aa200869"`, flag name: `#"hash_574003386f679990"`

#### `#"monkey_bomb"` (free monkey_bomb)

**steps**

  - name: `#"hash_438156183f3f5ffa"`, flag name: `#"monkey_bomb_step_1"`
  - name: `#"hash_bf8e42b419290b3"`, flag name: `#"monkey_bomb_step_2"`

#### `#"laundry_day"` (free monkey_bomb)

**steps**

  - name: `#"1"`, flag name: `#"hash_77cae6c10f2939fa"`

#### `#"spoon_quest"`

**steps**

  - name: `#"1"`, flag name: `#"hash_3b8b2ab09b97dee6"`

### Classifier (`zm_office`)

#### `#"main_quest"` (main quest)

**steps**

  - name: `#"step1"`, flag name: `#"main_quest_step1"`


#### `#"hash_5a9580406af2d773"`

**steps**

  - name: `#"step_1"`, flag name: `#"hash_5cbd9c892dca9e05"`
  - name: `#"step_2"`, flag name: `#"hash_5cbd99892dca98ec"`
  - name: `#"step_3"`, flag name: `#"hash_5cbd9a892dca9a9f"`
  - name: `#"step_4"`, flag name: `#"hash_5cbd97892dca9586"`
  - name: `#"step_5"`, flag name: `#"hash_5cbd98892dca9739"`

#### `#"hash_63dc1e557f49595f"`

**steps**

  - name: `#"step_1"`, flag name: `#"hash_4d540289d82df269"`
  - name: `#"step_2"`, flag name: `#"hash_4d53ff89d82ded50"`
  - name: `#"step_3"`, flag name: `#"hash_4d540089d82def03"`
  - name: `#"step_4"`, flag name: `#"hash_4d540589d82df782"`
  - name: `#"step_5"`, flag name: `#"hash_4d540689d82df935"`

#### `#"hash_6039fc2dd130edf5"`

**steps**

  - name: `#"step_1"`, flag name: `#"hash_5873576264199a27"`
  - name: `#"step_2"`, flag name: `#"hash_5873586264199bda"`

#### `#"jump_scare"` (Richtofen jumpscare)

**steps**

  - name: `#"step_1"`, flag name: `#"hash_3203b932029a4e0b"`

#### `#"narrative_room"`

**steps**

  - name: `#"step_1"`, flag name: `#"hash_64d6af5ddc324d26"`
  - name: `#"step_2"`, flag name: `#"hash_3f567f217222e5b2"`


### Dead of the Night (`zm_mansion`)

#### `#"zm_mansion_impaler"` (Impaler ww quest)

**steps**

  - name: `#"step_1"`, flag name: `#"impaler_step_1"`
  - name: `#"step_2"`, flag name: `#"impaler_step_2"`
  - name: `#"step_3"`, flag name: `#"impaler_step_3"`
  - name: `#"step_4"`, flag name: `#"impaler_step_4"`
  - name: `#"step_5"`, flag name: `#"impaler_step_5"`

#### `#"zm_jordans_painting"`

**steps**

  - name: `#"step_1"`, flag name: `#"hash_21ed75bc8122939c"`

#### `#"zm_jordans_reward"`

**steps**

  - name: `#"step_1"`, flag name: `#"hash_af33b9072da5dc1"`
  - name: `#"step_2"`, flag name: `#"hash_af3389072da58a8"`
  - name: `#"step_3"`, flag name: `#"hash_af3399072da5a5b"`
  - name: `#"step_4"`, flag name: `#"hash_af33e9072da62da"`
  - name: `#"step_5"`, flag name: `#"hash_af33f9072da648d"`

#### `#"zm_mansion_triad"` (stones/pap)

**steps**

  - name: `#"step_1"`, flag name: `#"triad_step_1"`
  - name: `#"step_2"`, flag name: `#"triad_step_2"`
  - name: `#"step_3"`, flag name: `#"triad_step_3"`
  - name: `#"step_4"`, flag name: `#"triad_step_4"`

#### `#"zm_mansion_pap_quest"`

**steps**

  - name: `#"hash_12a37f2c621d1245"`, flag name: `#"capture_souls"`

#### `#"zm_mansion_silver_bullet"` (silver bullets)

**steps**

  - name: `#"hash_5460ffe3987d805f"`, flag name: `#"silver_bullet"`

#### `#"hash_331f9ba64e2c2478"`

**steps**

  - name: `#"step_1"`, flag name: `#"a_skeet_fink_step_1"`
  - name: `#"step_2"`, flag name: `#"a_skeet_fink_step_2"`
  - name: `#"step_3"`, flag name: `#"a_skeet_fink_step_3"`
  - name: `#"step_4"`, flag name: `#"a_skeet_fink_step_4"`


#### `#"hash_4c0e5e4b34877996"`

**steps**

  - name: `#"step_1"`, flag name: `#"hash_5b60b951867b6b11"`
  - name: `#"step_2"`, flag name: `#"hash_5b60b651867b65f8"`

#### `#"hash_65636bbec86da22c"`

**steps**

  - name: `#"step_1"`, flag name: `#"hash_1551692125951197"`
  - name: `#"step_2"`, flag name: `#"hash_15516a212595134a"`

#### `#"zm_storage_billiards"`

**steps**

  - name: `#"step_1"`, flag name: `#"hash_33b63d9ccbdb1e3e"`
  - name: `#"step_2"`, flag name: `#"hash_33b63c9ccbdb1c8b"`

#### `#"hash_578d0d7709a00e6e"`

**steps**

  - name: `#"step_1"`, flag name: `#"hash_6e38611b5382ee7f"`
  - name: `#"step_2"`, flag name: `#"hash_6e38621b5382f032"`
  - name: `#"step_3"`, flag name: `#"hash_6e38631b5382f1e5"`

#### `#"hash_559b7237b8acece2"`

**steps**

  - name: `#"step_1"`, flag name: `#"hash_2388f47d8d90bdfb"`
  - name: `#"step_2"`, flag name: `#"hash_2388f57d8d90bfae"`
  - name: `#"step_3"`, flag name: `#"hash_2388f67d8d90c161"`
  - name: `#"step_4"`, flag name: `#"hash_2388f77d8d90c314"`

### Ancien Evil (`zm_red`)

#### `#"boss_battle"`

**steps**

  - name: `#"stat_tracker"`, flag name: `#"stat_tracker"`

#### `#"main_quest"`

**steps**

  - name: `#"oil"`, flag name: `#"oil"`
  - name: `#"reflect"`, flag name: `#"reflect"`
  - name: `#"split"`, flag name: `#"split"`
  - name: `#"hash_1b1abb2af5960bfe"`, flag name: `#"hash_1b1abb2af5960bfe"`
  - name: `#"play"`, flag name: `#"play"`
  - name: `#"blood"`, flag name: `#"blood"`
  - name: `#"door_interact"`, flag name: `#"door_interact"`
  - name: `#"mid_igc"`, flag name: `#"mid_igc"`
  - name: `#"cleanse"`, flag name: `#"cleanse"`
  - name: `#"push_ballista"`, flag name: `#"push_ballista"`
  - name: `#"ignite_ballista"`, flag name: `#"ignite_ballista"`
  - name: `#"teleport"`, flag name: `#"teleport"`

#### `#"prophecy"`

**steps**

  - name: `#"shoot_roots"`, flag name: `#"shoot_roots"`
  - name: `#"defeat_gegenees"`, flag name: `#"defeat_gegenees"`
  - name: `#"take_spear"`, flag name: `#"take_spear"`
  - name: `#"place_spear"`, flag name: `#"place_spear"`
  - name: `#"sundial_puzzle"`, flag name: `#"sundial_puzzle"`

#### `#"light"`

**steps**

  - name: `#"free_ankh"`, flag name: `#"free_ankh"`
  - name: `#"take_ankh"`, flag name: `#"take_ankh"`
  - name: `#"give_ankh"`, flag name: `#"give_ankh"`
  - name: `#"defend_ra"`, flag name: `#"defend_ra"`
  - name: `#"take_staff"`, flag name: `#"take_staff"`
  - name: `#"give_staff"`, flag name: `#"give_staff"`

#### `#"narrative_room"`

**steps**

  - name: `#"1"`, flag name: `#"hash_64d6af5ddc324d26"`
  - name: `#"2"`, flag name: `#"hash_3f567f217222e5b2"`


### Alpha Omega (`zm_white`)

#### `#"zm_white_main_quest"` (main quest)

**steps**

  - name: `#"hash_482ab5c3c8c111fc"`, flag name: `#"zm_white_main_quest_step1"`
  - name: `#"mq2_cv1"`, flag name: `#"zm_white_main_quest_step2"`
  - name: `#"mq3_cv2"`, flag name: `#"zm_white_main_quest_step3"`
  - name: `#"mq4_cv3"`, flag name: `#"zm_white_main_quest_step4"`
  - name: `#"mq5_cv4"`, flag name: `#"zm_white_main_quest_step5"`
  - name: `#"mq6_cv5"`, flag name: `#"zm_white_main_quest_step6"`
  - name: `#"hash_3a3d5f6df2a45005"`, flag name: `#"zm_white_main_quest_step7"`
  - name: `#"hash_12ea405f7c5f915c"`, flag name: `#"zm_white_main_quest_step8"`
  - name: `#"hash_3a9a71b60d9f9435"`, flag name: `#"zm_white_main_quest_step9"`

#### `#"zm_white_mq_crawler"` (Crawler step)

**steps**

  - name: `#"crawler_start"`, flag name: `#"zm_white_mq_crawler_step1"`

#### `#"zm_white_mq_canister"` (Canister step)

**steps**

  - name: `#"canister_start"`, flag name: `#"zm_white_mq_canister_step1"`

#### `#"zm_white_mq_circuit"` (Circuit step)

**steps**

  - name: `#"circuit_start"`, flag name: `#"zm_white_mq_circuit_step1"`

#### `#"zm_white_mq_server"` (Server step)

**steps**

  - name: `#"server_start"`, flag name: `#"zm_white_mq_server_step1"`

#### `#"zm_white_mq_mannequin"` (main quest related)

**steps**

  - name: `#"hash_2873e4263b1aed76"`, flag name: `#"hash_5bf53c01af16d950"`
  - name: `#"hash_2873e3263b1aebc3"`, flag name: `#"hash_5bf53f01af16de69"`

#### `#"mee_projectile"`

**steps**

  - name: `#"step_1"`, flag name: `#"mee_projectile_step1"`

#### `#"mee_melee"`

**steps**

  - name: `#"step_1"`, flag name: `#"mee_melee_step1"`

#### `#"mee_mixed"`

**steps**

  - name: `#"step_1"`, flag name: `#"mee_mixed_step1"`

#### `#"mee_galvaknuckle"`

**steps**

  - name: `#"step_1"`, flag name: `#"mee_galvaknuckle_step1"`

#### `#"jump_scare"`

**steps**

  - name: `#"step_1"`, flag name: `#"hash_3203b932029a4e0b"`

#### `#"private_mannequin_program"`

**steps**

  - name: `#"step_1"`, flag name: `#"hash_5c83380ff7db3131"`
  - name: `#"step_2"`, flag name: `#"hash_5c83350ff7db2c18"`

#### `#"boss_battle"`

**steps**

  - name: `#"stat_tracker"`, flag name: `#"stat_tracker"`

#### `#"hash_7b3ce20f6b2317db"`

**steps**

  - name: `#"step_1"`, flag name: `#"hash_2af54f403e86105d"`

#### `#"insanity_mode"`

**steps**

  - name: `#"step_1"`, flag name: `#"insanity_mode_step1"`
  - name: `#"step_2"`, flag name: `#"insanity_mode_step2"`
  - name: `#"step_3"`, flag name: `#"insanity_mode_step3"`
  - name: `#"step_4"`, flag name: `#"insanity_mode_step4"`

### Tag (`zm_orange`)


#### `#"main_quest"` (Main quest)

**steps**

  - name: `#"hash_86e283359f19a5f"`, flag name: `#"main_quest_step1"`
  - name: `#"hash_467104204a4803ad"`, flag name: `#"main_quest_step2"`
  - name: `#"hash_7c16d3a3e4250b9a"`, flag name: `#"main_quest_step3"`
  - name: `#"hash_2dfcd4264b2c2340"`, flag name: `#"main_quest_step4"`
  - name: `#"hash_c2e45a40a675911"`, flag name: `#"main_quest_step5"`
  - name: `#"hash_72bc0ec65f4afcca"`, flag name: `#"hash_6289c5eef32eca15"`
  - name: `#"hash_28c88f40ace27a7b"`, flag name: `#"hash_6289c2eef32ec4fc"`
  - name: `#"hash_382d731d4de07ed3"`, flag name: `#"main_quest_step7"`
  - name: `#"hash_2c00866b95e17ff5"`, flag name: `#"main_quest_step8"`
  - name: `#"hash_ebca448700872b8"`, flag name: `#"hash_62afa5eef34f62f2"`
  - name: `#"hash_810019231f11ea1"`, flag name: `#"hash_62afa4eef34f613f"`
  - name: `#"hash_11c4f1ecb0dd5a34"`, flag name: `#"main_quest_step10"`
  - name: `#"hash_d0bf3cf30a07a84"`, flag name: `#"main_quest_step11"`
  - name: `#"hash_13b9abe1bd17294c"`, flag name: `#"main_quest_step12"`
  - name: `#"hash_7d78cef11f6afb5e"`, flag name: `#"main_quest_step13"`
  - name: `#"hash_2bd81e2b05fccbed"`, flag name: `#"main_quest_step14"`
  - name: `#"hash_49b41abaa9addedd"`, flag name: `#"main_quest_step15"`

#### `#"ww_quest"` (Wunderwaffe quest)

**steps**

  - name: `#"hash_48c49b81fdcdc242"`, flag name: `#"ww_quest_step1"`
  - name: `#"hash_6442e35feab8c079"`, flag name: `#"ww_quest_step2"`
  - name: `#"hash_737f8b1503916752"`, flag name: `#"ww_quest_step3"`
  - name: `#"hash_60e28c4bd65d92ab"`, flag name: `#"ww_quest_step4"`
  - name: `#"hash_4a7a9c037e9a8447"`, flag name: `#"ww_quest_step5"`
  - name: `#"hash_7230371c8fbcfec2"`, flag name: `#"ww_quest_step6"`
  - name: `#"hash_532d2da7fe5bfe2e"`, flag name: `#"ww_quest_step7"`
  - name: `#"hash_52f633bb8e8c32e4"`, flag name: `#"ww_quest_step8"`
  - name: `#"hash_43fb367b319214fa"`, flag name: `#"ww_quest_step9"`
  - name: `#"hash_1ec16bb3298bdc60"`, flag name: `#"ww_quest_step10"`

#### `#"hash_12114abc7407913b"`

**steps**

  - name: `#"step_1"`, flag name: `#"hash_5986bb2ab1879d84"`

#### `#"hash_5e38e846ce88405b"`

**steps**

  - name: `#"step_1"`, flag name: `#"hash_2572fbc6efde23a8"`

#### `#"hash_729a1e4eb041be9b"`

**steps**

  - name: `#"step_1"`, flag name: `#"hash_1f2d771acb13cdad"`

#### `#"edge_of_the_world"`

**steps**

  - name: `#"step_1"`, flag name: `#"hash_32fca8166d23c911"`
  - name: `#"step_2"`, flag name: `#"hash_32fca8166d23c911"`

#### `#"hash_3a6788f4daed8c33"`

**steps**

  - name: `#"step_1"`, flag name: `#"hash_6261200a332f0945"`
  - name: `#"step_2"`, flag name: `#"hash_62611d0a332f042c"`
  - name: `#"step_3"`, flag name: `#"hash_62611e0a332f05df"`
  - name: `#"step_4"`, flag name: `#"hash_62611b0a332f00c6"`
  - name: `#"step_5"`, flag name: `#"hash_62611c0a332f0279"`
  - name: `#"step_6"`, flag name: `#"hash_6261190a332efd60"`

#### `#"ee_tundragun"` (tundragun)

**steps**

  - name: `#"step_1"`, flag name: `#"ee_tundragun_step1"`
  - name: `#"step_2"`, flag name: `#"ee_tundragun_step2"`

#### `#"yellow_snowballs"` (yellow snowballs)

**steps**

  - name: `#"step_1"`, flag name: `#"hash_2ed342ae0266e20"`
  - name: `#"step_2"`, flag name: `#"hash_2ed342ae0266e20"`
  - name: `#"step_3"`, flag name: `#"hash_2ed342ae0266e20"`
  - name: `#"step_4"`, flag name: `#"hash_2ed342ae0266e20"`

#### `#"pap_rock"` (pap)

**steps**

  - name: `#"step_1"`, flag name: `#"hash_57c2f2030917f2e4"`
  - name: `#"step_2"`, flag name: `#"hash_57c2f5030917f7fd"`

#### `#"freeze_mode"`

**steps**

  - name: `#"step_1"`, flag name: `#"hash_fca1aaee837b77"`

#### `#"hash_3e4c279707a5abe5"`

**steps**

  - name: `#"step_1"`, flag name: `#"hash_3e4c279707a5abe5"`
  - 
#### `#"hash_66685502a7dee586"`

**steps**

  - name: `#"step_1"`, flag name: `#"hash_66685502a7dee586"`

### Unknown steps

Need triage

#### `#"pernell_archive"` (zm_white?)

**steps**

  - name: `#"step_1"`, flag name: `#"pernell_archive_step1"`
  - name: `#"step_2"`, flag name: `#"pernell_archive_step2"`

#### `#"hash_22d9cdbaac99885"` (zm_office?)

**steps**

  - name: `#"step_1"`, flag name: `#"hash_7b16b0c7f4445917"`
  - name: `#"step_2"`, flag name: `#"hash_7b16b1c7f4445aca"`
  - name: `#"step_3"`, flag name: `#"hash_7b16b2c7f4445c7d"`
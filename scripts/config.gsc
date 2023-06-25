AtianMenuConfig() {
    // --------- menu config ---------
    
    // load menus at start, should be the same as the one described in menu_items.gsc, syntax: "MENU_NAME::ITEM_NAME"
    // example: "tool_menu::Invulnerability" for no damage
    self.preloaded_menus = array(
        "tool_menu::Ammos",
        "tool_menu::Invulnerability",
        "tool_menu::Max Points",
        "tool_menu::Max Revive",
        "teleport::Waypoint tp",
        "tool_menu::End contracts"
    );
    
    // do not activate the menu, only use the config to create the game
    // if this value isn't set to false, no menu will be created
    self.no_menu = false;

    // only the host has the menu
    self.only_host = true;

    // fly speeds
    // - fly when moving, default 20
    self.fly_speed_normal = 20;
    // - fly when moving fast, default 60
    self.fly_speed_fast = 60;
    
    // ------- global config -------

    // set the skin during the launch of the game, you can get the names in the utils/enums.gsc file, each names are split by ';'
    // the first is the most important, if no skin can be found, it won't change the skin, the key "random" is selecting a random skin
    // you can set the outfit, palette, warpaint and decal using NAME:OUTFIT:PALETTE:WARPAINT:DECAL, 0 = default, a bad config can
    // crash the game. A fun usage:
    // - "Richtofen (Primis):1" : Alcatraz zombies (ZM/BR only)
    // - "Richtofen (Primis):2" : Great War Richtofen (ZM/BR only)
    // - "Richtofen Primis:1" : Alcatraz zombies (BR only)
    // - "Richtofen Primis:2" : Great War Richtofen (BR only)
    self.character_skin = "random";

    // set the weapon camo when you pickup a weapon, you can specify :
    // - an ID (0-512)
    // - an ID range with "v1_inclusive:v2_exclusive"
    // - multiple camo splitted with ';'
    // - a random camo in a category with "cat:category_id"
    // - a random camo "random"
    // example:
    // - a random PAP camo "cat:pap"
    // - dday reactive camo "298"
    // - gold: "43", diamond "44", diamond raybow "199"
    //   dark matter "45", dark matter BO3 "192"
    self.weapon_camo = "random";

    // when does the camo is set
    // options:
    // - "once" : the camo is set only if the current weapon doesn't have a camo
    // - "change" : the camo is set every time you change your weapon
    self.weapon_camo_reset = "once";

    // number of lives per player
    // self.numlives = 1000;

    // size of the sensor dart radius (global, can be set by game mode)
    // - blackout core     : 2400 
    // - blackout alcatraz : 1200
    // - multiplayer       : 800 
    // self.sensor_dart_radius = 4800;

    // add weapons to the give weapon menu
    // self.add_weapons = array();

    // --------- bot config ----------

    // set a random skin when creating a bot
    // same config options as character_skin
    self.bot_random_skin = "random";
    
    // options:
    // - "none" : No random skin at spawn time
    // - "once" : The bot will respawn with the same skin
    // - "respawn" : at every respawn a new skin will be set
    self.bot_random_skin_logic = "once";

    // set a camo to the bots, same config as weapon_camo
    self.bot_random_camo = "random";

    // add bot at the start of the game
    //self.bot_add_start = 10;

    // ------- blackout config -------

    // force a blackout map, options:
    //    "wz_open_skyscrapers" // Core map
    //    "wz_escape"           // Alcatraz
    //    "wz_escape_alt"       // Alcatraz night
    self.force_blackout_map = "wz_escape_alt";

    // force a blackout mode, options: 
    //    "warzone_solo"               // solo
    //    "warzone_duo"                // duo
    //    "warzone_quad"               // quad
    //    "warzone_escape_solo"        // alcatraz portal solo
    //    "warzone_escape_duo_dbno"    // alcatraz portal duo
    //    "warzone_escape_quad_dbno"   // alcatraz portal quad
    //    "warzone_hot_pursuit"        // hot pursuit
    //    "warzone_heavy_metal_heroes" // heavy metal heroes
    //    "warzone_hardcore_solo"      // hardcore solo
    //    "warzone_hardcore_duo"       // hardcore duo
    //    "warzone_hardcore_quad"      // hardcore quad
    //    "warzone_bigteam_dbno_quad"  // ground war
    //    "warzone_pandemic_quad"      // pandemic (script error with alcatraz)
    // ---- gametypes with errors:
    //    "warzone_heavy_metal"        // heavy metal (no heroes) (script error)
    //    "warzone_spectre_rising"     // spectre rising DLC (crash the game)
    //    "warzone_ambush_solo"        // ambush solo (script error)
    //    "warzone_ambush_duo"         // ambush duo (script error)
    //    "warzone_ambush_quads"       // ambush quad (script error)
    self.force_blackout_gametype = "warzone_escape_quad_dbno";

    // force the gametype, but without switching, will be in the menu after quit
    //self.force_blackout_noswitch = true;

    
    // duck zombies, example: https://www.youtube.com/watch?v=XphuwHYtSjk
    // new: it works on the avogadro (https://youtu.be/tUzdoK6g1V4)
    self.blackout_quacknarok = true;

    // percentage of the zombies to have the quaknarok effect
    self.blackout_quacknarok_spawn_percentage = 1;

    // zombie spawn
    self.blackout_spawn_zombies = true;

    // zombie secondary spawn functions, options: "zombies" "brutus" "brutus_boss" "avogadro"
    // if this element is an array, a random value will be used in it, the avogadro gives 60 damages/shot
    self.blackout_spawn = "zombies"; //array("brutus", "zombies", "avogadro");

    // set the number of zombies per zone (only for the blackout_spawn="zombies")
    // the game set a maximum of 25 zombies at the same time on the map (https://www.youtube.com/watch?v=gGfDjTgJxQU)
    //self.blackout_zombies_count = 30;

    // set the zombies' eyes color (for default zombies)
    // options: "green", "red", "blue", "clear", "random"
    self.backout_zombies_eyes = "random";

    // /!\ the avogadro is bugged and will instantly die after few bullets (https://www.youtube.com/watch?v=39Rma4ah7OA), 
    // you can set the of the spawned object health using this config
    // 6000 = default health for the brutus
    self.blackout_spawn_default_health = 1000;

    // set respawn delay in respawn mode (in seconds)
    // self.waverespawndelay = 30;

    // activate all the known ee
    self.blackout_ee = true;

    // spawn the icarus (Mob's plane), by default if self.blackout_ee = true
    self.blackout_spawn_icarus = true;

    // spawn the Blackjack stashes
    self.blackout_blackjack = true;

    // spawn Snowballs
    self.blackout_spawn_snowballs = true;

    // spawn Water ballons (can't be used with blackout_quacknarok)
    self.blackout_spawn_waterballons = false;

    // enable cowards way out in last stand
    self.blackout_laststand_enable_cowards_wayout = true;

    // set the invulnerability time in last stand
    //self.blackout_laststand_invulnerability_time = 0.5;

    // set the revive time in last stand
    //self.blackout_laststand_revive_time = 5;

    // skip last stand
    self.blackout_laststand_skip=false;

    // size of the sensor dart radius
    // - blackout core     : 2400 
    // - blackout alcatraz : 1200
    // - multiplayer       : 800
    // self.blackout_sensor_dart_radius = 2400;

    // enable/disable objects in blackout, options (not everything is there):
    // it'll only disable the spawn, not the objects, so if you can't control the zone
    // files, this config is useless
    // vehicles ..: "atv", "suv", "tacticalraft", "cargotruck", "tank", "pbr", "arav", "motorcycle", "musclecar"
    // items .....: "backpack", "medkit", "lv1armor", "lv2armor", "lv3armor"
    // gadgets ...: "homunculus", "cymbalmonkey", "hawk", "dart", "trophysystem", "fraggrenade", 
    //              "smokegrenade", "acidbomb", "wraithfire", "empgrenade"
    // weapons ...: "blundergat", "raygun", "blade"
    // attachments: "reflex", "holo", "stock", "extmag", "fastmag", "elo", "lasersight"
    // heros .....: "raygun", "blade", "blundergat", "sparrow", "warmachine", "tak5"
    // ar ........: "icr", "rampart", "kn", "maddox", "vapr", "swat", "grav", "an94", "doublebarrel", (unknown: peacekeeper)
    // smg .......: "mp40", "mx9", "gks", "spitfire", "cordite", "saug", "daemon", "switchblade", "vmp", "minigun"
    // sniper ....: "sdm", "koshka", "outlaw", "paladin", "vendetta" (unknown: locus)
    // lmg .......: "vkm", "hades", "titan", "zweihander" (unknown: tigershark)
    // pistol ....: "mozu", "strife", "rk7", "kap45"
    // tr ........: "auger", "abr", "essex", "m16", "swordfish" (unknown: stingray)
    // shotguns ..: "sg12", "mog12", "argus", "rampage"
    // specials ..: "bowieknife", "secretsanta", "slaybell", "stopsign", "coinbag", "zombiearm", "homewrecker",
    //              "amulet", "actionfigure", "launcher"(unknown: Nifo'oti, Rising Tide)
    // perks .....: "perkawareness", "perkbrawler", "perkconsumer", "perkdeadsilence", "perkengineer", "perkironlungs", "perksquadlink"
    //              "perklooter", "perkmedic", "perkmobility", "perkoutlander", "perkparanoia", "perkreinforced" (unknown: tracker/skulker)

    //self.blackout_enable = array(
    //);
    //self.blackout_disable = array(
    //);

    // ------ multiplayer config -----

    // time to select a specialist
    //self.mp_drafttime = 30;
    
    // set the invulnerability time in last stand
    //self.mp_laststand_invulnerability_time = 0.5;

    // skip last stand
    //self.mp_laststand_skip = false;

    // set the revive time in last stand
    //self.mp_laststand_revive_time = 5;

    // set the maximum count of last stand
    //self.mp_laststand_max_count = 6;

    // size of the sensor dart radius
    // - blackout core     : 2400 
    // - blackout alcatraz : 1200
    // - multiplayer       : 800
    // self.mp_sensor_dart_radius = 800;

    // force a multiplayer map
    //self.mp_force_map = "mp_seaside";

    // force a multiplayer mode
    // you can start CT modes, but it'll crash at the end or if you don't start the right map
    //self.mp_force_gametype = "sd";

    // -------- zombie config --------

    // show the ingame timer
    self.zm_custom_show_timer = true;

    // xp multiplier (only in online)
    // self.xp_multiplier = 9999;

    // bypass custom mutation no EE policy
    self.zm_custom_ee = true;

    // activate Shamrock & Awe Event, if this value isn't set to true, you won't be able to get the Leprechaun Homunculus
    self.zm_holiday_event = true;

    // activate constant quaknarok
    //self.zm_quaknarok = true;

    // start round
    //self.zm_custom_startround = 115;
    // maximum round number (stop the game once reached)
    // self.zm_custom_zmroundcap = 999;
    
    // allow traps
    //self.zm_custom_traps = true;

    // highlight craftable elements
    self.zm_custom_highlightcraftables = true;

    // no barriers
    // self.zm_custom_norepair = false;

    // perk decay (false to remove all perks when down)
    // self.zm_custom_perks_decay = false;

    // enable magic
    // self.zm_custom_magic = false;
    
    // enable friendly fire
    // self.zm_custom_friendlyfire = true;

    // enable AAT
    // self.zm_custom_aat = false;

    // disable loadout
    //self.zm_custom_no_loadout = true;

    // set the start and the evolution of the zombies' health during the round
    // self.zm_custom_zombies_health_start = 150;
    // self.zm_custom_zombies_health_add = 0;
    // self.zm_custom_zombies_health_multiplier = 1;

    // maximum time (minutes?)
    // self.zm_custom_zmtimecap = 0;

    // down point lost
    // percentage of the player's score
    // self.zm_custom_down_lost_percentage = 0.4;
    
    // death point lost
    // percentage of the player's score
    // self.zm_custom_down_death_percentage = 0.4;


    // set the zombies' speed
    // options: "walk", "run", "sprint", "super_sprint"
    // self.zm_custom_zombies_speed_max = "run"
    // self.zm_custom_zombies_speed_min = "walk"

    // set the health multiplier for the zombies
    self.zm_custom_health_multiplier_zombie = 1;
    self.zm_custom_health_multiplier_enhanced = 1;
    self.zm_custom_health_multiplier_miniboss = 1;
    self.zm_custom_health_multiplier_popcorn = 1;
    self.zm_custom_health_multiplier_heavy = 1;

    // set the damage multiplier from the zombies
    self.zm_custom_damage_multiplier_zombie = 1;
    self.zm_custom_damage_multiplier_enhanced = 1;
    self.zm_custom_damage_multiplier_miniboss = 1;
    self.zm_custom_damage_multiplier_popcorn = 1;
    self.zm_custom_damage_multiplier_heavy = 1;

    // set the count multiplier for special zombies
    self.zm_custom_count_multiplier_enhanced = 1;
    self.zm_custom_count_multiplier_miniboss = 1;
    self.zm_custom_count_multiplier_popcorn = 1;
    self.zm_custom_count_multiplier_heavy = 1;

    // enable powerups
    //self.zm_custom_zmpowerupsactive = false;
    // disable powerups per type
    // options: "nuke", "double", "instakill", "chaospoints", "firesale", "specialweapon", "freeperk", "maxammo", "carpenter"
    self.zm_custom_disable_powerup = array(
    );

    // disable weapon categories
    // options: "pistol", "shotgun", "smg", "ar", "tr", "lmg", "sniper", "melee", "equipment", "hero"
    self.zm_custom_disable_weapon_category = array(
    );
    
    // allow elixir by category
    // loadout
    // self.zm_custom_elixir_lvl1 = true;
    // common
    // self.zm_custom_elixir_lvl2 = true;
    // rare
    // self.zm_custom_elixir_lvl3 = true;
    // legendary
    // self.zm_custom_elixir_lvl4 = true;
    // epic
    // self.zm_custom_elixir_lvl5 = true;

    // allow elixirs
    //self.zm_custom_zmelixiractive = false;
    // disable elixir per type
    // options : "aftertaste", "alchemicalantithesis", "alwaysdoneswiftly", "antientrapment", "anywherebuthere", "arsenalaccelerator", 
    //           "boardgames", "bulletboost", "burnedout", "cacheback", "conflagrationliquidation", "crawlspace", "ctrlz", "dangerclosest", 
    //           "deadofnuclearwinter", "dividendyield", "equipmint", "extracredit", "freefire", "headdrama", "headscan", 
    //           "immolationliquidation", "inplainsight", "jointheparty", "killjoy", "licensedcontractor", "neardeathexperience", 
    //           "newtoniannegation", "nowyouseeme", "nowherebutthere", "perkup", "perkaholic", "phantomreload", "phoenixup", 
    //           "pointdrops", "popshocks", "powerkeg", "powervacuum", "refreshmint", "reigndrops", "secretshopper", "shieldsup", 
    //           "shoppingfree", "sodafountain", "stockoption", "suitup", "swordflay", "talkinboutregeneration", "temporalgift", 
    //           "undeadmanwalking", "wallpower", "whoskeepingscore", "quacknarok"
    self.zm_custom_disable_elixir = array(
    );
    
    // allow talisman by category
    // common
    // self.zm_custom_talisman_lvl1 = true;
    // rare
    // self.zm_custom_talisman_lvl2 = true;
    // legendary
    // self.zm_custom_talisman_lvl3 = true;
    // epic
    // self.zm_custom_talisman_lvl4 = true;
    // ultra
    // self.zm_custom_talisman_lvl5 = true;

    
    // allow talismans
    //self.zm_custom_zmtalismanactive = false;
    // disable talisman per type
    // options : "boxguaranteeboxonly", "boxguaranteelmg", "coagulant", "extraclaymore", "extrafrag", "extraminiturret", "extramolotov",
    //           "extrasemtex", "impatient", "perkmodsingle", "perkpermanent1", "perkpermanent2", "perkpermanent3", "perkpermanent4",
    //           "perkreducecost1", "perkreducecost2", "perkreducecost3", "perkreducecost4", "perkstart1", "perkstart2", "perkstart3",
    //           "perkstart4", "shielddurabilitylegendary", "shielddurabilityrare", "shieldprice", "specialstartlvl2", "specialstartlvl3",
    //           "specialxprate", "startweaponar", "startweaponlmg", "startweaponsmg", "reducepapcost", "permanentheroweaparmor", "extraselfrevive"
    self.zm_custom_disable_talisman = array(
    );

    // allow perks
    //self.zm_custom_zmperkactive = false;
    // disable perk per type
    // options : "armorvest", "fastreload", "quickrevive", "widowswine", "staminup", "additionalprimaryweapon", "electriccherry", 
    //           "deadshot", "cooldown", "dying_wish", "phdflopper", "stronghold", "extraammo", "awareness", "shield", "mystery", 
    //           "etherealrazor", "zombshell", "wolf_protector", "death_dash"
    self.zm_custom_disable_perk = array(
    );

    
    // disable entities from spawning
    // options : "miniboss", "heavy", "dog", "enhanced"
    self.zm_custom_disable_entities = array(
    );

    // headshots only
	// self.zm_custom_headshots_only = false;

    // max powerups drop per round
    self.zm_max_drop_per_round = 4;

    
    // regen delay for the player
    // options: "fast", "normal", "long"
    // self.zm_custom_health_regendelay = "normal";

    // regen rate for the player
    // options: "instant", "fast", "normal", "slow", "none"
    // self.zm_custom_health_regenrate = "normal";

    // health when killing a zombies
    // in the custom mutation menu, the values are 0, 10, 25 or 50
    // self.zm_custom_health_onkill = 0;

    // draning the health of the player
    // options: "none", "slow" (every 6s), "fast" (every 3s), "hardcore" (every 1s)
    // self.zm_custom_health_drain = 0;

    // ------- dev config -------
    // config to replace the internal of the menu, by default nothing is set

    // activate the dev options
    //self.dev = true;

    // remove weapon restiction on the weapon enum data,
    // you won't be able to use a weapon if it is not available on this map
    //self.devcfg.enum_weapon_no_restrict = false;
    // bypass the level script weapon restriction in the enums
    //self.devcfg.bypassweapon_script = true;
}
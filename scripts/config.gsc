AtianMenuConfig() {
    // ------- global config -------

    // set the skin during the launch of the game, you can get the names in the utils/enums.gsc file, each names are split by ';'
    // the first is the most important, if no skin can be found, it won't change the skin, the key "random" is selecting a random skin
    // you can set the outfit, palette, warpaint and decal using NAME:OUTFIT:PALETTE:WARPAINT:DECAL, 0 = default, a bad config can
    // crash the game. A fun usage:
    // - "Richtofen (Primis):1" : Alcatraz zombies (ZM only)
    // - "Richtofen (Primis):2" : Great War Richtofen (ZM only)
    // - "Richtofen Primis:1" : Alcatraz zombies (BR only)
    // - "Richtofen Primis:2" : Great War Richtofen (BR only)
    self.character_skin = "Christina Fowler;Richtofen Primis:2;Crash";


    // number of lives per player
    self.numlives = 1000;

    // size of the sensor dart radius
    // - blackout core     : 2400 
    // - blackout alcatraz : 1200
    // - multiplayer       : 800 
    self.sensor_dart_radius = 4800;

    // --------- menu config ---------
    
    // load menus at start, should be the same as the one described in menu_items.gsc, syntax: "MENU_NAME::ITEM_NAME"
    // example: "tool_menu::Invulnerability" for no damage
    self.preloaded_menus = array(
        "tool_menu::Ammos",
        "tool_menu::Invulnerability",
        "tool_menu::Max Points"
    );

    // only the host has the menu
    // self.only_host = true;
    
    // do not activate the menu, only use the config to create the game
    // self.no_menu = true;

    // ------- blackout config -------

    // force a blackout map, options:
    //    "wz_open_skyscrapers" // Core map
    //    "wz_escape"           // Alcatraz
    //    "wz_escape_alt"       // Alcatraz night
    self.force_blackout_map = "wz_open_skyscrapers";

    // force a blackout mode, options: 
    //    "warzone_solo"               // solo
    //    "warzone_duo"                // duo
    //    "warzone_quad"               // quad
    //    "warzone_escape_duo_dbno"    // alcatraz portal duo
    //    "warzone_escape_quad_dbno"   // alcatraz portal quad
    //    "warzone_hot_pursuit"        // hot pursuit
    //    "warzone_heavy_metal_heroes" // heavy metal heroes
    //    "warzone_hardcore_solo"      // hardcore solo
    //    "warzone_hardcore_duo"       // hardcore duo
    //    "warzone_hardcore_quad"      // hardcore quad
    //    "warzone_pandemic_quad"      // pandemic (script error with alcatraz)
    // ---- gametypes with errors:
    //    "warzone_heavy_metal"        // heavy metal (no heroes) (script error)
    //    "warzone_spectre_rising"     // spectre rising DLC (crash the game)
    self.force_blackout_gametype = "warzone_quad";

    // force the gametype, but without switching, will be in the menu after quit
    //self.force_blackout_noswitch = true;

    
    // duck zombies, example: https://www.youtube.com/watch?v=XphuwHYtSjk
    // new: it works on the avogadro (https://youtu.be/tUzdoK6g1V4)
    self.blackout_quaknarok = true;

    // zombie spawn
    self.blackout_spawn_zombies = true;

    // zombie secondary spawn functions, options: "zombies" "brutus" "brutus_boss" "avogadro"
    // if this element is an array, a random value will be used in it
     self.blackout_spawn = "avogadro"; //array("brutus", "zombies", "avogadro");

    // /!\ the avogadro is bugged and will instantly die after few bullets (https://www.youtube.com/watch?v=39Rma4ah7OA), 
    // you can set the of the spawned object health using this config
    // 6000 = default health for the brutus
    self.blackout_spawn_default_health = 4000;

    // set respawn delay in respawn mode (in seconds)
    // self.waverespawndelay = 30;

    // spawn the icarus (Mob's plane)
    self.blackout_spawn_icarus = true;

    // spawn the Blackjack stashes
    self.blackout_blackjack = true;

    // spawn Snowballs
    self.blackout_spawn_snowballs = true;

    // spawn Water ballons (can't be used with blackout_quaknarok)
    self.blackout_spawn_waterballons = false;

    // ------ multiplayer config -----

    // time to select a specialist
    self.mp_drafttime = 2;

    // -------- zombie config --------

    // start round
    self.zm_custom_startround = 115;
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
    // self.zm_custom_elixir_lvl1 = true;
    // self.zm_custom_elixir_lvl2 = true;
    // self.zm_custom_elixir_lvl3 = true;
    // self.zm_custom_elixir_lvl4 = true;
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
    //           "undeadmanwalking", "wallpower", "whoskeepingscore"
    self.zm_custom_disable_elixir = array(
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
}
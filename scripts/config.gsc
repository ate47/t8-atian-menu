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

    // --------- menu config ---------
    
    // load menus at start, should be the same as the one described in menu_items.gsc, syntax: "MENU_NAME::ITEM_NAME"
    // example: "tool_menu::Invulnerability" for no damage
    self.preloaded_menus = array(
        "tool_menu::Ammos",
        "tool_menu::Invulnerability"
    );

    // only the host has the menu
    // self.only_host = true;
    
    // do not activate the menu, only use the config to create the game
    // self.no_menu = true;

    // dev menu, mostly useless for you
    self.dev = true;

    // ------- blackout config -------

    // force a blackout map, options:
    //    "wz_open_skyscrapers" // Core map
    //    "wz_escape"           // Alcatraz
    //    "wz_escape_alt"       // Alcatraz night
    self.force_blackout_map = "wz_open_skyscrapers";

    // force a blackout mode, options: 
    //    "warzone_solo"             // solo
    //    "warzone_duo"              // duo
    //    "warzone_quad"             // quad
    //    "warzone_escape_duo_dbno"  // alcatraz portal duo
    //    "warzone_escape_quad_dbno" // alcatraz portal quad
    //    "warzone_hot_pursuit"      // hot pursuit
    //    "warzone_spectre_rising"   // spectre rising DLC (crash the game)
    //    "warzone_hardcore_solo"    // hardcore solo
    //    "warzone_hardcore_duo"     // hardcore duo
    //    "warzone_hardcore_quad"    // hardcore quad
    //    "warzone_pandemic_quad"    // pandemic (script error with alcatraz)
    self.force_blackout_gametype = "warzone_quad";

    
    // duck zombies, example: https://www.youtube.com/watch?v=XphuwHYtSjk
    self.blackout_quaknarok = true;

    // zombie spawn
    self.blackout_spawn_zombies = true;

    // zombie secondary spawn functions, options: "zombies" "brutus" "brutus_boss" "avogadro"
    // if this element is an array, a random value will be used in it
     self.blackout_spawn = array("brutus", "zombies", "avogadro");

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

}
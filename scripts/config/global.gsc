/*
 * Atian Menu Global configurations
 *
 * These configurations are used for all the modes.
 *
 */
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
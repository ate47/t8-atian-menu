/*
 * Atian Menu Blackout configurations
 *
 * These configurations are used for the Blackout mode.
 *
 */
AtianMenuConfigBlackout() {
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
    
    // duck zombies, example: https://www.youtube.com/watch?v=XphuwHYtSjk
    // new: it works on the avogadro (https://youtu.be/tUzdoK6g1V4)
    self.blackout_quacknarok = true;

    // percentage of the zombies to have the quaknarok effect
    self.blackout_quacknarok_spawn_percentage = 1;

    // zombie spawn
    self.blackout_spawn_zombies = true;

    // zombie secondary spawn functions, options: "zombies" "brutus" "brutus_boss" "avogadro" "alcatraz_night"
    // alcatraz_night is only available on alcatraz
    // if this element is an array, a random value will be used in it, the avogadro gives 60 damages/shot
    self.blackout_spawn = "alcatraz_night";

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

    // set the death stash model
    // value: "default", "christmas", "shamrock"
    self.blackout_stash_model = "default";

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
}
/*
 * Atian Menu Zombies configurations
 *
 * These configurations are used for the Zombies mode.
 *
 */
AtianMenuConfigZombies() {
    // -------- zombies config --------

    // show the ingame timer
    self.zm_custom_show_timer = true;

    // xp multiplier (only in online)
    // self.xp_multiplier = 9999 = true;

    // bypass custom mutation no EE policy
    self.zm_custom_ee = true;

    // set the health in zombies (you'll have render issues above 512HP)
    // self.zm_max_health = 350;

    // activate Shamrock & Awe Event, if this value isn't set to true, you won't be able to get the Leprechaun Homunculus
    // (doesn't work on Ancient Evil and with multiple players)
    //self.zm_holiday_event = true;

    // activate constant quaknarok
    //self.zm_quaknarok = true;

    // revive amount
    //self.zm_custom_revive_amount = 3;

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
    //           "undeadmanwalking", "wallpower", "whoskeepingscore", "quacknarok", "walltowall", "blooddebt" (thanks Jek for these 2)
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
}

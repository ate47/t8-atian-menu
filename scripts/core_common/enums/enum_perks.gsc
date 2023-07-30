
add_perk_info(perk_name, perk_title) {
    perk_data = {
        #name: perk_name,
        #title: perk_title
    };

    array::add(self.perks, perk_data);
}

get_perks_enum_data() {
    if (!isdefined(level.atian_enum_data)) {
        generate_enum_values();
    }
    return level.atian_enum_data.perks;
}

generate_perkenum_enum() {
    if (isdefined(self.perks)) {
        return;
    }
    perks = {
        #perks: array()
    };
    self.perks = perks;

    perks add_perk_info(#"specialty_additionalprimaryweapon", "additionalprimaryweapon");
    perks add_perk_info(#"specialty_accuracyandflatspread", "accuracyandflatspread");
    perks add_perk_info(#"specialty_ammodrainsfromstockfirst", "ammodrainsfromstockfirst");
    perks add_perk_info(#"specialty_anteup", "anteup");
    perks add_perk_info(#"specialty_armorpiercing", "armor piercing");
    perks add_perk_info(#"specialty_armorregen", "armor regen");
    perks add_perk_info(#"specialty_armorvest", "armor vest");
    perks add_perk_info(#"specialty_bulletaccuracy", "bullet accuracy");
    perks add_perk_info(#"specialty_bulletdamage", "bullet damage");
    perks add_perk_info(#"specialty_bulletflinch", "bullet flinch");
    perks add_perk_info(#"specialty_bulletpenetration", "bullet penetration");
    perks add_perk_info(#"specialty_combat_efficiency", "combat efficiency");
    perks add_perk_info(#"specialty_deadshot", "deadshot");
    perks add_perk_info(#"specialty_decoy", "decoy");
    perks add_perk_info(#"specialty_delayexplosive", "delay explosive");
    perks add_perk_info(#"specialty_detectexplosive", "detect explosive");
    perks add_perk_info(#"specialty_detectedicon", "detected icon");
    perks add_perk_info(#"specialty_detectnearbyenemies", "detect nearbyenemies");
    perks add_perk_info(#"specialty_directionalfire", "directional fire");
    perks add_perk_info(#"specialty_disarmexplosive", "dis armexplosive");
    perks add_perk_info(#"specialty_doubletap2", "doubletap 2");
    perks add_perk_info(#"specialty_earnmoremomentum", "earn more momentum");
    perks add_perk_info(#"specialty_electriccherry", "electric cherry");
    perks add_perk_info(#"specialty_extraammo", "extra ammo");
    perks add_perk_info(#"hash_5163411d6d29e0a4", "hash_5163411d6d29e0a4");
    perks add_perk_info(#"specialty_fallheight", "fall height");
    perks add_perk_info(#"specialty_fastads", "fast ads");
    perks add_perk_info(#"specialty_fastequipmentuse", "fast equipment use");
    perks add_perk_info(#"specialty_fastladderclimb", "fast ladder climb");
    perks add_perk_info(#"specialty_fastmantle", "fast mantle");
    perks add_perk_info(#"specialty_fastmeleerecovery", "fast melee recovery");
    perks add_perk_info(#"specialty_fastreload", "fast reload");
    perks add_perk_info(#"specialty_fasttoss", "fast toss");
    perks add_perk_info(#"specialty_fastweaponswitch", "fast weapon switch");
    perks add_perk_info(#"specialty_finalstand", "final stand");
    perks add_perk_info(#"specialty_fireproof", "fire proof");
    perks add_perk_info(#"specialty_flakjacket", "flak jacket");
    perks add_perk_info(#"specialty_flashprotection", "flash protection");
    perks add_perk_info(#"specialty_friendliesthroughwalls", "friend lies through walls");
    perks add_perk_info(#"specialty_gpsjammer", "gps jammer");
    perks add_perk_info(#"specialty_grenadepulldeath", "grenade pull death");
    perks add_perk_info(#"specialty_healthregen", "health regen");
    perks add_perk_info(#"specialty_holdbreath", "hold breath");
    perks add_perk_info(#"specialty_immunecounteruav", "immune counteruav");
    perks add_perk_info(#"specialty_immuneemp", "immune emp");
    perks add_perk_info(#"specialty_immunemms", "immune mms");
    perks add_perk_info(#"specialty_immunenvthermal", "immun env thermal");
    perks add_perk_info(#"specialty_immunerangefinder", "immune range finder");
    perks add_perk_info(#"hash_33547b925aa16a42", "hash_33547b925aa16a42");
    perks add_perk_info(#"specialty_immunesmoke", "immune smoke");
    perks add_perk_info(#"specialty_immunetriggerbetty", "immune trigger betty");
    perks add_perk_info(#"specialty_immunetriggerc4", "immune trigger c4");
    perks add_perk_info(#"specialty_immunetriggershock", "immune trigger shock");
    perks add_perk_info(#"specialty_jetcharger", "jet charger");
    perks add_perk_info(#"specialty_jetnoradar", "jet noradar");
    perks add_perk_info(#"specialty_jetpack", "jetpack");
    perks add_perk_info(#"specialty_jetquiet", "jetquiet");
    perks add_perk_info(#"specialty_killstreak", "killstreak");
    perks add_perk_info(#"specialty_longersprint", "longer sprint");
    perks add_perk_info(#"specialty_loudenemies", "loud enemies");
    perks add_perk_info(#"specialty_lowgravity", "low gravity");
    perks add_perk_info(#"specialty_marksman", "marksman");
    perks add_perk_info(#"specialty_microwaveprotection", "microwave protection");
    perks add_perk_info(#"specialty_movefaster", "move faster");
    perks add_perk_info(#"specialty_nokillstreakreticle", "no killstreak reticle");
    perks add_perk_info(#"specialty_nomotionsensor", "no motion sensor");
    perks add_perk_info(#"specialty_noname", "no name");
    perks add_perk_info(#"specialty_nottargetedbyairsupport", "not targeted by airsupport");
    perks add_perk_info(#"specialty_nottargetedbyaitank", "not targeted by aitank");
    perks add_perk_info(#"specialty_nottargetedbyraps", "not targeted by raps");
    perks add_perk_info(#"specialty_nottargetedbyrobot", "not targeted by robot");
    perks add_perk_info(#"specialty_nottargetedbysensors", "not targeted by sensors");
    perks add_perk_info(#"specialty_nottargetedbysentry", "not targeted by sentry");
    perks add_perk_info(#"specialty_nottargetedbytripwire", "not targeted by tripwire");
    perks add_perk_info(#"specialty_overcharge", "overcharge");
    perks add_perk_info(#"specialty_phdflopper", "phd flopper");
    perks add_perk_info(#"specialty_pin_back", "pin back");
    perks add_perk_info(#"specialty_pistoldeath", "pistoldeath");
    perks add_perk_info(#"specialty_playeriszombie", "player is zombie");
    perks add_perk_info(#"specialty_proximityprotection", "proximityprotection");
    perks add_perk_info(#"specialty_quickrevive", "quick revive");
    perks add_perk_info(#"specialty_quieter", "quieter");
    perks add_perk_info(#"specialty_rof", "rof");
    perks add_perk_info(#"specialty_scavenger", "scavenger");
    perks add_perk_info(#"specialty_sengrenjammer", "sengren jammer");
    perks add_perk_info(#"specialty_shellshock", "shell shock");
    perks add_perk_info(#"specialty_showenemyequipment", "show enemy equipment");
    perks add_perk_info(#"hash_410c46b5ff702c96", "hash_410c46b5ff702c96");
    perks add_perk_info(#"specialty_showenemyvehicles", "show enemy vehicles");
    perks add_perk_info(#"specialty_showscorestreakicons", "show scorestreak icons");
    perks add_perk_info(#"specialty_sixthsensejammer", "sixthsense jammer");
    perks add_perk_info(#"specialty_spawnarmorpickups", "spawn armor pickups");
    perks add_perk_info(#"specialty_spawnpingenemies", "spawn ping enemies");
    perks add_perk_info(#"specialty_sprintequipment", "sprint equipment");
    perks add_perk_info(#"specialty_sprintfire", "sprint fire");
    perks add_perk_info(#"specialty_sprintgadget", "sprint gadget");
    perks add_perk_info(#"specialty_sprintgrenadelethal", "sprint grenade lethal");
    perks add_perk_info(#"specialty_sprintgrenadetactical", "sprint grenade tactical");
    perks add_perk_info(#"specialty_sprintheal", "sprint heal");
    perks add_perk_info(#"specialty_sprintrecovery", "sprint recovery");
    perks add_perk_info(#"specialty_sprintreload", "sprint reload");
    perks add_perk_info(#"specialty_sprintfirerecovery", "sprint fire recovery");
    perks add_perk_info(#"specialty_stalker", "stalker");
    perks add_perk_info(#"specialty_staminup", "staminup");
    perks add_perk_info(#"specialty_stunprotection", "stun protection");
    perks add_perk_info(#"specialty_teflon", "teflon");
    perks add_perk_info(#"specialty_tombstone", "tombstone");
    perks add_perk_info(#"specialty_tracer", "tracer");
    perks add_perk_info(#"specialty_tracker", "tracker");
    perks add_perk_info(#"specialty_trackerjammer", "tracker jammer");
    perks add_perk_info(#"specialty_twogrenades", "two grenades");
    perks add_perk_info(#"specialty_twoprimaries", "two primaries");
    perks add_perk_info(#"specialty_unlimitedsprint", "unlimited sprint");
    perks add_perk_info(#"specialty_vultureaid", "vultureaid");
    perks add_perk_info(#"specialty_whoswho", "whoswho");
    perks add_perk_info(#"specialty_widowswine", "widows wine");
    perks add_perk_info(#"specialty_locdamagecountsasheadshot", "loc damage counts as headshot");
    perks add_perk_info(#"specialty_wallrun", "wallrun");
    perks add_perk_info(#"specialty_doublejump", "doublejump");
    perks add_perk_info(#"specialty_slide", "slide");
    perks add_perk_info(#"specialty_sprint", "sprint");
    perks add_perk_info(#"specialty_forwardspawninteract", "forwardspawninteract");
    perks add_perk_info(#"specialty_forwardspawnfastinteract", "forwardspawnfastinteract");
    perks add_perk_info(#"specialty_armor", "armor");
    perks add_perk_info(#"specialty_armor_tier_two", "armor_tier_two");
    perks add_perk_info(#"specialty_armor_tier_three", "armor_tier_three");
    perks add_perk_info(#"hash_4df21972dd2a3a87", "hash_4df21972dd2a3a87");
    perks add_perk_info(#"specialty_scoreresetondeath", "scoreresetondeath");
    perks add_perk_info(#"specialty_cooldown", "cooldown");
    perks add_perk_info(#"specialty_mod_armorvest", "mod_armorvest");
    perks add_perk_info(#"specialty_mod_fastreload", "mod_fastreload");
    perks add_perk_info(#"specialty_mod_quickrevive", "mod_quickrevive");
    perks add_perk_info(#"specialty_mod_widowswine", "mod_widowswine");
    perks add_perk_info(#"specialty_mod_staminup", "mod_staminup");
    perks add_perk_info(#"specialty_mod_additionalprimaryweapon", "mod_additionalprimaryweapon");
    perks add_perk_info(#"specialty_mod_deadshot", "mod_deadshot");
    perks add_perk_info(#"specialty_mod_electriccherry", "mod_electriccherry");
    perks add_perk_info(#"specialty_mod_cooldown", "mod_cooldown");
    perks add_perk_info(#"specialty_freefire", "freefire");
    perks add_perk_info(#"specialty_camper", "camper");
    perks add_perk_info(#"specialty_awareness", "awareness");
    perks add_perk_info(#"specialty_berserker", "berserker");
    perks add_perk_info(#"specialty_shield", "shield");
    perks add_perk_info(#"specialty_mystery", "mystery");
    perks add_perk_info(#"specialty_mod_phdflopper", "mod_phdflopper");
    perks add_perk_info(#"specialty_mod_camper", "mod_camper");
    perks add_perk_info(#"specialty_mod_awareness", "mod_awareness");
    perks add_perk_info(#"specialty_mod_berserker", "mod_berserker");
    perks add_perk_info(#"specialty_mod_shield", "mod_shield");
    perks add_perk_info(#"specialty_mod_extraammo", "mod_extraammo");
    perks add_perk_info(#"specialty_mod_mystery", "mod_mystery");
    perks add_perk_info(#"specialty_outlander", "outlander");
    perks add_perk_info(#"specialty_sprintspeed", "sprintspeed");
    perks add_perk_info(#"hash_4ef368f54cd86ab7", "hash_4ef368f54cd86ab7");
    perks add_perk_info(#"specialty_consumer", "consumer");
    perks add_perk_info(#"specialty_stimulant", "stimulant");
    perks add_perk_info(#"specialty_brawler", "brawler");
    perks add_perk_info(#"specialty_paranoia", "paranoia");
    perks add_perk_info(#"specialty_looter", "looter");
    perks add_perk_info(#"hash_3a09b1d7eaa88087", "hash_3a09b1d7eaa88087");
    perks add_perk_info(#"specialty_etherealrazor", "etherealrazor");
    perks add_perk_info(#"specialty_mod_etherealrazor", "mod_etherealrazor");
    perks add_perk_info(#"hash_53010725c65a98a5", "hash_53010725c65a98a5");
    perks add_perk_info(#"hash_130074ec6de7a431", "hash_130074ec6de7a431");
    perks add_perk_info(#"hash_1bc7d0ea42d1d0a8", "hash_1bc7d0ea42d1d0a8");
    perks add_perk_info(#"specialty_zombshell", "zombshell");
    perks add_perk_info(#"specialty_mod_zombshell", "mod_zombshell");
    perks add_perk_info(#"specialty_wolf_protector", "wolf_protector");
    perks add_perk_info(#"specialty_mod_wolf_protector", "mod_wolf_protector");
    perks add_perk_info(#"specialty_death_dash", "death_dash");
    perks add_perk_info(#"specialty_mod_death_dash", "mod_death_dash");
}

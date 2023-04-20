get_all_modes_wz() {
    return array(
        "warzone_solo",
        "warzone_duo",
        "warzone_quad",
        "warzone_escape_duo_dbno",
        "warzone_escape_quad_dbno",
        "warzone_hot_pursuit",
        "warzone_spectre_rising",
        "warzone_hardcore_solo",
        "warzone_hardcore_duo",
        "warzone_hardcore_quad",
        "warzone_pandemic_quad"
    );
}
get_all_modes_mp() {
    return array(
        "conf",
        "conf_hc",
        "ctf",
        "dm",
        "dm_hc",
        "dom",
        "dom_hc",
        "dom_snipe_bb",
        "gun",
        "gun_hc",
        "koth",
        "koth_bb",
        "koth_cwl",
        "infect",
        "infect_hc",
        "prop",
        "prop_hc",
        "sd",
        "sd_bb",
        "sd_hc",
        "tdm",
        "tdm_hc",
        "tdm_bb",
        "tdm_bb_hc",
        "tdm_snipe_bb",
        "control",
        "control_hc",
        "control_cwl",
        "bounty",
        "bounty_hc",
        "escort",
        "escort_hc",
        "sd_cwl",
        "oic",
        "clean",
        "tdm_bb",
        "tdm_bb_hc",
        "dom_bb",
        "dom_bb_hc",
        "dom_dm",
        "sas",
        "sas_hc",
        "dom_snipe_bb",
        "tdm_snipe_bb"
    );
}
get_all_modes_zm() {
    return array(
        "ztrials",
        "zclassic",
        "ztutorial",
        "ztcm_towers",
        "ztcm_escape",
        "ztcm_zod",
        "zstandard",
        "ztcm"
    );
}
get_characters_for_mode() {
    if (is_warzone()) {
        return get_characters_wz();
    }
    if (is_multiplayer()) {
        return get_characters_mp();
    }
    if (is_zombies()) {
        return get_characters_zm();
    }
    return undefined;
}
get_characters_mp() {
    return array(
        "Invisible",  // 0
        "Ajax", // 1
        "Battery", // 2
        "Crash", // 3
        "Firebreak", // 4
        "Nomad", // 5
        "Prophet", // 6
        "Recon", // 7
        "Ruin", // 8
        "Seraph", // 9
        "Torque", // 10
        "Zero", // 11
        "Outrider", // 12
        "Spectre", // 13
        "Reaper", // 14
        "Zombies (Joe/Infected)", // 15
        "Zombies (Jane/Infected)" // 16
    );
}
get_characters_zm() {
    return array(
        "Invisible", // 0
        "Scarlett", // 1
        "Bruno", // 2
        "Diego", // 3
        "Shaw", // 4
        "Richtofen (Primis)", // 5
        "Dempsey (Primis)", // 6
        "Nikolai (Primis)", // 7
        "Takeo (Primis)", // 8
        "Christina Fowler", // 9
        "Jonathan Warwick", // 10
        "Gideon Jones", // 11
        "Godfrey", // 12
        "Bruno (IX)", // 13
        "Diego (IX)", // 14
        "Scarlett (IX)", // 15
        "Shaw (IX)", // 16
        "Dempsey (Ultimis)", // 17
        "Nikolai (Ultimis)", // 18
        "Richtofen (Ultimis)", // 19
        "Takeo (Ultimis)", // 20
        "Dempsey (Ultimis/AO)", // 21
        "Nikolai (Ultimis/AO)", // 22
        "Richtofen (Ultimis/AO)", // 23
        "Takeo (Ultimis/AO)", // 24
        "Russman", // 25
        "Misty (Abigail Briarton)", // 26
        "Marlton Johnson", // 27
        "Samuel Stuhlinger", // 28
        "Richtofen (Primis/Alcatraz)" // 29
    );
}
get_characters_wz() {
    return array(
        "Invisible", // 0
        "Battery", // 1
        "Firebreak", // 2
        "Nomad", // 3
        "Prophet", // 4
        "Ruin", // 5
        "Seraph", // 6
        "Ajax", // 7
        "Crash", // 8
        "Recon", // 9
        "Torque", // 10
        "Dempsey Ultimis", // 11
        "Nikolai Ultimis", // 12
        "Richtofen Ultimis", // 13
        "Takeo Ultimis", // 14
        "Dempsey Primis", // 15
        "Nikolai Primis", // 16
        "Richtofen Primis", // 17
        "Takeo Primis", // 18
        "Shadow man", // 19
        "Bruno", // 20
        "Diego", // 21
        "Scarlett", // 22
        "Shaw", // 23
        "Bruno (IX)", // 24
        "Diego (IX)", // 25
        "Scarlett (IX)", // 26
        "Shaw (IX)", // 27
        "Reznov", // 28
        "Mason", // 29
        "Woods", // 30
        "Menendez", // 31
        "Player man 1", // 32
        "Player man 2", // 33
        "Player man 3", // 34
        "Player man 4", // 35
        "Player woman 1", // 36
        "Player woman 2", // 37
        "Player woman 3", // 38
        "Player woman 4", // 39
        "Hudson", // 40
        "Player lvl 20", // 41
        "Player lvl 40", // 42
        "Player lvl 60", // 43
        "Player lvl 80", // 44
        "Player lvl 81", // 45
        "Zero", // 46
        "Reaper (Classic)", // 47
        "Outrider", // 48
        "Misty", // 49
        "Warden", // 50
        "Cosmo", // 51
        "Mason (Kid)", // 52
        "Zombies (Joe)", // 53
        "Hudson (Cool)", // 54
        "Zombies (Jane)", // 55
        "The Replacer", // 56
        "Spectre", // 57
        "Blackjack", // 58
        "Sergei", // 59
        "Sarah Hall", // 60
        "Woods (old)", // 61
        "Mendendez (top1)", // 62
        "The Replacer (Green)", // 63
        "Trejo", // 64
        "Russman", // 65
        "M. Shadows", // 66
        "Reaper", // 67
        "Price Classic", // 68
        "T.E.D.D.", // 69
        "Weaver", // 70
        "Price Classic", // 71
        "Stuhlinger", // 72
        "Marlton", // 73
        "Zombies (Joe/Infected)", // 74
        "Zombies (Jane/Infected)" // 75
    );
}

get_weapons_all() {
    return array(
        "ar_accurate_t8",
        "ar_damage_t8",
        "ar_fastfire_t8",
        "ar_galil_t8",
        "ar_mg1909_t8",
        "ar_modular_t8",
        "ar_peacekeeper_t8",
        "ar_standard_t8",
        "ar_stealth_t8",
        "hero_annihilator",
        "hero_flamethrower",
        "hero_pineapplegun",
        "launcher_standard_t8",
        "lmg_double_t8",
        "lmg_heavy_t8",
        "lmg_spray_t8",
        "lmg_standard_t8",
        "lmg_stealth_t8",
        "knife_loadout",
        "melee_bowie",
        "melee_club_t8",
        "melee_coinbag_t8",
        "melee_demohammer_t8",
        "melee_secretsanta_t8",
        "melee_slaybell_t8",
        "melee_stopsign_t8",
        "melee_zombiearm_t8",
        "melee_amuletfist_t8",
        "melee_actionfigure_t8",
        "pistol_burst_t8",
        "pistol_fullauto_t8",
        "pistol_revolver_t8",
        "pistol_standard_t8",
        "pistol_topbreak_t8",
        "ray_gun",
        "shock_rifle",
        "shotgun_fullauto_t8",
        "shotgun_precision_t8",
        "shotgun_pump_t8",
        "shotgun_semiauto_t8",
        "shotgun_trenchgun_t8",
        "smg_accurate_t8",
        "smg_capacity_t8",
        "smg_drum_pistol_t8",
        "smg_fastburst_t8",
        "smg_fastfire_t8",
        "smg_folding_t8",
        "smg_handling_t8",
        "smg_mp40_t8",
        "smg_standard_t8",
        "smg_thompson_t8",
        "smg_vmp_t8",
        "sniper_damagesemi_t8",
        "sniper_fastrechamber_t8",
        "sniper_locus_t8",
        "sniper_mini14_t8",
        "sniper_powerbolt_t8",
        "sniper_powersemi_t8",
        "sniper_quickscope_t8",
        "special_ballisticknife_t8_dw",
        "special_crossbow_t8",
        "special_crossbow_t8_sas",
        "tr_damageburst_t8",
        "tr_flechette_t8",
        "tr_leveraction_t8",
        "tr_longburst_t8",
        "tr_midburst_t8",
        "tr_powersemi_t8",
        "ww_blundergat_t8",
        "ww_freezegun_t8",
        "none"
    );
    /*
    return array(
        "ability_dog",
        "ability_smart_cover",
        "ac130",
        "ai_tank_marker",
        "ar_accurate_t8",
        "ar_damage_t8",
        "ar_fastfire_t8",
        "ar_galil_t8",
        "ar_mg1909_t8",
        "ar_modular_t8",
        "ar_peacekeeper_t8",
        "ar_standard_t8",
        "ar_stealth_t8",
        "bare_hands",
        "basketball",
        "bowie_knife",
        "claymore",
        "counteruav",
        "cymbal_monkey",
        "dart",
        "drone_squadron",
        "eq_acid_bomb",
        "eq_cluster_semtex_grenade",
        "eq_concertina_wire",
        "eq_decoy_grenade",
        "eq_emp_grenade",
        "eq_grapple",
        "eq_gravityslam",
        "eq_hawk",
        "eq_localheal",
        "eq_molotov",
        "eq_seeker_mine",
        "eq_sensor",
        "eq_smoke",
        "eq_swat_grenade",
        "eq_tripwire",
        "eq_wraith_fire",
        "frag_grenade",
        "gadget_armor",
        "gadget_health_boost",
        "gadget_health_regen",
        "gadget_health_regen_large",
        "gadget_health_regen_medium",
        "gadget_health_regen_small",
        "gadget_health_regen_squad",
        "gadget_icepick",
        "gadget_radiation_field",
        "gadget_spawnbeacon",
        "gadget_supplypod",
        "gadget_vision_pulse",
        "hatchet",
        "helicopter_comlink",
        "hero_annihilator",
        "hero_flamethrower",
        "hero_pineapplegun",
        "knife_loadout",
        "launcher_standard_t8",
        "lmg_double_t8",
        "lmg_heavy_t8",
        "lmg_spray_t8",
        "lmg_standard_t8",
        "lmg_stealth_t8",
        "melee_bowie",
        "melee_club_t8",
        "melee_coinbag_t8",
        "melee_demohammer_t8",
        "melee_secretsanta_t8",
        "melee_slaybell_t8",
        "melee_stopsign_t8",
        "melee_zombiearm_t8",
        "melee_amuletfist_t8",
        "melee_actionfigure_t8",
        "overwatch_helicopter",
        "pistol_burst_t8",
        "pistol_fullauto_t8",
        "pistol_revolver_t8",
        "pistol_standard_t8",
        "pistol_topbreak_t8",
        "planemortar",
        "ray_gun",
        "recon_car",
        "remote_missile",
        "shock_rifle",
        "shotgun_fullauto_t8",
        "shotgun_precision_t8",
        "shotgun_pump_t8",
        "shotgun_semiauto_t8",
        "shotgun_trenchgun_t8",
        "sig_blade",
        "sig_bow_quickshot",
        "sig_buckler_dw",
        "smg_accurate_t8",
        "smg_capacity_t8",
        "smg_drum_pistol_t8",
        "smg_fastburst_t8",
        "smg_fastfire_t8",
        "smg_folding_t8",
        "smg_handling_t8",
        "smg_mp40_t8",
        "smg_standard_t8",
        "smg_thompson_t8",
        "smg_vmp_t8",
        "sniper_damagesemi_t8",
        "sniper_fastrechamber_t8",
        "sniper_locus_t8",
        "sniper_mini14_t8",
        "sniper_powerbolt_t8",
        "sniper_powersemi_t8",
        "sniper_quickscope_t8",
        "snowball",
        "special_ballisticknife_t8_dw",
        "special_crossbow_t8",
        "special_crossbow_t8_sas",
        "spectre_grenade",
        "straferun",
        "supplydrop_marker",
        "swat_team",
        "tr_damageburst_t8",
        "tr_flechette_t8",
        "tr_leveraction_t8",
        "tr_longburst_t8",
        "tr_midburst_t8",
        "tr_powersemi_t8",
        "trophy_system",
        "uav",
        "ultimate_turret",
        "willy_pete",
        "ww_blundergat_t8",
        "ww_freezegun_t8",
        "satchel_charge",
        "riotshield",
        "none"
    );
    */
}

get_all_maps_mp() {
    return array(
        "mp_austria",
        "mp_cairo",
        "mp_casino",
        "mp_cosmodrome",
        "mp_elevation",
        "mp_embassy",
        "mp_firingrange2",
        "mp_firingrange2_alt",
        "mp_frenetic",
        "mp_geothermal",
        "mp_gridlock",
        "mp_grind",
        "mp_hacienda",
        "mp_hacienda_alt",
        "mp_icebreaker",
        "mp_jungle2",
        "mp_jungle2_alt",
        "mp_madagascar",
        "mp_maldives",
        "mp_militia",
        "mp_morocco",
        "mp_mountain2",
        "mp_nuketown_4",
        "mp_offshore",
        "mp_offshore_alt",
        "mp_russianbase",
        "mp_seaside",
        "mp_seaside_alt",
        "mp_silo",
        "mp_slums2",
        "mp_station",
        "mp_urban",
        "mp_zombie_museum"
    );
}
get_all_maps_wz() {
    return array(
        "wz_escape",
        "wz_escape_alt",
        "wz_open_skyscrapers"
    );
}

get_wz_vehicles() {
    return array(
        "helicopter_light",
        "helicopter_utility",
        "vehicle_t8_mil_helicopter_transport_dark_wz",
        "player_atv",
        "player_tank",
        "player_suv",
        "player_muscle",
        "veh_muscle_car_convertible_player_wz_replacer",
        "player_motorcycle",
        "recon_wz",
        "cargo_truck_wz",
        "tactical_raft_wz",
        "pbr_boat_wz",
        "player_fav"
    );
}

// a basic lookup function, not all the hashes are here, but enough to give information
hash_lookup(hash_value) {
    switch (hash_value) {
        // archetype
        case #"zombie": return "zombie";
        case #"catalyst": return "catalyst";
        case #"zombie_quad": return "zombie_quad";
        case #"zombie_dog": return "zombie_dog";
        case #"zombie": return "zombie";
        case #"werewolf": return "werewolf";
        case #"wasp": return "wasp";
        case #"warlord": return "warlord";
        case #"tiger": return "tiger";
        case #"stoker": return "stoker";
        case #"skeleton": return "skeleton";
        case #"robot": return "robot";
        case #"raps": return "raps";
        case #"parasite": return "parasite";
        case #"nova_crawler": return "nova_crawler";
        case #"nosferatu": return "nosferatu";
        case #"mp_dog": return "mp_dog";
        case #"human_rpg": return "human_rpg";
        case #"human_riotshield": return "human_riotshield";
        case #"human": return "human";
        case #"glaive": return "glaive";
        case #"gladiator": return "gladiator";
        case #"ghost": return "ghost";
        case #"gegenees": return "gegenees";
        case #"crimson_nosferatu": return "crimson_nosferatu";
        case #"civilian": return "civilian";
        case #"catalyst": return "catalyst";
        case #"brutus": return "brutus";
        case #"blight_father": return "blight_father";
        // item type
        case #"weapon": return "weapon";
        case #"attachment": return "attachment";
        case #"equipment": return "equipment";
        case #"health": return "health";
        case #"armor": return "armor";
        case #"backpack": return "backpack";
        case #"cash": return "cash";
        case #"resource": return "resource";
        case #"ammo": return "ammo";
        case #"quest": return "quest";
        // vehicle type
        case #"helicopter_light": return "helicopter_light";
        case #"helicopter_utility": return "helicopter_utility";
        case #"vehicle_t8_mil_helicopter_transport_dark_wz": return "vehicle_t8_mil_helicopter_transport_dark_wz";
        case #"player_atv": return "player_atv";
        case #"player_tank": return "player_tank";
        case #"player_suv": return "player_suv";
        case #"player_muscle": return "player_muscle";
        case #"veh_muscle_car_convertible_player_wz_replacer": return "veh_muscle_car_convertible_player_wz_replacer";
        case #"player_motorcycle": return "player_motorcycle";
        case #"recon_wz": return "recon_wz";
        case #"cargo_truck_wz": return "cargo_truck_wz";
        case #"tactical_raft_wz": return "tactical_raft_wz";
        case #"pbr_boat_wz": return "pbr_boat_wz";
        case #"player_fav": return "player_fav";
        // weapon
        case #"snowball": return "snowball";
        case #"spectre_grenade": return "spectre_grenade";
        case #"straferun": return "straferun";
        case #"supplydrop_marker": return "supplydrop_marker";
        case #"swat_team": return "swat_team";
        case #"trophy_system": return "trophy_system";
        case #"uav": return "uav";
        case #"ultimate_turret": return "ultimate_turret";
        case #"willy_pete": return "willy_pete";
        case #"satchel_charge": return "satchel_charge";
        case #"riotshield": return "riotshield";
        case #"none": return "none";
        case #"rocket": return "rocket";
        case #"ability_dog": return "ability_dog";
        case #"ability_smart_cover": return "ability_smart_cover";
        case #"ac130": return "ac130";
		case #"tank_robot": return "tank_robot";
		case #"cobra_20mm_comlink": return "cobra_20mm_comlink";
        case #"ai_tank_marker": return "ai_tank_marker";
        case #"bare_hands": return "bare_hands";
        case #"basketball": return "basketball";
        case #"bowie_knife": return "bowie_knife";
        case #"claymore": return "claymore";
        case #"counteruav": return "counteruav";
        case #"cymbal_monkey": return "cymbal_monkey";
        case #"dart": return "dart";
        case #"drone_squadron": return "drone_squadron";
        case #"eq_acid_bomb": return "eq_acid_bomb";
        case #"eq_cluster_semtex_grenade": return "eq_cluster_semtex_grenade";
        case #"eq_concertina_wire": return "eq_concertina_wire";
        case #"eq_decoy_grenade": return "eq_decoy_grenade";
        case #"eq_emp_grenade": return "eq_emp_grenade";
        case #"eq_grapple": return "eq_grapple";
        case #"eq_gravityslam": return "eq_gravityslam";
        case #"eq_hawk": return "eq_hawk";
        case #"eq_localheal": return "eq_localheal";
        case #"eq_molotov": return "eq_molotov";
        case #"eq_seeker_mine": return "eq_seeker_mine";
        case #"eq_sensor": return "eq_sensor";
        case #"eq_smoke": return "eq_smoke";
        case #"eq_swat_grenade": return "eq_swat_grenade";
        case #"eq_tripwire": return "eq_tripwire";
        case #"eq_wraith_fire": return "eq_wraith_fire";
        case #"frag_grenade": return "frag_grenade";
        case #"gadget_armor": return "gadget_armor";
        case #"gadget_health_boost": return "gadget_health_boost";
        case #"gadget_health_regen": return "gadget_health_regen";
        case #"gadget_health_regen_large": return "gadget_health_regen_large";
        case #"gadget_health_regen_medium": return "gadget_health_regen_medium";
        case #"gadget_health_regen_small": return "gadget_health_regen_small";
        case #"gadget_health_regen_squad": return "gadget_health_regen_squad";
        case #"gadget_icepick": return "gadget_icepick";
        case #"gadget_radiation_field": return "gadget_radiation_field";
        case #"gadget_spawnbeacon": return "gadget_spawnbeacon";
        case #"gadget_smart_cover": return "gadget_smart_cover";
        case #"gadget_supplypod": return "gadget_supplypod";
        case #"gadget_vision_pulse": return "gadget_vision_pulse";
        case #"hatchet": return "hatchet";
        case #"helicopter_comlink": return "helicopter_comlink";
        case #"hero_annihilator": return "hero_annihilator";
        case #"hero_flamethrower": return "hero_flamethrower";
        case #"hero_pineapplegun": return "hero_pineapplegun";
        case #"knife_loadout": return "knife_loadout";
        case #"overwatch_helicopter": return "overwatch_helicopter";
        case #"planemortar": return "planemortar";
        case #"ray_gun": return "ray_gun";
        case #"recon_car": return "recon_car";
        case #"remote_missile": return "remote_missile";
        case #"shock_rifle": return "shock_rifle";
        case #"sig_blade": return "sig_blade";
        case #"sig_bow_quickshot": return "sig_bow_quickshot";
        case #"ar_accurate_t8": return "ar_accurate_t8";
        case #"ar_damage_t8": return "ar_damage_t8";
        case #"ar_fastfire_t8": return "ar_fastfire_t8";
        case #"ar_galil_t8": return "ar_galil_t8";
        case #"ar_mg1909_t8": return "ar_mg1909_t8";
        case #"ar_modular_t8": return "ar_modular_t8";
        case #"ar_peacekeeper_t8": return "ar_peacekeeper_t8";
        case #"ar_standard_t8": return "ar_standard_t8";
        case #"ar_stealth_t8": return "ar_stealth_t8";
        case #"shotgun_fullauto_t8": return "shotgun_fullauto_t8";
        case #"shotgun_precision_t8": return "shotgun_precision_t8";
        case #"shotgun_pump_t8": return "shotgun_pump_t8";
        case #"shotgun_semiauto_t8": return "shotgun_semiauto_t8";
        case #"shotgun_trenchgun_t8": return "shotgun_trenchgun_t8";
        case #"sig_buckler_dw": return "sig_buckler_dw";
        case #"smg_accurate_t8": return "smg_accurate_t8";
        case #"smg_capacity_t8": return "smg_capacity_t8";
        case #"smg_drum_pistol_t8": return "smg_drum_pistol_t8";
        case #"smg_fastburst_t8": return "smg_fastburst_t8";
        case #"smg_fastfire_t8": return "smg_fastfire_t8";
        case #"smg_folding_t8": return "smg_folding_t8";
        case #"smg_handling_t8": return "smg_handling_t8";
        case #"smg_mp40_t8": return "smg_mp40_t8";
        case #"smg_standard_t8": return "smg_standard_t8";
        case #"smg_thompson_t8": return "smg_thompson_t8";
        case #"smg_vmp_t8": return "smg_vmp_t8";
        case #"sniper_damagesemi_t8": return "sniper_damagesemi_t8";
        case #"sniper_fastrechamber_t8": return "sniper_fastrechamber_t8";
        case #"sniper_locus_t8": return "sniper_locus_t8";
        case #"sniper_mini14_t8": return "sniper_mini14_t8";
        case #"sniper_powerbolt_t8": return "sniper_powerbolt_t8";
        case #"sniper_powersemi_t8": return "sniper_powersemi_t8";
        case #"sniper_quickscope_t8": return "sniper_quickscope_t8";
        case #"special_ballisticknife_t8_dw": return "special_ballisticknife_t8_dw";
        case #"special_crossbow_t8": return "special_crossbow_t8";
        case #"special_crossbow_t8_sas": return "special_crossbow_t8_sas";
        case #"tr_damageburst_t8": return "tr_damageburst_t8";
        case #"tr_flechette_t8": return "tr_flechette_t8";
        case #"tr_leveraction_t8": return "tr_leveraction_t8";
        case #"tr_longburst_t8": return "tr_longburst_t8";
        case #"tr_midburst_t8": return "tr_midburst_t8";
        case #"tr_powersemi_t8": return "tr_powersemi_t8";
        case #"ww_blundergat_t8": return "ww_blundergat_t8";
        case #"ww_freezegun_t8": return "ww_freezegun_t8";
        case #"launcher_standard_t8": return "launcher_standard_t8";
        case #"lmg_double_t8": return "lmg_double_t8";
        case #"lmg_heavy_t8": return "lmg_heavy_t8";
        case #"lmg_spray_t8": return "lmg_spray_t8";
        case #"lmg_standard_t8": return "lmg_standard_t8";
        case #"lmg_stealth_t8": return "lmg_stealth_t8";
        case #"melee_bowie": return "melee_bowie";
        case #"melee_club_t8": return "melee_club_t8";
        case #"melee_coinbag_t8": return "melee_coinbag_t8";
        case #"melee_demohammer_t8": return "melee_demohammer_t8";
        case #"melee_secretsanta_t8": return "melee_secretsanta_t8";
        case #"melee_slaybell_t8": return "melee_slaybell_t8";
        case #"melee_stopsign_t8": return "melee_stopsign_t8";
        case #"melee_zombiearm_t8": return "melee_zombiearm_t8";
        case #"melee_amuletfist_t8": return "melee_amuletfist_t8";
        case #"melee_actionfigure_t8": return "melee_actionfigure_t8";
        case #"pistol_burst_t8": return "pistol_burst_t8";
        case #"pistol_fullauto_t8": return "pistol_fullauto_t8";
        case #"pistol_revolver_t8": return "pistol_revolver_t8";
        case #"pistol_standard_t8": return "pistol_standard_t8";
        case #"pistol_topbreak_t8": return "pistol_topbreak_t8";
        // upgraded weapon
        case #"ar_accurate_t8_upgraded": return "ar_accurate_t8_upgraded";
        case #"ar_damage_t8_upgraded": return "ar_damage_t8_upgraded";
        case #"ar_fastfire_t8_upgraded": return "ar_fastfire_t8_upgraded";
        case #"ar_galil_t8_upgraded": return "ar_galil_t8_upgraded";
        case #"ar_mg1909_t8_upgraded": return "ar_mg1909_t8_upgraded";
        case #"ar_modular_t8_upgraded": return "ar_modular_t8_upgraded";
        case #"ar_peacekeeper_t8_upgraded": return "ar_peacekeeper_t8_upgraded";
        case #"ar_standard_t8_upgraded": return "ar_standard_t8_upgraded";
        case #"ar_stealth_t8_upgraded": return "ar_stealth_t8_upgraded";
        case #"shotgun_fullauto_t8_upgraded": return "shotgun_fullauto_t8_upgraded";
        case #"shotgun_precision_t8_upgraded": return "shotgun_precision_t8_upgraded";
        case #"shotgun_pump_t8_upgraded": return "shotgun_pump_t8_upgraded";
        case #"shotgun_semiauto_t8_upgraded": return "shotgun_semiauto_t8_upgraded";
        case #"shotgun_trenchgun_t8_upgraded": return "shotgun_trenchgun_t8_upgraded";
        case #"sig_buckler_dw_upgraded": return "sig_buckler_dw_upgraded";
        case #"smg_accurate_t8_upgraded": return "smg_accurate_t8_upgraded";
        case #"smg_capacity_t8_upgraded": return "smg_capacity_t8_upgraded";
        case #"smg_drum_pistol_t8_upgraded": return "smg_drum_pistol_t8_upgraded";
        case #"smg_fastburst_t8_upgraded": return "smg_fastburst_t8_upgraded";
        case #"smg_fastfire_t8_upgraded": return "smg_fastfire_t8_upgraded";
        case #"smg_folding_t8_upgraded": return "smg_folding_t8_upgraded";
        case #"smg_handling_t8_upgraded": return "smg_handling_t8_upgraded";
        case #"smg_mp40_t8_upgraded": return "smg_mp40_t8_upgraded";
        case #"smg_standard_t8_upgraded": return "smg_standard_t8_upgraded";
        case #"smg_thompson_t8_upgraded": return "smg_thompson_t8_upgraded";
        case #"smg_vmp_t8_upgraded": return "smg_vmp_t8_upgraded";
        case #"sniper_damagesemi_t8_upgraded": return "sniper_damagesemi_t8_upgraded";
        case #"sniper_fastrechamber_t8_upgraded": return "sniper_fastrechamber_t8_upgraded";
        case #"sniper_locus_t8_upgraded": return "sniper_locus_t8_upgraded";
        case #"sniper_mini14_t8_upgraded": return "sniper_mini14_t8_upgraded";
        case #"sniper_powerbolt_t8_upgraded": return "sniper_powerbolt_t8_upgraded";
        case #"sniper_powersemi_t8_upgraded": return "sniper_powersemi_t8_upgraded";
        case #"sniper_quickscope_t8_upgraded": return "sniper_quickscope_t8_upgraded";
        case #"special_ballisticknife_t8_dw_upgraded": return "special_ballisticknife_t8_dw_upgraded";
        case #"special_crossbow_t8_upgraded": return "special_crossbow_t8_upgraded";
        case #"special_crossbow_t8_sas_upgraded": return "special_crossbow_t8_sas_upgraded";
        case #"tr_damageburst_t8_upgraded": return "tr_damageburst_t8_upgraded";
        case #"tr_flechette_t8_upgraded": return "tr_flechette_t8_upgraded";
        case #"tr_leveraction_t8_upgraded": return "tr_leveraction_t8_upgraded";
        case #"tr_longburst_t8_upgraded": return "tr_longburst_t8_upgraded";
        case #"tr_midburst_t8_upgraded": return "tr_midburst_t8_upgraded";
        case #"tr_powersemi_t8_upgraded": return "tr_powersemi_t8_upgraded";
        case #"ww_blundergat_t8_upgraded": return "ww_blundergat_t8_upgraded";
        case #"ww_freezegun_t8_upgraded": return "ww_freezegun_t8_upgraded";
        case #"launcher_standard_t8_upgraded": return "launcher_standard_t8_upgraded";
        case #"lmg_double_t8_upgraded": return "lmg_double_t8_upgraded";
        case #"lmg_heavy_t8_upgraded": return "lmg_heavy_t8_upgraded";
        case #"lmg_spray_t8_upgraded": return "lmg_spray_t8_upgraded";
        case #"lmg_standard_t8_upgraded": return "lmg_standard_t8_upgraded";
        case #"lmg_stealth_t8_upgraded": return "lmg_stealth_t8_upgraded";
        case #"melee_bowie_upgraded": return "melee_bowie_upgraded";
        case #"melee_club_t8_upgraded": return "melee_club_t8_upgraded";
        case #"melee_coinbag_t8_upgraded": return "melee_coinbag_t8_upgraded";
        case #"melee_demohammer_t8_upgraded": return "melee_demohammer_t8_upgraded";
        case #"melee_secretsanta_t8_upgraded": return "melee_secretsanta_t8_upgraded";
        case #"melee_slaybell_t8_upgraded": return "melee_slaybell_t8_upgraded";
        case #"melee_stopsign_t8_upgraded": return "melee_stopsign_t8_upgraded";
        case #"melee_zombiearm_t8_upgraded": return "melee_zombiearm_t8_upgraded";
        case #"melee_amuletfist_t8_upgraded": return "melee_amuletfist_t8_upgraded";
        case #"melee_actionfigure_t8_upgraded": return "melee_actionfigure_t8_upgraded";
        case #"pistol_burst_t8_upgraded": return "pistol_burst_t8_upgraded";
        case #"pistol_fullauto_t8_upgraded": return "pistol_fullauto_t8_upgraded";
        case #"pistol_revolver_t8_upgraded": return "pistol_revolver_t8_upgraded";
        case #"pistol_standard_t8_upgraded": return "pistol_standard_t8_upgraded";
        case #"pistol_topbreak_t8_upgraded": return "pistol_topbreak_t8_upgraded";
        // weapon category
        case #"ar": return "ar";
        case #"lmg": return "lmg";
        case #"pistol": return "pistol";
        case #"shotgun": return "shotgun";
        case #"smg": return "smg";
        case #"sniper": return "sniper";
        case #"tr": return "tr";
        case #"mg": return "mg";
        case #"melee": return "melee";
        case #"rifle": return "rifle";
        case #"rocketlauncher": return "rocketlauncher";
        // inventory
		case #"inventory_tank_robot": return "inventory_tank_robot";
		case #"inventory_ac130": return "inventory_ac130";
		case #"inventory_helicopter_comlink": return "inventory_helicopter_comlink";
		case #"inventory_dart": return "inventory_dart";
		case #"inventory_drone_squadron": return "inventory_drone_squadron";
		case #"inventory_recon_car": return "inventory_recon_car";
		case #"inventory_remote_missile": return "inventory_remote_missile";
		case #"inventory_planemortar": return "inventory_planemortar";
		case #"inventory_overwatch_helicopter": return "inventory_overwatch_helicopter";
		case #"inventory_straferun": return "inventory_straferun";
		case #"inventory_ultimate_turret": return "inventory_ultimate_turret";
        // modifier
        case #"mod_zombshell": return "mod_zombshell";
        case #"mod_wolf_protector": return "mod_wolf_protector";
        case #"mod_widows_wine": return "mod_widows_wine";
        case #"mod_unknown": return "mod_unknown";
        case #"mod_trigger_hurt": return "mod_trigger_hurt";
        case #"mod_tortoise": return "mod_tortoise";
        case #"mod_telefrag": return "mod_telefrag";
        case #"mod_suicide": return "mod_suicide";
        case #"mod_stronghold": return "mod_stronghold";
        case #"mod_slider": return "mod_slider";
        case #"mod_rifle_bullet": return "mod_rifle_bullet";
        case #"mod_revive": return "mod_revive";
        case #"mod_projectile_splash": return "mod_projectile_splash";
        case #"mod_projectile": return "mod_projectile";
        case #"mod_pistol_bullet": return "mod_pistol_bullet";
        case #"mod_meta": return "mod_meta";
        case #"mod_melee_weapon_butt": return "mod_melee_weapon_butt";
        case #"mod_melee_assassinate": return "mod_melee_assassinate";
        case #"mod_melee": return "mod_melee";
        case #"mod_marathon": return "mod_marathon";
        case #"mod_impact": return "mod_impact";
        case #"mod_hit_by_object": return "mod_hit_by_object";
        case #"mod_head_shot": return "mod_head_shot";
        case #"mod_grenade_splash": return "mod_grenade_splash";
        case #"mod_grenade": return "mod_grenade";
        case #"mod_falling": return "mod_falling";
        case #"mod_explosive": return "mod_explosive";
        case #"mod_ethereal_razor": return "mod_ethereal_razor";
        case #"mod_electrocuted": return "mod_electrocuted";
        case #"mod_electric_cherry": return "mod_electric_cherry";
        case #"mod_dying_wish": return "mod_dying_wish";
        case #"mod_drown": return "mod_drown";
        case #"mod_dot_self": return "mod_dot_self";
        case #"mod_dot": return "mod_dot";
        case #"mod_death_perception": return "mod_death_perception";
        case #"mod_death_dash": return "mod_death_dash";
        case #"mod_deadshot": return "mod_deadshot";
        case #"mod_crush": return "mod_crush";
        case #"mod_cooldown": return "mod_cooldown";
        case #"mod_burned": return "mod_burned";
        case #"mod_bandolier": return "mod_bandolier";
        case #"mod_additionalprimaryweapon": return "mod_additionalprimaryweapon";
        case #"MOD_UNKNOWN": return "MOD_UNKNOWN";
        case #"MOD_TRIGGER_HURT": return "MOD_TRIGGER_HURT";
        case #"MOD_SUICIDE": return "MOD_SUICIDE";
        case #"MOD_RIFLE_BULLET": return "MOD_RIFLE_BULLET";
        case #"MOD_PROJECTIVLE_SPLASH": return "MOD_PROJECTIVLE_SPLASH";
        case #"MOD_PROJECTILE_SPLASH": return "MOD_PROJECTILE_SPLASH";
        case #"MOD_PROJECTILE": return "MOD_PROJECTILE";
        case #"MOD_POST_GAME": return "MOD_POST_GAME";
        case #"MOD_PISTOL_BULLET": return "MOD_PISTOL_BULLET";
        case #"MOD_META": return "MOD_META";
        case #"MOD_MELEE_WEAPON_BUTT": return "MOD_MELEE_WEAPON_BUTT";
        case #"MOD_MELEE_ASSASSINATE": return "MOD_MELEE_ASSASSINATE";
        case #"MOD_MELEE": return "MOD_MELEE";
        case #"MOD_IMPACT": return "MOD_IMPACT";
        case #"MOD_HIT_BY_OBJECT": return "MOD_HIT_BY_OBJECT";
        case #"MOD_HEAD_SHOT": return "MOD_HEAD_SHOT";
        case #"MOD_GRENADE_SPLASH": return "MOD_GRENADE_SPLASH";
        case #"MOD_GRENADE": return "MOD_GRENADE";
        case #"MOD_GAS": return "MOD_GAS";
        case #"MOD_FALLING": return "MOD_FALLING";
        case #"MOD_EXPLOSIVE_SPLASH": return "MOD_EXPLOSIVE_SPLASH";
        case #"MOD_EXPLOSIVE": return "MOD_EXPLOSIVE";
        case #"MOD_ELECTROCUTED": return "MOD_ELECTROCUTED";
        case #"MOD_DROWN": return "MOD_DROWN";
        case #"MOD_DOWNED": return "MOD_DOWNED";
        case #"MOD_DOT_SELF": return "MOD_DOT_SELF";
        case #"MOD_DOT": return "MOD_DOT";
        case #"MOD_DEATH_CIRCLE": return "MOD_DEATH_CIRCLE";
        case #"MOD_CRUSH": return "MOD_CRUSH";
        case #"MOD_BURNED": return "MOD_BURNED";
        case #"MOD_BULLET": return "MOD_BULLET";
        case #"MOD_BLED_OUT": return "MOD_BLED_OUT";
        case #"MOD_AAT": return "MOD_AAT";

        default: return hash_value;
    }
}
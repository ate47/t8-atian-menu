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

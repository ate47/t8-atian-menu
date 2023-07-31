get_all_modes_wz() {
    return array(
        "warzone_solo",
        "warzone_duo",
        "warzone_quad",
        "warzone_escape_solo",
        "warzone_escape_duo_dbno",
        "warzone_escape_quad_dbno",
        "warzone_hot_pursuit",
        "warzone_heavy_metal_heroes",
        "warzone_spectre_rising",
        "warzone_hardcore_solo",
        "warzone_hardcore_duo",
        "warzone_hardcore_quad",
        "warzone_pandemic_quad",
        "warzone_bigteam_dbno_quad"
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
    return array();
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
        #"helicopter_light",
        #"helicopter_utility",
        #"vehicle_t8_mil_helicopter_transport_dark_wz",
        #"player_atv",
        #"player_tank",
        #"player_suv",
        #"player_muscle",
        #"veh_muscle_car_convertible_player_wz_replacer",
        #"player_motorcycle",
        #"recon_wz",
        #"cargo_truck_wz",
        #"tactical_raft_wz",
        #"pbr_boat_wz",
        #"player_fav",
        #"veh_dart_wz"
    );
}

get_csv_file_title(hash_csv) {
    hash_csv = hash_lookup(hash_csv);
    if (ishash(hash_csv)) {
        switch (hash_csv) {
            case #"hash_41c3d60c9fdc1c1a": return "audio all maps";
            case #"hash_6d9aadb58948623b": return "audio escape, office, white";
            case #"hash_5513a399a5c36320": return "audio escape";
            case #"hash_c79aaf74e007b22": return "audio mansion";
            case #"hash_74c49b8d4f407798": return "audio mansion";
            case #"hash_75b01784227cb52f": return "audio office";
            case #"hash_6a57c10f8d76df9e": return "audio orange";
            case #"hash_50f83dce1a50995": return "audio orange";
            case #"hash_5963a3db3032ab46": return "audio red, towers";
            case #"hash_37db46ab64d46fca": return "audio red";
            case #"hash_54bad987adb5e01d": return "towers";
            case #"hash_2a32b98080f6388": return "white";
            case #"hash_5ec1825aeab754a2": return "character banter";
            case #"hash_241c0e86d7b363e9": return "weapon table level zm_escape";
            case #"hash_67972fca091f2c13": return "weapon table level zm_mansion";
            case #"hash_2ed6ad41883dc026": return "weapon table level zm_office";
            case #"hash_544f128e274c84e0": return "weapon table level zm_orange";
            case #"hash_27415a2cb947e75": return "weapon table level zm_red";
            case #"hash_42dcec7533a676b0": return "weapon table level zm_towers";
            case #"hash_6dcfc619b819ab4f": return "weapon table level zm_white";
            case #"hash_3180c9ba4da02927": return "weapon table level zm_zodt8";
            case #"hash_5694d3fa5334f8fe": return "weapon table 1";
            case #"hash_3f8d28bb3d9e9bec": return "weapon table 2";
            case #"hash_7bda40310359350e": return "weapon table default";
            default: return "" + hash_csv;
        }
    }
    return hash_csv;
}

get_bot_names() {
    return array(
        "AA",
        "BB",
        "CC",
        "DD",
        "EE",
        "FF"
    );
}
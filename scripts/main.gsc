MaxPower() {
    self endon(#"disconnect", #"spawned_player");
    level endon(#"end_game", #"game_ended");
    while (true) {
        self gadgetpowerset(0, 100);
        self gadgetpowerset(1, 100);
        self gadgetpowerset(2, 100);
        waitframe(1);
    }
}

print_menu() {
    if (self.menu_menu) {
        page = int(self.menu_cursor / 8);
        maxpage = int((self.menu_selection.size - 1) / 8) + 1;
        self iprintln("---- Tools (" + (page + 1) + "/" + maxpage + ") ----");

        index_start = 8 * page;
        index_end = int(min(8 * (int(self.menu_cursor / 8) + 1), self.menu_selection.size));
        for (i = index_start; i < index_end; i++) {
            if (self.menu_cursor === i) {
                self iprintln("-> " + (self.menu_selection[i]) + " <");
            } else {
                self iprintln("- " + (self.menu_selection[i]));
            }
        }

        end_space = (8 - (index_end % 8));
        if (end_space !== 8) {
            for (i = 0; i < end_space; i++) {
                self iprintln("");
            }
        }
    } else {
        for (i = 0; i < 9; i++) {
            self iprintln("");
        }
    }
}

CustomScript()
{
    self endon(#"spawned_player", #"disconnect");
    level endon(#"end_game", #"game_ended");
	self unlink();
    self.menu_selection = [];
    self.menu_selection[0] = "Info";
    self.menu_selection[1] = "PaP AE";
    self.menu_selection[2] = "Dark matter";
    self.menu_selection[3] = "PaP VoD";
    self.menu_selection[4] = "Camo";
    self.menu_selection[5] = "Reticle";
    self.menu_selection[6] = "Change map";
    self.menu_selection[7] = "Change gametype";
    self.menu_selection[8] = "Blackout mode";
    self.menu_selection[9] = "skin test";
    self.menu_selection[10] = "Weapons";
    self.menu_selection[11] = "Add bot";

    self.menu_cursor = 0;
    self.menu_menu = false;

    while (true) {
        updated = false;
        if(self meleeButtonPressed()) { // open/close menu
            while (self meleeButtonPressed()) waitframe(1);
            if (self.menu_menu) {
                self.menu_menu = false;
            } else {
                self.menu_menu = true;
                self.menu_cursor = 0;
            }
            updated = true;
        } else if (self.menu_menu) { // in menu
            if (self adsButtonPressed()) {
                while (self adsButtonPressed()) waitframe(1);
                if (self.menu_cursor === 0) {
                    self.menu_cursor = self.menu_selection.size - 1;
                } else {
                    self.menu_cursor--;
                }
                updated = true;
            } else if (self attackButtonPressed()) {
                while (self attackButtonPressed()) waitframe(1);
                if (self.menu_cursor === self.menu_selection.size - 1) {
                    self.menu_cursor = 0;
                } else {
                    self.menu_cursor++;
                }
                updated = true;
            } else if (self useButtonPressed()) {
                while (self useButtonPressed()) waitframe(1);
                
                for (i = 0; i < 9; i++) {
                    self iprintln("");
                }
                self.menu_menu = self HandleMenuButton();

                if (self.menu_menu) {
                    self print_menu();
                }
            }
        }

        if (updated) {
            self print_menu();
        }
        waitframe(1);
    }
}
SetCamo(id, reticle) {
    weapon = self GetCurrentWeapon();

    if (!isDefined(reticle)) {
        reticle = 0;
    }

    if (isdefined(weapon)) {
        self takeweapon(weapon);
        weapon_options = self calcweaponoptions(id, reticle, 0);
        
        self giveweapon(weapon, weapon_options);
        camo_index_var = getcamoindex(weapon_options);
        camo_var2 = function_11c873a(camo_index_var);
        self iPrintLn("camo: " + camo_index_var + ", reticle: " + reticle);
        if (isdefined(camo_var2)) {
            self iPrintLn("var:camo: " + camo_var2);
        }
    }
}
HandleMenuButton() {
    switch (self.menu_cursor) {
    case 0:
        weapon = self GetCurrentWeapon();

        if (isdefined(weapon) && isdefined(weapon.name)) {
            str_weapon = weapon.name;
            self IPrintLn("Weapon: " + weapon.name);
        }
        if (isdefined(level.gametype)) {
            self iprintln("gamemode: " + level.gametype);
        }
        if (isdefined(level.script)) {
            self iprintln("map: " + level.script);
        }
        return false;
    case 1:
        self SetCamo(74);
        return true;
    case 2:
        self SetCamo(45);
        return true;
    case 3:
        self SetCamo(146, 38);
        return true;
        // #"hash_10d3ded6ab48d6d4"
        // 1 -> 42 base camo %3==mode
        // 43 gold
        // 44 diamond
        // 45 dm
        // 74 pap
        // 79 twitch
        // 117 bacon
        // 118 twitch 2
        // 146 ???
        // 223 diamon rainbow
        // 235 dm 30
        // 298 dday
        // 310 masked
        // 512 max

        
        // 1 -> 42 base camo %3==mode
        // 43 gold
        // 44 diamond
        // 45 dm
        // 46 $
        // 47 green course
        // 48 blue
        // 49 kiss
        // 50 fortuna
        // 51 donuts
        // 52->56 bobine
        // 57->61 avis de recherche
        // 62->66,71->72 strip
        // 67->70 rave
        // 74 AE camo purple
        // 75 AE camo blue
        // 76 AE camo orange
        // 77 AE camo yellow
        // 78 AE camo green
        // 79 twitch
        // 80 serment
        // 81 imbu
        // 82 megalodon
        // 83 surf
        // 84 goinfre
        // 86 chrysalide
        // 87->88 chambre forte
        // 89,93->94 nebula
        // 90->92 After life
        // 117 bacon
        // 118 Twitch 2
        
    case 4:
        camo_id = -1;
        while (true) {
            if (self meleeButtonPressed()) {
                while (self meleeButtonPressed()) waitframe(1);
                return false;
            }
            if (self attackButtonPressed()) {
                while (self attackButtonPressed()) waitframe(1);
                camo_id += 1;
            } else if (self adsButtonPressed()) {
                while (self adsButtonPressed()) waitframe(1);
                camo_id = int(max(0, camo_id - 1));
            } else {
                waitframe(1);
                continue;
            }

            SetCamo(camo_id);    
            // 35 mustache        
            // 36 emoji
            // 38 royal
            // 49 cross
            // 50 crow
            // 67 anchor
            // 66 treyarch
            waitframe(1);
        }
        return false;
    case 5:
        reticle_id = -1;
        while (true) {
            if (self meleeButtonPressed()) {
                while (self meleeButtonPressed()) waitframe(1);
                return false;
            }
            if (self attackButtonPressed()) {
                while (self attackButtonPressed()) waitframe(1);
                reticle_id += 1;
            } else if (self adsButtonPressed()) {
                while (self adsButtonPressed()) waitframe(1);
                reticle_id = int(max(0, reticle_id - 1));
            } else {
                waitframe(1);
                continue;
            }

            SetCamo(146, reticle_id);            
            waitframe(1);
        }
        return false;
    case 6:
        map_id = 0;
        maps = array(
            "wz_escape",
            "wz_open_skyscrapers",
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
        while (self useButtonPressed()) waitframe(1);
        first = true;
        while (true) {
            if (self meleeButtonPressed()) {
                while (self meleeButtonPressed()) waitframe(1);
                return false;
            }
            if (self attackButtonPressed()) {
                while (self attackButtonPressed()) waitframe(1);
                if (map_id === maps.size -1) {
                    map_id = 0;
                } else {
                    map_id = int(min(maps.size, map_id + 1));
                }
            } else if (self adsButtonPressed()) {
                while (self adsButtonPressed()) waitframe(1);
                if (map_id === 0) {
                    map_id = maps.size - 1;
                } else {
                    map_id = int(max(0, map_id - 1));
                }
            } else if (self useButtonPressed()) {
                if (MapExists(maps[map_id])) {
                    map(maps[map_id]);
                } else {
                    self iprintln("map doesn't exist");
                }
            } else if (!first) {
                waitframe(1);
                continue;
            } else {
                first = false;
            }

            if (map_id < 5) {
                start_map = 0;
            } else if (map_id > maps.size - 5) {
                start_map = int(max(0, maps.size - 9));
            } else {
                start_map = map_id - 5;
            }
            end_map = start_map + 9;
            for (i = start_map; i < end_map; i++) {
                if (i === map_id) {
                    self iPrintLn("> " + maps[i]);
                } else {
                    self iPrintLn(maps[i]);
                }
            }

            waitframe(1);
        }
        return false;
    case 7:
        gametype_id = 0;
        gametypes = array(
            "warzone_solo",
            "warzone_duo",
            "warzone_quad",
            "warzone_escape_duo_dbno",
            "warzone_escape_quad_dbno",
            "warzone_hot_pursuit",
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
            "tdm_snipe_bb",
            "ztcm_towers",
            "ztrials",
            "zclassic",
            "ztutorial",
            "ztcm_escape",
            "ztcm_zod",
            "zstandard",
            "ztcm"
        );
        while (self useButtonPressed()) waitframe(1);
        first = true;
        while (true) {
            if (self meleeButtonPressed()) {
                while (self meleeButtonPressed()) waitframe(1);
                return false;
            }
            if (self attackButtonPressed()) {
                while (self attackButtonPressed()) waitframe(1);
                if (gametype_id === gametypes.size - 1) {
                    gametype_id = 0;
                } else {
                    gametype_id = int(min(gametypes.size, gametype_id + 1));
                }
            } else if (self adsButtonPressed()) {
                while (self adsButtonPressed()) waitframe(1);
                if (gametype_id === 0) {
                    gametype_id = gametypes.size - 1;
                } else {
                    gametype_id = int(max(0, gametype_id - 1));
                }
            } else if (self useButtonPressed()) {
                self iprintln("loading mode " + gametypes[gametype_id] + "...");
                switchmap_load(level.script, gametypes[gametype_id]);
	            wait(10);
                switchmap_switch();
            } else if (!first) {
                waitframe(1);
                continue;
            } else {
                first = false;
            }

            if (gametype_id < 5) {
                start_map = 0;
            } else if (gametype_id > gametypes.size - 5) {
                start_map = int(max(0, gametypes.size - 9));
            } else {
                start_map = gametype_id - 5;
            }
            end_map = start_map + 9;
            for (i = start_map; i < end_map; i++) {
                if (i === gametype_id) {
                    self iPrintLn("> " + gametypes[i]);
                } else {
                    self iPrintLn(gametypes[i]);
                }
            }

            waitframe(1);
        }
    case 8:
        blackout_mode_id = 0;
        blackout_modes = array(
            "Base solo",
            "Base duo",
            "Base quad",

            "Hot pursuit",
            "Heavy metal heroes",
            "Alcatraz Heavy metal heroes",

            "Alcatraz duo",
            "Alcatraz quad",

            "Alcatraz duo (dbno)",
            "Alcatraz quad (dbno)",

            "Alcatraz solo (Base)",
            "Alcatraz duo (Base)",
            "Alcatraz quad (Base)"
        );
        blackout_modes_map = array(
            // base
            "wz_open_skyscrapers",
            "wz_open_skyscrapers",
            "wz_open_skyscrapers",

            // hot pursuit
            "wz_open_skyscrapers",
            "wz_open_skyscrapers",
            "wz_escape",

            // Alcatraz
            "wz_escape",
            "wz_escape",

            // Alcatraz dbno
            "wz_escape",
            "wz_escape",

            // Alcatraz base
            "wz_escape",
            "wz_escape",
            "wz_escape"
        );
        blackout_modes_gametype = array(
            // base
            "warzone_solo",
            "warzone_duo",
            "warzone_quad",
            // hot pursuit
            "warzone_hot_pursuit",
            "warzone_heavy_metal_heroes",
            "warzone_heavy_metal_heroes",
            // Alcatraz
            "warzone_escape_duo",
            "warzone_escape_quad",
            // Alcatraz dbno
            "warzone_escape_duo_dbno",
            "warzone_escape_quad_dbno",
            // Alcatraz base
            "warzone_solo",
            "warzone_duo",
            "warzone_quad"
        );


        while (self useButtonPressed()) waitframe(1);
        first = true;
        while (true) {
            if (self meleeButtonPressed()) {
                while (self meleeButtonPressed()) waitframe(1);
                return false;
            }
            if (self attackButtonPressed()) {
                while (self attackButtonPressed()) waitframe(1);
                if (blackout_mode_id === blackout_modes.size - 1) {
                    blackout_mode_id = 0;
                } else {
                    blackout_mode_id = int(min(blackout_modes.size, blackout_mode_id + 1));
                }
            } else if (self adsButtonPressed()) {
                while (self adsButtonPressed()) waitframe(1);
                if (blackout_mode_id === 0) {
                    blackout_mode_id = blackout_modes.size - 1;
                } else {
                    blackout_mode_id = int(max(0, blackout_mode_id - 1));
                }
            } else if (self useButtonPressed()) {
                self iprintln("loading mode " + blackout_modes[blackout_mode_id] + "...");
                switchmap_load(blackout_modes_map[blackout_mode_id], blackout_modes_gametype[blackout_mode_id]);
                for (i = 0; i < 10; i++) {
                    self iprintln("loading mode " + blackout_modes[blackout_mode_id] + "... " + (i + 1) + "/10");
                    self iprintln("map: " + blackout_modes_map[blackout_mode_id] + ", mode: " + blackout_modes_gametype[blackout_mode_id]);
                    wait(1);
                }
                switchmap_switch();
            } else if (!first) {
                waitframe(1);
                continue;
            } else {
                first = false;
            }

            if (blackout_mode_id < 5) {
                start_map = 0;
            } else if (blackout_mode_id > blackout_modes.size - 5) {
                start_map = int(max(0, blackout_modes.size - 9));
            } else {
                start_map = blackout_mode_id - 5;
            }
            end_map = start_map + 9;
            for (i = start_map; i < end_map; i++) {
                if (i === blackout_mode_id) {
                    self iPrintLn("> " + blackout_modes[i]);
                } else {
                    self iPrintLn(blackout_modes[i]);
                }
            }

            waitframe(1);
        }
    /*
    
	globallogic_audio::set_leader_gametype_dialog(key, undefined, undefined, undefined);
	if(isdefined(getgametypesetting(#"hash_2992e3d39d55b312")) && getgametypesetting(#"hash_2992e3d39d55b312"))
	{
		key = "warSpectreRisingStart";
	}
	else if(isdefined(getgametypesetting(#"hash_53d529e82bcf1212")) && getgametypesetting(#"hash_53d529e82bcf1212"))
	{
		key = "hcStartWarzone";
	}
	else if(isdefined(getgametypesetting(#"hash_4ff7ee3c3a534065")) && getgametypesetting(#"hash_4ff7ee3c3a534065"))
	{
		key = "warZombieStart";
	}
	else
	{
		key = "startWarzone";
	}
	globallogic_audio::set_leader_gametype_dialog(key, undefined, undefined, undefined);
    */
        return false;
    case 9:
        character_id = 0;
        characters = array(
            "Invisible",
            "Battery",
            "Firebreak",
            "Nomad",
            "Prophet",
            "Ruin",
            "Seraph",
            "Ajax",
            "Crash",
            "Recon",
            "Torque",
            "Dempsey Ultimis",
            "Nikolai Ultimis",
            "Richtofen Ultimis",
            "Takeo Ultimis",
            "Dempsey Primis",
            "Nikolai Primis",
            "Richtofen Primis",
            "Takeo Primis",
            "Shadow man",
            "Bruno",
            "Diego",
            "Scarlett",
            "Shaw",
            "Bruno (IX)",
            "Diego (IX)",
            "Scarlett (IX)",
            "Shaw (IX)",
            "Reznov",
            "Mason",
            "Woods",
            "Menendez",
            "Player man 1",
            "Player man 2",
            "Player man 3",
            "Player man 4",
            "Player woman 1",
            "Player woman 2",
            "Player woman 3",
            "Player woman 4",
            "Hudson",
            "Player lvl 20",
            "Player lvl 40",
            "Player lvl 60",
            "Player lvl 80",
            "Player lvl 81",
            "Zero",
            "Reaper (Classic)",
            "Outrider",
            "Misty",
            "Warden",
            "Cosmo",
            "Mason (Kid)",
            "Zombies (Joe)",
            "Hudson (Cool)",
            "Zombies (Jane)",
            "The Replacer",
            "Spectre",
            "Blackjack",
            "Sergei",
            "Sarah Hall",
            "Woods (old)",
            "Mendendez (top1)",
            "The Replacer (Green)",
            "Trejo",
            "Russman",
            "M. Shadows",
            "Reaper",
            "Price Classic",
            "T.E.D.D.",
            "Weaver",
            "Price Classic",
            "Stuhlinger",
            "Marlton",
            "Zombies (Joe/Infected)",
            "Zombies (Jane/Infected)"
        );
        while (self useButtonPressed()) waitframe(1);
        first = true;
        while (true) {
            if (self meleeButtonPressed()) {
                while (self meleeButtonPressed()) waitframe(1);
                return false;
            }
            if (self attackButtonPressed()) {
                while (self attackButtonPressed()) waitframe(1);
                if (character_id === characters.size - 1) {
                    character_id = 0;
                } else {
                    character_id = int(min(characters.size, character_id + 1));
                }
            } else if (self adsButtonPressed()) {
                while (self adsButtonPressed()) waitframe(1);
                if (character_id === 0) {
                    character_id = characters.size - 1;
                } else {
                    character_id = int(max(0, character_id - 1));
                }
            } else if (self useButtonPressed()) {
                self IPrintLn("Specialist: " + characters[character_id] + " (" + character_id + ")");
                self setspecialistindex(character_id);       
                self player_role::update_fields();  
                return false;
            } else if (!first) {
                waitframe(1);
                continue;
            } else {
                first = false;
            }

            if (character_id < 5) {
                start_map = 0;
            } else if (character_id > characters.size - 5) {
                start_map = int(max(0, characters.size - 9));
            } else {
                start_map = character_id - 5;
            }
            end_map = start_map + 9;
            for (i = start_map; i < end_map; i++) {
                if (i === character_id) {
                    self iPrintLn("> " + characters[i]);
                } else {
                    self iPrintLn(characters[i]);
                }
            }

            waitframe(1);
        }
        return false;
    case 10:
        weapon_id = 0;
        weapons = array(
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
            "ww_blundergat_t8"
        );
        while (self useButtonPressed()) waitframe(1);
        first = true;
        while (true) {
            if (self meleeButtonPressed()) {
                while (self meleeButtonPressed()) waitframe(1);
                return false;
            }
            if (self attackButtonPressed()) {
                while (self attackButtonPressed()) waitframe(1);
                if (weapon_id === weapons.size - 1) {
                    weapon_id = 0;
                } else {
                    weapon_id = int(min(weapons.size, weapon_id + 1));
                }
            } else if (self adsButtonPressed()) {
                while (self adsButtonPressed()) waitframe(1);
                if (weapon_id === 0) {
                    weapon_id = weapons.size - 1;
                } else {
                    weapon_id = int(max(0, weapon_id - 1));
                }
            } else if (self useButtonPressed()) {
                weapon = getweapon(hash(weapons[weapon_id]));

                if (isdefined(weapon)) {
                    weapon_options = self calcweaponoptions(0, 0, 0);

                    old_weapon = self GetCurrentWeapon();

                    if (isdefined(old_weapon)) {
                        self takeweapon(old_weapon);
                    }

                    self giveweapon(weapon, weapon_options);

                    if (isdefined(weapon.name)) {
                        self iPrintLn("gave weapon : " + weapon.name);
                    } else {
                        self iPrintLn("gave weapon nn: " + weapons[weapon_id]);
                    }
                } else {
                    self iPrintLn("unknown weapon " + weapons[weapon_id]);
                }
                return false;
            } else if (!first) {
                waitframe(1);
                continue;
            } else {
                first = false;
            }

            if (weapon_id < 5) {
                start_map = 0;
            } else if (weapon_id > weapons.size - 5) {
                start_map = int(max(0, weapons.size - 9));
            } else {
                start_map = weapon_id - 5;
            }
            end_map = start_map + 9;
            for (i = start_map; i < end_map; i++) {
                if (i === weapon_id) {
                    self iPrintLn("> " + weapons[i]);
                } else {
                    self iPrintLn(weapons[i]);
                }
            }

            waitframe(1);
        }
        return false;
    case 11:
        for (i = 0; i < 20; i++) {
            AddTestClient();
            self iprintln("Bot #" + i + " added");
        }
        return false;
    }
    return true;
}
onPlayerSpawned() {
    self endon(#"disconnect", #"spawned_player");
    level endon(#"end_game", #"game_ended");
    
    while (!self meleeButtonPressed()) waitframe(1);
    self thread MaxPower();
    self thread CustomScript();
    self iPrintLnBold("^2h^3e^4l^5l^6o ^7m^8e");

}
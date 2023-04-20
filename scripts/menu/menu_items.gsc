init_menus() {
    // ---- Tools ----
    self add_menu("tool_menu", "Tools", "start_menu");
    self add_menu_item_menuswitch("start_menu", "Tools", "tool_menu");

    self add_menu_item("tool_menu", "Info", &func_helloworld);
    self add_menu_item_modswitch("tool_menu", "Fly", "fly");
    self add_menu_item("tool_menu", "Third person", &func_3rdperson);

    self add_menu_item_modswitch("tool_menu", "Ammos", "maxammo");
    self add_menu_item("tool_menu", "End contracts", &func_end_contracts);
    self add_menu_item("tool_menu", "Invulnerability", &func_invulnerability);

    if (isdefined(self.atianconfig.dev) && self.atianconfig.dev) {
        self add_menu("tool_menu_dev", "Dev tools", "tool_menu");
        self add_menu_item_menuswitch("tool_menu", "Dev tools", "tool_menu_dev");

        self add_menu_item("tool_menu_dev", "All Color (ln)", &func_echo_dev_color);
        self add_menu_item("tool_menu_dev", "All Color (bold)", &func_echobold, "^00 ^11 ^22 ^33 ^44 ^55 ^66 ^77 ^88 ^99 ");

        self add_menu("tool_menu_dev_entities", "Entities", "tool_menu_dev", &func_searchentities);
        self add_menu_item_menuswitch("tool_menu_dev", "Entities", "tool_menu_dev_entities");
        
        self add_menu("dev_config", "Config", "tool_menu_dev");
        self add_menu_item_menuswitch("tool_menu_dev", "Config", "dev_config");
        
        if (isdefined(level.var_cca518d) && level.var_cca518d) {
            self add_menu_item("dev_config", "spawn zombies");
        }
        if (isdefined(level.var_d33a57a) && level.var_d33a57a) {
            self add_menu_item("dev_config", "spawn blight father");
        }
        if (isdefined(level.var_b6e30614) && level.var_b6e30614) {
            self add_menu_item("dev_config", "spawn dog");
        }
        if (isdefined(level.var_6b59ac2c) && level.var_6b59ac2c) {
            self add_menu_item("dev_config", "spawn brutus");
        }
        if (isdefined(level.var_4f7f5c18) && level.var_4f7f5c18) {
            self add_menu_item("dev_config", "spawn brutus boss");
        }
        if (isdefined(level.var_9196aafd) && level.var_9196aafd) {
            self add_menu_item("dev_config", "spawn avogadro");
        }
        if (isdefined(level.var_5c9e1f9) && level.var_5c9e1f9) {
            self add_menu_item("dev_config", "spawn icarus");
        }
        if (isdefined(getgametypesetting(#"hash_7c8ad12994670d63")) && getgametypesetting(#"hash_7c8ad12994670d63")) {
            self add_menu_item("dev_config", "spawn blackjack stash");
        }
        
        wz_stash_blackjack = getdynentarray(#"wz_stash_blackjack");
        if (isdefined(wz_stash_blackjack)) {
            self add_menu("dev_wz_stash_blackjack", "Stash blackjack", "tool_menu_dev");
            self add_menu_item_menuswitch("tool_menu_dev", "Stash blackjack", "dev_wz_stash_blackjack");
            
            for (i = 0; i < wz_stash_blackjack.size; i++) {
                if (isdefined(wz_stash_blackjack[i].origin)) {
                    self add_menu_item("dev_config", "stash " + i, &func_teleport, wz_stash_blackjack[i].origin);
                }
            }
        }
    }

    if (is_zombies()) {
        self add_menu_item("tool_menu", "Ignore me", &func_zmignoreme);
        self add_menu_item_modswitch("tool_menu", "Max Points", "maxpoints");
        self add_menu_item("tool_menu", "Infinite revive time", &func_inf_revive);
        self add_menu_item("tool_menu", "Kill all zombies", &func_kill_zombies);

        self add_menu("zombies_speed", "Zombies speed", "tool_menu");
        self add_menu_item_menuswitch("tool_menu", "Zombies speed", "zombies_speed");

        self add_menu_item("zombies_speed", "Default", &func_zombies_speed);
        self add_menu_item("zombies_speed", "Walk", &func_zombies_speed, "walk");
        self add_menu_item("zombies_speed", "Run", &func_zombies_speed, "run");
        self add_menu_item("zombies_speed", "Sprint", &func_zombies_speed, "sprint");
        self add_menu_item("zombies_speed", "Super sprint", &func_zombies_speed, "super_sprint");

        self add_menu("round_tool", "Round tool", "tool_menu");
        self add_menu_item_menuswitch("tool_menu", "Round tool", "round_tool");
        
        self add_menu("round_tool_set", "Set", "round_tool");
        self add_menu_item_menuswitch("round_tool", "Set", "round_tool_set");

        for (i = 0; i < 9; i++) {
            self add_menu("round_tool_set" + i, "" + max(1, (i * 100)) + " -> " + ((i + 1) * 100), "round_tool_set");
            self add_menu_item_menuswitch("round_tool_set", "" + max(1, (i * 100)) + " -> " + ((i + 1) * 100), "round_tool_set" + i);
        }
        // custom menu for the 900-935
        self add_menu("round_tool_set9", "900 -> 935", "round_tool_set");
        self add_menu_item_menuswitch("round_tool_set", "900 -> 935", "round_tool_set9");

        for (i = 1; i <= 935; i++) {
            self add_menu_item(("round_tool_set" + int(i / 100)), "" + i, &func_round_set, i);
        }

        self add_menu_item("round_tool", "-100", &func_round_add, -100);
        self add_menu_item("round_tool", "-10", &func_round_add, -10);
        self add_menu_item("round_tool", "-1", &func_round_add, -1);
        self add_menu_item("round_tool", "+1", &func_round_add, 1);
        self add_menu_item("round_tool", "+10", &func_round_add, 10);
        self add_menu_item("round_tool", "+100", &func_round_add, 100);

        self add_menu_item("tool_menu", "Complete ee", &func_complete_ee);
    }

    self add_menu_item("tool_menu", "Test", &func_test);

    // ---- Weapon ----
    self add_menu("tool_weapon", "Guns", "start_menu");
    self add_menu_item_menuswitch("start_menu", "Guns", "tool_weapon");

    self add_menu_item_modswitch("tool_weapon", "TP gun", "tpgun");
    self add_menu_item_modswitch("tool_weapon", "Physic Explosion gun", "explosion_gun");

    if (is_zombies()) {
        self add_menu_item_modswitch("tool_weapon", "Rocket gun", "rocketgun_upgraded");
    } else {
        self add_menu_item_modswitch("tool_weapon", "Rocket gun", "rocketgun");
    }
    self add_menu_item_modswitch("tool_weapon", "Armageddon", "rocket_armageddon");
    self add_menu_item_modswitch("tool_weapon", "Rocket man", "rocketman");
    
    if (is_multiplayer()) {
        self add_menu_item_modswitch("tool_weapon", "Mantis gun", "tankgun");
        self add_menu_item_modswitch("tool_weapon", "Hellstorm gun", "missilegun");
        self add_menu_item_modswitch("tool_weapon", "Hellstorm bomblet gun", "missilegun3");
        self add_menu_item_modswitch("tool_weapon", "A-10 gun", "a10gun");
    } else if (is_zombies()) {
        if (level.script === "zm_white") {
            self add_menu_item_modswitch("tool_weapon", "Zombie nova (white)", "zmnova_white");
            self add_menu_item_modswitch("tool_weapon", "Zombie nova (red)", "zmnova_blue");
        } else if (level.script === "zm_red") {
            self add_menu_item_modswitch("tool_weapon", "Zombie gegenees", "zmgegenees");
            self add_menu_item_modswitch("tool_weapon", "Zombie gegenees (golden)", "zmgegenees_golden");
        } else if (level.script === "zm_towers") {
            self add_menu_item_modswitch("tool_weapon", "Zombie elephant rider", "zmelephant_rider");
        }
    }

    // ---- Give weapon ----
    self add_menu("weapons", "Give weapon", "start_menu");
    self add_menu_item_menuswitch("start_menu", "Give weapon", "weapons");

    weapons = get_weapons_all();

    for (i = 0; i < weapons.size; i++) {
        self add_menu_item("weapons", weapons[i], &func_give_weapon, weapons[i]);
    }

    if (isdefined(level.script)) {
        self add_menu("teleport", "Teleport", "start_menu");
        self add_menu_item_menuswitch("start_menu", "Teleport", "teleport");

        if (is_warzone()) {
            self add_menu_item_modswitch("teleport", "Waypoint tp", "waypoint_tp");
            self add_menu_item("teleport", "Random tp", &RandomTp);
        }

        switch (level.script) {
            case "wz_escape":
            case "wz_escape_alt":
                self add_menu_item("teleport", "Boat", &func_teleport, (-9045, -4126, 117.117), (0, 150, 0));
                self add_menu_item("teleport", "Docks", &func_teleport, (2049, -4510, 144.125), (-9, -178, 0));
                self add_menu_item("teleport", "Island", &func_teleport, (-9868, -7088, 199.947), (0, 62, 0));
                self add_menu_item("teleport", "Main building", &func_teleport, (-70, 419, 1392.13), (0, -5, 0));
                self add_menu_item("teleport", "Model industries", &func_teleport, (5636, 9464, 1144.13), (0, -70, 0));
                self add_menu_item("teleport", "New industries", &func_teleport, (3268, 6574, 527.625), (0, 16, 0));
                self add_menu_item("teleport", "Submarine", &func_teleport, (9503, 5888, 117), (0, 67, 0));
                self add_menu_item("teleport", "White house", &func_teleport, (-4057, -4664, 693.125), (-10, -100, 0));
                break;
            case "wz_open_skyscrapers":
            case "wz_open_skyscrapers_alt":
                self add_menu_item("teleport", "Asylum", &func_teleport, (9904.15, -41700.2, 4013.05), (0, -63, 0));
                self add_menu_item("teleport", "Buried", &func_teleport, (-55217.4, -38466.2, 1996.18), (0, 13, 0));
                self add_menu_item("teleport", "Dam", &func_teleport, (37654.7, -45952.6, 4072.38), (27, 128, 0));
                self add_menu_item("teleport", "Dock", &func_teleport, (-31249, 25237, 1148.13), (0, 170, 0));
                self add_menu_item("teleport", "Factory", &func_teleport, (-40143, -13333, 1366.13), (0, -60, 0));
                self add_menu_item("teleport", "Firing range", &func_teleport, (12296.2, -2656.55, 1326.5), (0, 144, 0));
                self add_menu_item("teleport", "Lighthouse", &func_teleport, (-45981, 27144, 1240.13), (-25, -29, 0));
                self add_menu_item("teleport", "Nuketown", &func_teleport, (-11560, 45393, 1650.82), (0, -155, 0));
                self add_menu_item("teleport", "Raid", &func_teleport, (48010, 5174, 5132.13), (0, 60, 0));
                self add_menu_item("teleport", "Rivertown", &func_teleport, (-2899, -17123, 1308.13), (0, -23, 0));
                self add_menu_item("teleport", "Sat", &func_teleport, (4510.68, 17379.9, 4031.51), (0, 38, 0));
                self add_menu_item("teleport", "Train station", &func_teleport, (26605, -19024, 2015.11), (-3, -90, 0));
                break;
            case "mp_firingrange2":
            case "mp_firingrange2_alt":
                self add_menu_item("teleport", "Center", &func_teleport, (207, -680, 56.125), (0, 34, 0));
                self add_menu_item("teleport", "Bridge West", &func_teleport, (-20910, -979, 552.125), (0, -68, 0));
                self add_menu_item("teleport", "Bridge East", &func_teleport, (26701, -303, 552.125), (0, 145, 0));
                self add_menu_item("teleport", "Parking", &func_teleport, (-5310, 4652, 12.125), (0, -68, 0));
                self add_menu_item("teleport", "West City", &func_teleport, (-74410, 15369, 512.125), (-23, 117, 0));
                self add_menu_item("teleport", "West City - Park", &func_teleport, (-72134, -19485, 512.125), (0, 85, 0));
                break;
            case "mp_gridlock": // lair
                self add_menu_item("teleport", "Center", &func_teleport, (-3, -724, 288.125), (0, 67, 0));
                break;
            case "mp_hacienda":
            case "mp_hacienda_alt":
                self add_menu_item("teleport", "Center", &func_teleport, (227, 360, -7.875), (0, 126, 0));
                self add_menu_item("teleport", "Road", &func_teleport, (-16650, -5488, -59.4672), (0, 0, 0));
                self add_menu_item("teleport", "Tiger cage", &func_teleport, (43, 1867, -127.875), (0, -56, 0));
                break;
            case "mp_icebreaker":
                self add_menu_item("teleport", "Center", &func_teleport, (-3472, 814, 216.17), (0, -57, 0));
                self add_menu_item("teleport", "Top iceberg", &func_teleport, (9899, -666, 4950.47), (18, -176, 0));
                break;
            case "mp_maldives": // lair
                self add_menu_item("teleport", "Center", &func_teleport, (-3, -724, 288.125), (0, 67, 0));
                self add_menu_item("teleport", "Volcano", &func_teleport, (-17823.7, 5811.25, 1992.34), (0, 40, 0));
                break;
            case "mp_militia":
                self add_menu_item("teleport", "Center", &func_teleport, (-221, 379, -1.875), (0, -22, 0));
                break;
            case "mp_mountain2":// summit
                self add_menu_item("teleport", "Center", &func_teleport, (2322, 872, 320.125), (0, -22, 0));
                break;
            case "mp_nuketown_4":
                self add_menu_item("teleport", "Center", &func_teleport, (-41, 490.88, -60.8872), (0, 148, 0));
                self add_menu_item("teleport", "Rocket tunnel", &func_teleport, (-112.017, 1348.36, -200.875), (12, -81, 0));
                break;
            case "mp_offshore":// contraband
            case "mp_offshore_alt":
                self add_menu_item("teleport", "Center", &func_teleport, (2544, -251, 64.125), (0, 45, 0));
                self add_menu_item("teleport", "Island 2", &func_teleport, (-3512, 4515, 11.5002), (0, -85, 0));
                self add_menu_item("teleport", "Island 3", &func_teleport, (-8073, -8542, -3.38165), (0, -33, 0));
                self add_menu_item("teleport", "Island 4", &func_teleport, (7258, -13268, 92.4429), (0, 170, 0));
                self add_menu_item("teleport", "Island 4", &func_teleport, (8627, 11180, 18.8269), (0, -148, 0));
                self add_menu_item("teleport", "Jail", &func_teleport, (2273, -1938, -47.875), (0, 26, 0));
                break;
            case "mp_urban": // arsenal
            case "mp_urban_alt": // arsenal sandstorm
                self add_menu_item("teleport", "Center", &func_teleport, (-1426, -622, 128.125), (0, 40, 0));
                self add_menu_item("teleport", "Dam", &func_teleport, (-10475, -5307, 1380.13), (0, 169, 0));
                self add_menu_item("teleport", "Parking", &func_teleport, (1032, 7905, 128.125), (0, -122, 0));
                break;
        }
    }

    if (is_warzone()) {
        if (can_spawn_vehicle()) {
            self add_menu("vehicle_wz", "Spawn vehicle", "start_menu");
            self add_menu_item_menuswitch("start_menu", "Spawn vehicle", "vehicle_wz");

            wz_vehicles = get_wz_vehicles();
            for (i = 0; i < wz_vehicles.size; i++) {
                self add_menu_item("vehicle_wz", "" + wz_vehicles[i], &func_spawn_vehicle, wz_vehicles[i]);
            }
        }

        if (!isdefined(self.atianconfig.force_blackout_map)) {
            self add_menu("map_wz", "Set map", "start_menu");
            self add_menu_item_menuswitch("start_menu", "Set map", "map_wz");

            map_wz = get_all_maps_wz();
            
            for (i = 0; i < map_wz.size; i++) {
                self add_menu_item("map_wz", map_wz[i], &func_set_map, map_wz[i]);
            }
        }
        if (!(isdefined(self.atianconfig.force_blackout_map) && isdefined(self.atianconfig.force_blackout_gametype))) {
            self add_menu("gmap_wz", "Set map/gametype", "start_menu");
            self add_menu_item_menuswitch("start_menu", "Set map/gametype", "gmap_wz");

            self add_menu_item("gmap_wz", "Core Solo", &func_set_mapgametype, "wz_open_skyscrapers", "warzone_solo");
            self add_menu_item("gmap_wz", "Core Duo", &func_set_mapgametype, "wz_open_skyscrapers", "warzone_duo");
            self add_menu_item("gmap_wz", "Core Quad", &func_set_mapgametype, "wz_open_skyscrapers", "warzone_quad");
            
            self add_menu_item("gmap_wz", "Alcatraz portal Duo", &func_set_mapgametype, "wz_escape", "warzone_escape_duo_dbno");
            self add_menu_item("gmap_wz", "Alcatraz portal Quad", &func_set_mapgametype, "wz_escape", "warzone_escape_quad_dbno");
            
            self add_menu_item("gmap_wz", "Alcatraz Night portal Duo", &func_set_mapgametype, "wz_escape_alt", "warzone_escape_duo_dbno");
            self add_menu_item("gmap_wz", "Alcatraz Night portal Quad", &func_set_mapgametype, "wz_escape_alt", "warzone_escape_quad_dbno");

            self add_menu_item("gmap_wz", "Hot pursuit", &func_set_mapgametype, "wz_open_skyscrapers", "warzone_hot_pursuit");
            self add_menu_item("gmap_wz", "Pandemic", &func_set_mapgametype, "wz_open_skyscrapers", "warzone_pandemic_quad");
            self add_menu_item("gmap_wz", "Heavy metal heroes", &func_set_mapgametype, "wz_open_skyscrapers", "warzone_heavy_metal_heroes");

            self add_menu_item("gmap_wz", "Core hardcore Solo", &func_set_mapgametype, "wz_escape", "warzone_hardcore_solo");
            self add_menu_item("gmap_wz", "Core hardcore Duo", &func_set_mapgametype, "wz_escape", "warzone_hardcore_duo");
            self add_menu_item("gmap_wz", "Core hardcore Quad", &func_set_mapgametype, "wz_escape", "warzone_hardcore_quad");
            
            self add_menu_item("gmap_wz", "Alcatraz hardcore Solo", &func_set_mapgametype, "wz_escape", "warzone_hardcore_solo");
            self add_menu_item("gmap_wz", "Alcatraz hardcore Duo", &func_set_mapgametype, "wz_escape", "warzone_hardcore_duo");
            self add_menu_item("gmap_wz", "Alcatraz hardcore Quad", &func_set_mapgametype, "wz_escape", "warzone_hardcore_quad");

            self add_menu_item("gmap_wz", "Alcatraz Solo (no respawn)", &func_set_mapgametype, "wz_escape", "warzone_solo");
            self add_menu_item("gmap_wz", "Alcatraz Duo (no respawn)", &func_set_mapgametype, "wz_escape", "warzone_duo");
            self add_menu_item("gmap_wz", "Alcatraz Quad (no respawn)", &func_set_mapgametype, "wz_escape", "warzone_quad");
        }
        
        if (!isdefined(self.atianconfig.force_blackout_gametype)) {
            self add_menu("mode_wz", "Set gametype", "start_menu");
            self add_menu_item_menuswitch("start_menu", "Set gametype", "mode_wz");

            mode_wz = get_all_modes_wz();
            
            for (i = 0; i < mode_wz.size; i++) {
                self add_menu_item("mode_wz", mode_wz[i], &func_set_gametype, mode_wz[i]);
            }
        }
    } else if (is_multiplayer()) {
        self add_menu("map_mp", "Set map", "start_menu");
        self add_menu_item_menuswitch("start_menu", "Set map", "map_mp");

        map_mp = get_all_maps_mp();
        
        for (i = 0; i < map_mp.size; i++) {
            self add_menu_item("map_mp", map_mp[i], &func_set_map, map_mp[i]);
        }
        
        self add_menu("mode_mp", "Set gametype", "start_menu");
        self add_menu_item_menuswitch("start_menu", "Set gametype", "mode_mp");

        mode_mp = get_all_modes_mp();
        
        for (i = 0; i < mode_mp.size; i++) {
            self add_menu_item("mode_mp", mode_mp[i], &func_set_gametype, mode_mp[i]);
        }
    } else if (is_zombies()) {
        // ---- Weapons (Upgraded) ----
        self add_menu("weapons_upgraded", "Give weapon (Upgraded)", "start_menu");
        self add_menu_item_menuswitch("start_menu", "Give weapon (Upgraded)", "weapons_upgraded");

        weapons = get_weapons_all();

        for (i = 0; i < weapons.size; i++) {
            self add_menu_item("weapons_upgraded", weapons[i], &func_give_weapon, weapons[i] + "_upgraded");
        }
    }
    self add_menu("random", "Random", "start_menu");
    self add_menu_item_menuswitch("start_menu", "Random", "random");

    self add_menu_item_modswitch("random", "YOU SPIN ME...", "spin_me");
    

    // ---- Characters ----
    self add_menu("characters", "Characters", "start_menu");
    self add_menu_item_menuswitch("start_menu", "Characters", "characters");

    characters = get_characters_for_mode();

    for (i = 0; i < characters.size; i++) {
        self add_menu_item("characters", characters[i], &func_set_char, i);
    }

    // ---- Camos ----
    self add_menu("camos", "Camos", "start_menu");
    self add_menu_item_menuswitch("start_menu", "Camos", "camos");
    
    // ---- Camos/Mastery ----
    self add_menu("camos_master", "Mastery", "camos");
    self add_menu_item_menuswitch("camos", "Mastery", "camos_master");
    
    // ---- Camos/Pack a punch ----
    self add_menu("camos_pap", "Pack a punch", "camos");
    self add_menu_item_menuswitch("camos", "Pack a punch", "camos_pap");
    
    // ---- Camos/Black market (Reactive) ----
    self add_menu("camos_blackjack_reactive", "Black market (Reactive)", "camos");
    self add_menu_item_menuswitch("camos", "Black market (Reactive)", "camos_blackjack_reactive");
    // ---- Camos/Black market ----
    self add_menu("camos_blackjack", "Black market", "camos");
    self add_menu_item_menuswitch("camos", "Black market", "camos_blackjack");
    
    // ---- Camos/Multiplayer ----
    self add_menu("camos_mp", "Multiplayer", "camos");
    self add_menu_item_menuswitch("camos", "Multiplayer", "camos_mp");
    
    // ---- Camos/Zombies ----
    self add_menu("camos_zm", "Zombies", "camos");
    self add_menu_item_menuswitch("camos", "Zombies", "camos_zm");
    
    // ---- Camos/Blackout ----
    self add_menu("camos_wz", "Blackout", "camos");
    self add_menu_item_menuswitch("camos", "Blackout", "camos_wz");
    
    // ---- Camos/By id ----
    self add_menu("camos_id", "By id", "camos");
    self add_menu_item_menuswitch("camos", "By id", "camos_id");

    for (i = 1; i < 43; i += 3) {
        self add_menu_item("camos_mp", "Generic MP " + i, &func_set_camo, i);
    }

    for (i = 2; i < 43; i += 3) {
        self add_menu_item("camos_wz", "Generic BR " + i, &func_set_camo, i);
    }

    for (i = 3; i < 43; i += 3) {
        self add_menu_item("camos_zm", "Generic ZM " + i, &func_set_camo, i);
    }

    self add_menu_item("camos_master", "Gold", &func_set_camo, 43);
    self add_menu_item("camos_master", "Diamond", &func_set_camo, 44);
    self add_menu_item("camos_master", "Dark matter", &func_set_camo, 45);
    

    self add_menu_item("camos_pap", "Voyage of despair purple", &func_set_camo, 146);
    self add_menu_item("camos_pap", "Voyage of despair red", &func_set_camo, 147);
    self add_menu_item("camos_pap", "Voyage of despair green", &func_set_camo, 148);
    self add_menu_item("camos_pap", "Voyage of despair yellow", &func_set_camo, 149);
    self add_menu_item("camos_pap", "Voyage of despair pink", &func_set_camo, 150);
    self add_menu_item("camos_pap", "IX blue", &func_set_camo, 151);
    self add_menu_item("camos_pap", "IX red", &func_set_camo, 152);
    self add_menu_item("camos_pap", "IX green", &func_set_camo, 153);
    self add_menu_item("camos_pap", "IX purple", &func_set_camo, 154);
    self add_menu_item("camos_pap", "IX orange", &func_set_camo, 155);
    self add_menu_item("camos_pap", "Blood of the Dead yellow", &func_set_camo, 156);
    self add_menu_item("camos_pap", "Blood of the Dead red", &func_set_camo, 157);
    self add_menu_item("camos_pap", "Blood of the Dead yellow", &func_set_camo, 158);
    self add_menu_item("camos_pap", "Blood of the Dead green", &func_set_camo, 159);
    self add_menu_item("camos_pap", "Blood of the Dead purple", &func_set_camo, 160);
    self add_menu_item("camos_pap", "Classified 1", &func_set_camo, 161);
    self add_menu_item("camos_pap", "Classified 2", &func_set_camo, 162);
    self add_menu_item("camos_pap", "Classified 3", &func_set_camo, 163);
    self add_menu_item("camos_pap", "Classified 4", &func_set_camo, 164);
    self add_menu_item("camos_pap", "Classified 5", &func_set_camo, 165);
    self add_menu_item("camos_pap", "Dead of the night green", &func_set_camo, 280);
    self add_menu_item("camos_pap", "Dead of the night purple", &func_set_camo, 281);
    self add_menu_item("camos_pap", "Dead of the night red", &func_set_camo, 282);
    self add_menu_item("camos_pap", "Dead of the night blue", &func_set_camo, 283);
    self add_menu_item("camos_pap", "Dead of the night orange", &func_set_camo, 284);
    self add_menu_item("camos_pap", "Ancien Evil purple", &func_set_camo, 74);
    self add_menu_item("camos_pap", "Ancien Evil blue", &func_set_camo, 75);
    self add_menu_item("camos_pap", "Ancien Evil orange", &func_set_camo, 76);
    self add_menu_item("camos_pap", "Ancien Evil yellow", &func_set_camo, 77);
    self add_menu_item("camos_pap", "Ancien Evil green", &func_set_camo, 78);
    self add_menu_item("camos_pap", "Alpha Omega", &func_set_camo, 345);
    self add_menu_item("camos_pap", "Tag der toten", &func_set_camo, 394);

    self add_menu_item("camos_blackjack_reactive", "D-Day", &func_set_camo, 298);
    self add_menu_item("camos_blackjack_reactive", "Roadtrip", &func_set_camo, 300);
    self add_menu_item("camos_blackjack_reactive", "Masked", &func_set_camo, 310);
    self add_menu_item("camos_blackjack_reactive", "Bobine", &func_set_camo, 52);
    self add_menu_item("camos_blackjack_reactive", "Search", &func_set_camo, 57);
    self add_menu_item("camos_blackjack_reactive", "Strip", &func_set_camo, 62);
    self add_menu_item("camos_blackjack_reactive", "Rave", &func_set_camo, 67);
    self add_menu_item("camos_blackjack_reactive", "Nebula", &func_set_camo, 89);
    self add_menu_item("camos_blackjack_reactive", "After life", &func_set_camo, 90);
    self add_menu_item("camos_blackjack_reactive", "Postluminescence", &func_set_camo, 119);
    self add_menu_item("camos_blackjack_reactive", "115", &func_set_camo, 129);
    self add_menu_item("camos_blackjack_reactive", "Grey matter", &func_set_camo, 131);
    self add_menu_item("camos_blackjack_reactive", "Denied access (waifu)", &func_set_camo, 167);
    self add_menu_item("camos_blackjack_reactive", "Skull", &func_set_camo, 168);
    self add_menu_item("camos_blackjack_reactive", "Solar eruption", &func_set_camo, 381);
    self add_menu_item("camos_blackjack_reactive", "Vision of the future", &func_set_camo, 387);
    self add_menu_item("camos_blackjack_reactive", "Pestilence", &func_set_camo, 389);
    self add_menu_item("camos_blackjack_reactive", "Crypted", &func_set_camo, 286);
    self add_menu_item("camos_blackjack_reactive", "Judas", &func_set_camo, 357);
    self add_menu_item("camos_blackjack_reactive", "Incandescent", &func_set_camo, 359);
    self add_menu_item("camos_blackjack_reactive", "Encoded", &func_set_camo, 363);

    self add_menu_item("camos_blackjack", "Twitch 1", &func_set_camo, 79);
    self add_menu_item("camos_blackjack", "Twitch 2", &func_set_camo, 118);
    self add_menu_item("camos_blackjack", "$", &func_set_camo, 46);
    self add_menu_item("camos_blackjack", "Green course", &func_set_camo, 47);
    self add_menu_item("camos_blackjack", "Blue", &func_set_camo, 48);
    self add_menu_item("camos_blackjack", "Kiss", &func_set_camo, 49);
    self add_menu_item("camos_blackjack", "Fortuna", &func_set_camo, 50);
    self add_menu_item("camos_blackjack", "Donuts", &func_set_camo, 51);
    self add_menu_item("camos_blackjack", "Serment", &func_set_camo, 80);
    self add_menu_item("camos_blackjack", "Imbu", &func_set_camo, 81);
    self add_menu_item("camos_blackjack", "Megalodon", &func_set_camo, 82);
    self add_menu_item("camos_blackjack", "Surf", &func_set_camo, 83);
    self add_menu_item("camos_blackjack", "Goinfre", &func_set_camo, 84);
    self add_menu_item("camos_blackjack", "Chrysalide", &func_set_camo, 86);
    self add_menu_item("camos_blackjack", "Locker", &func_set_camo, 87);
    self add_menu_item("camos_blackjack", "Bacon", &func_set_camo, 117);
    self add_menu_item("camos_blackjack", "Dead time", &func_set_camo, 120);
    self add_menu_item("camos_blackjack", "Dirty buble", &func_set_camo, 121);
    self add_menu_item("camos_blackjack", "Heaven", &func_set_camo, 122);
    self add_menu_item("camos_blackjack", "Pique nique royal", &func_set_camo, 123);
    self add_menu_item("camos_blackjack", "Mai Tai Zombie", &func_set_camo, 124);
    self add_menu_item("camos_blackjack", "Heaven", &func_set_camo, 122);
    self add_menu_item("camos_blackjack", "Colonne piégée", &func_set_camo, 126);
    self add_menu_item("camos_blackjack", "Derezzed", &func_set_camo, 134);
    self add_menu_item("camos_blackjack", "Steam explosion", &func_set_camo, 135);
    self add_menu_item("camos_blackjack", "Goinfre", &func_set_camo, 136);
    self add_menu_item("camos_blackjack", "Arabesque", &func_set_camo, 137);
    self add_menu_item("camos_blackjack", "Se sentir visé", &func_set_camo, 166);
    self add_menu_item("camos_blackjack", "Rampage", &func_set_camo, 170);
    self add_menu_item("camos_blackjack", "Soul eater", &func_set_camo, 171);
    self add_menu_item("camos_blackjack", "Marathon", &func_set_camo, 172);
    self add_menu_item("camos_blackjack", "Avant garde", &func_set_camo, 173);
    self add_menu_item("camos_blackjack", "Plasma", &func_set_camo, 293);
    self add_menu_item("camos_blackjack", "Air fight", &func_set_camo, 305);
    self add_menu_item("camos_blackjack", "Cherry", &func_set_camo, 314);
    self add_menu_item("camos_blackjack", "Gigakiller", &func_set_camo, 315);
    self add_menu_item("camos_blackjack", "Flicker", &func_set_camo, 316);
    self add_menu_item("camos_blackjack", "Rocket box", &func_set_camo, 317);
    self add_menu_item("camos_blackjack", "USA", &func_set_camo, 346);
    self add_menu_item("camos_blackjack", "Juicy", &func_set_camo, 347);
    self add_menu_item("camos_blackjack", "Glyph", &func_set_camo, 348);
    self add_menu_item("camos_blackjack", "Gratte-gratte", &func_set_camo, 350);
    self add_menu_item("camos_blackjack", "Flocon", &func_set_camo, 351);
    self add_menu_item("camos_blackjack", "Vertige", &func_set_camo, 353);
    self add_menu_item("camos_blackjack", "High tension", &func_set_camo, 354);
    self add_menu_item("camos_blackjack", "Gluant", &func_set_camo, 355);

    for (i = 0; i < 512; i++) {
        self add_menu_item("camos_id", "Id " + i, &func_set_camo, i);
    }

    // ---- Reticles ----
    self add_menu("reticles", "Reticles", "start_menu");
    self add_menu_item_menuswitch("start_menu", "Reticles", "reticles");
    
    // ---- Reticles/By id ----
    self add_menu("reticles_id", "Reticles Id", "start_menu");
    self add_menu_item_menuswitch("reticles", "By id", "reticles_id");
    
    for (i = 0; i < 512; i++) {
        self add_menu_item("reticles_id", "Id " + i, &func_set_reticle, i);
    }

    self add_menu_item("reticles", "King", &func_set_reticle, 50);
    self add_menu_item("reticles", "Treyarch", &func_set_reticle, 66);
    self add_menu_item("reticles", "Anchor", &func_set_reticle, 67);

    reticle_colors = array("red", "green", "yellow", "purple", "cyan");
    for (i = 0; i < reticle_colors.size; i++) {
        self add_menu_item("reticles", "Dot" + " " + reticle_colors[i], &func_set_reticle, 0 + i);
    }
    for (i = 0; i < reticle_colors.size; i++) {
        self add_menu_item("reticles", "Dot+" + " " + reticle_colors[i], &func_set_reticle, 5 + i);
    }
    for (i = 0; i < reticle_colors.size; i++) {
        self add_menu_item("reticles", "Nord" + " " + reticle_colors[i], &func_set_reticle, 10 + i);
    }
    for (i = 0; i < reticle_colors.size; i++) {
        self add_menu_item("reticles", "Echelon" + " " + reticle_colors[i], &func_set_reticle, 15 + i);
    }
    for (i = 0; i < reticle_colors.size; i++) {
        self add_menu_item("reticles", "Clamp" + " " + reticle_colors[i], &func_set_reticle, 20 + i);
    }
    for (i = 0; i < reticle_colors.size; i++) {
        self add_menu_item("reticles", "Circle" + " " + reticle_colors[i], &func_set_reticle, 25 + i);
    }
    for (i = 0; i < reticle_colors.size; i++) {
        self add_menu_item("reticles", "Cross" + " " + reticle_colors[i], &func_set_reticle, 30 + i);
    }
    for (i = 0; i < reticle_colors.size; i++) {
        self add_menu_item("reticles", "Mustache" + " " + reticle_colors[i], &func_set_reticle, 35 + i);
    }
    for (i = 0; i < reticle_colors.size; i++) {
        self add_menu_item("reticles", "Square" + " " + reticle_colors[i], &func_set_reticle, 40 + i);
    }
    for (i = 0; i < reticle_colors.size; i++) {
        self add_menu_item("reticles", "Cross" + " " + reticle_colors[i], &func_set_reticle, 45 + i);
    }
    for (i = 0; i < reticle_colors.size; i++) {
        self add_menu_item("reticles", "Circle" + " " + reticle_colors[i], &func_set_reticle, 51 + i);
    }
    for (i = 0; i < reticle_colors.size; i++) {
        self add_menu_item("reticles", "Clamp" + " " + reticle_colors[i], &func_set_reticle, 56 + i);
    }
    for (i = 0; i < reticle_colors.size; i++) {
        self add_menu_item("reticles", "Circle" + " " + reticle_colors[i], &func_set_reticle, 61 + i);
    }

    // ---- Skin custom ----
    self add_menu("skin_custom", "Skin custom", "start_menu");
    self add_menu_item_menuswitch("start_menu", "Skin custom", "skin_custom");

    self add_menu("skin_custom_default", "Known skins", "skin_custom");
    self add_menu_item_menuswitch("skin_custom", "Known skins", "skin_custom_default");

    if (is_warzone()) {
        // 1 = battery
        self add_menu("skin_custom_default_battery", "Battery", "skin_custom_default");
        self add_menu_item_menuswitch("skin_custom_default", "Battery", "skin_custom_default_battery");
        self add_menu_item("skin_custom_default_battery", "Battery number", &func_set_skin, 1, 14);
        self add_menu_item("skin_custom_default_battery", "Battery money", &func_set_skin, 1, 16);
        self add_menu_item("skin_custom_default_battery", "Battery twitter", &func_set_skin, 1, 19);
        self add_menu_item("skin_custom_default_battery", "Battery criminal", &func_set_skin, 1, 21);
        self add_menu_item("skin_custom_default_battery", "Battery aviator", &func_set_skin, 1, 25);
        // 2 = firebreak
        self add_menu("skin_custom_default_firebreak", "Firebreak", "skin_custom_default");
        self add_menu_item_menuswitch("skin_custom_default", "Firebreak", "skin_custom_default_firebreak");
        self add_menu_item("skin_custom_default_firebreak", "Firebreak silverfish", &func_set_skin, 2, 9);
        self add_menu_item("skin_custom_default_firebreak", "Firebreak nebula", &func_set_skin, 2, 10);
        self add_menu_item("skin_custom_default_firebreak", "Firebreak number", &func_set_skin, 2, 14);
        self add_menu_item("skin_custom_default_firebreak", "Firebreak rabbit", &func_set_skin, 2, 15);
        self add_menu_item("skin_custom_default_firebreak", "Firebreak money", &func_set_skin, 2, 17);
        // 48 = outrider
        self add_menu("skin_custom_default_outrider", "Outrider", "skin_custom_default");
        self add_menu_item_menuswitch("skin_custom_default", "Outrider", "skin_custom_default_outrider");
        self add_menu_item("skin_custom_default_outrider", "Outrider money", &func_set_skin, 48, 3);
        self add_menu_item("skin_custom_default_outrider", "Outrider number", &func_set_skin, 48, 4);
        self add_menu_item("skin_custom_default_outrider", "Outrider pirate", &func_set_skin, 48, 10);
        self add_menu_item("skin_custom_default_outrider", "Outrider cheerleader", &func_set_skin, 48, 14);
        self add_menu_item("skin_custom_default_outrider", "Outrider heroes", &func_set_skin, 48, 18);
        self add_menu_item("skin_custom_default_outrider", "Outrider red", &func_set_skin, 48, 1);
        self add_menu_item("skin_custom_default_outrider", "Outrider white", &func_set_skin, 48, 8);
        self add_menu_item("skin_custom_default_outrider", "Outrider green", &func_set_skin, 48, 15);
        self add_menu_item("skin_custom_default_outrider", "Outrider pink", &func_set_skin, 48, 19);
        self add_menu_item("skin_custom_default_outrider", "Outrider blank", &func_set_skin, 48, 19, 1);
        // DO NOT TEST 12

        // 67 = reaper
        self add_menu("skin_custom_default_reaper", "Reaper", "skin_custom_default");
        self add_menu_item_menuswitch("skin_custom_default", "Reaper", "skin_custom_default_reaper");
        self add_menu_item("skin_custom_default_reaper", "Reaper spectre", &func_set_skin, 67, 1);
        self add_menu_item("skin_custom_default_reaper", "Reaper punk", &func_set_skin, 67, 2);
        self add_menu_item("skin_custom_default_reaper", "Reaper red", &func_set_skin, 67, 3);
        self add_menu_item("skin_custom_default_reaper", "Reaper number", &func_set_skin, 67, 4);
        // 17 = richtofen
        self add_menu_item("skin_custom_default", "Richtofen great war", &func_set_skin, 17, 2);
        self add_menu_item("skin_custom_default", "Zombie", &func_set_skin, 17, 1);
    } else if (is_multiplayer()) {
        // 2 = battery
        self add_menu("skin_custom_default_battery", "Battery", "skin_custom_default");
        self add_menu_item_menuswitch("skin_custom_default", "Battery", "skin_custom_default_battery");
        self add_menu_item("skin_custom_default_battery", "Battery number", &func_set_skin, 2, 14);
        self add_menu_item("skin_custom_default_battery", "Battery money", &func_set_skin, 2, 16);
        self add_menu_item("skin_custom_default_battery", "Battery twitter", &func_set_skin, 2, 19);
        self add_menu_item("skin_custom_default_battery", "Battery criminal", &func_set_skin, 2, 21);
        self add_menu_item("skin_custom_default_battery", "Battery aviator", &func_set_skin, 2, 25);
        // 4 = firebreak
        self add_menu("skin_custom_default_firebreak", "Firebreak", "skin_custom_default");
        self add_menu_item_menuswitch("skin_custom_default", "Firebreak", "skin_custom_default_firebreak");
        self add_menu_item("skin_custom_default_firebreak", "Firebreak silverfish", &func_set_skin, 4, 9);
        self add_menu_item("skin_custom_default_firebreak", "Firebreak nebula", &func_set_skin, 4, 10);
        self add_menu_item("skin_custom_default_firebreak", "Firebreak number", &func_set_skin, 4, 14);
        self add_menu_item("skin_custom_default_firebreak", "Firebreak rabbit", &func_set_skin, 4, 15);
        self add_menu_item("skin_custom_default_firebreak", "Firebreak money", &func_set_skin, 4, 17);
        // 12 = outrider
        self add_menu("skin_custom_default_outrider", "Outrider", "skin_custom_default");
        self add_menu_item_menuswitch("skin_custom_default", "Outrider", "skin_custom_default_outrider");
        self add_menu_item("skin_custom_default_outrider", "Outrider money", &func_set_skin, 12, 3);
        self add_menu_item("skin_custom_default_outrider", "Outrider number", &func_set_skin, 12, 4);
        self add_menu_item("skin_custom_default_outrider", "Outrider pirate", &func_set_skin, 12, 10);
        self add_menu_item("skin_custom_default_outrider", "Outrider cheerleader", &func_set_skin, 12, 14);
        self add_menu_item("skin_custom_default_outrider", "Outrider heroes", &func_set_skin, 12, 18);
        self add_menu_item("skin_custom_default_outrider", "Outrider red", &func_set_skin, 12, 1);
        self add_menu_item("skin_custom_default_outrider", "Outrider white", &func_set_skin, 12, 8);
        self add_menu_item("skin_custom_default_outrider", "Outrider green", &func_set_skin, 12, 15);
        self add_menu_item("skin_custom_default_outrider", "Outrider pink", &func_set_skin, 12, 19);
        self add_menu_item("skin_custom_default_outrider", "Outrider blank", &func_set_skin, 12, 19, 1);
        // DO NOT TEST 12
        // 14 = reaper
        self add_menu("skin_custom_default_reaper", "Reaper", "skin_custom_default");
        self add_menu_item_menuswitch("skin_custom_default", "Reaper", "skin_custom_default_reaper");
        self add_menu_item("skin_custom_default_reaper", "Reaper spectre", &func_set_skin, 14, 1);
        self add_menu_item("skin_custom_default_reaper", "Reaper punk", &func_set_skin, 14, 2);
        self add_menu_item("skin_custom_default_reaper", "Reaper red", &func_set_skin, 14, 3);
        self add_menu_item("skin_custom_default_reaper", "Reaper number", &func_set_skin, 14, 4);
    } else if (is_zombies()) {
        // 5 = richtofen
        self add_menu_item("skin_custom_default", "Richtofen great war", &func_set_skin, 5, 2);
        self add_menu_item("skin_custom_default", "Zombie", &func_set_skin, 5, 1);
    } 
    
    self add_menu_item("skin_custom", "Clear", &func_set_skin_custom_clear);

    // ---- Skin custom/Skin ----
    self add_menu("skin_custom_skin", "Skin", "skin_custom");
    self add_menu_item_menuswitch("skin_custom", "Skin", "skin_custom_skin");
    self add_menu_item("skin_custom_skin", "Default", &func_set_skin_custom, 0);
    
    for (i = 1; i < 100; i++) {
        self add_menu_item("skin_custom_skin", "Skin " + i, &func_set_skin_custom, i);
    }

    // ---- Skin custom/Palette ----
    self add_menu("skin_custom_palette", "Palette", "skin_custom");
    self add_menu_item_menuswitch("skin_custom", "Palette", "skin_custom_palette");
    self add_menu_item("skin_custom_palette", "Default", &func_set_skin_custom_palette, 0);
    
    for (i = 1; i < 100; i++) {
        self add_menu_item("skin_custom_palette", "Skin " + i, &func_set_skin_custom_palette, i);
    }

    // ---- Skin custom/Decal ----
    self add_menu("skin_custom_decal", "Decal", "skin_custom");
    self add_menu_item_menuswitch("skin_custom", "Decal", "skin_custom_decal");
    self add_menu_item("skin_custom_decal", "Default", &func_set_skin_custom_decal, 0);
    
    for (i = 1; i < 100; i++) {
        self add_menu_item("skin_custom_decal", "Skin " + i, &func_set_skin_custom_decal, i);
    }

    // ---- Skin custom/Warpaint ----
    self add_menu("skin_custom_warpaint", "Warpaint", "skin_custom");
    self add_menu_item_menuswitch("skin_custom", "Warpaint", "skin_custom_warpaint");
    self add_menu_item("skin_custom_warpaint", "Default", &func_set_skin_custom_warpaint, 0);
    
    for (i = 1; i < 100; i++) {
        self add_menu_item("skin_custom_warpaint", "Skin " + i, &func_set_skin_custom_warpaint, i);
    }

    self thread menu_think();
}

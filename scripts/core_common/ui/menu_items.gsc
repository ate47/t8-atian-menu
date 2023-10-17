init_menus() {
    // ---- Tools ----
    self add_menu("tool_menu", "Tools", "start_menu", true);

    self add_menu_item("tool_menu", "Info", &func_infomenu);
    self add_menu_item_modswitch("tool_menu", "Fly", "fly");
    self add_menu_item("tool_menu", "Third person", &func_3rdperson);

    self add_menu_item_modswitch("tool_menu", "Ammos", "maxammo");
    if (is_zombies()) {
        self add_menu_item("tool_menu", "End contracts", &func_end_contracts);
        self add_menu_item("tool_menu", "Tier skip", &func_tier_skip);
    }
    self add_menu_item("tool_menu", "Invulnerability", &func_invulnerability);

    self add_menu_item("tool_menu", "No hud", &func_toggle_hud);
    self add_menu_item("tool_menu", "Camera mode", &func_show_hud);

    if (is_zombies()) {
        self add_menu_item("tool_menu", "Ignore me", &func_zmignoreme);
        self add_menu_item_modswitch("tool_menu", "Max Points", "maxpoints");
        self add_menu_item("tool_menu", "Max Revive", &func_zmmaxrevive);
        self add_menu_item("tool_menu", "Infinite revive time", &func_inf_revive);
        self add_menu_item("tool_menu", "Kill all zombies", &func_kill_zombies);

        self add_menu("zombies_speed", "Zombies speed", "tool_menu", true);

        self add_menu_item("zombies_speed", "Default", &func_zombies_speed);
        self add_menu_item("zombies_speed", "Walk", &func_zombies_speed, "walk");
        self add_menu_item("zombies_speed", "Run", &func_zombies_speed, "run");
        self add_menu_item("zombies_speed", "Sprint", &func_zombies_speed, "sprint");
        self add_menu_item("zombies_speed", "Super sprint", &func_zombies_speed, "super_sprint");

        self add_menu("round_tool", "Round tool", "tool_menu", true);
        
        self add_menu("round_tool_set", "Set", "round_tool", true);

        for (i = 0; i < 9; i++) {
            self add_menu("round_tool_set" + i, "" + max(1, (i * 100)) + " -> " + ((i + 1) * 100), "round_tool_set", true);
        }
        // custom menu for the 900-935
        self add_menu("round_tool_set9", "900 -> 935", "round_tool_set", true);

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

        if (sessionmodeisonlinegame()) {
            self add_menu("zm_xp_multiplier", "XP multiplier", "tool_menu", true);
            self add_menu_item("zm_xp_multiplier", "/4", &func_set_xp_multiplier, 0.25);
            self add_menu_item("zm_xp_multiplier", "/2", &func_set_xp_multiplier, 0.5);
            self add_menu_item("zm_xp_multiplier", "Normal", &func_set_xp_multiplier);
            self add_menu_item("zm_xp_multiplier", "x2", &func_set_xp_multiplier, 2);
            self add_menu_item("zm_xp_multiplier", "x4", &func_set_xp_multiplier, 4);
            self add_menu_item("zm_xp_multiplier", "x8", &func_set_xp_multiplier, 8);
            self add_menu_item("zm_xp_multiplier", "x9999", &func_set_xp_multiplier, 9999);
        }
    }

    self add_menu_item("tool_menu", "Test", &func_test);

    // ---- Weapon ----
    self add_menu("tool_weapon", "Guns", "start_menu", true);

    self add_menu_item("tool_weapon", "Drop weapon", &func_drop);

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

    if (is_warzone() || is_zombies() || is_dev_mode()) {
        self add_menu_item_modswitch("tool_weapon", "Pea's gun", "pea_gun");
    }

    // ---- Give weapon ----
    self add_menu("weapons", "Give weapon", "start_menu", true);

    weapon_data = get_weapon_enum_data();

    foreach (cat_key, cat_item in weapon_data.categories) {
        menu_id = "weapons_" + cat_item.name;
        if (cat_item.weapons.size == 0) {
            continue; // empty category
        }

        self add_menu(menu_id, cat_item.title, "weapons", true);
        if (cat_item.name == "gadget" && is_multiplayer()) {
            for (i = 0; i < cat_item.weapons.size; i++) {
                w_i = cat_item.weapons[i];
                self add_menu_item(menu_id, w_i.title, &func_setgadget, w_i.name, w_i.gadgetid);
            }
        } else if (cat_item.name == "scorestreak" && is_multiplayer()) {
            //self add_menu_item(menu_id, "Clear streaks", &func_clear_killstreaks);
            for (i = 0; i < cat_item.weapons.size; i++) {
                w_i = cat_item.weapons[i];
                self add_menu_item(menu_id, w_i.title, &func_give_killstreak, w_i.name);
            }
        } else if (cat_item.name == "melee" && is_zombies()) {
            for (i = 0; i < cat_item.weapons.size; i++) {
                w_i = cat_item.weapons[i];
#ifdef _SUPPORTS_LAZYLINK
                self add_menu_item(menu_id, w_i.title, &func_give_zm_melee, w_i.name);
#endif
            }
        } else {
            for (i = 0; i < cat_item.weapons.size; i++) {
                w_i = cat_item.weapons[i];
                self add_menu_item(menu_id, w_i.title, &func_give_weapon, w_i.name);
                if (is_zombies() && w_i.upgradable) {
                    self add_menu_item(menu_id, w_i.title + " (Upgraded)", &func_give_weapon, w_i.name, 0, true);
                }
            }
        }
    }
    
    if (isdefined(self.atianconfig.add_weapons) && self.atianconfig.add_weapons.size != 0) {
        self add_menu("weapons_custom", "Custom", "weapons", true);

        for (i = 0; i < self.atianconfig.add_weapons.size; i++) {
            self add_menu_item("weapons_custom", self.atianconfig.add_weapons[i], &func_give_weapon, self.atianconfig.add_weapons[i]);
        }
    }

    // internal weapons
    self add_menu("weapons_internal", "Internal", "weapons", true, &menu_open_message, "^1Warning: Can crash the game with bad usage!");
    for (i = 0; i < weapon_data.global_weapons.size; i++) {
        self add_menu_item("weapons_internal", "" + weapon_data.global_weapons[i], &func_give_weapon, weapon_data.global_weapons[i]);
    }
    
    self add_menu("weapons_attachment", "Set attachment", "weapons", true, &func_searchattachment);

    if (isdefined(level.script)) {
        self add_menu("teleport", "Teleport", "start_menu", true);

        if (is_warzone()) {
            self add_menu_item_modswitch("teleport", "Waypoint tp", "waypoint_tp");
            self add_menu_item("teleport", "Random tp", &RandomTp);
        }

        switch (level.script) {
            case "zm_zodt8":
                self add_menu_item("teleport", "Spawn", &func_teleport, (-16, -4113, 928.125));
                break;
            case "zm_escape":
                self add_menu_item("teleport", "Roof", &func_teleport, (3443, 9802, 1704.13));
                self add_menu_item("teleport", "Spawn", &func_teleport, (9923, 11439, 256.125));
                self add_menu_item("teleport", "White house", &func_teleport, (-5681, 8934, 463.125), (-10, -141, 0));
                break;
            case "zm_towers":
                self add_menu_item("teleport", "Boss fight", &func_teleport, (-3518, 460, 1.15883), (0, -180, 0));
                self add_menu_item("teleport", "Arena", &func_teleport, (30, 80, 80.625), (0, -180, 0));
                break;
            case "zm_office":
                self add_menu_item("teleport", "Groom Lake", &func_teleport, (8550, 1300, -416.375), (0, -90, 0));
                self add_menu_item("teleport", "Office", &func_teleport, (-485, 2490, 16.125), (0, 180, 0));
                break;
            case "zm_mansion":
                self add_menu_item("teleport", "Spawn", &func_teleport, (235, 1086, -7.875), (0, -50, 0));
                self add_menu_item("teleport", "Ruins", &func_teleport, (13320, -7141, -1841.76), (0, -120, 0));
                break;
            case "zm_white":
                self add_menu_item("teleport", "Center", &func_teleport, (-149, 675, -61.125), (0, -100, 0));
                break;
            case "zm_orange":
                self add_menu_item("teleport", "Boat", &func_teleport, (-1150, -818, 600.932), (0, 143, 0));
                self add_menu_item("teleport", "Spawn", &func_teleport, (1573, 2984, 38.7583), (0, -50, 0));
                self add_menu_item("teleport", "Mars", &func_teleport, (-7471, -24921, 8.86695), (-12, -6, 0));
                self add_menu_item("teleport", "Lab", &func_teleport, (-1466, 4252, 1399.63), (0, -82, 0));
            case "zm_red":
                self add_menu_item("teleport", "Center of the world", &func_teleport, (-1585, 8981, 319.159), (0, -90, 0));
                self add_menu_item("teleport", "Intro", &func_teleport, (3300, -5100, 860.125), (0, 140, 0));
                self add_menu_item("teleport", "River", &func_teleport, (-1410, 7637, -591.562), (0, -90, 0));
                self add_menu_item("teleport", "Spawn", &func_teleport, (-818.773, -837, 64.125), (0, -50, 0));
                self add_menu_item("teleport", "Olympus", &func_teleport, (20404, 23140, 1000.76), (0, -100, 0));
                break;
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
            case "mp_casino":
                self add_menu_item("teleport", "Center", &func_teleport, (482, -24, 0.125));
                break;
            case "mp_cairo":
                self add_menu_item("teleport", "Center", &func_teleport, (533, 372, -0.064));
                break;
            case "mp_grind":
                self add_menu_item("teleport", "Center", &func_teleport, (43, -581, 1208.13));
                break;
            case "mp_cosmodrome":
                self add_menu_item("teleport", "Center", &func_teleport, (-927, 372, -3.875));
                break;
            case "mp_embassy":
                self add_menu_item("teleport", "Center", &func_teleport, (650, -1677, 144.125), (0, -32, 0));
                self add_menu_item("teleport", "Building top", &func_teleport, (-2640, -2416, 2720.13), (0, 12, 0));
                break;
            case "mp_elevation":
                self add_menu_item("teleport", "Center", &func_teleport, (43, -108, 208.679), (0, -110, 0));
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
            case "mp_geothermal":
                self add_menu_item("teleport", "Center", &func_teleport, (-777, 1465, 448.125), (0, -77, 0));
                break;
            case "mp_gridlock":
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
            case "mp_madagascar":
                self add_menu_item("teleport", "Center", &func_teleport, (489, 427, 187.458), (0, 15, 0));
                self add_menu_item("teleport", "Mountains", &func_teleport, (72406, 92087, 21293));
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
            case "mp_russianbase":
                self add_menu_item("teleport", "Center", &func_teleport, (-230, -118, -0.69361));
                break;
            case "mp_seaside":
            case "mp_seaside_alt":
                self add_menu_item("teleport", "Center", &func_teleport, (611, -1137, 703.125));
                break;
            case "mp_urban": // arsenal
            case "mp_urban_alt": // arsenal sandstorm
                self add_menu_item("teleport", "Center", &func_teleport, (-1426, -622, 128.125), (0, 40, 0));
                self add_menu_item("teleport", "Dam", &func_teleport, (-10475, -5307, 1380.13), (0, 169, 0));
                self add_menu_item("teleport", "Parking", &func_teleport, (1032, 7905, 128.125), (0, -122, 0));
                break;
            //case "mp_austria":
            //case "mp_jungle2":
            //case "mp_jungle2_alt":
            //case "mp_morocco":
            //case "mp_silo":
            //case "mp_slums2":
            //case "mp_station":
            //case "mp_zombie_museum":
            default:
                self add_menu_item("teleport", "Nothing known");
                break;
        }
    }

    if (is_warzone()) {
        self add_menu("wz_tools", "Blackout tools", "start_menu", true);


#ifdef _SUPPORTS_LAZYLINK
        self add_menu_item("wz_tools", "Wz test give", &func_give_item_test, #"tomahawk_t8_wz_item_pandemic");
        self add_menu("wzitems", "Blackout item", "wz_tools", true);

        wzitems_data = get_wzitems_enum_data();
        foreach(category_key, cat_item in wzitems_data.categories) {
            cat_menu_id = "wzitems_" + cat_item.name;

            self add_menu(cat_menu_id, cat_item.title, "wzitems", true);

            for (i = 0; i < cat_item.items.size; i++) {
                item = cat_item.items[i];

                self add_menu_item(cat_menu_id, item.title, &func_give_item_test, item.name);
            }
        }

        self add_menu_item("wz_tools", "Clear inventory", &func_wz_item_clear_inventory, true);
#endif

        if (!(isdefined(self.atianconfig.force_blackout_map) && isdefined(self.atianconfig.force_blackout_gametype))) {
            self add_menu("gmap_wz", "Set map/gametype", "start_menu", true);

            self add_menu("gmap_wz_open_skyscrapers", "Core map", "gmap_wz", true);
            self add_menu("gmap_wz_escape", "Alcatraz", "gmap_wz", true);
            self add_menu("gmap_wz_escape_alt", "Alcatraz Night", "gmap_wz", true);

            self add_menu_item("gmap_wz_open_skyscrapers", "Hot pursuit", &func_set_mapgametype, "wz_open_skyscrapers", "warzone_hot_pursuit");
            self add_menu_item("gmap_wz_open_skyscrapers", "Pandemic", &func_set_mapgametype, "wz_open_skyscrapers", "warzone_pandemic_quad");
            self add_menu_item("gmap_wz_open_skyscrapers", "Heavy metal heroes", &func_set_mapgametype, "wz_open_skyscrapers", "warzone_heavy_metal_heroes");
            
            escape_maps = array("wz_escape", "wz_escape_alt");

            for (i = 0; i < escape_maps.size; i++) {
                map_name = escape_maps[i];
                menuid = "gmap_" + map_name;

                self add_menu_item(menuid, "Portal Solo", &func_set_mapgametype, map_name, "warzone_escape_solo");
                self add_menu_item(menuid, "Portal Duo", &func_set_mapgametype, map_name, "warzone_escape_duo_dbno");
                self add_menu_item(menuid, "Portal Quad", &func_set_mapgametype, map_name, "warzone_escape_quad_dbno");
            }

            wz_maps = get_all_maps_wz();

            for (i = 0; i < wz_maps.size; i++) {
                map_name = wz_maps[i];
                menuid = "gmap_" + map_name;
            
                self add_menu_item(menuid, "Standard Solo", &func_set_mapgametype, map_name, "warzone_solo");
                self add_menu_item(menuid, "Standard Duo", &func_set_mapgametype, map_name, "warzone_duo");
                self add_menu_item(menuid, "Standard Quad", &func_set_mapgametype, map_name, "warzone_quad");
                
                self add_menu_item(menuid, "Hardcore Solo", &func_set_mapgametype, map_name, "warzone_hardcore_solo");
                self add_menu_item(menuid, "Hardcore Duo", &func_set_mapgametype, map_name, "warzone_hardcore_duo");
                self add_menu_item(menuid, "Hardcore Quad", &func_set_mapgametype, map_name, "warzone_hardcore_quad");
            }
        }
        
        if (!isdefined(self.atianconfig.force_blackout_gametype)) {
            self add_menu("mode_wz", "Set gametype", "start_menu", true);

            mode_wz = get_all_modes_wz();
            
            for (i = 0; i < mode_wz.size; i++) {
                self add_menu_item("mode_wz", mode_wz[i], &func_set_gametype, mode_wz[i]);
            }
        }
    } else if (is_multiplayer()) {
        if (!isdefined(self.atianconfig.mp_force_gametype)) {
            self add_menu("mode_mp", "Set gametype", "start_menu", true);

            mode_mp = get_all_modes_mp();
            
            for (i = 0; i < mode_mp.size; i++) {
                self add_menu_item("mode_mp", mode_mp[i], &func_set_gametype, mode_mp[i]);
            }
        }
    } else if (is_zombies()) {
        self add_menu("zm_tools", "Zombies tools", "start_menu", true);


#ifdef _SUPPORTS_LAZYLINK
        if (isdefined(level._custom_perks)) {
            self add_menu("zmperks", "Zombies Perk", "zm_tools", true);
            self add_menu("zmperksmod", "Zombies Perk (Modifier)", "zm_tools", true);
            foreach (key, perk_item in level._custom_perks) {
                if (isdefined(level.var_5355c665) && isdefined(level.var_5355c665[key])) {
                    // basic perk
                    self add_menu_item("zmperks", zm_perk_translate(key), &func_give_zm_perk, key, false);
                } else {
                    self add_menu_item("zmperksmod", zm_perk_translate(key), &func_give_zm_perk, key, true);
                }
            }
        }
        if (isdefined(level.zombie_powerups)) {
            fixup = array("small_ammo");
            self add_menu("zmpowerups", "Powerups", "zm_tools", true);
            foreach (key, pwup_item in level.zombie_powerups) {
                if (isdefined(pwup_item.powerup_name)) {
                    key = pwup_item.powerup_name;
                }
                if (array::contains(fixup, key)) {
                    continue; // fixup
                }
                self add_menu_item("zmpowerups", zm_pwrp_translate(key), &func_zm_pwrp_spawn, key);
            }
        }
#endif

        self add_menu_item("zm_tools", "Open Narrative room", &func_activate_narrative_room);
        self add_menu("dev_ee", "ZM easter eggs", "zm_tools", true, &func_searchee);


        self add_menu("dev_zmxp", "XP Info", "zm_tools", true);
        
        self add_menu("dev_zmxp_score_info", "Score info", "dev_zmxp", true, &func_array_explorer, level.scoreinfo);
        
        bundles = array("zm_base_difficulty", "zm_base_difficulty_zstandard");
        foreach (bundle_str in bundles) {
            bundle = getscriptbundle(bundle_str);

            if (!isdefined(bundle)) {
                continue;
            }

            menuid = "dev_zmxp_" + bundle_str;

            self add_menu(menuid, bundle_str, "dev_zmxp", true);

            self add_menu(menuid + "E", "Easy", menuid, true);
            self add_menu(menuid + "N", "Normal", menuid, true);
            self add_menu(menuid + "H", "Hard", menuid, true);
            self add_menu(menuid + "I", "Insane", menuid, true);

            self add_menu_item(menuid + "E", "zomMoveSpeedMult: " + get_object_type(bundle.zomMoveSpeedMult_E));
            self add_menu_item(menuid + "E", "zomBaseHealth: " + get_object_type(bundle.zomBaseHealth_E));
            self add_menu_item(menuid + "E", "zomHealthIncrease: " + get_object_type(bundle.zomHealthIncrease_E));
            self add_menu_item(menuid + "E", "zomHealthIncreaseMult: " + get_object_type(bundle.zomHealthIncreaseMult_E));
            self add_menu_item(menuid + "E", "zomSpawnDelay: " + get_object_type(bundle.zomSpawnDelay_E));
            self add_menu_item(menuid + "E", "zomNewRunnerInt: " + get_object_type(bundle.zomNewRunnerInt_E));
            self add_menu_item(menuid + "E", "zomMaxCount: " + get_object_type(bundle.zomMaxCount_E));
            self add_menu_item(menuid + "E", "zomMaxCountPerPlayer: " + get_object_type(bundle.zomMaxCountPerPlayer_E));
            self add_menu_item(menuid + "E", "zomCountScalar: " + get_object_type(bundle.zomCountScalar_E));
            self add_menu_item(menuid + "E", "zomCountSoloMult: " + get_object_type(bundle.zomCountSoloMult_E));
            self add_menu_item(menuid + "E", "zomPointScalar: " + get_object_type(bundle.zomPointScalar_E));
            self add_menu_item(menuid + "E", "plyBaseHealth: " + get_object_type(bundle.plyBaseHealth_E));
            self add_menu_item(menuid + "E", "plyPenaltyNoRevive: " + get_object_type(bundle.plyPenaltyNoRevive_E));
            self add_menu_item(menuid + "E", "plyPenaltyDeath: " + get_object_type(bundle.plyPenaltyDeath_E));
            self add_menu_item(menuid + "E", "plyPenaltyDowned: " + get_object_type(bundle.plyPenaltyDowned_E));
            self add_menu_item(menuid + "E", "plyPenaltyDownedPointStep: " + get_object_type(bundle.plyPenaltyDownedPointStep_E));
            self add_menu_item(menuid + "E", "plySelfReviveCountCoop: " + get_object_type(bundle.plySelfReviveCountCoop_E));
            self add_menu_item(menuid + "E", "plySelfReviveCountSolo: " + get_object_type(bundle.plySelfReviveCountSolo_E));
            self add_menu_item(menuid + "E", "zomMixedStart: " + get_object_type(bundle.zomMixedStart_E));
            self add_menu_item(menuid + "E", "zomMixedStartSolo: " + get_object_type(bundle.zomMixedStartSolo_E));
            self add_menu_item(menuid + "E", "zomCatalystStart: " + get_object_type(bundle.zomCatalystStart_E));
            self add_menu_item(menuid + "E", "zomCatalystStartSolo: " + get_object_type(bundle.zomCatalystStartSolo_E));
            self add_menu_item(menuid + "E", "zomStokerStart: " + get_object_type(bundle.zomStokerStart_E));
            self add_menu_item(menuid + "E", "zomStokerStartSolo: " + get_object_type(bundle.zomStokerStartSolo_E));
            self add_menu_item(menuid + "E", "plyShieldDamageMult: " + get_object_type(bundle.plyShieldDamageMult_E));
            self add_menu_item(menuid + "E", "plyRetainWeapons: " + get_object_type(bundle.plyRetainWeapons_E));
            self add_menu_item(menuid + "E", "plyPerksDecay: " + get_object_type(bundle.plyPerksDecay_E));
            self add_menu_item(menuid + "E", "plyHealthRegenRate: " + get_object_type(bundle.plyHealthRegenRate_E));
            self add_menu_item(menuid + "E", "plyHealthRegenDelay: " + get_object_type(bundle.plyHealthRegenDelay_E));
            self add_menu_item(menuid + "E", "plyXPModfier: " + get_object_type(bundle.plyXPModfier_E));
            self add_menu_item(menuid + "E", "plyHighlightCraftables: " + get_object_type(bundle.plyHighlightCraftables_E));
            self add_menu_item(menuid + "N", "zomMoveSpeedMult: " + get_object_type(bundle.zomMoveSpeedMult_N));
            self add_menu_item(menuid + "N", "zomBaseHealth: " + get_object_type(bundle.zomBaseHealth_N));
            self add_menu_item(menuid + "N", "zomHealthIncrease: " + get_object_type(bundle.zomHealthIncrease_N));
            self add_menu_item(menuid + "N", "zomHealthIncreaseMult: " + get_object_type(bundle.zomHealthIncreaseMult_N));
            self add_menu_item(menuid + "N", "zomSpawnDelay: " + get_object_type(bundle.zomSpawnDelay_N));
            self add_menu_item(menuid + "N", "zomNewRunnerInt: " + get_object_type(bundle.zomNewRunnerInt_N));
            self add_menu_item(menuid + "N", "zomMaxCount: " + get_object_type(bundle.zomMaxCount_N));
            self add_menu_item(menuid + "N", "zomMaxCountPerPlayer: " + get_object_type(bundle.zomMaxCountPerPlayer_N));
            self add_menu_item(menuid + "N", "zomCountScalar: " + get_object_type(bundle.zomCountScalar_N));
            self add_menu_item(menuid + "N", "zomCountSoloMult: " + get_object_type(bundle.zomCountSoloMult_N));
            self add_menu_item(menuid + "N", "zomPointScalar: " + get_object_type(bundle.zomPointScalar_N));
            self add_menu_item(menuid + "N", "plyBaseHealth: " + get_object_type(bundle.plyBaseHealth_N));
            self add_menu_item(menuid + "N", "plyPenaltyNoRevive: " + get_object_type(bundle.plyPenaltyNoRevive_N));
            self add_menu_item(menuid + "N", "plyPenaltyDeath: " + get_object_type(bundle.plyPenaltyDeath_N));
            self add_menu_item(menuid + "N", "plyPenaltyDowned: " + get_object_type(bundle.plyPenaltyDowned_N));
            self add_menu_item(menuid + "N", "plyPenaltyDownedPointStep: " + get_object_type(bundle.plyPenaltyDownedPointStep_N));
            self add_menu_item(menuid + "N", "plySelfReviveCountCoop: " + get_object_type(bundle.plySelfReviveCountCoop_N));
            self add_menu_item(menuid + "N", "plySelfReviveCountSolo: " + get_object_type(bundle.plySelfReviveCountSolo_N));
            self add_menu_item(menuid + "N", "zomMixedStart: " + get_object_type(bundle.zomMixedStart_N));
            self add_menu_item(menuid + "N", "zomMixedStartSolo: " + get_object_type(bundle.zomMixedStartSolo_N));
            self add_menu_item(menuid + "N", "zomCatalystStart: " + get_object_type(bundle.zomCatalystStart_N));
            self add_menu_item(menuid + "N", "zomCatalystStartSolo: " + get_object_type(bundle.zomCatalystStartSolo_N));
            self add_menu_item(menuid + "N", "zomStokerStart: " + get_object_type(bundle.zomStokerStart_N));
            self add_menu_item(menuid + "N", "zomStokerStartSolo: " + get_object_type(bundle.zomStokerStartSolo_N));
            self add_menu_item(menuid + "N", "plyShieldDamageMult: " + get_object_type(bundle.plyShieldDamageMult_N));
            self add_menu_item(menuid + "N", "plyRetainWeapons: " + get_object_type(bundle.plyRetainWeapons_N));
            self add_menu_item(menuid + "N", "plyPerksDecay: " + get_object_type(bundle.plyPerksDecay_N));
            self add_menu_item(menuid + "N", "plyHealthRegenRate: " + get_object_type(bundle.plyHealthRegenRate_N));
            self add_menu_item(menuid + "N", "plyHealthRegenDelay: " + get_object_type(bundle.plyHealthRegenDelay_N));
            self add_menu_item(menuid + "N", "plyXPModfier: " + get_object_type(bundle.plyXPModfier_N));
            self add_menu_item(menuid + "N", "plyHighlightCraftables: " + get_object_type(bundle.plyHighlightCraftables_N));
            self add_menu_item(menuid + "H", "zomMoveSpeedMult: " + get_object_type(bundle.zomMoveSpeedMult_H));
            self add_menu_item(menuid + "H", "zomBaseHealth: " + get_object_type(bundle.zomBaseHealth_H));
            self add_menu_item(menuid + "H", "zomHealthIncrease: " + get_object_type(bundle.zomHealthIncrease_H));
            self add_menu_item(menuid + "H", "zomHealthIncreaseMult: " + get_object_type(bundle.zomHealthIncreaseMult_H));
            self add_menu_item(menuid + "H", "zomSpawnDelay: " + get_object_type(bundle.zomSpawnDelay_H));
            self add_menu_item(menuid + "H", "zomNewRunnerInt: " + get_object_type(bundle.zomNewRunnerInt_H));
            self add_menu_item(menuid + "H", "zomMaxCount: " + get_object_type(bundle.zomMaxCount_H));
            self add_menu_item(menuid + "H", "zomMaxCountPerPlayer: " + get_object_type(bundle.zomMaxCountPerPlayer_H));
            self add_menu_item(menuid + "H", "zomCountScalar: " + get_object_type(bundle.zomCountScalar_H));
            self add_menu_item(menuid + "H", "zomCountSoloMult: " + get_object_type(bundle.zomCountSoloMult_H));
            self add_menu_item(menuid + "H", "zomPointScalar: " + get_object_type(bundle.zomPointScalar_H));
            self add_menu_item(menuid + "H", "plyBaseHealth: " + get_object_type(bundle.plyBaseHealth_H));
            self add_menu_item(menuid + "H", "plyPenaltyNoRevive: " + get_object_type(bundle.plyPenaltyNoRevive_H));
            self add_menu_item(menuid + "H", "plyPenaltyDeath: " + get_object_type(bundle.plyPenaltyDeath_H));
            self add_menu_item(menuid + "H", "plyPenaltyDowned: " + get_object_type(bundle.plyPenaltyDowned_H));
            self add_menu_item(menuid + "H", "plyPenaltyDownedPointStep: " + get_object_type(bundle.plyPenaltyDownedPointStep_H));
            self add_menu_item(menuid + "H", "plySelfReviveCountCoop: " + get_object_type(bundle.plySelfReviveCountCoop_H));
            self add_menu_item(menuid + "H", "plySelfReviveCountSolo: " + get_object_type(bundle.plySelfReviveCountSolo_H));
            self add_menu_item(menuid + "H", "zomMixedStart: " + get_object_type(bundle.zomMixedStart_H));
            self add_menu_item(menuid + "H", "zomMixedStartSolo: " + get_object_type(bundle.zomMixedStartSolo_H));
            self add_menu_item(menuid + "H", "zomCatalystStart: " + get_object_type(bundle.zomCatalystStart_H));
            self add_menu_item(menuid + "H", "zomCatalystStartSolo: " + get_object_type(bundle.zomCatalystStartSolo_H));
            self add_menu_item(menuid + "H", "zomStokerStart: " + get_object_type(bundle.zomStokerStart_H));
            self add_menu_item(menuid + "H", "zomStokerStartSolo: " + get_object_type(bundle.zomStokerStartSolo_H));
            self add_menu_item(menuid + "H", "plyShieldDamageMult: " + get_object_type(bundle.plyShieldDamageMult_H));
            self add_menu_item(menuid + "H", "plyRetainWeapons: " + get_object_type(bundle.plyRetainWeapons_H));
            self add_menu_item(menuid + "H", "plyPerksDecay: " + get_object_type(bundle.plyPerksDecay_H));
            self add_menu_item(menuid + "H", "plyHealthRegenRate: " + get_object_type(bundle.plyHealthRegenRate_H));
            self add_menu_item(menuid + "H", "plyHealthRegenDelay: " + get_object_type(bundle.plyHealthRegenDelay_H));
            self add_menu_item(menuid + "H", "plyXPModfier: " + get_object_type(bundle.plyXPModfier_H));
            self add_menu_item(menuid + "H", "plyHighlightCraftables: " + get_object_type(bundle.plyHighlightCraftables_H));
            self add_menu_item(menuid + "I", "zomMoveSpeedMult: " + get_object_type(bundle.zomMoveSpeedMult_I));
            self add_menu_item(menuid + "I", "zomBaseHealth: " + get_object_type(bundle.zomBaseHealth_I));
            self add_menu_item(menuid + "I", "zomHealthIncrease: " + get_object_type(bundle.zomHealthIncrease_I));
            self add_menu_item(menuid + "I", "zomHealthIncreaseMult: " + get_object_type(bundle.zomHealthIncreaseMult_I));
            self add_menu_item(menuid + "I", "zomSpawnDelay: " + get_object_type(bundle.zomSpawnDelay_I));
            self add_menu_item(menuid + "I", "zomNewRunnerInt: " + get_object_type(bundle.zomNewRunnerInt_I));
            self add_menu_item(menuid + "I", "zomMaxCount: " + get_object_type(bundle.zomMaxCount_I));
            self add_menu_item(menuid + "I", "zomMaxCountPerPlayer: " + get_object_type(bundle.zomMaxCountPerPlayer_I));
            self add_menu_item(menuid + "I", "zomCountScalar: " + get_object_type(bundle.zomCountScalar_I));
            self add_menu_item(menuid + "I", "zomCountSoloMult: " + get_object_type(bundle.zomCountSoloMult_I));
            self add_menu_item(menuid + "I", "zomPointScalar: " + get_object_type(bundle.zomPointScalar_I));
            self add_menu_item(menuid + "I", "plyBaseHealth: " + get_object_type(bundle.plyBaseHealth_I));
            self add_menu_item(menuid + "I", "plyPenaltyNoRevive: " + get_object_type(bundle.plyPenaltyNoRevive_I));
            self add_menu_item(menuid + "I", "plyPenaltyDeath: " + get_object_type(bundle.plyPenaltyDeath_I));
            self add_menu_item(menuid + "I", "plyPenaltyDowned: " + get_object_type(bundle.plyPenaltyDowned_I));
            self add_menu_item(menuid + "I", "plyPenaltyDownedPointStep: " + get_object_type(bundle.plyPenaltyDownedPointStep_I));
            self add_menu_item(menuid + "I", "plySelfReviveCountCoop: " + get_object_type(bundle.plySelfReviveCountCoop_I));
            self add_menu_item(menuid + "I", "plySelfReviveCountSolo: " + get_object_type(bundle.plySelfReviveCountSolo_I));
            self add_menu_item(menuid + "I", "zomMixedStart: " + get_object_type(bundle.zomMixedStart_I));
            self add_menu_item(menuid + "I", "zomMixedStartSolo: " + get_object_type(bundle.zomMixedStartSolo_I));
            self add_menu_item(menuid + "I", "zomCatalystStart: " + get_object_type(bundle.zomCatalystStart_I));
            self add_menu_item(menuid + "I", "zomCatalystStartSolo: " + get_object_type(bundle.zomCatalystStartSolo_I));
            self add_menu_item(menuid + "I", "zomStokerStart: " + get_object_type(bundle.zomStokerStart_I));
            self add_menu_item(menuid + "I", "zomStokerStartSolo: " + get_object_type(bundle.zomStokerStartSolo_I));
            self add_menu_item(menuid + "I", "plyShieldDamageMult: " + get_object_type(bundle.plyShieldDamageMult_I));
            self add_menu_item(menuid + "I", "plyRetainWeapons: " + get_object_type(bundle.plyRetainWeapons_I));
            self add_menu_item(menuid + "I", "plyPerksDecay: " + get_object_type(bundle.plyPerksDecay_I));
            self add_menu_item(menuid + "I", "plyHealthRegenRate: " + get_object_type(bundle.plyHealthRegenRate_I));
            self add_menu_item(menuid + "I", "plyHealthRegenDelay: " + get_object_type(bundle.plyHealthRegenDelay_I));
            self add_menu_item(menuid + "I", "plyXPModfier: " + get_object_type(bundle.plyXPModfier_I));
            self add_menu_item(menuid + "I", "plyHighlightCraftables: " + get_object_type(bundle.plyHighlightCraftables_I));
        }
    }
    
    if (can_spawn_vehicle()) {
        self add_menu("vehicle_wz", "Spawn vehicle", "start_menu", true);

        foreach (key, veh_item in get_vehicles_enum_data().vehicles) {
            self add_menu_item("vehicle_wz", veh_item.title, &func_spawn_vehicle, veh_item.name);
        }

        self add_menu_item("vehicle_wz", "Enter vehicle", &func_enter_vehicle);
    }

    if (!(is_warzone() && isdefined(self.atianconfig.force_blackout_map)) && !(is_multiplayer() && isdefined(self.atianconfig.mp_force_map))) {
        map_data = get_maps_data_for_mode();

        if (isdefined(map_data)) {
            self add_menu("map_menu", "Set map " + map_data.title, "start_menu", true);
            foreach(map_info in map_data.items) {
                if (!map_info.playable) {
                    if (!is_dev_mode()) {
                        continue; // can't load this map
                    }
                    suffix = " (unp)";
                } else {
                    suffix = "";
                }
                if (level.script == map_info.name) {
                    self add_menu_item("map_menu", map_info.title + suffix + " (current)");
                } else {
                    self add_menu_item("map_menu", map_info.title + suffix, &func_set_map, map_info.name);
                }
            }
        }
    }
    self add_menu("random", "Random", "start_menu", true);

    self add_menu_item_modswitch("random", "YOU SPIN ME...", "spin_me");
    self add_menu_item("random", "Randomise me", &func_randomise_player);
    
    if (!(is_warzone() && !is_dev_mode())) {
        // don't add bot in wz, it's useless
        self add_menu("random_bot", "Bot tool", "random", true);
        self add_menu("random_bot_teleport", "Teleport to bot", "random_bot", true, &func_bot_search, #"teleport");
        self add_menu_item("random_bot", "Add bot", &func_spawn_add_bot, false);
        self add_menu_item("random_bot", "Add bot (look)", &func_spawn_add_bot, true);
        self add_menu_item("random_bot", "Add bot (max)", &func_spawn_add_bot, false, true);
        self add_menu_item("random_bot", "Remove bot", &func_spawn_remove_bot);
        self add_menu("random_bot_remove", "Remove bot (list)", "random_bot", true, &func_bot_search, #"remove");
        self add_menu_item("random_bot", "Remove bot (all)", &func_spawn_remove_bot, true);
        if (is_multiplayer()) {
            self add_menu("random_bot_killstreak", "Use scorestreaks", "random_bot", true, &func_bot_useks_search);
        }
    }

    if (is_zombies() || is_warzone()) {
        quacknarok_menu_item = self add_menu_item("random", "Quacknarok", &func_set_quacknarok);
        
        if (!isdefined(quacknarok_menu_item)) {
            self func_set_quacknarok(quacknarok_menu_item, true);
        }
    }
    if (is_warzone() || is_ct()) {
        self add_menu("zombies_eyes", "Zombies eyes", "random", true);
        self add_menu_item("zombies_eyes", "Clear", &func_wz_set_zombies_eyes_color, #"clear");
        self add_menu_item("zombies_eyes", "Blue", &func_wz_set_zombies_eyes_color, #"blue");
        self add_menu_item("zombies_eyes", "Green", &func_wz_set_zombies_eyes_color, #"green");
        self add_menu_item("zombies_eyes", "Red", &func_wz_set_zombies_eyes_color, #"red");
        self add_menu_item("zombies_eyes", "Random", &func_wz_set_zombies_eyes_color, #"random");
    }
    

    // ---- Camos ----
    self add_menu("camos", "Camos", "start_menu", true);

    camo_data = get_camo_enum_data();
    
    foreach(category_key, cat_item in camo_data.categories) {
        cat_menu_id = "camos_" + cat_item.id;
        self add_menu(cat_menu_id, cat_item.name, "camos", true);

        for (i = 0; i < cat_item.camos.size; i++) {
            camo_item = cat_item.camos[i];

            if (camo_item.category != cat_item.id) {
                continue;
            }

            self add_menu_item(cat_menu_id, camo_item.title, &func_set_camo, camo_item.id);
        }
    }

    // ---- Mastercrafts ----
    self add_menu("mastercrafts", "Mastercrafts", "start_menu", true);
    self add_menu_item("mastercrafts", "Random", &func_give_random_mastercraft);
    if (is_zombies()) {
        self add_menu_item("mastercrafts", "Random (Upgraded)", &func_give_random_mastercraft, true);
    }

    mastercraft_data = get_mastercraft_enum_data();
    
    foreach(mastercraft_key, mastercraft_item in mastercraft_data.all) {
        lookup = hash_lookup(mastercraft_item.name);
        
        mc_menu_id = "mastercrafts_" + lookup;
        self add_menu(mc_menu_id, lookup, "mastercrafts", true);

        for (i = 0; i < mastercraft_item.variants.size; i++) {
            variant_item = mastercraft_item.variants[i];

            self add_menu_item(mc_menu_id, variant_item.name, &func_give_weapon, mastercraft_item.name, variant_item.id);
        }
        if (is_zombies()) {
            mc_menu_id = "mastercrafts_" + lookup + "_upgraded";
            self add_menu(mc_menu_id, lookup + " (upgraded)", "mastercrafts", true);

            for (i = 0; i < mastercraft_item.variants.size; i++) {
                variant_item = mastercraft_item.variants[i];

                self add_menu_item(mc_menu_id, variant_item.name, &func_give_weapon, mastercraft_item.name, variant_item.id, true);
            }
        }
    }

    // ---- Camos/By id ----
    self add_menu("camos_id", "By id", "camos", true);

    for (i = 0; i < 512; i++) {
        self add_menu_item("camos_id", "Id " + i, &func_set_camo, i);
    }

    // ---- Reticles ----
    self add_menu("reticles", "Reticles", "start_menu", true);
    
    // ---- Reticles/By id ----
    self add_menu("reticles_id", "Reticles Id", "reticles", true);
    
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

    // ---- Characters ----
    self add_menu("characters", "Characters", "start_menu", true);

    // ---- Skin custom ----
    self add_menu("skin_custom_default", "Skins", "start_menu", true);
    self add_menu_item("skin_custom_default", "Set custom skin", &func_set_random_skin);


    self add_menu("skin_custom", "Skin custom", "start_menu", true);

    skin_data = get_skin_enum_data();
    foreach(character_id, char_item in skin_data.characters) {
        if (is_warzone()) {
            sid = char_item.wz;
        } else if (is_multiplayer()) {
            sid = char_item.mp;
        } else if (is_zombies()) {
            sid = char_item.zm;
        } 
        if (sid == 0 && !char_item.invisible) continue;

        self add_menu_item("characters", char_item.id, &func_set_char, sid);

        if (char_item.skins.size == 0) {
            continue; // no sknown skin for this character
        }

        char_menu_id = "characters_skin_" + sid;
        self add_menu(char_menu_id, char_item.id, "skin_custom_default", true);

        self add_menu_item(char_menu_id, "Default", &func_set_skin, sid, 0, 0);

        for (i = 0; i < char_item.skins.size; i++) {
            skin_item = char_item.skins[i];
            self add_menu_item(char_menu_id, skin_item.title, &func_set_skin, sid, skin_item.skin, skin_item.palette);
        }
    }
    
    self add_menu_item("skin_custom", "Clear", &func_set_skin_custom_clear);

    // ---- Skin custom/Skin ----
    self add_menu("skin_custom_skin", "Skin", "skin_custom", true);
    self add_menu_item("skin_custom_skin", "Default", &func_set_skin_custom, 0);
    
    for (i = 1; i < 100; i++) {
        self add_menu_item("skin_custom_skin", "Skin " + i, &func_set_skin_custom, i);
    }

    // ---- Skin custom/Palette ----
    self add_menu("skin_custom_palette", "Palette", "skin_custom", true);
    self add_menu_item("skin_custom_palette", "Default", &func_set_skin_custom_palette, 0);
    
    for (i = 1; i < 100; i++) {
        self add_menu_item("skin_custom_palette", "Skin " + i, &func_set_skin_custom_palette, i);
    }

    // ---- Skin custom/Decal ----
    self add_menu("skin_custom_decal", "Decal", "skin_custom", true);
    self add_menu_item("skin_custom_decal", "Default", &func_set_skin_custom_decal, 0);
    
    for (i = 1; i < 100; i++) {
        self add_menu_item("skin_custom_decal", "Skin " + i, &func_set_skin_custom_decal, i);
    }

    // ---- Skin custom/Warpaint ----
    self add_menu("skin_custom_warpaint", "Warpaint", "skin_custom", true);
    self add_menu_item("skin_custom_warpaint", "Default", &func_set_skin_custom_warpaint, 0);
    
    for (i = 1; i < 100; i++) {
        self add_menu_item("skin_custom_warpaint", "Skin " + i, &func_set_skin_custom_warpaint, i);
    }

    self add_menu("internal", "Internal", "start_menu", true);
    
    self add_menu("dev_csv", "CSV explorer", "internal", true, &func_csv_explorer_tab);
#ifdef ATIAN_COD_TOOL
    self add_menu("dev_csv2", "CSV explorer ACTS", "internal", true, &func_csv_explorer_tab2);
#endif

    // --- Perks ----
    self add_menu("perks", "Perks", "internal", true, &func_search_perks);

    if (is_multiplayer()) {
        self add_menu("dev_gadgets", "Gadgets", "internal", true, &func_searchgadgets);
        self add_menu("dev_killstreak", "Killstreaks", "internal", true, &func_searchkillstreaks);
    }

    if (isdefined(level.atianconfig.loaded_modules_elem)) {
        self add_menu("dev_systems", "Loaded systems", "internal", true);
        self add_menu("dev_systems_ignored", "Ignored systems", "internal", true);
        
        foreach (sys in level.atianconfig.loaded_modules_elem) {
            if (sys.ignore) {
                self add_menu_item("dev_systems_ignored", "" + sys.name);
            } else {
                sysmenudid = "dev_systems_" + sys.name;
                if (isdefined(sys.reqs) && !(isarray(sys.reqs) && sys.reqs.size == 0)) {
                    if (!isarray(sys.reqs)) {
                        reqs = array(sys.reqs);
                    } else {
                        reqs = sys.reqs;
                    }
                    self add_menu(sysmenudid, "" + sys.name + " (" + reqs.size + ")", "dev_systems", true);
                    foreach (req in reqs) {
                        nreq = hash_lookup(req);
                        if (array::contains(level.atianconfig.loaded_modules, nreq)) {
                            suffix = " (loaded)";
                        } else {
                            suffix = " (not loaded)";
                        }
                        self add_menu_item(sysmenudid, "" + nreq + suffix);
                    }
                } else {
                    self add_menu_item("dev_systems", "" + sys.name + " (0)");
                }
            }
        }
    }
}

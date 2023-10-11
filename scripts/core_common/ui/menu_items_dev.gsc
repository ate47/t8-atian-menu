init_menus_dev() {
    if (!is_dev_mode()) {
        return;
    }

    self add_menu_item("tool_menu", "Hide hud", &func_hidehud);

    self add_menu_item_modswitch("tool_weapon", "Physic gun", "physic_gun");

    self add_menu("tool_menu_dev", "Dev tools", "tool_menu", true);
    self add_menu("tool_menu_dev_logs", "Logs", "tool_menu_dev", true, &func_am_log);

    self add_menu("actor_tool", "Actor tool", "start_menu", true);
    
    self add_menu_item("actor_tool", "ST male t1", &func_spawn_actor, "spawner_mp_swat_gunner_team1_male", "swat_gunner");
    self add_menu_item("actor_tool", "ST female t1", &func_spawn_actor, "spawner_mp_swat_gunner_team1_female", "swat_gunner");
    self add_menu_item("actor_tool", "ST male t2", &func_spawn_actor, "spawner_mp_swat_gunner_team2_male", "swat_gunner");
    self add_menu_item("actor_tool", "ST female t2", &func_spawn_actor, "spawner_mp_swat_gunner_team2_female", "swat_gunner");

    self add_menu_item("vehicle_wz", "Enter vehicle", &func_enter_vehicle);

    self add_menu("dev_model_search", "Model search", "tool_menu_dev", true);
    foreach (e in array (
        #"hash_2c0078538e398b4f", "p8_zm_zod_light_morse_lamp"
    )) {
        self add_menu_item("dev_model_search", e, &func_search_model, e);
    }
    //self add_menu_item_modswitch("tool_weapon", "Test ray gun 1", "test_rg1");
    //self add_menu_item_modswitch("tool_weapon", "Test ray gun 2", "test_rg2");
    //self add_menu_item_modswitch("tool_weapon", "Test ray gun 3", "test_rg3");
    
    self add_menu("dev_model", "Test model", "tool_menu_dev", true);

    models = array("p8_fxanim_wz_spd_death_stash_mod", "p8_fxanim_wz_win_death_stash_mod", "p8_fxanim_wz_death_stash_mod");
    foreach (model in models) {
        self add_menu_item("dev_model", "" + model, &func_spawnmodel, model);
    }


#ifdef _SUPPORTS_LAZYLINK
    self add_menu_item("tool_menu_dev", "Enable all zones", &func_zm_zone_open_all);

    if (is_warzone()) {
        self add_menu_item("wz_tools", "Test 1", &func_wz_item_test1, true);
        self add_menu_item("wz_tools", "Test 2", &func_wz_item_test2, true);
        self add_menu_item("wz_tools", "Test 3", &func_wz_item_test3, true);
        self add_menu_item("wz_tools", "Test 4", &func_wz_item_test4, true);
    }
#endif

    
    // works
    //self add_menu_item("tool_menu_dev", "Thread endon 1", &test_thread_endon, true, false);
    //self add_menu_item("tool_menu_dev", "Thread no endon 1", &test_thread_endon, false, false);
    //self add_menu_item("tool_menu_dev", "Thread endon 2", &test_thread_endon, true, true);
    //self add_menu_item("tool_menu_dev", "Thread no endon 2", &test_thread_endon, false, true);
    self add_menu_item("tool_menu_dev", "Dev test 1", &func_dev_method1);
    self add_menu_item("tool_menu_dev", "Dev test 2", &func_dev_method2);
    self add_menu_item("tool_menu_dev", "Dev test 3", &func_dev_method3);
    self add_menu_item("tool_menu_dev", "Dev test 4", &func_dev_method4);
    self add_menu_item("tool_menu_dev", "Crash me", &func_dev_method5);

    spawners = getspawnerarray();

    self add_menu("dev_spawner", "Spawners", "tool_menu_dev", true);
    if (isdefined(spawners) && isarray(spawners) && spawners.size != 0) {
        foreach(spawner_key, spawner_item in spawners) {
            mid = "dev_spawner_" + spawner_key;
            if (isdefined(spawner_item.var_9fde8624)) {
                self add_menu_item("dev_spawner", "" + hash_lookup(spawner_item.var_9fde8624));
            } else {
                self add_menu_item("dev_spawner", "ukn " + spawner_key);
            }
            //self add_menu(mid, "Spawner", "dev_spawner", true);
        }
    } else {
        self add_menu_item("dev_spawner", "No spawner");
    }


    self add_menu("dev_wog", "Group data", "tool_menu_dev", true);

    group_elements = array("camo", "tag", "emblem", "paintjob", "reticle", "lens", "reticle_color");
    foreach (group in group_elements) {
        self add_menu("dev_wog_" + group, group, "dev_wog", true, &func_weaponoption_search, group);
    }

    self add_menu("dev_array_explorer", "Array explorer", "tool_menu_dev", true, &func_array_explorer, &get_array_explorer_values, true);

    self add_menu_item("tool_menu_dev", "reset weapon opts", &func_setweaponoptreset);
    self add_menu("dev_weaponopt3", "Weapon opt 3", "tool_menu_dev", true);
    self add_menu("dev_weaponopt4", "Weapon opt 4", "tool_menu_dev", true);
    self add_menu("dev_weaponopt5", "Weapon opt 5", "tool_menu_dev", true);

    for (i = 0; i < 256; i++) {
        self add_menu_item("dev_weaponopt3", "opt3=" + i, &func_setweaponopt3, i);
        self add_menu_item("dev_weaponopt4", "opt4=" + i, &func_setweaponopt4, i);
        self add_menu_item("dev_weaponopt5", "opt5=" + i, &func_setweaponopt5, i);
    }

    self add_menu("dev_dynent", "Dynent tp", "tool_menu_dev", true);

    dynents = array("zombie_apoc_homunculus", "spring_event_homunculus", "nixie_tube_cage");
    
    self add_menu("dev_dynent_unk_blackout", "Unk blackout", "dev_dynent", true, &func_searchdynent, #"hash_25e69fa10c944661");
    self add_menu("dev_dynent_fishing_rock", "Fishing rock", "dev_dynent", true, &func_searchdynent, "fishing_rock");
    self add_menu("dev_dynent_blackjack", "Stash blackjack", "dev_dynent", true, &func_searchdynent, #"wz_stash_blackjack");
    self add_menu("dev_dynent_spring_event_homunculus", "Spring event homunculus", "dev_dynent", true, &func_searchdynent, "spring_event_homunculus");
    
    for (i = 0; i < dynents.size; i++) {
        self add_menu_item("dev_dynent", "" + dynents[i], &func_dynent_tp, dynents[i]);
    }
    

        
    self add_menu_item("tool_menu_dev", "func_pb_gactive 1", &func_setpbgactivebank, 0);
    self add_menu_item("tool_menu_dev", "func_pb_gactive 2", &func_setpbgactivebank, 1);
    self add_menu_item("tool_menu_dev", "func_pb_gactive 4", &func_setpbgactivebank, 2);
    self add_menu_item("tool_menu_dev", "func_pb_gactive 8", &func_setpbgactivebank, 3);

    self add_menu_item("tool_menu_dev", "Unlock all", &func_unlock_all);

    if (isdefined(level.zombie_weapons)) {
        self add_menu("dev_weapon", "Dev ZM weapon", "tool_menu_dev", true);
        foreach(weapon in level.zombie_weapons) {
            if(isdefined(weapon.weapon.name)) {
                self add_menu_item("dev_weapon", hash_lookup(weapon.weapon.name), &func_give_weapon, weapon.weapon.name);
            }
        }
    }

    self add_menu_item("tool_menu_dev", "All Color (ln)", &func_echo_dev_color);
    self add_menu_item("tool_menu_dev", "All Color (bold)", &func_echobold, "^00 ^11 ^22 ^33 ^44 ^55 ^66 ^77 ^88 ^99 ");

    self add_menu("tool_menu_dev_entities", "Entities", "tool_menu_dev", true, &func_searchentities);
    
    self add_menu("dev_config", "Config", "tool_menu_dev", true);
    
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
    if (isdefined(getgametypesetting(#"wzlootlockers")) && getgametypesetting(#"wzlootlockers")) {
        self add_menu_item("dev_config", "spawn blackjack stash");
    }

/*
    if (is_warzone()) {
        self add_menu("dev_spawnlist", "Spawn list", "tool_menu_dev", true);
        spawnlist_types = array();
        spawnlist = struct::get_array("scriptbundle_itemspawnlist", "classname");
        if (!isdefined(spawnlist)) {
            self add_menu_item("dev_spawnlist", "no spawnlist");
        } else {
            foreach(group in spawnlist) {
                if(!isdefined(group.target) || !isdefined(group.var_b91441dd) || !isdefined(group.var_b91441dd.itemlist)) {
                    continue;
                }

                itemlist = group.var_b91441dd.itemlist;
                for (row = 0; row < itemlist.size; row++) {
                    item_name = group.var_b91441dd.itemlist[row].var_a6762160;
                    if(isdefined(item_name) && isdefined(level.var_4afb8f5a) && isdefined(level.var_4afb8f5a[item_name])) {
                        item_name = level.var_4afb8f5a[item_name];
                    }
                    if(!isdefined(item_name) || item_name == "") {
                        return;
                    }
                    item_bundle = getscriptbundle(item_name);
                    
                    if(!isdefined(item_bundle) || !isdefined(item_bundle.itemtype) || item_bundle.itemtype == #"blank") {
                        return;
                    }
                    menu_type = spawnlist_types[item_bundle.itemtype];
                    if (!isdefined(menu_type)) {
                        menu_type = "dev_spawnlist_" + item_bundle.itemtype;
                        spawnlist_types[item_bundle.itemtype] = menu_type;
                        self add_menu(menu_type, hash_lookup(item_bundle.itemtype), "dev_spawnlist", true);
                    }
                    
                    if (item_bundle.itemtype == #"vehicle") {
                        self add_menu_item(menu_type, hash_lookup(item_bundle.vehicle), &func_spawn_vehicle, item_bundle.vehicle);
                    } else if (item_bundle.itemtype == #"weapon") {
                        if (isdefined(item_bundle.name)) {
                            if (isdefined(isweapon(item_bundle.weapon))) {
                                self add_menu_item(menu_type, hash_lookup(item_bundle.name), &func_give_weapon, item_bundle.weapon);
                            } else if (isdefined(isweapon(item_bundle.weapon.weapon))) {
                                self add_menu_item(menu_type, hash_lookup(item_bundle.name), &func_give_weapon, item_bundle.weapon.weapon);
                            } else {
                                self add_menu_item(menu_type, hash_lookup(item_bundle.name));
                            }
                        } else {
                            self add_menu_item(menu_type, "unknown");
                        }
                    } else if (isdefined(item_bundle.name)) {
                        self add_menu_item(menu_type, hash_lookup(item_bundle.name));
                    } else {
                        self add_menu_item(menu_type, "unknown");
                    }
                }
            }
        }
    }
*/
}

function init_menus() {
    self add_menu("tool_menu", "Tools", "start_menu", true);
    self add_menu_item_modswitch("tool_menu", "Fly", "fly");
    self add_menu_item_modswitch("tool_menu", "Ammos", "maxammo");
    
    self add_menu_item("tool_menu", "Invulnerability", &func_invulnerability);
    self add_menu_item("tool_menu", "No hud", &func_toggle_hud);
    self add_menu_item("tool_menu", "Camera mode", &func_show_hud);

    if (is_zombies()) {
        self add_menu("tool_zm", "Zombies", "start_menu", true);
        self add_menu_item("tool_zm", "Ignore me", &func_zmignoreme);
        self add_menu_item_modswitch("tool_zm", "Max Points", "maxpoints");

        self add_menu_item("tool_zm", "Kill all zombies", &func_kill_zombies);
        self add_menu_item("tool_zm", "Kill all zombies (Loop)", &func_kill_zombies, true);

        self add_menu("zombies_speed", "Zombies speed", "tool_zm", true);

        self add_menu_item("zombies_speed", "Default", &func_zombies_speed);
        self add_menu_item("zombies_speed", "Walk", &func_zombies_speed, "walk");
        self add_menu_item("zombies_speed", "Run", &func_zombies_speed, "run");
        self add_menu_item("zombies_speed", "Sprint", &func_zombies_speed, "sprint");
        self add_menu_item("zombies_speed", "Super sprint", &func_zombies_speed, "super_sprint");
        
        self add_menu_item("tool_zm", "Open doors", &func_zombie_open_sesame);
    }

    self add_menu("tool_weapon", "Guns", "start_menu", true);

    self add_menu_item("tool_weapon", "Take weapon", &func_drop);

    self add_menu("weapon_menu", "Weapons", "start_menu", true);
    self add_menu_item("weapon_menu", "ar_accurate_t9", &func_give_weapon, #"ar_accurate_t9");
    self add_menu_item("weapon_menu", "ar_british_t9", &func_give_weapon, #"ar_british_t9");
    self add_menu_item("weapon_menu", "ar_damage_t9", &func_give_weapon, #"ar_damage_t9");
    self add_menu_item("weapon_menu", "ar_fastfire_t9", &func_give_weapon, #"ar_fastfire_t9");
    self add_menu_item("weapon_menu", "ar_fasthandling_t9", &func_give_weapon, #"ar_fasthandling_t9");
    self add_menu_item("weapon_menu", "ar_mobility_t9", &func_give_weapon, #"ar_mobility_t9");
    self add_menu_item("weapon_menu", "ar_season6_t9", &func_give_weapon, #"ar_season6_t9");
    self add_menu_item("weapon_menu", "ar_slowfire_t9", &func_give_weapon, #"ar_slowfire_t9");
    self add_menu_item("weapon_menu", "ar_slowhandling_t9", &func_give_weapon, #"ar_slowhandling_t9");
    self add_menu_item("weapon_menu", "ar_standard_t9", &func_give_weapon, #"ar_standard_t9");
    self add_menu_item("weapon_menu", "chopper_gunner", &func_give_weapon, #"chopper_gunner");
    self add_menu_item("weapon_menu", "hero_annihilator", &func_give_weapon, #"hero_annihilator");
    self add_menu_item("weapon_menu", "hero_flamethrower", &func_give_weapon, #"hero_flamethrower");
    self add_menu_item("weapon_menu", "hero_pineapplegun", &func_give_weapon, #"hero_pineapplegun");
    self add_menu_item("weapon_menu", "knife_loadout_t9", &func_give_weapon, #"knife_loadout_t9");
    self add_menu_item("weapon_menu", "launcher_freefire_t9", &func_give_weapon, #"launcher_freefire_t9");
    self add_menu_item("weapon_menu", "launcher_standard_t9", &func_give_weapon, #"launcher_standard_t9");
    self add_menu_item("weapon_menu", "lmg_accurate_t9", &func_give_weapon, #"lmg_accurate_t9");
    self add_menu_item("weapon_menu", "lmg_fastfire_t9", &func_give_weapon, #"lmg_fastfire_t9");
    self add_menu_item("weapon_menu", "lmg_light_t9", &func_give_weapon, #"lmg_light_t9");
    self add_menu_item("weapon_menu", "lmg_slowfire_t9", &func_give_weapon, #"lmg_slowfire_t9");
    self add_menu_item("weapon_menu", "melee_baseballbat_t9", &func_give_weapon, #"melee_baseballbat_t9");
    self add_menu_item("weapon_menu", "melee_battleaxe_t9", &func_give_weapon, #"melee_battleaxe_t9");
    self add_menu_item("weapon_menu", "melee_cane_t9", &func_give_weapon, #"melee_cane_t9");
    self add_menu_item("weapon_menu", "melee_coldwar_t9_dw", &func_give_weapon, #"melee_coldwar_t9_dw");
    self add_menu_item("weapon_menu", "melee_etool_t9", &func_give_weapon, #"melee_etool_t9");
    self add_menu_item("weapon_menu", "melee_mace_t9", &func_give_weapon, #"melee_mace_t9");
    self add_menu_item("weapon_menu", "melee_machete_t9", &func_give_weapon, #"melee_machete_t9");
    self add_menu_item("weapon_menu", "melee_sai_t9_dw", &func_give_weapon, #"melee_sai_t9_dw");
    self add_menu_item("weapon_menu", "melee_sledgehammer_t9", &func_give_weapon, #"melee_sledgehammer_t9");
    self add_menu_item("weapon_menu", "melee_wakizashi_t9", &func_give_weapon, #"melee_wakizashi_t9");
    self add_menu_item("weapon_menu", "mortar", &func_give_weapon, #"hash_3f33adcbed7f6c86");
    self add_menu_item("weapon_menu", "napalm strike", &func_give_weapon, #"hash_183ddeea72e71f27");
    self add_menu_item("weapon_menu", "pistol_burst_t9_dw", &func_give_weapon, #"pistol_burst_t9_dw");
    self add_menu_item("weapon_menu", "pistol_burst_t9", &func_give_weapon, #"pistol_burst_t9");
    self add_menu_item("weapon_menu", "pistol_fullauto_t9_dw", &func_give_weapon, #"pistol_fullauto_t9_dw");
    self add_menu_item("weapon_menu", "pistol_fullauto_t9", &func_give_weapon, #"pistol_fullauto_t9");
    self add_menu_item("weapon_menu", "pistol_revolver_t9_dw", &func_give_weapon, #"pistol_revolver_t9_dw");
    self add_menu_item("weapon_menu", "pistol_revolver_t9", &func_give_weapon, #"pistol_revolver_t9");
    self add_menu_item("weapon_menu", "pistol_semiauto_t9_dw", &func_give_weapon, #"pistol_semiauto_t9_dw");
    self add_menu_item("weapon_menu", "pistol_semiauto_t9", &func_give_weapon, #"pistol_semiauto_t9");
    self add_menu_item("weapon_menu", "pistol_shotgun_t9_dw", &func_give_weapon, #"pistol_shotgun_t9_dw");
    self add_menu_item("weapon_menu", "pistol_shotgun_t9", &func_give_weapon, #"pistol_shotgun_t9");
    self add_menu_item("weapon_menu", "ray_gun", &func_give_weapon, #"ray_gun");
    self add_menu_item("weapon_menu", "rcxd", &func_give_weapon, #"hash_3c8b385a76cbfe83");
    self add_menu_item("weapon_menu", "remote missile", &func_give_weapon, #"hash_3de3d523512f7cbc");
    self add_menu_item("weapon_menu", "shotgun_fullauto_t9", &func_give_weapon, #"shotgun_fullauto_t9");
    self add_menu_item("weapon_menu", "shotgun_leveraction_t9", &func_give_weapon, #"shotgun_leveraction_t9");
    self add_menu_item("weapon_menu", "shotgun_pump_t9", &func_give_weapon, #"shotgun_pump_t9");
    self add_menu_item("weapon_menu", "shotgun_semiauto_t9", &func_give_weapon, #"shotgun_semiauto_t9");
    self add_menu_item("weapon_menu", "sig_bow_flame", &func_give_weapon, #"sig_bow_flame");
    self add_menu_item("weapon_menu", "sig_lmg", &func_give_weapon, #"sig_lmg");
    self add_menu_item("weapon_menu", "smg_accurate_t9", &func_give_weapon, #"smg_accurate_t9");
    self add_menu_item("weapon_menu", "smg_burst_t9", &func_give_weapon, #"smg_burst_t9");
    self add_menu_item("weapon_menu", "smg_capacity_t9", &func_give_weapon, #"smg_capacity_t9");
    self add_menu_item("weapon_menu", "smg_fastfire_t9", &func_give_weapon, #"smg_fastfire_t9");
    self add_menu_item("weapon_menu", "smg_handling_t9", &func_give_weapon, #"smg_handling_t9");
    self add_menu_item("weapon_menu", "smg_heavy_t9", &func_give_weapon, #"smg_heavy_t9");
    self add_menu_item("weapon_menu", "smg_season6_t9", &func_give_weapon, #"smg_season6_t9");
    self add_menu_item("weapon_menu", "smg_semiauto_t9", &func_give_weapon, #"smg_semiauto_t9");
    self add_menu_item("weapon_menu", "smg_spray_t9", &func_give_weapon, #"smg_spray_t9");
    self add_menu_item("weapon_menu", "smg_standard_t9", &func_give_weapon, #"smg_standard_t9");
    self add_menu_item("weapon_menu", "sniper_accurate_t9", &func_give_weapon, #"sniper_accurate_t9");
    self add_menu_item("weapon_menu", "sniper_cannon_t9", &func_give_weapon, #"sniper_cannon_t9");
    self add_menu_item("weapon_menu", "sniper_powersemi_t9", &func_give_weapon, #"sniper_powersemi_t9");
    self add_menu_item("weapon_menu", "sniper_quickscope_t9", &func_give_weapon, #"sniper_quickscope_t9");
    self add_menu_item("weapon_menu", "sniper_standard_t9", &func_give_weapon, #"sniper_standard_t9");
    self add_menu_item("weapon_menu", "special_ballisticknife_t9_dw", &func_give_weapon, #"special_ballisticknife_t9_dw");
    self add_menu_item("weapon_menu", "special_crossbow_t9", &func_give_weapon, #"special_crossbow_t9");
    self add_menu_item("weapon_menu", "special_grenadelauncher_t9", &func_give_weapon, #"special_grenadelauncher_t9");
    self add_menu_item("weapon_menu", "special_nailgun_t9", &func_give_weapon, #"special_nailgun_t9");
    self add_menu_item("weapon_menu", "tr_damagesemi_t9", &func_give_weapon, #"tr_damagesemi_t9");
    self add_menu_item("weapon_menu", "tr_fastburst_t9", &func_give_weapon, #"tr_fastburst_t9");
    self add_menu_item("weapon_menu", "tr_longburst_t9", &func_give_weapon, #"tr_longburst_t9");
    self add_menu_item("weapon_menu", "tr_powerburst_t9", &func_give_weapon, #"tr_powerburst_t9");
    self add_menu_item("weapon_menu", "tr_precisionsemi_t9", &func_give_weapon, #"tr_precisionsemi_t9");
    self add_menu_item("weapon_menu", "ultimate_turret", &func_give_weapon, #"ultimate_turret");
    self add_menu_item("weapon_menu", "knife_loadout", &func_give_weapon, #"knife_loadout");
    self add_menu_item("weapon_menu", "knife (scream)", &func_give_weapon, #"hash_28fdaa999c8aa3af");
    self add_menu_item("weapon_menu", "knife (infected)", &func_give_weapon, #"hash_3f47e8be065a0dc0");
    if (is_zombies()) {
        self add_menu_item("weapon_menu", "ww_ieu_acid_t9", &func_give_weapon, #"ww_ieu_acid_t9");
        self add_menu_item("weapon_menu", "ww_ieu_electric_t9", &func_give_weapon, #"ww_ieu_electric_t9");
        self add_menu_item("weapon_menu", "ww_ieu_gas_t9", &func_give_weapon, #"ww_ieu_gas_t9");
        self add_menu_item("weapon_menu", "ww_ieu_plasma_t9", &func_give_weapon, #"ww_ieu_plasma_t9");
        self add_menu_item("weapon_menu", "ww_ieu_shockwave_t9", &func_give_weapon, #"ww_ieu_shockwave_t9");
        self add_menu_item("weapon_menu", "ww_ray_rifle_t9", &func_give_weapon, #"ww_ray_rifle_t9");
        self add_menu_item("weapon_menu", "hash_55c23f24d806e3a6", &func_give_weapon, #"hash_55c23f24d806e3a6");
        self add_menu_item("weapon_menu", "hash_7a9d35a0f888b881", &func_give_weapon, #"hash_7a9d35a0f888b881");
        self add_menu_item("weapon_menu", "hash_25ff17bb722aaaf5", &func_give_weapon, #"hash_25ff17bb722aaaf5");
        self add_menu_item("weapon_menu", "hash_6518b25ee10d7f7e", &func_give_weapon, #"hash_6518b25ee10d7f7e");
        self add_menu_item("weapon_menu", "crbr", &func_give_weapon, #"hash_386308ed987052a4");
        self add_menu_item("weapon_menu", "crbr 1", &func_give_weapon, #"hash_131a672d67787b26");
        self add_menu_item("weapon_menu", "crbr 2", &func_give_weapon, #"hash_7bf7797b85b0089c");
        self add_menu_item("weapon_menu", "crbr 3", &func_give_weapon, #"hash_226d0ad69d9efa1");
        self add_menu_item("weapon_menu", "chrysalax (melee)", &func_give_weapon, #"hash_69461751fa492ea4");
        self add_menu_item("weapon_menu", "chrysalax", &func_give_weapon, #"hash_18696150427f2efb");
        self add_menu_item("weapon_menu", "bowie_knife", &func_give_weapon, #"bowie_knife");
    }

    self add_menu("camo_menu", "Camo", "start_menu", true);

    self add_menu("camo_pap", "Pack a Punch", "camo_menu", true);
    self add_menu_item("camo_pap", "Pack a Punch 1", &func_camo, 67);
    self add_menu_item("camo_pap", "Pack a Punch 2", &func_camo, 68);
    self add_menu_item("camo_pap", "Pack a Punch 3", &func_camo, 69);
    self add_menu_item("camo_pap", "Pack a Punch Mauer der Toten 1", &func_camo, 116);
    self add_menu_item("camo_pap", "Pack a Punch Mauer der Toten 2", &func_camo, 117);
    self add_menu_item("camo_pap", "Pack a Punch Mauer der Toten 3", &func_camo, 118);
    self add_menu_item("camo_pap", "Pack a Punch Forsaken 1", &func_camo, 119);
    self add_menu_item("camo_pap", "Pack a Punch Forsaken 2", &func_camo, 120);
    self add_menu_item("camo_pap", "Pack a Punch Forsaken 3", &func_camo, 121);

    self add_menu("camo_master", "Mastery", "camo_menu", true);
    self add_menu_item("camo_master", "Gold", &func_camo, 61);
    self add_menu_item("camo_master", "Diamond", &func_camo, 62);
    self add_menu_item("camo_master", "DM Ultra", &func_camo, 63);
    self add_menu_item("camo_master", "Gold (Zombies)", &func_camo, 64);
    self add_menu_item("camo_master", "Diamond (Zombies)", &func_camo, 65);
    self add_menu_item("camo_master", "Dark Aether", &func_camo, 66);

    self add_menu("camo_byid", "By id", "camo_menu", true);
    for (i = 0; i < 150; i++) {
        self add_menu_item("camo_byid", "Camo " + i, &func_camo, i);
    }

    self add_menu("skin_menu", "Skin", "start_menu", true);
    self add_menu("outfit_menu", "Outfit", "start_menu", true);

    self add_menu_item("skin_menu", "Invisible", &func_skin, 0);
    self add_menu_item("skin_menu", "Adler", &func_skin, 1);
    self add_menu_item("skin_menu", "Portnova", &func_skin, 2);
    self add_menu_item("skin_menu", "Garcia", &func_skin, 3);
    self add_menu_item("skin_menu", "Baker", &func_skin, 4);
    self add_menu_item("skin_menu", "Sims", &func_skin, 5);
    self add_menu_item("skin_menu", "Hunter", &func_skin, 6);
    self add_menu_item("skin_menu", "Vargas", &func_skin, 7);
    self add_menu_item("skin_menu", "Stone", &func_skin, 8);
    self add_menu_item("skin_menu", "Song", &func_skin, 9);
    self add_menu_item("skin_menu", "Powers", &func_skin, 10);
    self add_menu_item("skin_menu", "Baker (2)", &func_skin, 11);
    self add_menu_item("skin_menu", "Zeyna", &func_skin, 12);
    self add_menu_item("skin_menu", "Wolf", &func_skin, 13);
    self add_menu_item("skin_menu", "Beck", &func_skin, 14);
    self add_menu_item("skin_menu", "Knight", &func_skin, 15);
    self add_menu_item("skin_menu", "Antonov", &func_skin, 16);
    self add_menu_item("skin_menu", "Park", &func_skin, 17);
    self add_menu_item("skin_menu", "Stitch", &func_skin, 18);
    self add_menu_item("skin_menu", "Bulldozer", &func_skin, 19);
    self add_menu_item("skin_menu", "CDL", &func_skin, 20);
    self add_menu_item("skin_menu", "CDL", &func_skin, 21);
    self add_menu_item("skin_menu", "Woods", &func_skin, 22);
    self add_menu_item("skin_menu", "Rivas", &func_skin, 23);
    self add_menu_item("skin_menu", "Naga", &func_skin, 24);
    self add_menu_item("skin_menu", "Maxis", &func_skin, 25);
    self add_menu_item("skin_menu", "John Doe (BO4 zombies)", &func_skin, 26);
    self add_menu_item("skin_menu", "Jane Doe (BO4 zombies)", &func_skin, 27);
    self add_menu_item("skin_menu", "Nude (Male)", &func_skin, 28);
    self add_menu_item("skin_menu", "Nude (Female)", &func_skin, 29);
    self add_menu_item("skin_menu", "Wraith", &func_skin, 30);
    self add_menu_item("skin_menu", "Baker (3)", &func_skin, 31);
    self add_menu_item("skin_menu", "Park (2)", &func_skin, 32);
    self add_menu_item("skin_menu", "Price", &func_skin, 33);
    self add_menu_item("skin_menu", "John McClane", &func_skin, 34);
    self add_menu_item("skin_menu", "Rambo", &func_skin, 35);
    self add_menu_item("skin_menu", "Weaver", &func_skin, 36);
    self add_menu_item("skin_menu", "Jackal", &func_skin, 37);
    self add_menu_item("skin_menu", "Salah", &func_skin, 38);
    self add_menu_item("skin_menu", "Kitsune", &func_skin, 39);
    self add_menu_item("skin_menu", "Stryker", &func_skin, 40);
    self add_menu_item("skin_menu", "Arthur Kingsley", &func_skin, 41);
    self add_menu_item("skin_menu", "Hudson", &func_skin, 42);
    self add_menu_item("skin_menu", "Mason", &func_skin, 43);
    self add_menu_item("skin_menu", "Scream", &func_skin, 44);
    self add_menu_item("skin_menu", "Fuze", &func_skin, 45);
    self add_menu_item("skin_menu", "Zombies (Female)", &func_skin, 46);
    self add_menu_item("skin_menu", "Zombies (Male)", &func_skin, 47);
    self add_menu_item("skin_menu", "Lazar", &func_skin, 48);

    for (i = 0; i < 24; i++) {
        self add_menu_item("outfit_menu", "Outfit " + i, &func_outfit, i);
    }

    self add_menu("vehicle", "Vehicle", "start_menu", true);
    self add_menu_item("vehicle", "Enter vehicle", &func_enter_vehicle);
    self add_vehicle_obj("ADAV", #"hash_10e49116dd0a922f");
    self add_vehicle_obj("Amphibious", #"hash_3f0737088e8a4d33");
    self add_vehicle_obj("Anti-Air missiles", #"veh_missile_turret");
    self add_vehicle_obj("Armored vehicle", #"hash_4420cded39673048");
    self add_vehicle_obj("ATV (Red)", #"hash_3efa223f4a0bffcd");
    self add_vehicle_obj("ATV", #"hash_555e089964330582");
    self add_vehicle_obj("Black hawk", #"hash_32fd84f720fa8002");
    self add_vehicle_obj("Black hawk", #"hash_508d62164fdfd53c");
    self add_vehicle_obj("Black hawk", #"hash_56f2823854475ea7");
    self add_vehicle_obj("Black hawk", #"hash_75cd743f7ce45c03");
    self add_vehicle_obj("Black hawk", #"hash_7d913ad3c6e2cf74");
    self add_vehicle_obj("BO3 Helicopter", #"heli_ai_mp");
    self add_vehicle_obj("Boat", #"hash_41ba5d07050a929e");
    self add_vehicle_obj("Care package helicopter", #"vehicle_t9_mil_helicopter_care_package");
    self add_vehicle_obj("Cobra", #"hash_5c374aecf501acfd");
    self add_vehicle_obj("Cobra", #"hash_67f8285741e2ff4b");
    self add_vehicle_obj("Cobra", #"hash_78ca57ecf310bdd3");
    self add_vehicle_obj("Drone squad 2", #"hash_3effd1dd89ee3d36");
    self add_vehicle_obj("Drone squad 3", #"hash_3a28e8bcf12e1d74");
    self add_vehicle_obj("Drone squad", #"hash_444804d03bdda785");
    self add_vehicle_obj("Drop plane", #"vehicle_t9_mil_air_transport_hpc_intro");
    self add_vehicle_obj("fake_vehicle", #"fake_vehicle");
    self add_vehicle_obj("Fav light 2", #"hash_1b33573a29a71bc3");
    self add_vehicle_obj("Fav light", #"vehicle_t9_mil_fav_light");
    self add_vehicle_obj("Gunship", #"veh_t8_ac130_gunship_mp");
    self add_vehicle_obj("hash_cc0da768150d81", #"hash_cc0da768150d81");
    self add_vehicle_obj("Heavy Helicopter", #"veh_t8_helicopter_gunship_mp_guard");
    self add_vehicle_obj("Helicopter", #"hash_17e868e0ebf3c1d6");
    self add_vehicle_obj("Helicopter", #"hash_3557d59a876a018a");
    self add_vehicle_obj("Helicopter", #"hash_3f738a621add7f21");
    self add_vehicle_obj("Helicopter", #"hash_571dc2d4c625d8f8");
    self add_vehicle_obj("Helicopter", #"hash_6595f5efe62a4ec");
    self add_vehicle_obj("Jeep ", #"hash_292ed13d86264e87");
    self add_vehicle_obj("Jeep ", #"hash_3061aec11377f525");
    self add_vehicle_obj("Jeep 2", #"hash_16d38c1f1db587be");
    self add_vehicle_obj("Jeep 2", #"hash_23e5c1239feb3a5f");
    self add_vehicle_obj("Jeep 3", #"hash_29129c862305321f");
    self add_vehicle_obj("Jeep", #"hash_1465fc41ab88939");
    self add_vehicle_obj("Jeep", #"hash_14e36867d3c6ff1");
    self add_vehicle_obj("Jeep", #"hash_19a7610c6357620");
    self add_vehicle_obj("Jeep", #"hash_1bdb534f1e8e23f5");
    self add_vehicle_obj("Jeep", #"hash_38c374bd703a37ce");
    self add_vehicle_obj("Jeep", #"hash_3b8ba30888baf51e");
    self add_vehicle_obj("Jeep", #"hash_61d7c8890f89dc5e");
    self add_vehicle_obj("Jeep", #"hash_7d6a6c54d3f08d43");
    self add_vehicle_obj("Jeep", #"vehicle_t9_mil_ru_truck_light_player");
    self add_vehicle_obj("Large helicopter", #"hash_4209c5ff3b969c7a");
    self add_vehicle_obj("Large transport vehicle", #"hash_4bfd80fe09072db3");
    self add_vehicle_obj("Motorbike 2", #"hash_4eb33555df990431");
    self add_vehicle_obj("Motorbike", #"vehicle_motorcycle_mil_us_offroad");
    self add_vehicle_obj("Mounted Weapon black hawk", #"hash_53c596704f007063");
    self add_vehicle_obj("Mounted Weapon", #"hash_51bbd89d04b94d68");
    self add_vehicle_obj("Napalm strike", #"hash_3d2bbfdb89093d91");
    self add_vehicle_obj("Omega Helicopter", #"hash_669d01ea5db4e10c");
    self add_vehicle_obj("Pickup", #"hash_1598bee2e954e43a");
    self add_vehicle_obj("Pickup", #"hash_653e1d46cd298e05");
    self add_vehicle_obj("Plane", #"hash_1d28a638b43b4117");
    self add_vehicle_obj("Racing RCXD alternative", #"vehicle_t9_rcxd_racing_alt");
    self add_vehicle_obj("Racing RCXD", #"vehicle_t9_rcxd_racing");
    self add_vehicle_obj("RCXD (Zombies)", #"vehicle_t9_rcxd_racing_zm");
    self add_vehicle_obj("RCXD", #"hash_46249425f37afc74");
    self add_vehicle_obj("RCXD", #"hash_6e0d7fd3b29c6580");
    self add_vehicle_obj("RCXD", #"hash_7dd2944ddf7cc7e9");
    self add_vehicle_obj("Requiem Helicopter", #"hash_437293ae239af1ab");
    self add_vehicle_obj("Sedan russian", #"vehicle_t9_civ_ru_sedan_80s_player");
    self add_vehicle_obj("Sedan White", #"hash_27f92469d9c8c8");
    self add_vehicle_obj("Straferun", #"vehicle_straferun_mp");
    self add_vehicle_obj("Tank", #"hash_28d512b739c9d9c1");
    self add_vehicle_obj("Tank", #"hash_6296120b45d0c0b9");
    self add_vehicle_obj("Tank", #"vehicle_t9_mil_ru_tank_t72_sr");
    self add_vehicle_obj("Transport plane", #"vehicle_t8_mil_air_transport_infiltration");
    self add_vehicle_obj("Transport truck", #"hash_1c63d67929319598");
    self add_vehicle_obj("Transport Truck", #"hash_62197ae3451b23c");
    self add_vehicle_obj("Transport truck", #"vehicle_t9_mil_ru_truck_transport_player_obj_sr");
    self add_vehicle_obj("Truck Anti-Aircraft", #"hash_57f7c02f5db425b9");
    self add_vehicle_obj("Truck", #"hash_331dac1d7450a6ed");
    self add_vehicle_obj("Truck", #"hash_3677daa34d36098a");
    self add_vehicle_obj("Truck", #"hash_37c73ce15aabb343");
    self add_vehicle_obj("Truck", #"hash_3cdadb03ee525329");
    self add_vehicle_obj("Truck", #"hash_405ba997da57b6db");
    self add_vehicle_obj("Turret", #"hash_c235ad5cb6323be");
    self add_vehicle_obj("Turret", #"veh_ultimate_turret");
    self add_vehicle_obj("Yuri (Requiem)", #"hash_50b5a1068a7647d3");
    self add_vehicle_obj("Yuri 2", #"hash_631691623ad368bd");
    self add_vehicle_obj("Yuri 3", #"hash_58cc8ce25d32031f");
    self add_vehicle_obj("Yuri", #"veh_t9_mil_us_helicopter_large_chopper_gunner");

    // use acts dbgpcw and check the vehicles to expand the list

    //self add_vehicle_obj("hash_d069dee6a0076c8", #"hash_d069dee6a0076c8");
    //self add_vehicle_obj("hash_d57fa1b1aacffc7", #"hash_d57fa1b1aacffc7");
    //self add_vehicle_obj("veh_ultimate_turret_wz", #"veh_ultimate_turret_wz");
    //self add_vehicle_obj("defaultvehicle_mp", #"defaultvehicle_mp");

    if (is_dev_mode()) {
        self add_menu("dev", "Dev", "start_menu", true);
        self add_menu_item("dev", "test dev 1", &func_dev_1);
        self add_menu_item("dev", "test varargs", &func_testvarargs);
        self add_menu_item("dev", "test unlock all", &func_unlock_all);
    }
}

function add_vehicle_obj(title, vehicule_type) {
    if (!isassetloaded("vehicle", vehicule_type)) {
        return; // vehicle not loaded or already in the enum
    }
    self add_menu_item("vehicle", title, &func_spawn_vehicle, vehicule_type);
}

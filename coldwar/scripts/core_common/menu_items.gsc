init_menus() {
    self add_menu("tool_menu", "Tools", "start_menu", true);
    self add_menu_item_modswitch("tool_menu", "Fly", "fly");
    self add_menu_item_modswitch("tool_menu", "Ammos", "maxammo");
    self add_menu_item("tool_menu", "Ignore me", &func_zmignoreme);
    self add_menu_item_modswitch("tool_menu", "Max Points", "maxpoints");
    self add_menu_item("tool_menu", "Invulnerability", &func_invulnerability);


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
    self add_menu_item("weapon_menu", "ww_ieu_acid_t9", &func_give_weapon, #"ww_ieu_acid_t9");
    self add_menu_item("weapon_menu", "ww_ieu_electric_t9", &func_give_weapon, #"ww_ieu_electric_t9");
    self add_menu_item("weapon_menu", "ww_ieu_gas_t9", &func_give_weapon, #"ww_ieu_gas_t9");
    self add_menu_item("weapon_menu", "ww_ieu_plasma_t9", &func_give_weapon, #"ww_ieu_plasma_t9");
    self add_menu_item("weapon_menu", "ww_ieu_shockwave_t9", &func_give_weapon, #"ww_ieu_shockwave_t9");
    self add_menu_item("weapon_menu", "ww_ray_rifle_t9", &func_give_weapon, #"ww_ray_rifle_t9");
    self add_menu_item("weapon_menu", "hash_55c23f24d806e3a6", &func_give_weapon, #"hash_55c23f24d806e3a6");
    self add_menu_item("weapon_menu", "knife_loadout", &func_give_weapon, #"knife_loadout");
    self add_menu_item("weapon_menu", "knife (scream)", &func_give_weapon, #"hash_28fdaa999c8aa3af");
    self add_menu_item("weapon_menu", "knife (infected)", &func_give_weapon, #"hash_3f47e8be065a0dc0");
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

    self add_menu("camo_menu", "Camo", "start_menu", true);
    for (i = 0; i < 512; i++) {
        self add_menu_item("camo_menu", "camo " + i, &func_camo, i);
    }

    self add_menu("vehicle", "Vehicle", "start_menu", true);
    self add_menu_item("vehicle", "Enter vehicle", &func_enter_vehicle);
    self add_vehicle_obj("ADAV", #"hash_10e49116dd0a922f");
    self add_vehicle_obj("Anti-Air missiles", #"veh_missile_turret");
    self add_vehicle_obj("ATV (Red)", #"hash_3efa223f4a0bffcd");
    self add_vehicle_obj("ATV", #"hash_555e089964330582");
    self add_vehicle_obj("BO3 Helicopter", #"heli_ai_mp");
    self add_vehicle_obj("Care package helicopter", #"vehicle_t9_mil_helicopter_care_package");
    self add_vehicle_obj("Drone squad 2", #"hash_3effd1dd89ee3d36");
    self add_vehicle_obj("Drone squad 3", #"hash_3a28e8bcf12e1d74");
    self add_vehicle_obj("Drone squad", #"hash_444804d03bdda785");
    self add_vehicle_obj("Drop plane", #"vehicle_t9_mil_air_transport_hpc_intro");
    self add_vehicle_obj("fake_vehicle", #"fake_vehicle");
    self add_vehicle_obj("Fav light 2", #"hash_1b33573a29a71bc3");
    self add_vehicle_obj("Fav light", #"vehicle_t9_mil_fav_light");
    self add_vehicle_obj("Gunship", #"veh_t8_ac130_gunship_mp");
    self add_vehicle_obj("Heavy Helicopter", #"veh_t8_helicopter_gunship_mp_guard");
    self add_vehicle_obj("Helicopter", #"hash_3f738a621add7f21");
    self add_vehicle_obj("Helicopter", #"hash_6595f5efe62a4ec");
    self add_vehicle_obj("Jeep", #"hash_7d6a6c54d3f08d43");
    self add_vehicle_obj("Jeep", #"vehicle_t9_mil_ru_truck_light_player");
    self add_vehicle_obj("Large helicopter", #"hash_4209c5ff3b969c7a");
    self add_vehicle_obj("Large transport vehicle", #"hash_4bfd80fe09072db3");
    self add_vehicle_obj("Motorbike 2", #"hash_4eb33555df990431");
    self add_vehicle_obj("Motorbike", #"vehicle_motorcycle_mil_us_offroad");
    self add_vehicle_obj("Napalm strike", #"hash_3d2bbfdb89093d91");
    self add_vehicle_obj("Omega Helicopter", #"hash_669d01ea5db4e10c");
    self add_vehicle_obj("Racing RCXD alternative", #"vehicle_t9_rcxd_racing_alt");
    self add_vehicle_obj("Racing RCXD", #"vehicle_t9_rcxd_racing");
    self add_vehicle_obj("RCXD (Zombies)", #"vehicle_t9_rcxd_racing_zm");
    self add_vehicle_obj("RCXD", #"hash_7dd2944ddf7cc7e9");
    self add_vehicle_obj("Requiem Helicopter", #"hash_437293ae239af1ab");
    self add_vehicle_obj("Sedan russian", #"vehicle_t9_civ_ru_sedan_80s_player");
    self add_vehicle_obj("Sedan White", #"hash_27f92469d9c8c8");
    self add_vehicle_obj("Straferun", #"vehicle_straferun_mp");
    self add_vehicle_obj("Tank", #"hash_28d512b739c9d9c1");
    self add_vehicle_obj("Tank", #"hash_6296120b45d0c0b9");
    self add_vehicle_obj("Tank", #"vehicle_t9_mil_ru_tank_t72_sr");
    self add_vehicle_obj("Transport truck", #"hash_1c63d67929319598");
    self add_vehicle_obj("Transport Truck", #"hash_62197ae3451b23c");
    self add_vehicle_obj("Transport truck", #"vehicle_t9_mil_ru_truck_transport_player_obj_sr");
    self add_vehicle_obj("Turret", #"veh_ultimate_turret");
    self add_vehicle_obj("Yuri (Requiem)", #"hash_50b5a1068a7647d3");
    self add_vehicle_obj("Yuri 2", #"hash_631691623ad368bd");
    self add_vehicle_obj("Yuri 3", #"hash_58cc8ce25d32031f");
    self add_vehicle_obj("Yuri", #"veh_t9_mil_us_helicopter_large_chopper_gunner");

    //self add_vehicle_obj("hash_d069dee6a0076c8", #"hash_d069dee6a0076c8");
    //self add_vehicle_obj("hash_d57fa1b1aacffc7", #"hash_d57fa1b1aacffc7");
    //self add_vehicle_obj("veh_ultimate_turret_wz", #"veh_ultimate_turret_wz");
    //self add_vehicle_obj("defaultvehicle_mp", #"defaultvehicle_mp");

    self add_menu("dev", "Dev", "start_menu", true);
    self add_menu_item("dev", "test dev 1", &func_dev_1);
}

func_set_mapgametype(item, map_name, gametype) {
    self menu_drawing_function("loading map " + map_name + " with mode " + gametype);
    switchmap_preload(map_name, gametype);
    wait(1);
    switchmap_switch();
}

add_vehicle_obj(title, vehicule_type) {
    if (!isassetloaded("vehicle", vehicule_type)) {
        return; // vehicle not loaded or already in the enum
    }
    self add_menu_item("vehicle", title, &func_spawn_vehicle, vehicule_type);
}
func_spawn_vehicle(item, vehicule_type) {

    load = isassetloaded("vehicle", vehicule_type);

    if (!isdefined(load) || !load) {
        self menu_drawing_secondary("^1Asset not loaded");
        return;
    }
    look = self get_look_position();

    veh = spawnvehicle(vehicule_type, look, (0, 0, 0));
    if (!isdefined(veh)) {
        self menu_drawing_secondary("^1bad vehicle");
        return;
    }
    veh makeusable();
    if (isdefined(veh.isphysicsvehicle) && veh.isphysicsvehicle) {
        veh setbrake(1);
    }
    if (isdefined(veh.vehicleclass) && veh.vehicleclass == #"helicopter") {
        veh.origin = veh.origin + (0, 0, veh.height);
        // you spin me
    }
    if (isairborne(veh)) {
        veh setrotorspeed(1.0);
    }
}

func_enter_vehicle(item, slot) {
    trace = self get_look_trace();

    entity = trace[#"entity"];


    if (isdefined(entity) && isvehicle(entity)) {
        entity usevehicle(self, 0);
    } else {
        self menu_drawing_secondary("^1No vehicle found");
    }
}

func_dev_1(item) {
    bundle = getscriptbundle("zombie_vars_settings");

    self iprintln("^1Enabled: ^2" + isdefined(bundle));
    if (isdefined(bundle)) {
        self iprintln("^1Name:    ^2" + (isdefined(bundle.name) ? bundle.name : "undefined"));
    }
}

func_give_weapon(item, weapon_name) {
    weapon = getweapon(ishash(weapon_name) ? weapon_name : hash(weapon_name));
    if (isdefined(weapon)) {
        self giveweapon(weapon);
        self switchtoweapon(weapon);
    } else {
        self menu_drawing_function("unknown weapon " + weapon_name);
    }
    return true;
}

func_zmignoreme(item) {
    if (isdefined(self.tool_zmignoreme) && self.tool_zmignoreme) {
        self.tool_zmignoreme = false;
        self disableinvulnerability();
        self val::set(#"atianmod", "ignoreme", false);
    } else {
        self.tool_zmignoreme = true;
    }
    item.activated = self.tool_zmignoreme;
    return true;
}

func_invulnerability(item) {
    if (isdefined(self.tool_invulnerability) && self.tool_invulnerability) {
        self.tool_invulnerability = false;
        self disableinvulnerability();
        self val::set(#"oob", "disable_oob", false);
    } else {
        self.tool_invulnerability = true;
    }
    item.activated = self.tool_invulnerability;
    return true;
}

func_drop(item) {
    weapon = self getcurrentweapon();
    if (isdefined(weapon) && self hasweapon(weapon)) {
        self takeweapon(weapon);
    }
}

func_camo(item, id) {
    currentweapon = self getcurrentweapon();
    if (isdefined(currentweapon)) {
        self setcamo(currentweapon, id);
    }
}

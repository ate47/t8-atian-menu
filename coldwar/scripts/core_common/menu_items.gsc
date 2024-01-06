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

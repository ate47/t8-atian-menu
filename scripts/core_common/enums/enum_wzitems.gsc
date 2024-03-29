
add_wzitem_info(wz_item_name, wz_item_title, wz_item_category) {
    wz_item_data = {
        #name: wz_item_name,
        #title: wz_item_title,
        #category: wz_item_category
    };

    array::add(self.items, wz_item_data);
    cat = self.categories[wz_item_category];
    if (isdefined(cat)) {
        array::add(cat.items, wz_item_data);
    }
}

add_wzitem_category(category_id, category_title) {
    wz_item_data = {
        #name: category_id,
        #title: category_title,
        #items: array()
    };
    self.categories[category_id] = wz_item_data;
}

get_wzitems_enum_data() {
    if (!isdefined(level.atian_enum_data)) {
        generate_enum_values();
    }
    return level.atian_enum_data.wzitems;
}

generate_wzitems_enum() {
    if (isdefined(self.wzitems)) {
        return;
    }
    wzitems = {
        #items: array(),
        #categories: array()
    };
    self.wzitems = wzitems;

    wzitems add_wzitem_category("weap_ar", "Assault Rifle");
    wzitems add_wzitem_category("weap_smg", "Submachine Gun");
    wzitems add_wzitem_category("weap_lmg", "Light machine gun");
    wzitems add_wzitem_category("weap_tr", "Tactical rifle");
    wzitems add_wzitem_category("weap_pistol", "Pistol");
    wzitems add_wzitem_category("weap_hero", "Hero weapon");
    wzitems add_wzitem_category("weap_melee", "Melee");
    wzitems add_wzitem_category("weap_shotgun", "Shotgun");
    wzitems add_wzitem_category("weap_sniper", "Sniper");
    wzitems add_wzitem_category("weap_special", "Special");
    wzitems add_wzitem_category("weap_ww", "Wonder weapon");
    wzitems add_wzitem_category("perk", "Perk");
    wzitems add_wzitem_category("att", "Attachment");
    wzitems add_wzitem_category("ee", "EE");
    wzitems add_wzitem_category("hw", "Halloween Event");
    wzitems add_wzitem_category("eq", "Equipment");
    wzitems add_wzitem_category("health", "Health");
    wzitems add_wzitem_category("armor", "Armor");
    wzitems add_wzitem_category("ammo", "Ammo");
    wzitems add_wzitem_category("other", "Other");
    wzitems add_wzitem_category("unknown", "Unknown");

    wzitems add_wzitem_info(#"backpack_item", "Backpack", "other");
    wzitems add_wzitem_info(#"resource_item_paint", "Paint cans", "other");
    wzitems add_wzitem_info(#"resource_item_paint_stack_10", "Paint cans (x10)", "other");
    wzitems add_wzitem_info(#"resource_item_loot_locker_key", "Blackjack key", "other");
    wzitems add_wzitem_info(#"flare_gun_wz_item", "Flare gun (Supply)", "other");
    wzitems add_wzitem_info(#"flare_gun_veh_wz_item", "Flare gun (Vehicle)", "other"); // not for wz_escape lol
    wzitems add_wzitem_info(#"wz_ball", "Basketball", "other");
    wzitems add_wzitem_info(#"cash_item_500", "$500", "other");

    wzitems add_wzitem_info(#"acid_bomb_wz_item", "Acid bomb", "eq");
    wzitems add_wzitem_info(#"trip_wire_wz_item", "Trip wire", "eq");
    wzitems add_wzitem_info(#"trophy_system_wz_item", "Trophy system", "eq");
    wzitems add_wzitem_info(#"ultimate_turret_wz_item", "Turret", "eq");
    wzitems add_wzitem_info(#"wraithfire_wz_item", "Wraith fire", "eq");
    wzitems add_wzitem_info(#"hatchet_wz_item", "Tomahawk", "eq");
    wzitems add_wzitem_info(#"tomahawk_t8_wz_item", "Tomahawk (Zombies)", "eq");
    wzitems add_wzitem_info(#"tomahawk_t8_wz_item_pandemic", "Tomahawk (Infected)", "eq");
    wzitems add_wzitem_info(#"hawk_wz_item", "Hawk", "eq");
    wzitems add_wzitem_info(#"homunculus_wz_item", "Homunculus", "eq");
    wzitems add_wzitem_info(#"barricade_wz_item", "Barricade", "eq");
    wzitems add_wzitem_info(#"cluster_semtex_wz_item", "Cluster grenade", "eq");
    wzitems add_wzitem_info(#"concertina_wire_wz_item", "Concertina wire", "eq");
    wzitems add_wzitem_info(#"concussion_wz_item", "Concussion", "eq");
    wzitems add_wzitem_info(#"cymbal_monkey_wz_item", "Monkey", "eq");
    wzitems add_wzitem_info(#"dart_wz_item", "Dart", "eq");
    wzitems add_wzitem_info(#"emp_grenade_wz_item", "Emp grenade", "eq");
    wzitems add_wzitem_info(#"frag_grenade_wz_item", "Frag grenade", "eq");
    wzitems add_wzitem_info(#"grapple_wz_item", "Grapple", "eq");
    wzitems add_wzitem_info(#"molotov_wz_item", "Molotov", "eq");
    wzitems add_wzitem_info(#"recon_car_wz_item", "Recon car", "eq");
    wzitems add_wzitem_info(#"sensor_dart_wz_item", "Sensor dart", "eq");
    wzitems add_wzitem_info(#"smoke_grenade_wz_item", "Smoke grenade", "eq");
    wzitems add_wzitem_info(#"spectre_grenade_wz_item", "Smoke grenade (Spectre)", "eq");
    wzitems add_wzitem_info(#"smoke_grenade_wz_item_spring_holiday", "Smoke grenade (Green)", "eq");
    wzitems add_wzitem_info(#"swat_grenade_wz_item", "9-Bang", "eq");
    wzitems add_wzitem_info(#"wz_waterballoon", "Waterballoon", "eq");
    wzitems add_wzitem_info(#"unlimited_grapple_wz_item", "Grapple (Unlimited)", "eq");

    wzitems add_wzitem_info(#"extbarrel_wz_item", "Long Barrel", "att");
    wzitems add_wzitem_info(#"extmag_wz_item", "Extended Mags", "att");
    wzitems add_wzitem_info(#"fastmag_wz_item", "Fast Mags", "att");
    wzitems add_wzitem_info(#"foregrip_wz_item", "Grip", "att");
    wzitems add_wzitem_info(#"acog_plus_wz_item", "x4", "att");
    wzitems add_wzitem_info(#"reddot_wz_item", "x3", "att");
    wzitems add_wzitem_info(#"acog_wz_item", "x2", "att");
    wzitems add_wzitem_info(#"reflex_wz_item", "Reflex", "att");
    wzitems add_wzitem_info(#"tritium_wz_item", "Elo", "att");
    wzitems add_wzitem_info(#"advmag_wz_item", "Hybrid mag", "att");
    wzitems add_wzitem_info(#"laser_sight_wz_item", "Laser sight", "att");
    wzitems add_wzitem_info(#"holo_wz_item", "Holo", "att");
    wzitems add_wzitem_info(#"stock_wz_item", "Stock", "att");
    wzitems add_wzitem_info(#"suppressor_wz_item", "Suppressor", "att");
    wzitems add_wzitem_info(#"sniperscope_wz_item", "Sniper scope", "att");

    wzitems add_wzitem_info(#"annihilator_wz_item", "Annihilator", "weap_hero");
    wzitems add_wzitem_info(#"sig_blade_wz_item", "Blade", "weap_hero");
    wzitems add_wzitem_info(#"flamethrower_wz_item", "Flamethrower", "weap_hero");
    wzitems add_wzitem_info(#"sparrow_wz_item", "Sparrow", "weap_hero");
    wzitems add_wzitem_info(#"warmachine_wz_item", "War machine", "weap_hero");

    wzitems add_wzitem_info(#"allistairs_folly_t8_item", "Alistair's folly", "weap_ww");
    wzitems add_wzitem_info(#"blundergat_wz_item", "Blundergat", "weap_ww");
    wzitems add_wzitem_info(#"death_of_orion_t8_item", "Death of Orion", "weap_ww");
    wzitems add_wzitem_info(#"ww_crossbow_impaler_t8_item", "Impaler", "weap_ww");
    wzitems add_wzitem_info(#"ray_gun_t8_item", "Ray gun", "weap_ww");
    wzitems add_wzitem_info(#"ray_gun_mk2_t8_item", "Raygun mk2", "weap_ww");
    wzitems add_wzitem_info(#"ray_gun_mk2x_t8_item", "Raygun mk2 X", "weap_ww");
    wzitems add_wzitem_info(#"ray_gun_mk2y_t8_item", "Raygun mk2 Y", "weap_ww");
    wzitems add_wzitem_info(#"ray_gun_mk2z_t8_item", "Raygun mk2 Z", "weap_ww");
    wzitems add_wzitem_info(#"ww_winters_fury_t8_item", "Winter's Howl", "weap_ww");
    
    wzitems add_wzitem_info(#"ammo_type_9mm_item", "9mm", "ammo");
    wzitems add_wzitem_info(#"ammo_type_556_item", "5.56mm", "ammo");
    wzitems add_wzitem_info(#"ammo_type_762_item", "7.62mm", "ammo");
    wzitems add_wzitem_info(#"ammo_type_12ga_item", "Cal .12", "ammo");
    wzitems add_wzitem_info(#"ammo_type_45_item", "Cal .45", "ammo");
    wzitems add_wzitem_info(#"ammo_type_50cal_item", "Cal .50", "ammo");
    wzitems add_wzitem_info(#"ammo_type_338_item", "Cal .338", "ammo");
    wzitems add_wzitem_info(#"ammo_type_rocket_item", "Rockets", "ammo");
    wzitems add_wzitem_info(#"ammo_type_9mm_double_item", "9mm (Double)", "ammo");
    wzitems add_wzitem_info(#"ammo_type_556_double_item", "5.56mm (Double)", "ammo");
    wzitems add_wzitem_info(#"ammo_type_762_double_item", "7.62mm (Double)", "ammo");
    wzitems add_wzitem_info(#"ammo_type_12ga_double_item", "Cal .12 (Double)", "ammo");
    wzitems add_wzitem_info(#"ammo_type_45_double_item", "Cal .45 (Double)", "ammo");
    wzitems add_wzitem_info(#"ammo_type_50cal_double_item", "Cal .50 (Double)", "ammo");
    wzitems add_wzitem_info(#"ammo_type_338_double_item", "Cal .338 (Double)", "ammo");
    wzitems add_wzitem_info(#"ammo_type_rocket_double_item", "Rockets (Double)", "ammo");

    wzitems add_wzitem_info(#"health_item_small", "Bandages", "health");
    wzitems add_wzitem_info(#"health_item_medium", "Med kit", "health");
    wzitems add_wzitem_info(#"health_item_large", "Trauma kit", "health");
    wzitems add_wzitem_info(#"health_item_squad", "TAK-5", "health");

    wzitems add_wzitem_info(#"perk_item_awareness", "Awareness", "perk");
    wzitems add_wzitem_info(#"perk_item_brawler", "Brawler", "perk");
    wzitems add_wzitem_info(#"perk_item_consumer", "Consumer", "perk");
    wzitems add_wzitem_info(#"perk_item_deadsilence", "Dead silence", "perk");
    wzitems add_wzitem_info(#"perk_item_engineer", "Engineer", "perk");
    wzitems add_wzitem_info(#"perk_item_ironlungs", "Iron lungs", "perk");
    wzitems add_wzitem_info(#"perk_item_stimulant", "Stimulant", "perk");
    wzitems add_wzitem_info(#"perk_item_looter", "Looter", "perk");
    wzitems add_wzitem_info(#"perk_item_medic", "Medic", "perk");
    wzitems add_wzitem_info(#"perk_item_lightweight", "Mobility", "perk");
    wzitems add_wzitem_info(#"perk_item_outlander", "Outlander", "perk");
    wzitems add_wzitem_info(#"perk_item_paranoia", "Paranoia", "perk");
    wzitems add_wzitem_info(#"perk_item_reinforced", "Reinforced", "perk");
    wzitems add_wzitem_info(#"perk_item_drifter", "Shulker", "perk");
    wzitems add_wzitem_info(#"perk_item_squadlink", "Squad link", "perk");
    wzitems add_wzitem_info(#"perk_item_bloody_tracker", "Tracker", "perk");
    wzitems add_wzitem_info(#"perk_item_doublejump", "Double jump", "perk");
    
    wzitems add_wzitem_info(#"special_crossbow_t8_item", "Reaver C86", "weap_special");
    wzitems add_wzitem_info(#"launcher_standard_t8_item", "Hellion salvo", "weap_special");
    wzitems add_wzitem_info(#"launcher_standard_operator_t8_item", "Hellion salvo (Operator)", "weap_special");

    wzitems add_wzitem_info(#"armor_shard_item", "Armor shard", "armor");
    wzitems add_wzitem_info(#"armor_item_small", "Armor tier 1", "armor");
    wzitems add_wzitem_info(#"armor_item_medium", "Armor tier 2", "armor");
    wzitems add_wzitem_info(#"armor_item_large", "Armor Tier 3", "armor");

    wzitems add_wzitem_info(#"cu01_item", "Ajax", "ee");
    wzitems add_wzitem_info(#"cu02_item", "Torque", "ee");
    wzitems add_wzitem_info(#"cu03_item", "Crash", "ee");
    wzitems add_wzitem_info(#"cu04_item", "Recon", "ee");
    wzitems add_wzitem_info(#"cu06_item", "Firebreak", "ee");
    wzitems add_wzitem_info(#"cu07_item", "Nomad", "ee");
    wzitems add_wzitem_info(#"cu08_item", "Ruin", "ee");
    wzitems add_wzitem_info(#"cu10_item", "Prophet", "ee");
    wzitems add_wzitem_info(#"cu11_item", "Bruno", "ee");
    wzitems add_wzitem_info(#"cu12_item", "Diego", "ee");
    wzitems add_wzitem_info(#"cu13_item", "Scarlett", "ee");
    wzitems add_wzitem_info(#"cu14_item", "Shaw", "ee");
    wzitems add_wzitem_info(#"cu15_item", "Dempsey", "ee");
    wzitems add_wzitem_info(#"cu16_item", "Nikolai", "ee");
    wzitems add_wzitem_info(#"cu17_item", "Richtofen", "ee");
    wzitems add_wzitem_info(#"cu18_item", "Takeo", "ee");
    wzitems add_wzitem_info(#"cu19_item", "Mason", "ee");
    wzitems add_wzitem_info(#"cu20_item", "Menendez", "ee");
    wzitems add_wzitem_info(#"cu21_item", "Reznov", "ee");
    wzitems add_wzitem_info(#"cu22_item", "Woods", "ee");
    wzitems add_wzitem_info(#"cu28_item", "Bruno (IX)", "ee");
    wzitems add_wzitem_info(#"cu29_item", "Diego (IX)", "ee");
    wzitems add_wzitem_info(#"cu30_item", "Scarlett (IX)", "ee");
    wzitems add_wzitem_info(#"cu31_item", "Shaw (IX)", "ee");
    wzitems add_wzitem_info(#"cu32_item", "Zero", "ee");
    wzitems add_wzitem_info(#"cu33_item", "Outrider", "ee");
    wzitems add_wzitem_info(#"cu34_item", "Spectre", "ee");
    wzitems add_wzitem_info(#"cu35_item", "Reaper", "ee");

    wzitems add_wzitem_info(#"hw_event_item_mc", "mc", "hw");
    wzitems add_wzitem_info(#"hw_event_item_kk", "kk", "hw");
    wzitems add_wzitem_info(#"hw_event_item_wb", "wb", "hw");
    wzitems add_wzitem_info(#"hw_event_item_th", "th", "hw");
    wzitems add_wzitem_info(#"hw_event_item_tod", "tod", "hw");
    wzitems add_wzitem_info(#"hw_event_item_jk", "jk", "hw");

    wzitems add_wzitem_info(#"ar_accurate_t8_item", "ICR-7", "weap_ar");
    wzitems add_wzitem_info(#"ar_accurate_t8_gold_item", "ICR-7 (Gold)", "weap_ar");
    wzitems add_wzitem_info(#"ar_modular_t8_item", "KN-57", "weap_ar");
    wzitems add_wzitem_info(#"ar_modular_t8_gold_item", "KN-57 (Gold)", "weap_ar");
    wzitems add_wzitem_info(#"ar_damage_t8_item", "Rampart 17", "weap_ar");
    wzitems add_wzitem_info(#"ar_damage_t8_gold_item", "Rampart 17 (Gold)", "weap_ar");
    wzitems add_wzitem_info(#"ar_fastfire_t8_item", "Maddox RFB", "weap_ar");
    wzitems add_wzitem_info(#"ar_fastfire_t8_gold_item", "Maddox RFB (Gold)", "weap_ar");
    wzitems add_wzitem_info(#"ar_fastfire_t8_operator_item", "Maddox RFB (Operator)", "weap_ar");
    wzitems add_wzitem_info(#"ar_stealth_t8_item", "VAPR-XKG", "weap_ar");
    wzitems add_wzitem_info(#"ar_stealth_t8_gold_item", "VAPR-XKG (Gold)", "weap_ar");
    wzitems add_wzitem_info(#"ar_stealth_t8_operator_item", "VAPR-XKG (Operator)", "weap_ar");
    wzitems add_wzitem_info(#"ar_standard_t8_item", "Swat RFT", "weap_ar");
    wzitems add_wzitem_info(#"ar_standard_t8_gold_item", "Swat RFT (Gold)", "weap_ar");
    wzitems add_wzitem_info(#"ar_an94_t8_item", "AN-94", "weap_ar");
    wzitems add_wzitem_info(#"ar_doublebarrel_t8_item", "Echohawk", "weap_ar");
    wzitems add_wzitem_info(#"ar_galil_t8_item", "Grav", "weap_ar");
    wzitems add_wzitem_info(#"ar_peacekeeper_t8_item", "Peacekeeper", "weap_ar");
    wzitems add_wzitem_info(#"ar_peacekeeper_t8_gold_item", "Peacekeeper(gold) ", "weap_ar");
    wzitems add_wzitem_info(#"ar_doublebarrel_t8_item", "Echohawk", "weap_ar");
    wzitems add_wzitem_info(#"ar_galil_t8_item", "Grav", "weap_ar");
    
    wzitems add_wzitem_info(#"lmg_spray_t8_item", "Hades", "weap_lmg");
    wzitems add_wzitem_info(#"lmg_spray_t8_gold_item", "Hades (Gold)", "weap_lmg");
    wzitems add_wzitem_info(#"lmg_spray_t8_operator_item", "Hades (Operator)", "weap_lmg");
    wzitems add_wzitem_info(#"lmg_standard_t8_item", "Titan", "weap_lmg");
    wzitems add_wzitem_info(#"lmg_standard_t8_gold_item", "Titan (Gold)", "weap_lmg");
    wzitems add_wzitem_info(#"lmg_standard_t8_operator_item", "Titan (Operator)", "weap_lmg");
    wzitems add_wzitem_info(#"lmg_heavy_t8_item", "VKM-750", "weap_lmg");
    wzitems add_wzitem_info(#"lmg_heavy_t8_gold_item", "VKM-750 (Gold)", "weap_lmg");
    wzitems add_wzitem_info(#"lmg_double_t8_item", "Zweihander", "weap_lmg");
    wzitems add_wzitem_info(#"lmg_stealth_t8_item", "Tigershark", "weap_lmg");
    wzitems add_wzitem_info(#"lmg_stealth_t8_gold_item", "Tigershark (Gold)", "weap_lmg");
    wzitems add_wzitem_info(#"lmg_stealth_t8_operator_item", "Tigershark (Operator)", "weap_lmg");
    
    wzitems add_wzitem_info(#"melee_bowie_t8_item", "Bowie knife", "weap_melee");
    wzitems add_wzitem_info(#"melee_bloody_bowie_t8_item", "Bloody bowie knife", "weap_melee");
    wzitems add_wzitem_info(#"melee_actionfigure_t8_item", "Series 6 Outrider", "weap_melee");
    wzitems add_wzitem_info(#"melee_coinbag_t8_item", "Cha-Ching", "weap_melee");
    wzitems add_wzitem_info(#"melee_demohammer_t8_item", "Home Wrecker", "weap_melee");
    wzitems add_wzitem_info(#"melee_stopsign_t8_item", "Full Stop", "weap_melee");
    wzitems add_wzitem_info(#"melee_zombiearm_t8_item", "Backhander", "weap_melee");
    wzitems add_wzitem_info(#"melee_club_t8_item", "Nifo'oti", "weap_melee");
    wzitems add_wzitem_info(#"melee_secretsanta_t8_item", "Secret Santa", "weap_melee");
    wzitems add_wzitem_info(#"melee_slaybell_t8_item", "Slay Bell", "weap_melee");
    wzitems add_wzitem_info(#"melee_amuletfist_t8_item", "Eye of Apophis", "weap_melee");
    wzitems add_wzitem_info(#"melee_cutlass_t8_item", "Rising Tide", "weap_melee");
    wzitems add_wzitem_info(#"melee_spork_t8_item", "Alcatraz Spork", "weap_melee");
    
    wzitems add_wzitem_info(#"tr_longburst_t8_item", "Swordfish", "weap_tr");
    wzitems add_wzitem_info(#"tr_longburst_t8_gold_item", "Swordfish (Gold)", "weap_tr");
    wzitems add_wzitem_info(#"tr_longburst_t8_operator_item", "Swordfish (Operator)", "weap_tr");
    wzitems add_wzitem_info(#"tr_powersemi_t8_item", "Auger DMR", "weap_tr");
    wzitems add_wzitem_info(#"tr_powersemi_t8_gold_item", "Auger DMR (Gold)", "weap_tr");
    wzitems add_wzitem_info(#"tr_powersemi_t8_operator_item", "Auger DMR (Operator)", "weap_tr");
    wzitems add_wzitem_info(#"tr_midburst_t8_item", "ABR 223", "weap_tr");
    wzitems add_wzitem_info(#"tr_midburst_t8_gold_item", "ABR 223 (Gold)", "weap_tr");
    wzitems add_wzitem_info(#"tr_midburst_t8_operator_item", "ABR 223 (Operator)", "weap_tr");
    wzitems add_wzitem_info(#"tr_leveraction_t8_item", "Essex Model 07", "weap_tr");
    wzitems add_wzitem_info(#"tr_damageburst_t8_item", "M16", "weap_tr");
    wzitems add_wzitem_info(#"tr_flechette_t8_item", "S6 Stingray", "weap_tr");

    wzitems add_wzitem_info(#"pistol_burst_t8_gold_item", "pistol_burst (Gold)", "weap_pistol");
    wzitems add_wzitem_info(#"pistol_burst_t8_item", "pistol_burst", "weap_pistol");
    wzitems add_wzitem_info(#"pistol_fullauto_t8_gold_item", "pistol_fullauto (Gold)", "weap_pistol");
    wzitems add_wzitem_info(#"pistol_fullauto_t8_item", "pistol_fullauto", "weap_pistol");
    wzitems add_wzitem_info(#"pistol_grip_wz_item", "pistol_grip", "weap_pistol");
    wzitems add_wzitem_info(#"pistol_revolver_t8_gold_item", "pistol_revolver (Gold)", "weap_pistol");
    wzitems add_wzitem_info(#"pistol_revolver_t8_item", "pistol_revolver", "weap_pistol");
    wzitems add_wzitem_info(#"pistol_revolver_t8_operator_item", "pistol_revolver (Operator)", "weap_pistol");
    wzitems add_wzitem_info(#"pistol_standard_t8_gold_item", "pistol_standard (Gold)", "weap_pistol");
    wzitems add_wzitem_info(#"pistol_standard_t8_item", "pistol_standard", "weap_pistol");

    wzitems add_wzitem_info(#"shotgun_pump_t8_item", "MOG-12", "weap_shotgun");
    wzitems add_wzitem_info(#"shotgun_pump_t8_gold_item", "MOG-12 (Gold)", "weap_shotgun");
    wzitems add_wzitem_info(#"shotgun_semiauto_t8_item", "SG-12", "weap_shotgun");
    wzitems add_wzitem_info(#"shotgun_semiauto_t8_gold_item", "SG-12 (Gold)", "weap_shotgun");
    wzitems add_wzitem_info(#"shotgun_fullauto_t8_item", "Rampage", "weap_shotgun");
    wzitems add_wzitem_info(#"shotgun_precision_t8_item", "Argus", "weap_shotgun");

    wzitems add_wzitem_info(#"smg_mp40_t8_item", "MP40", "weap_smg");
    wzitems add_wzitem_info(#"smg_standard_t8_item", "MX9", "weap_smg");
    wzitems add_wzitem_info(#"smg_standard_t8_gold_item", "MX9 (Gold)", "weap_smg");
    wzitems add_wzitem_info(#"smg_accurate_t8_item", "GKS", "weap_smg");
    wzitems add_wzitem_info(#"smg_accurate_t8_gold_item", "GKS (Gold)", "weap_smg");
    wzitems add_wzitem_info(#"smg_accurate_t8_operator_item", "GKS (Operator)", "weap_smg");
    wzitems add_wzitem_info(#"smg_capacity_t8_item", "Cordite", "weap_smg");
    wzitems add_wzitem_info(#"smg_capacity_t8_gold_item", "Cordite (Gold)", "weap_smg");
    wzitems add_wzitem_info(#"smg_fastburst_t8_item", "smg_fastburst_t8", "weap_smg");
    wzitems add_wzitem_info(#"smg_fastburst_t8_gold_item", "smg_fastburst_t8 (Gold)", "weap_smg");
    wzitems add_wzitem_info(#"smg_fastfire_t8_item", "Spitfire", "weap_smg");
    wzitems add_wzitem_info(#"smg_fastfire_t8_gold_item", "Spitfire (Gold)", "weap_smg");
    wzitems add_wzitem_info(#"smg_fastfire_t8_operator_item", "Spitfire (Operator)", "weap_smg");
    wzitems add_wzitem_info(#"smg_handling_t8_item", "Saug 9mm", "weap_smg");
    wzitems add_wzitem_info(#"smg_handling_t8_gold_item", "Saug 9mm (Gold)", "weap_smg");
    wzitems add_wzitem_info(#"smg_folding_t8_item", "Switchblade X9", "weap_smg");
    wzitems add_wzitem_info(#"smg_folding_t8_gold_item", "Switchblade X9 (Gold)", "weap_smg");
    wzitems add_wzitem_info(#"smg_minigun_t8_item", "MicroMG 9mm", "weap_smg");
    wzitems add_wzitem_info(#"smg_vmp_t8_item", "VMP", "weap_smg");

    wzitems add_wzitem_info(#"sniper_fastrechamber_t8_item", "Outlaw", "weap_sniper");
    wzitems add_wzitem_info(#"sniper_fastrechamber_t8_gold_item", "Outlaw (Gold)", "weap_sniper");
    wzitems add_wzitem_info(#"sniper_fastrechamber_t8_operator_item", "Outlaw (Operator)", "weap_sniper");
    wzitems add_wzitem_info(#"sniper_mini14_t8_item", "Vendetta", "weap_sniper");
    wzitems add_wzitem_info(#"sniper_mini14_t8_gold_item", "Vendetta (Gold)", "weap_sniper");
    wzitems add_wzitem_info(#"sniper_mini14_t8_operator_item", "Vendetta (Operator)", "weap_sniper");
    wzitems add_wzitem_info(#"sniper_powerbolt_t8_item", "Paladin HB50", "weap_sniper");
    wzitems add_wzitem_info(#"sniper_powerbolt_t8_gold_item", "Paladin HB50 (Gold)", "weap_sniper");
    wzitems add_wzitem_info(#"sniper_powersemi_t8_item", "SDM", "weap_sniper");
    wzitems add_wzitem_info(#"sniper_powersemi_t8_gold_item", "SDM (Gold)", "weap_sniper");
    wzitems add_wzitem_info(#"sniper_quickscope_t8_item", "Koshka", "weap_sniper");
    wzitems add_wzitem_info(#"sniper_quickscope_t8_gold_item", "Koshka (Gold)", "weap_sniper");
    wzitems add_wzitem_info(#"sniper_quickscope_t8_operator_item", "Koshka (Operator)", "weap_sniper");
    wzitems add_wzitem_info(#"sniper_damagesemi_t8_item", "Havelina AA50", "weap_sniper");
    wzitems add_wzitem_info(#"sniper_locus_t8_item", "Locus", "weap_sniper");

    wzitems add_wzitem_info(#"zodiac_wz_vehicle_odg", "zodiac_wz_vehicle_odg", "unknown");
    wzitems add_wzitem_info(#"zodiac_wz_vehicle_black", "zodiac_wz_vehicle_black", "unknown");
    wzitems add_wzitem_info(#"zodiac_wz_vehicle_grey", "zodiac_wz_vehicle_grey", "unknown");

#ifdef ATIAN_MENU_DEV
    // UNKNOWN ITEMS

/*

11,cash_item_500,itemspawnentry,500,cash,None
36,perk_item_doublejump,itemspawnentry,1,generic,None
38,ammo_type_12ga_double_item,itemspawnentry,40,ammo,None
69,ammo_type_45_double_item,itemspawnentry,100,ammo,None
92,zodiac_wz_vehicle_odg,itemspawnentry,unknown,vehicle,None
93,hw_event_item_mc,itemspawnentry,unknown,quest,None
119,ammo_type_556_double_item,itemspawnentry,100,ammo,None
130,zodiac_wz_vehicle_black,itemspawnentry,unknown,vehicle,None
149,hw_event_item_kk,itemspawnentry,unknown,quest,None
155,melee_spork_t8_item,itemspawnentry,1,weapon,Common
158,ammo_type_9mm_double_item,itemspawnentry,100,ammo,None
177,ammo_type_338_double_item,itemspawnentry,60,ammo,None
196,zodiac_wz_vehicle_grey,itemspawnentry,unknown,vehicle,None
224,hw_event_item_wb,itemspawnentry,unknown,quest,None
231,hw_event_item_th,itemspawnentry,unknown,quest,None
234,ammo_type_762_double_item,itemspawnentry,100,ammo,None
236,ammo_type_50cal_double_item,itemspawnentry,60,ammo,None
237,hw_event_item_tod,itemspawnentry,unknown,quest,None
266,hw_event_item_jk,itemspawnentry,unknown,quest,None

*/
    // don't care
    wzitems add_wzitem_info(#"ar_accurate_t8_wallbuy_item", "ar_accurate_t8_wallbuy_item", "unknown");
    wzitems add_wzitem_info(#"ar_damage_t8_wallbuy_item", "ar_damage_t8_wallbuy_item", "unknown");
    wzitems add_wzitem_info(#"ar_fastfire_t8_wallbuy_item", "ar_fastfire_t8_wallbuy_item", "unknown");
    wzitems add_wzitem_info(#"ar_galil_t8_wallbuy_item", "ar_galil_t8_wallbuy_item", "unknown");
    wzitems add_wzitem_info(#"ar_modular_t8_wallbuy_item", "ar_modular_t8_wallbuy_item", "unknown");
    wzitems add_wzitem_info(#"ar_standard_t8_wallbuy_item", "ar_standard_t8_wallbuy_item", "unknown");
    wzitems add_wzitem_info(#"ar_stealth_t8_wallbuy_item", "ar_stealth_t8_wallbuy_item", "unknown");
    wzitems add_wzitem_info(#"lmg_double_t8_wallbuy_item", "lmg_double_t8_wallbuy_item", "unknown");
    wzitems add_wzitem_info(#"lmg_heavy_t8_wallbuy_item", "lmg_heavy_t8_wallbuy_item", "unknown");
    wzitems add_wzitem_info(#"lmg_spray_t8_wallbuy_item", "lmg_spray_t8_wallbuy_item", "unknown");
    wzitems add_wzitem_info(#"lmg_standard_t8_wallbuy_item", "lmg_standard_t8_wallbuy_item", "unknown");
    wzitems add_wzitem_info(#"shotgun_fullauto_t8_wallbuy_item", "shotgun_fullauto_t8_wallbuy_item", "unknown");
    wzitems add_wzitem_info(#"shotgun_pump_t8_wallbuy_item", "shotgun_pump_t8_wallbuy_item", "unknown");
    wzitems add_wzitem_info(#"shotgun_semiauto_t8_wallbuy_item", "shotgun_semiauto_t8_wallbuy_item", "unknown");
    wzitems add_wzitem_info(#"smg_accurate_t8_wallbuy_item", "smg_accurate_t8_wallbuy_item", "unknown");
    wzitems add_wzitem_info(#"smg_capacity_t8_wallbuy_item", "smg_capacity_t8_wallbuy_item", "unknown");
    wzitems add_wzitem_info(#"smg_fastburst_t8_wallbuy_item", "smg_fastburst_t8_wallbuy_item", "unknown");
    wzitems add_wzitem_info(#"smg_fastfire_t8_wallbuy_item", "smg_fastfire_t8_wallbuy_item", "unknown");
    wzitems add_wzitem_info(#"smg_folding_t8_wallbuy_item", "smg_folding_t8_wallbuy_item", "unknown");
    wzitems add_wzitem_info(#"smg_handling_t8_wallbuy_item", "smg_handling_t8_wallbuy_item", "unknown");
    wzitems add_wzitem_info(#"smg_mp40_t8_wallbuy_item", "smg_mp40_t8_wallbuy_item", "unknown");
    wzitems add_wzitem_info(#"smg_standard_t8_wallbuy_item", "smg_standard_t8_wallbuy_item", "unknown");
    wzitems add_wzitem_info(#"sniper_fastrechamber_t8_wallbuy_item", "sniper_fastrechamber_t8_wallbuy_item", "unknown");
    wzitems add_wzitem_info(#"sniper_powerbolt_t8_wallbuy_item", "sniper_powerbolt_t8_wallbuy_item", "unknown");
    wzitems add_wzitem_info(#"sniper_powersemi_t8_wallbuy_item", "sniper_powersemi_t8_wallbuy_item", "unknown");
    wzitems add_wzitem_info(#"sniper_quickscope_t8_wallbuy_item", "sniper_quickscope_t8_wallbuy_item", "unknown");
    wzitems add_wzitem_info(#"tr_leveraction_t8_wallbuy_item", "tr_leveraction_t8_wallbuy_item", "unknown");
    wzitems add_wzitem_info(#"tr_longburst_t8_wallbuy_item", "tr_longburst_t8_wallbuy_item", "unknown");
    wzitems add_wzitem_info(#"tr_midburst_t8_wallbuy_item", "tr_midburst_t8_wallbuy_item", "unknown");
    wzitems add_wzitem_info(#"tr_powersemi_t8_wallbuy_item", "tr_powersemi_t8_wallbuy_item", "unknown");


#endif
}
weapon_enum_match_restriction(weapon_restriction) {
    if (isdefined(level.atianconfig.devcfg.bypassweapon_script) && level.atianconfig.devcfg.bypassweapon_script) {
        return true;
    }
    a_restrictions_or = strTok(weapon_restriction, "|");
    
    for (i = 0; i < a_restrictions_or.size; i++) {
        a_restrictions = strTok(a_restrictions_or[i], ";");

        query_false = false;
        for (j = 0; j < a_restrictions.size; j++) {
            res_data = strTok(a_restrictions[j], "=");
            if (res_data.size < 2) {
                continue; // bad config
            }

            switch (res_data[0]) {
                case "map":
                    data = nullable_to_str(level.script, "noscript");
                    break;
                case "gamemode":
                    data = get_gamemode();
                    break;
                case "gametype":
                    data = nullable_to_str(level.gametype, "nogametype");
                    break;
                default:
                    data = undefined;
                    break; // bad config
            }
            query_false = !isdefined(data) || !array::contains(strTok(res_data[1], ","), data);
            break;
        }
        if (query_false) {
            continue;
        }
        return true;
    }
    return false;
}
add_weapon_info(weapon_name, weapon_title, weapon_category, is_upgradable = false, weapon_restriction = undefined, gadget_id = 0) {
    if (isdefined(weapon_restriction)
        && !(isdefined(level.atianconfig.devcfg.enum_weapon_no_restrict) && level.atianconfig.devcfg.enum_weapon_no_restrict)) {
        if (!weapon_enum_match_restriction(weapon_restriction)) {
            return;
        }
    }
    weapon_name_data = {
        #name: weapon_name,
        #title: weapon_title,
        #category: weapon_category,
        #upgradable: is_upgradable,
        #gadgetid: gadget_id
    };

    array::add(self.weapons, weapon_name_data);
    cat = self.categories[weapon_category];
    if (isdefined(cat)) {
        array::add(cat.weapons, weapon_name_data);
    }
}

add_weapon_category(category_id, category_title) {
    weapon_name_data = {
        #name: category_id,
        #title: category_title,
        #weapons: array()
    };
    self.categories[category_id] = weapon_name_data;
}

get_weapon_enum_data() {
    if (!isdefined(level.atian_enum_data)) {
        generate_enum_values();
    }
    return level.atian_enum_data.weapon_data;
}

generate_weapon_enum() {
    if (isdefined(self.weapon_data)) {
        return;
    }
    weapon_data = {
        #weapons: array(),
        #categories: array(),
        #global_weapons: array()
    };
    self.weapon_data = weapon_data;

    weapon_data add_weapon_category("ar", "Assault rifle");
    weapon_data add_weapon_category("smg", "Submachine Gun");
    weapon_data add_weapon_category("tr", "Tactical rifle");
    weapon_data add_weapon_category("lmg", "Light machine gun");
    weapon_data add_weapon_category("sniper", "Sniper");
    weapon_data add_weapon_category("pistol", "Pistol");
    weapon_data add_weapon_category("shotgun", "Shotgun");
    weapon_data add_weapon_category("melee", "Melee");
    weapon_data add_weapon_category("special", "Special");
    weapon_data add_weapon_category("ww", "Wonder weapon");
    weapon_data add_weapon_category("gadget", "Gadget");
    weapon_data add_weapon_category("hero", "Hero weapon");
    weapon_data add_weapon_category("scorestreak", "Scorestreak");
    weapon_data add_weapon_category("gametype", "Gametype weapon");

    

    weapon_data add_weapon_info("ar_accurate_t8", "ICR-7", "ar", true);
    weapon_data add_weapon_info("ar_damage_t8", "Rampart 17", "ar", true);
    weapon_data add_weapon_info("ar_modular_t8", "KN-57", "ar", true);
    weapon_data add_weapon_info("ar_stealth_t8", "VAPR-XKG", "ar", true);
    weapon_data add_weapon_info("ar_fastfire_t8", "Maddox RFB", "ar", true);
    weapon_data add_weapon_info("ar_galil_t8", "Grav", "ar", true);
    weapon_data add_weapon_info("ar_standard_t8", "Swat RFT", "ar", true);
    weapon_data add_weapon_info("ar_peacekeeper_t8", "Peacekeeper", "ar", true);
    weapon_data add_weapon_info("ar_an94_t8", "AN-94", "ar", true);
    weapon_data add_weapon_info("ar_doublebarrel_t8", "Echohawk", "ar", true);
    weapon_data add_weapon_info("ar_mg1909_t8", "Hitchcock M9", "ar", true, "gamemode=zm");

    weapon_data add_weapon_info("smg_standard_t8", "MX9", "smg", true);
    weapon_data add_weapon_info("smg_accurate_t8", "GKS", "smg", true);
    weapon_data add_weapon_info("smg_capacity_t8", "Cordite", "smg", true);
    weapon_data add_weapon_info("smg_fastfire_t8", "Spitfire", "smg", true);
    weapon_data add_weapon_info("smg_folding_t8", "Switchblade X9", "smg", true);
    weapon_data add_weapon_info("smg_handling_t8", "Saug 9mm", "smg", true);
    weapon_data add_weapon_info("smg_fastburst_t8", "Daemon 3XB", "smg", true);
    weapon_data add_weapon_info("smg_vmp_t8", "VMP", "smg", true);
    weapon_data add_weapon_info("smg_minigun_t8", "MicroMG 9mm", "smg", true);
    weapon_data add_weapon_info("smg_drum_pistol_t8", "Escargot", "smg", true, "gamemode=zm");
    weapon_data add_weapon_info("smg_mp40_t8", "MP40", "smg", true, "gamemode=zm,wz");
    weapon_data add_weapon_info("smg_thompson_t8", "M1927", "smg", true, "map=zm_office,zm_orange,zm_escape,zm_white");
    
    weapon_data add_weapon_info("tr_longburst_t8", "Swordfish", "tr", true);
    weapon_data add_weapon_info("tr_leveraction_t8", "Essex Model 07", "tr", true, "gamemode=zm,wz");
    weapon_data add_weapon_info("tr_midburst_t8", "ABR 223", "tr", true);
    weapon_data add_weapon_info("tr_powersemi_t8", "Auger DMR", "tr", true);
    weapon_data add_weapon_info("tr_flechette_t8", "S6 Stingray", "tr", true);
    weapon_data add_weapon_info("tr_damageburst_t8", "M16", "tr", true);

    weapon_data add_weapon_info("sniper_powerbolt_t8", "Paladin HB50", "sniper", true);
    weapon_data add_weapon_info("sniper_powersemi_t8", "SDM", "sniper", true);
    weapon_data add_weapon_info("sniper_fastrechamber_t8", "Outlaw", "sniper", true);
    weapon_data add_weapon_info("sniper_quickscope_t8", "Koshka", "sniper", true);
    weapon_data add_weapon_info("sniper_locus_t8", "Locus", "sniper", true);
    weapon_data add_weapon_info("sniper_damagesemi_t8", "Havelina AA50", "sniper", true);
    weapon_data add_weapon_info("sniper_mini14_t8", "Vendetta", "sniper", true);

    weapon_data add_weapon_info("pistol_standard_t8", "Strife", "pistol", true);
    weapon_data add_weapon_info("pistol_burst_t8", "RK-7 Garrison", "pistol", true);
    weapon_data add_weapon_info("pistol_revolver_t8", "Mozu", "pistol", true);
    weapon_data add_weapon_info("pistol_fullauto_t8", "KAP-45", "pistol", true);
    weapon_data add_weapon_info("pistol_topbreak_t8", "Welling", "pistol", true, "gamemode=zm");
    weapon_data add_weapon_info("pistol_standard", "MR-6 (BO3)", "pistol", false);

    weapon_data add_weapon_info("lmg_standard_t8", "Titan", "lmg", true);
    weapon_data add_weapon_info("lmg_spray_t8", "Hades", "lmg", true);
    weapon_data add_weapon_info("lmg_heavy_t8", "VKM-750", "lmg", true);
    weapon_data add_weapon_info("lmg_double_t8", "Zweihander", "lmg", true, "gamemode=zm");
    weapon_data add_weapon_info("lmg_stealth_t8", "Tigershark", "lmg", true);
    
    weapon_data add_weapon_info("shotgun_pump_t8", "MOG-12", "shotgun", true);
    weapon_data add_weapon_info("shotgun_semiauto_t8", "SG-12", "shotgun", true);
    weapon_data add_weapon_info("shotgun_trenchgun_t8", "Trenchgun", "shotgun", true, "gamemode=zm");
    weapon_data add_weapon_info("shotgun_fullauto_t8", "Rampage", "shotgun", true);
    weapon_data add_weapon_info("shotgun_precision_t8", "Argus", "shotgun", true);

    weapon_data add_weapon_info("bare_hands", "Bare hands", "melee", false);
    weapon_data add_weapon_info("knife_loadout", "Combat Knife", "melee", false, "gamemode=mp");
    weapon_data add_weapon_info("bowie_knife", "Bowie knife", "melee", false, "gamemode=zm"); // zombies players' knife
    weapon_data add_weapon_info("melee_bowie", "Bowie knife", "melee", false, "gamemode=wz");
    weapon_data add_weapon_info("melee_club_t8", "Nifo'oti", "melee", false, "gamemode=mp,wz");
    weapon_data add_weapon_info("melee_coinbag_t8", "Cha-Ching", "melee", false, "gamemode=mp,wz");
    weapon_data add_weapon_info("melee_demohammer_t8", "Home Wrecker", "melee", false, "gamemode=mp,wz");
    weapon_data add_weapon_info("melee_secretsanta_t8", "Secret Santa", "melee", false, "gamemode=mp,wz");
    weapon_data add_weapon_info("melee_slaybell_t8", "Slay Bell", "melee", false, "gamemode=mp,wz");
    weapon_data add_weapon_info("melee_stopsign_t8", "Full Stop", "melee", false, "gamemode=mp,wz");
    weapon_data add_weapon_info("melee_zombiearm_t8", "Backhander", "melee", false, "gamemode=mp,wz");
    weapon_data add_weapon_info("melee_amuletfist_t8", "Eye of Apophis", "melee", false, "gamemode=mp,wz");
    weapon_data add_weapon_info("melee_actionfigure_t8", "Series 6 Outrider", "melee", false, "gamemode=mp,wz");
    weapon_data add_weapon_info("melee_cutlass_t8", "Rising Tide", "melee", false, "gamemode=mp,wz");
    weapon_data add_weapon_info("spknifeork", "Spknifeork", "melee", false, "map=zm_escape");
    weapon_data add_weapon_info("spoon_alcatraz", "Spoon alcatraz", "melee", false, "map=zm_escape");
    weapon_data add_weapon_info("spork_alcatraz", "Spknifeork", "melee", false, "map=zm_escape");
    weapon_data add_weapon_info("stake_knife", "Stake knife", "melee", false, "map=zm_mansion");
    weapon_data add_weapon_info("galvaknuckles_t8", "Galvaknuckles", "melee", false, "map=zm_white");
    
    
    weapon_data add_weapon_info("ray_gun", "Ray gun", "ww", true, "gamemode=wz,mp|map=zm_office,zm_orange,zm_escape,zm_white");
    weapon_data add_weapon_info("ray_gun_mk2", "Ray gun MK2", "ww", true, "map=zm_office,zm_orange,zm_escape,zm_white,wz_escape,wz_escape_alt"); // crash the game on the main map
    weapon_data add_weapon_info("ray_gun_mk2v", "Ray gun MK2 V", "ww", true, "map=zm_white,wz_escape,wz_escape_alt");
    weapon_data add_weapon_info("ray_gun_mk2x", "Ray gun MK2 X", "ww", true, "map=zm_white,wz_escape,wz_escape_alt");
    weapon_data add_weapon_info("ray_gun_mk2y", "Ray gun MK2 Y", "ww", true, "map=zm_white,wz_escape,wz_escape_alt");
    weapon_data add_weapon_info("ray_gun_mk2z", "Ray gun MK2 Z", "ww", true, "map=zm_white,wz_escape,wz_escape_alt");
    weapon_data add_weapon_info("ww_freezegun_t8", "Winter's Howl", "ww", true, "map=zm_office,zm_white,zm_orange,wz_escape,wz_escape_alt");
    weapon_data add_weapon_info("ww_blundergat_t8", "Blundergat", "ww", true, "gamemode=wz|map=zm_escape");
    weapon_data add_weapon_info("ww_blundergat_fire_t8", "Magmagat", "ww", true, "map=zm_escape");
    weapon_data add_weapon_info("ww_blundergat_acid_t8", "Acidgat", "ww", true, "map=zm_escape");
    weapon_data add_weapon_info(#"hash_494f5501b3f8e1e9", "Blundergat Tempered", "ww", false, "map=zm_escape");
    weapon_data add_weapon_info("ww_crossbow_impaler_t8", "Savage Impaler", "ww", false, "gamemode=wz|map=zm_mansion");
    weapon_data add_weapon_info(#"hash_138efe2bb30be63c", "Alistair's Folly", "ww", false, "map=zm_mansion"); // wz_escape,wz_escape_alt
    weapon_data add_weapon_info(#"hash_138f012bb30beb55", "Chaos Theory", "ww", false, "map=zm_mansion"); 
    weapon_data add_weapon_info(#"hash_138f002bb30be9a2", "Alistair's Annihilator", "ww", false, "map=zm_mansion");
    weapon_data add_weapon_info("ww_tricannon_t8", "Kraken", "ww", true, "map=zm_zodt8");
    weapon_data add_weapon_info("ww_tricannon_water_t8", "Kraken (Water)", "ww", true, "map=zm_zodt8");
    weapon_data add_weapon_info("ww_tricannon_fire_t8", "Kraken (Fire)", "ww", true, "map=zm_zodt8");
    weapon_data add_weapon_info("ww_tricannon_air_t8", "Kraken (Air)", "ww", true, "map=zm_zodt8");
    weapon_data add_weapon_info("ww_tricannon_earth_t8", "Kraken (Earth)", "ww", true, "map=zm_zodt8");
    weapon_data add_weapon_info("ww_crossbow_t8", "Death of Orion", "ww", true, "gamemode=wz|map=zm_towers");
    weapon_data add_weapon_info("ww_hand_o_uncharged", "Ouranos Hand (Uncharged)", "ww", false, "map=zm_red");
    weapon_data add_weapon_info("ww_hand_o", "Ouranos Hand", "ww", false, "map=zm_red");
    weapon_data add_weapon_info("ww_hand_o_upgraded", "Ouranos Hand (Upgraded)", "ww", false, "map=zm_red");
    weapon_data add_weapon_info("ww_hand_h_uncharged", "Hemera Hand (Uncharged)", "ww", false, "map=zm_red");
    weapon_data add_weapon_info("ww_hand_h", "Hemera Hand", "ww", false, "map=zm_red");
    weapon_data add_weapon_info("ww_hand_h_upgraded", "Hemera Hand (Upgraded)", "ww", false, "map=zm_red");
    weapon_data add_weapon_info("ww_hand_g_uncharged", "Gaia Hand (Uncharged)", "ww", false, "map=zm_red");
    weapon_data add_weapon_info("ww_hand_g", "Gaia Hand", "ww", false, "map=zm_red");
    weapon_data add_weapon_info("ww_hand_g_upgraded", "Gaia Hand (Upgraded)", "ww", false, "map=zm_red");
    weapon_data add_weapon_info("ww_hand_c_uncharged", "Charon Hand (Uncharged)", "ww", false, "map=zm_red");
    weapon_data add_weapon_info("ww_hand_c", "Charon Hand", "ww", false, "map=zm_red");
    weapon_data add_weapon_info("ww_hand_c_upgraded", "Charon Hand (Upgraded)", "ww", false, "map=zm_red");
    weapon_data add_weapon_info("ww_tesla_gun_t8", "Wunderwaffe (BO3)", "ww", true, "map=zm_orange");
    weapon_data add_weapon_info("ww_tesla_sniper_t8", "Wunderwaffe (BO4)", "ww", true, "map=zm_orange");
    weapon_data add_weapon_info("thundergun", "Thundergun", "ww", true, "map=zm_orange");
    weapon_data add_weapon_info("tundragun", "Tundragun", "ww", true, "map=zm_orange");

    if (level.script != "zm_escape") {
        weapon_data add_weapon_info("hero_sword_pistol_lv1", "Viper and Dragon (LVL 1)", "hero", false, "gamemode=zm"); // ;map=zm_office,zm_escape,zm_white,zm_orange
        weapon_data add_weapon_info("hero_sword_pistol_lv2", "Viper and Dragon (LVL 2)", "hero", false, "gamemode=zm"); // ;map=zm_office,zm_escape,zm_white,zm_orange
        weapon_data add_weapon_info("hero_sword_pistol_lv3", "Viper and Dragon (LVL 3)", "hero", false, "gamemode=zm"); // ;map=zm_office,zm_escape,zm_white,zm_orange
        weapon_data add_weapon_info("hero_chakram_lv1", "Chakrams of Vengeance (LVL 1)", "hero", false, "gamemode=zm"); // ;map=zm_office,zm_escape,zm_white,zm_orange
        weapon_data add_weapon_info("hero_chakram_lv2", "Chakrams of Vengeance (LVL 2)", "hero", false, "gamemode=zm"); // ;map=zm_office,zm_escape,zm_white,zm_orange
        weapon_data add_weapon_info("hero_chakram_lv3", "Chakrams of Vengeance (LVL 3)", "hero", false, "gamemode=zm"); // ;map=zm_office,zm_escape,zm_white,zm_orange
        weapon_data add_weapon_info("hero_scepter_lv1", "Scepter of Ra (LVL 1)", "hero", false, "gamemode=zm"); // ;map=zm_office,zm_escape,zm_white,zm_orange
        weapon_data add_weapon_info("hero_scepter_lv2", "Scepter of Ra (LVL 2)", "hero", false, "gamemode=zm"); // ;map=zm_office,zm_escape,zm_white,zm_orange
        weapon_data add_weapon_info("hero_scepter_lv3", "Scepter of Ra (LVL 3)", "hero", false, "gamemode=zm"); // ;map=zm_office,zm_escape,zm_white,zm_orange
        weapon_data add_weapon_info("hero_hammer_lv1", "Hammer of Valhalla (LVL 1)", "hero", false, "gamemode=zm"); // ;map=zm_office,zm_escape,zm_white,zm_orange
        weapon_data add_weapon_info("hero_hammer_lv2", "Hammer of Valhalla (LVL 2)", "hero", false, "gamemode=zm"); // ;map=zm_office,zm_escape,zm_white,zm_orange
        weapon_data add_weapon_info("hero_hammer_lv3", "Hammer of Valhalla (LVL 3)", "hero", false, "gamemode=zm"); // ;map=zm_office,zm_escape,zm_white,zm_orange
    }
    weapon_data add_weapon_info("hero_flamethrower_t8_lv1", "Hellfire (LV 1)", "hero", false, "gamemode=zm");
    weapon_data add_weapon_info("hero_flamethrower_t8_lv2", "Hellfire (LV 2)", "hero", false, "gamemode=zm");
    weapon_data add_weapon_info("hero_flamethrower_t8_lv3", "Hellfire (LV 3)", "hero", false, "gamemode=zm");
    weapon_data add_weapon_info("hero_gravityspikes_t8_lv1", "Ragnarok DG-5 (LV 1)", "hero", false, "gamemode=zm");
    weapon_data add_weapon_info("hero_gravityspikes_t8_lv2", "Ragnarok DG-5 (LV 2)", "hero", false, "gamemode=zm");
    weapon_data add_weapon_info("hero_gravityspikes_t8_lv3", "Ragnarok DG-5 (LV 3)", "hero", false, "gamemode=zm");
    weapon_data add_weapon_info("hero_katana_t8_lv1", "Path of Sorrows (LV 1)", "hero", false, "gamemode=zm");
    weapon_data add_weapon_info("hero_katana_t8_lv2", "Path of Sorrows (LV 2)", "hero", false, "gamemode=zm");
    weapon_data add_weapon_info("hero_katana_t8_lv3", "Path of Sorrows (LV 3)", "hero", false, "gamemode=zm");
    weapon_data add_weapon_info("hero_minigun_t8_lv1", "Overkill (LV 1)", "hero", false, "gamemode=zm");
    weapon_data add_weapon_info("hero_minigun_t8_lv2", "Overkill (LV 2)", "hero", false, "gamemode=zm");
    weapon_data add_weapon_info("hero_minigun_t8_lv3", "Overkill (LV 3)", "hero", false, "gamemode=zm");
    // weapon_data add_weapon_info("hero_lightninggun_arc", "Tempest 2 (BO3)", "hero", false, "gamemode=mp");
    weapon_data add_weapon_info("sig_blade", "Blade", "hero", false, "gamemode=wz");
    weapon_data add_weapon_info("sig_minigun", "Minigun (bug)", "hero", false, "gamemode=mp");
    weapon_data add_weapon_info("hero_minigun", "Minigun (BO3)", "hero", false, "gamemode=mp");
    weapon_data add_weapon_info("sig_minigun_alt", "Minigun (mount)", "hero", false, "gamemode=mp");
    weapon_data add_weapon_info("hero_bowlauncher", "Sparrow (BO3 physic)", "hero", false, "gamemode=mp");
    weapon_data add_weapon_info("seeker_mine_arc", "Seeker mine arc weapon", "hero", false, "gamemode=mp");

    weapon_data add_weapon_info("basketball", "Basketball", "special", false, "gamemode=wz");
    weapon_data add_weapon_info("special_ballisticknife_t8_dw", "Ballistic Knife", "special", true);
    weapon_data add_weapon_info("special_crossbow_t8", "Reaver C86", "special", true);
    weapon_data add_weapon_info("special_crossbow_t8_sas", "Reaver C86 (S&S)", "special", false, "gamemode=mp"); // ;gametype=sas
    weapon_data add_weapon_info("launcher_standard_t8", "Hellion Salvo", "special", true);
    weapon_data add_weapon_info("remote_missile_missile", "Hellstorm missile", "special", false, "gamemode=mp");
    weapon_data add_weapon_info("minigun", "Minigun", "special", false, "gamemode=zm");
    weapon_data add_weapon_info("zhield_dw", "Shield", "special", false, "map=zm_zodt8,zm_orange,zm_white,zm_mansion");
    weapon_data add_weapon_info(#"hash_42a45d43be3dba42", "Soul shield", "special", false, "map=zm_escape");
    weapon_data add_weapon_info("riotshield", "Riot shield", "special", false, "gamemode=zm");
    weapon_data add_weapon_info("defaultweapon", "Default weapon", "special", false);

    weapon_data add_weapon_info("ball", "Ball", "gametype", false, "gamemode=mp");
    weapon_data add_weapon_info("briefcase_bomb", "Briefcase bomb", "gametype", false, "gamemode=mp");
    weapon_data add_weapon_info("briefcase_bomb_defuse", "Briefcase bomb (defuse)", "gametype", false, "gamemode=mp");
    weapon_data add_weapon_info("downed", "Downed", "gametype", false, "gamemode=mp");
    
    weapon_data add_weapon_info("gadget_supplypod", "Ammo pod", "gadget", false, "gamemode=mp");
    weapon_data add_weapon_info("eq_acid_bomb", "Acid bomb", "gadget", false); // yes, no restriction
    // weapon_data add_weapon_info("bouncingbetty", "Bouncing betty", "gadget", false, "gamemode=mp"); // Crash the server
    weapon_data add_weapon_info("claymore", "Claymore", "gadget", false);
    weapon_data add_weapon_info("eq_cluster_semtex_grenade", "Cluster grenade", "gadget", false, "gamemode=mp,wz");
    weapon_data add_weapon_info("eq_concertina_wire", "Concertina wire", "gadget", false, "gamemode=mp,wz");
    weapon_data add_weapon_info("concussion_grenade", "Concussion grenade", "gadget", false, "gamemode=mp,wz"); // or eq_slow_grenade eq_slow_grenade_hunter_ph
    weapon_data add_weapon_info("cymbal_monkey", "Cymbal monkey", "gadget", false, "gamemode=wz|map=zm_office,zm_escape,zm_white,zm_orange");
    weapon_data add_weapon_info("eq_emp_grenade", "EMP grenade", "gadget", false, "gamemode=mp,wz");
    weapon_data add_weapon_info("frag_grenade", "Frag grenade", "gadget", false);
    weapon_data add_weapon_info("flash_grenade", "Flash grenade", "gadget", false, "gamemode=mp,wz");
    weapon_data add_weapon_info("eq_grapple", "Grapple", "gadget", false, "gamemode=mp,wz");
    weapon_data add_weapon_info("eq_hawk", "Hawk", "gadget", false, "gamemode=mp,wz");
    weapon_data add_weapon_info("gadget_jammer", "Jammer (prototype)", "gadget", false, "gamemode=mp,wz");
    weapon_data add_weapon_info("gadget_health_regen", "Health regen", "gadget", false, "gamemode=mp", 1);
    weapon_data add_weapon_info("homunculus", "Homunculus", "gadget", false, "gamemode=wz,zm");
    weapon_data add_weapon_info("homunculus_leprechaun", "Homunculus leprechaun", "gadget", false, "gamemode=wz,zm");
    weapon_data add_weapon_info("thunderstorm", "Pegasus strike", "gadget", false, "map=zm_red");
    weapon_data add_weapon_info("eq_molotov", "Molotov", "gadget", false);
    weapon_data add_weapon_info("mute_smoke", "Mute smoke (bug)", "gadget", false, "gamemode=mp");
    weapon_data add_weapon_info("gadget_radiation_field", "Nuclear reactor", "gadget", false, "gamemode=mp");
    weapon_data add_weapon_info("eq_sensor", "Sensor dart", "gadget", false, "gamemode=mp,wz");
    weapon_data add_weapon_info("willy_pete", "Smoke", "gadget", false, "gamemode=mp,wz");
    weapon_data add_weapon_info("eq_smoke", "Smoke (Spectre)", "gadget", false, "gamemode=mp,wz");
    weapon_data add_weapon_info("snowball", "Snowball", "gadget", false, "gamemode=wz|map=zm_orange");
    weapon_data add_weapon_info("gadget_spawnbeacon", "Spawn beacon", "gadget", false, "gamemode=mp");
    weapon_data add_weapon_info("m202_flash", "Thermite", "gadget", false, "gamemode=mp");
    weapon_data add_weapon_info("wraith_fire_fire", "Thermite", "gadget", false, "gamemode=zm");
    weapon_data add_weapon_info("hatchet", "Tomahawk", "gadget", false, "gamemode=mp,wz");
    weapon_data add_weapon_info("tomahawk_t8", "Hell retriver", "gadget", true, "gamemode=wz|map=zm_escape");
    weapon_data add_weapon_info("eq_tripwire", "Tripwire", "gadget", false, "gamemode=mp,wz");
    weapon_data add_weapon_info("trophy_system", "Trophy system", "gadget", false, "gamemode=mp,wz");
    weapon_data add_weapon_info("waterballoon", "Waterballoon", "gadget", false, "gamemode=wz");
    weapon_data add_weapon_info("eq_swat_grenade", "9-Bang", "gadget", false, "gamemode=mp,wz");
    weapon_data add_weapon_info("sticky_grenade", "Sticky grenade", "gadget", false, "gamemode=zm");
    weapon_data add_weapon_info("eq_shroud ", "Jammer", "gadget", false, "gamemode=mp");
    weapon_data add_weapon_info("sig_blade", "Blade", "gadget", false, "gamemode=mp", 2);
    weapon_data add_weapon_info("sig_buckler", "Shield", "gadget", false, "gamemode=mp", 2);
    weapon_data add_weapon_info("hero_lightninggun", "Tempest (BO3)", "gadget", false, "gamemode=mp", 2);
    weapon_data add_weapon_info("shock_rifle", "Tempest (BO4)", "gadget", false, "gamemode=mp", 2);
    weapon_data add_weapon_info("hero_annihilator", "Annihilator", "gadget", false, "gamemode=mp,wz", 2);
    weapon_data add_weapon_info("hero_annihilator_oic", "Annihilator (OIC)", "gadget", false, "gamemode=mp", 2);
    weapon_data add_weapon_info("hero_flamethrower", "Purifier", "gadget", false, "gamemode=mp,wz", 2);
    weapon_data add_weapon_info("hero_pineapplegun", "War machine", "gadget", false, "gamemode=mp,wz", 2);
    weapon_data add_weapon_info("ability_dog", "Dog", "gadget", false, "gamemode=mp", 2);
    weapon_data add_weapon_info("hero_pineapple_grenade", "War machine pistol", "gadget", false, "gamemode=mp,wz", 2);
    weapon_data add_weapon_info("hero_gravityspikes", "Gravity spikes", "gadget", false, "gamemode=mp", 2);
    weapon_data add_weapon_info("sig_bow_quickshot", "Sparrow", "gadget", false, "gamemode=mp", 2);
    weapon_data add_weapon_info("eq_localheal", "Heal", "gadget", false, "gamemode=mp", 2);
    weapon_data add_weapon_info("gadget_icepick", "Icepick", "gadget", false, "gamemode=mp", 2);
    
    // weapon_data add_weapon_info("inventory_supplydrop_marker", "Supply drop", "scorestreak", false, "gamemode=mp");
    weapon_data add_weapon_info("inventory_counteruav", "C-UAV", "scorestreak", false, "gamemode=mp");
    weapon_data add_weapon_info("inventory_uav", "UAV", "scorestreak", false, "gamemode=mp");
    weapon_data add_weapon_info("inventory_swat_team", "Swat team", "scorestreak", false, "gamemode=mp");
    weapon_data add_weapon_info("inventory_overwatch_helicopter", "Overwatch helicopter", "scorestreak", false, "gamemode=mp");
    weapon_data add_weapon_info("inventory_helicopter_comlink", "Helicopter comlink", "scorestreak", false, "gamemode=mp");
    weapon_data add_weapon_info("inventory_drone_squadron", "Drone squadron", "scorestreak", false, "gamemode=mp");
    weapon_data add_weapon_info("inventory_dart", "Dart", "scorestreak", false, "gamemode=mp");
    weapon_data add_weapon_info("inventory_ac130", "Gunship", "scorestreak", false, "gamemode=mp");
    weapon_data add_weapon_info("inventory_planemortar", "Plane mortar", "scorestreak", false, "gamemode=mp");
    weapon_data add_weapon_info("inventory_remote_missile", "Hellstorm", "scorestreak", false, "gamemode=mp");
    weapon_data add_weapon_info("inventory_straferun", "Straferun", "scorestreak", false, "gamemode=mp");
    weapon_data add_weapon_info("inventory_recon_car", "RCXD", "scorestreak", false, "gamemode=mp");
    weapon_data add_weapon_info("inventory_ultimate_turret", "Turret", "scorestreak", false, "gamemode=mp");
    weapon_data add_weapon_info("inventory_ai_tank_marker", "Mantis", "scorestreak", false, "gamemode=mp");


    array::add(weapon_data.global_weapons, "homunculus_upgraded");
    array::add(weapon_data.global_weapons, "hero_bowlauncher");
    array::add(weapon_data.global_weapons, "drone_squadron");
    array::add(weapon_data.global_weapons, "drone_strike");
    array::add(weapon_data.global_weapons, "emp");
    array::add(weapon_data.global_weapons, "emp_grenade");
    array::add(weapon_data.global_weapons, "emp_turret");
    array::add(weapon_data.global_weapons, "eq_cluster_semtex_grenade");
    array::add(weapon_data.global_weapons, "eq_concertina_wire");
    array::add(weapon_data.global_weapons, "eq_grapple");
    array::add(weapon_data.global_weapons, "eq_gravityslam");
    array::add(weapon_data.global_weapons, "eq_hawk");
    array::add(weapon_data.global_weapons, "eq_localheal");
    array::add(weapon_data.global_weapons, "eq_sensor");
    array::add(weapon_data.global_weapons, "eq_slow_grenade");
    array::add(weapon_data.global_weapons, "eq_slow_grenade_hunter_ph");
    array::add(weapon_data.global_weapons, "eq_smoke");
    array::add(weapon_data.global_weapons, "eq_sticky_grenade");
    array::add(weapon_data.global_weapons, "eq_swat_grenade");
    array::add(weapon_data.global_weapons, "eq_tripwire");
    array::add(weapon_data.global_weapons, "equip_sprout");
    array::add(weapon_data.global_weapons, "flak_drone_rocket");
    array::add(weapon_data.global_weapons, "gadget_armor");
    array::add(weapon_data.global_weapons, "gadget_camo");
    array::add(weapon_data.global_weapons, "gadget_clone");
    array::add(weapon_data.global_weapons, "gadget_health_regen");
    array::add(weapon_data.global_weapons, "gadget_health_regen_squad");
    array::add(weapon_data.global_weapons, "gadget_heat_wave");
    array::add(weapon_data.global_weapons, "gadget_icepick");
    array::add(weapon_data.global_weapons, "gadget_jammer");
    array::add(weapon_data.global_weapons, "gadget_medicalinjectiongun");
    array::add(weapon_data.global_weapons, "gadget_radiation_field");
    array::add(weapon_data.global_weapons, "gadget_resurrect");
    array::add(weapon_data.global_weapons, "gadget_spawnbeacon");
    array::add(weapon_data.global_weapons, "gadget_speed_burst");
    array::add(weapon_data.global_weapons, "gadget_supplypod");
    array::add(weapon_data.global_weapons, "gadget_vision_pulse");
    array::add(weapon_data.global_weapons, "galvaknuckles_t8");
    array::add(weapon_data.global_weapons, "golden_knife");
    array::add(weapon_data.global_weapons, "gun_ultimate_turret");
    array::add(weapon_data.global_weapons, "helicopter_comlink");
    array::add(weapon_data.global_weapons, "hero_pineapple_grenade");
    array::add(weapon_data.global_weapons, "hind_ffar");
    
    array::add(weapon_data.global_weapons, "siegebot_javelin_turret");
    array::add(weapon_data.global_weapons, "siegebot_launcher_turret");
    array::add(weapon_data.global_weapons, "siegebot_launcher_turret_theia");
    array::add(weapon_data.global_weapons, "sig_blade");
    array::add(weapon_data.global_weapons, "sig_buckler");
    array::add(weapon_data.global_weapons, "sig_buckler_dw");
    array::add(weapon_data.global_weapons, "sig_buckler_turret");
    array::add(weapon_data.global_weapons, "sig_minigun");
    array::add(weapon_data.global_weapons, "spike_charge");
    array::add(weapon_data.global_weapons, "spike_charge_siegebot");
    array::add(weapon_data.global_weapons, "spike_charge_siegebot_theia");
    array::add(weapon_data.global_weapons, "spike_launcher");
    array::add(weapon_data.global_weapons, "spike_launcher_cpzm");
    array::add(weapon_data.global_weapons, "sticky_grenade");
    array::add(weapon_data.global_weapons, "hero_gravityspikes");
    array::add(weapon_data.global_weapons, "killstreak_ai_tank");
    array::add(weapon_data.global_weapons, "killstreak_qrdrone");
    // array::add(weapon_data.global_weapons, "killstreak_remote");
    array::add(weapon_data.global_weapons, "microwave_turret");
    array::add(weapon_data.global_weapons, "microwave_turret_deploy");
    array::add(weapon_data.global_weapons, "minigun");
    array::add(weapon_data.global_weapons, "music_box");
    array::add(weapon_data.global_weapons, "overwatch_helicopter");
    //array::add(weapon_data.global_weapons, "parachute");
    array::add(weapon_data.global_weapons, "planemortar");
    array::add(weapon_data.global_weapons, "recon_car");
    array::add(weapon_data.global_weapons, "remote_missile");
    array::add(weapon_data.global_weapons, "remote_missile_bomblet");
    array::add(weapon_data.global_weapons, "rider_spear_projectile");
    array::add(weapon_data.global_weapons, "riotshield");
    array::add(weapon_data.global_weapons, "satchel_charge");
    array::add(weapon_data.global_weapons, "satellite");
    array::add(weapon_data.global_weapons, "scavenger_item");
    array::add(weapon_data.global_weapons, "scavenger_item_hack");
    array::add(weapon_data.global_weapons, "scrambler");
    array::add(weapon_data.global_weapons, "seeker_mine_arc");
    array::add(weapon_data.global_weapons, "spectre_grenade");
    array::add(weapon_data.global_weapons, "spknifeork");
    array::add(weapon_data.global_weapons, "spoon_alcatraz");
    array::add(weapon_data.global_weapons, "spork_alcatraz");
    array::add(weapon_data.global_weapons, "stake_knife");
    array::add(weapon_data.global_weapons, "sprint_boost_grenade");
    array::add(weapon_data.global_weapons, "straferun");
    //array::add(weapon_data.global_weapons, "straferun_gun");
    //array::add(weapon_data.global_weapons, "straferun_rockets");
    array::add(weapon_data.global_weapons, "supplydrop");
    array::add(weapon_data.global_weapons, "swat_team");
    array::add(weapon_data.global_weapons, "tank_robot");
    array::add(weapon_data.global_weapons, "tank_robot_launcher_turret");
    array::add(weapon_data.global_weapons, "uav");
    array::add(weapon_data.global_weapons, "ultimate_turret");
    array::add(weapon_data.global_weapons, "ultimate_turret_deploy");
    array::add(weapon_data.global_weapons, "weapon_null");
    array::add(weapon_data.global_weapons, "wraith_fire_fire");
    array::add(weapon_data.global_weapons, "zhield_dw");
    array::add(weapon_data.global_weapons, "zhield_frost_dw");
    array::add(weapon_data.global_weapons, "zhield_zpear_dw");
    array::add(weapon_data.global_weapons, "zhield_zpear_turret");
    array::add(weapon_data.global_weapons, "zombie_ai_defaultmelee");
    array::add(weapon_data.global_weapons, "zombie_builder");
    array::add(weapon_data.global_weapons, "zombie_fists");
    array::add(weapon_data.global_weapons, "bowie_knife");
    array::add(weapon_data.global_weapons, "bowie_knife_story_1");
    array::add(weapon_data.global_weapons, "camera_spike");
    array::add(weapon_data.global_weapons, "cobra_20mm");
    //array::add(weapon_data.global_weapons, "cobra_20mm_comlink");
    array::add(weapon_data.global_weapons, "combat_robot_marker");
    array::add(weapon_data.global_weapons, "counteruav");
    array::add(weapon_data.global_weapons, "cymbal_monkey");
    array::add(weapon_data.global_weapons, "dart");
    array::add(weapon_data.global_weapons, "dart_blade");
    array::add(weapon_data.global_weapons, "dart_turret");
    //array::add(weapon_data.global_weapons, "destructible_car");
    array::add(weapon_data.global_weapons, "dog_ai_defaultmelee");
    array::add(weapon_data.global_weapons, #"hash_114729f4d5a8d08c");
    array::add(weapon_data.global_weapons, #"hash_117b6097e272dd1f");
    array::add(weapon_data.global_weapons, #"hash_136814846f94f0cd");
    array::add(weapon_data.global_weapons, #"hash_158041aab1e14f3a");
    array::add(weapon_data.global_weapons, #"hash_166200a2e04510f4");
    array::add(weapon_data.global_weapons, #"hash_1773b576c62a506");
    array::add(weapon_data.global_weapons, #"hash_17f9f60ce4ea5074");
    array::add(weapon_data.global_weapons, #"hash_185abc5c82e9d849");
    array::add(weapon_data.global_weapons, #"hash_18c353e6053566bd");
    array::add(weapon_data.global_weapons, #"hash_19049416fc420e6f");
    array::add(weapon_data.global_weapons, #"hash_19abd3767bd1566d");
    array::add(weapon_data.global_weapons, #"hash_1b92c0a29a45b07c");
    array::add(weapon_data.global_weapons, #"hash_1d2a0f56220e6ff6");
    array::add(weapon_data.global_weapons, #"hash_1d2a1056220e71a9");
    array::add(weapon_data.global_weapons, #"hash_1d2a1156220e735c");
    array::add(weapon_data.global_weapons, #"hash_1d2a1256220e750f");
    array::add(weapon_data.global_weapons, #"hash_1d8ec79043d16eb");
    array::add(weapon_data.global_weapons, #"hash_1db9fa8f7231f179");
    array::add(weapon_data.global_weapons, #"hash_216eeca7a4295e4");
    array::add(weapon_data.global_weapons, #"hash_2182349b1e42e1a4");
    array::add(weapon_data.global_weapons, #"hash_24840aebcc206215");
    array::add(weapon_data.global_weapons, #"hash_26ffb92552ae26be");
    array::add(weapon_data.global_weapons, #"hash_27e4878539bc7f72");
    array::add(weapon_data.global_weapons, #"hash_28323cd36d8b5f93");
    array::add(weapon_data.global_weapons, #"hash_286a30586a6aed12");
    array::add(weapon_data.global_weapons, #"hash_291e1c117ebbf5e6");
    array::add(weapon_data.global_weapons, #"hash_2b3a2f2eeada34a8");
    array::add(weapon_data.global_weapons, #"hash_2ca35808b452d993");
    array::add(weapon_data.global_weapons, #"hash_31be8125c7d0f273");
    array::add(weapon_data.global_weapons, #"hash_33be4792feeabece");
    array::add(weapon_data.global_weapons, #"hash_34575452eba07c65");
    array::add(weapon_data.global_weapons, #"hash_38c782e8db011867");
    array::add(weapon_data.global_weapons, #"hash_38ffd09564931482");
    array::add(weapon_data.global_weapons, #"hash_3b38033eca0a3bdd");
    array::add(weapon_data.global_weapons, #"hash_3b5610f58856b4ea");
    array::add(weapon_data.global_weapons, #"hash_3f62a872201cd1ce");
    array::add(weapon_data.global_weapons, #"hash_3fec64a2af587850");
    array::add(weapon_data.global_weapons, #"hash_40380537847df901");
    array::add(weapon_data.global_weapons, #"hash_42895043be26dc73");
    array::add(weapon_data.global_weapons, #"hash_42a45d43be3dba42");
    array::add(weapon_data.global_weapons, #"hash_46a10de5f2b5c030");
    array::add(weapon_data.global_weapons, #"hash_46a10fe5f2b5c396");
    array::add(weapon_data.global_weapons, #"hash_46a110e5f2b5c549");
    array::add(weapon_data.global_weapons, #"hash_49441cf211e409b9");
    array::add(weapon_data.global_weapons, #"hash_494e18dad9bd3acb");
    array::add(weapon_data.global_weapons, #"hash_494e1ddad9bd434a");
    array::add(weapon_data.global_weapons, #"hash_494e1edad9bd44fd");
    array::add(weapon_data.global_weapons, #"hash_494f5501b3f8e1e9");
    array::add(weapon_data.global_weapons, #"hash_4aa70c9036cc210e");
    array::add(weapon_data.global_weapons, #"hash_4b92b1a2aa3037f5");
    array::add(weapon_data.global_weapons, #"hash_5517c404e6d9592b");
    array::add(weapon_data.global_weapons, #"hash_5517c504e6d95ade");
    array::add(weapon_data.global_weapons, #"hash_5517c604e6d95c91");
    array::add(weapon_data.global_weapons, #"hash_5624a55eb03372d0");
    array::add(weapon_data.global_weapons, #"hash_579652e2459b8c74");
    array::add(weapon_data.global_weapons, #"hash_5a7fd1af4a1d5c9");
    array::add(weapon_data.global_weapons, #"hash_5ce0422cff84b2b3");
    array::add(weapon_data.global_weapons, #"hash_5e1f4dd6a8a34700");
    array::add(weapon_data.global_weapons, #"hash_5fbda3ef4b135b49");
    array::add(weapon_data.global_weapons, #"hash_615e6c73989c85b4");
    array::add(weapon_data.global_weapons, #"hash_617dcc39334959ce");
    array::add(weapon_data.global_weapons, #"hash_661d3f578391fdda");
    array::add(weapon_data.global_weapons, #"hash_66401df7cd6bf292");
    array::add(weapon_data.global_weapons, #"hash_6a9069969e6fa287");
    array::add(weapon_data.global_weapons, #"hash_6b525d940c1c1e39");
    array::add(weapon_data.global_weapons, #"hash_721bd01efec90239");
    array::add(weapon_data.global_weapons, #"hash_7264d6f24a950a5b");
    array::add(weapon_data.global_weapons, #"hash_72cba96681a7af18");
    array::add(weapon_data.global_weapons, #"hash_740692024876c999");
    array::add(weapon_data.global_weapons, #"hash_753ba1d1412a4962");
    array::add(weapon_data.global_weapons, #"hash_76d1218de27081f6");
    array::add(weapon_data.global_weapons, #"hash_78e66b21aa05c753");
    array::add(weapon_data.global_weapons, #"hash_7932008294f0d876");
    array::add(weapon_data.global_weapons, #"hash_79fccf9f83bf7568");
    array::add(weapon_data.global_weapons, #"hash_7a42b57be462143f");
    array::add(weapon_data.global_weapons, #"hash_7a88daffaea7a9cf");
    array::add(weapon_data.global_weapons, #"hash_7ab3f9a730359659");
    array::add(weapon_data.global_weapons, #"hash_7ca6d96b2bfb822c");
    array::add(weapon_data.global_weapons, #"hash_7ca6dc6b2bfb8745");
    array::add(weapon_data.global_weapons, #"hash_7d040bd867e93061");
    array::add(weapon_data.global_weapons, #"hash_8a4d8f38ca65ff0");
    array::add(weapon_data.global_weapons, #"hash_8c773df059a6d5e");
    array::add(weapon_data.global_weapons, #"hash_a2556a2905fd952");
    array::add(weapon_data.global_weapons, #"hash_a3fa25abdd4b905");
    array::add(weapon_data.global_weapons, #"hash_eb070d4a71cdba8");
    array::add(weapon_data.global_weapons, #"hash_eb072d4a71cdf0e");
    array::add(weapon_data.global_weapons, #"hash_eb073d4a71ce0c1");

    array::add(weapon_data.global_weapons, "pistol_standard");
    array::add(weapon_data.global_weapons, "pistol_revolver38");
    array::add(weapon_data.global_weapons, "pistol_burst");
    array::add(weapon_data.global_weapons, "pistol_fullauto");
    array::add(weapon_data.global_weapons, "pistol_shotgun_dw");
    array::add(weapon_data.global_weapons, "pistol_energy");
    array::add(weapon_data.global_weapons, "smg_standard");
    array::add(weapon_data.global_weapons, "smg_versatile");
    array::add(weapon_data.global_weapons, "smg_capacity");
    array::add(weapon_data.global_weapons, "smg_fastfire");
    array::add(weapon_data.global_weapons, "smg_burst");
    array::add(weapon_data.global_weapons, "smg_longrange");
    array::add(weapon_data.global_weapons, "smg_sten");
    array::add(weapon_data.global_weapons, "smg_mp40");
    array::add(weapon_data.global_weapons, "smg_ppsh");
    array::add(weapon_data.global_weapons, "smg_thompson");
    array::add(weapon_data.global_weapons, "ar_standard");
    array::add(weapon_data.global_weapons, "ar_cqb");
    array::add(weapon_data.global_weapons, "ar_accurate");
    array::add(weapon_data.global_weapons, "ar_damage");
    array::add(weapon_data.global_weapons, "ar_marksman");
    array::add(weapon_data.global_weapons, "ar_longburst");
    array::add(weapon_data.global_weapons, "ar_garand");
    array::add(weapon_data.global_weapons, "ar_famas");
    array::add(weapon_data.global_weapons, "ar_peacekeeper");
    array::add(weapon_data.global_weapons, "shotgun_pump");
    array::add(weapon_data.global_weapons, "shotgun_semiauto");
    array::add(weapon_data.global_weapons, "shotgun_fullauto");
    array::add(weapon_data.global_weapons, "shotgun_precision");
    array::add(weapon_data.global_weapons, "shotgun_energy");
    array::add(weapon_data.global_weapons, "lmg_light");
    array::add(weapon_data.global_weapons, "lmg_cqb");
    array::add(weapon_data.global_weapons, "lmg_slowfire");
    array::add(weapon_data.global_weapons, "lmg_heavy");
    array::add(weapon_data.global_weapons, "sniper_fastsemi");
    array::add(weapon_data.global_weapons, "sniper_fastbolt");
    array::add(weapon_data.global_weapons, "sniper_powerbolt");
    array::add(weapon_data.global_weapons, "launcher_standard");
    array::add(weapon_data.global_weapons, "launcher_multi");
    array::add(weapon_data.global_weapons, "special_crossbow_dw");
    array::add(weapon_data.global_weapons, "ray_gun");
    array::add(weapon_data.global_weapons, "idgun");
    array::add(weapon_data.global_weapons, "idgun_0");
    array::add(weapon_data.global_weapons, "idgun_1");
    array::add(weapon_data.global_weapons, "idgun_2");
    array::add(weapon_data.global_weapons, "idgun_3");
    array::add(weapon_data.global_weapons, "idgun_upgraded_0");
    array::add(weapon_data.global_weapons, "idgun_upgraded_1");
    array::add(weapon_data.global_weapons, "idgun_upgraded_2");
    array::add(weapon_data.global_weapons, "idgun_upgraded_3");
    array::add(weapon_data.global_weapons, "tesla_gun");
    array::add(weapon_data.global_weapons, "tesla_gun_upgraded");
    array::add(weapon_data.global_weapons, "hero_annihilator");
    array::add(weapon_data.global_weapons, "elemental_bow");
    array::add(weapon_data.global_weapons, "elemental_bow_storm");
    array::add(weapon_data.global_weapons, "elemental_bow_demongate");
    array::add(weapon_data.global_weapons, "elemental_bow_rune_prison");
    array::add(weapon_data.global_weapons, "elemental_bow_wolf_howl");
    array::add(weapon_data.global_weapons, "hero_gravityspikes_melee");
    array::add(weapon_data.global_weapons, "hero_mirg2000");
    array::add(weapon_data.global_weapons, "hero_mirg2000_upgraded");
    array::add(weapon_data.global_weapons, "skull_gun");
    array::add(weapon_data.global_weapons, "raygun_mark3");
    array::add(weapon_data.global_weapons, "dragon_gauntlet_flamethrower");
    array::add(weapon_data.global_weapons, "melee_wrench");
    array::add(weapon_data.global_weapons, "melee_dagger");
    array::add(weapon_data.global_weapons, "melee_fireaxe");
    array::add(weapon_data.global_weapons, "melee_sword");
    array::add(weapon_data.global_weapons, "thundergun");
    array::add(weapon_data.global_weapons, "melee_nunchuks");
    array::add(weapon_data.global_weapons, "melee_mace");
    array::add(weapon_data.global_weapons, "melee_improvise");
    array::add(weapon_data.global_weapons, "melee_boneglass");
    array::add(weapon_data.global_weapons, "melee_katana");
    array::add(weapon_data.global_weapons, "minigun");
    array::add(weapon_data.global_weapons, "cymbal_monkey");
    array::add(weapon_data.global_weapons, "octobomb");
    array::add(weapon_data.global_weapons, "octobomb_upgraded");
    array::add(weapon_data.global_weapons, "glaive_apothicon_0");
    array::add(weapon_data.global_weapons, "glaive_apothicon_1");
    array::add(weapon_data.global_weapons, "glaive_apothicon_2");
    array::add(weapon_data.global_weapons, "glaive_apothicon_3");
    array::add(weapon_data.global_weapons, "glaive_keeper_0");
    array::add(weapon_data.global_weapons, "glaive_keeper_1");
    array::add(weapon_data.global_weapons, "glaive_keeper_2");
    array::add(weapon_data.global_weapons, "glaive_keeper_3");
    array::add(weapon_data.global_weapons, "knife");
    array::add(weapon_data.global_weapons, "bowie_knife");
    array::add(weapon_data.global_weapons, "defaultweapon");
    array::add(weapon_data.global_weapons, "zod_riotshield");
    array::add(weapon_data.global_weapons, "zod_riotshield_upgraded");
    array::add(weapon_data.global_weapons, "hero_gravityspikes");
    array::add(weapon_data.global_weapons, "zombie_beast_grapple_dwr");
}

add_mastercraft(weapon_name, variant_name, variant_id) {
    if (!isdefined(self.mc[weapon_name])) {
        self.mc[weapon_name] = {
            #name: weapon_name,
            #variants: array()
        };
    }
    if (!isdefined(self.all[weapon_name])) {
        self.all[weapon_name] = {
            #name: weapon_name,
            #variants: array()
        };
    }
    variant_data = {
        #name: variant_name,
        #id: variant_id
    };

    array::add(self.mc[weapon_name].variants, variant_data);
    array::add(self.all[weapon_name].variants, variant_data);
}
add_mk2(weapon_name, variant_name, variant_id) {
    if (!isdefined(self.mk2[weapon_name])) {
        self.mk2[weapon_name] = {
            #name: weapon_name,
            #variants: array()
        };
    }
    if (!isdefined(self.all[weapon_name])) {
        self.all[weapon_name] = {
            #name: weapon_name,
            #variants: array()
        };
    }
    variant_data = {
        #name: variant_name,
        #id: variant_id
    };

    array::add(self.mk2[weapon_name].variants, variant_data);
    array::add(self.all[weapon_name].variants, variant_data);
}


get_mastercraft_enum_data() {
    if (!isdefined(level.atian_enum_data)) {
        generate_enum_values();
    }
    return level.atian_enum_data.mastercraft_data;
}

generate_mastercraft_enum() {
    if (isdefined(self.mastercraft_data)) {
        return;
    }
    mastercraft_data = {
        #mk2: array(),
        #mc: array(),
        #all: array()
    };
    self.mastercraft_data = mastercraft_data;

    // AR

    mastercraft_data add_mk2("ar_accurate_t8", "MK2", 1);
    mastercraft_data add_mastercraft("ar_accurate_t8", "MC 1", 2);
    mastercraft_data add_mastercraft("ar_accurate_t8", "MC 2", 3);

    mastercraft_data add_mk2("ar_damage_t8", "MK2", 1);
    mastercraft_data add_mastercraft("ar_damage_t8", "MC", 2);
    
    mastercraft_data add_mk2("ar_fastfire_t8", "MK2", 1);
    mastercraft_data add_mastercraft("ar_fastfire_t8", "MC", 2);

    mastercraft_data add_mk2("ar_stealth_t8", "MK2", 3);
    mastercraft_data add_mastercraft("ar_stealth_t8", "MC VAmPiRe", 2);
    
    mastercraft_data add_mk2("ar_peacekeeper_t8", "MK2", 1);

    mastercraft_data add_mk2("ar_standard_t8", "MK2", 1);
    mastercraft_data add_mastercraft("ar_standard_t8", "MC", 2);

    // LMG

    mastercraft_data add_mk2("lmg_standard_t8", "MK2", 1);
    mastercraft_data add_mastercraft("lmg_standard_t8", "MC", 2);
    
    mastercraft_data add_mk2("lmg_heavy_t8", "MK2", 3);
    mastercraft_data add_mastercraft("lmg_heavy_t8", "MC", 2);

    mastercraft_data add_mastercraft("lmg_spray_t8", "MC", 1);
    
    mastercraft_data add_mk2("lmg_stealth_t8", "MK2", 1);

    // PISTOL
    
    mastercraft_data add_mk2("pistol_standard_t8", "MK2", 1);
    mastercraft_data add_mastercraft("pistol_standard_t8", "MC", 2);
    
    mastercraft_data add_mastercraft("pistol_burst_t8", "MC", 2);
    
    mastercraft_data add_mk2("pistol_revolver_t8", "MK2", 3);
    mastercraft_data add_mastercraft("pistol_revolver_t8", "MC", 2);
    
    mastercraft_data add_mk2("pistol_fullauto_t8", "MK2", 1);
    mastercraft_data add_mastercraft("pistol_fullauto_t8", "MC", 2);
    
    // SHOTGUNS
    
    mastercraft_data add_mk2("shotgun_pump_t8", "MK2", 2);
    mastercraft_data add_mastercraft("shotgun_pump_t8", "MC", 3);
    
    mastercraft_data add_mk2("shotgun_semiauto_t8", "MK2", 1);
    mastercraft_data add_mastercraft("shotgun_semiauto_t8", "MC", 2);
    
    mastercraft_data add_mk2("shotgun_fullauto_t8", "MK2", 1);
    mastercraft_data add_mastercraft("shotgun_fullauto_t8", "MC", 2);

    // SMG
    
    mastercraft_data add_mk2("smg_accurate_t8", "MK2", 1);
    mastercraft_data add_mastercraft("smg_accurate_t8", "MC 1", 2);
    mastercraft_data add_mastercraft("smg_accurate_t8", "MC 2", 2);
    
    mastercraft_data add_mk2("smg_capacity_t8", "MK2", 2);
    mastercraft_data add_mastercraft("smg_capacity_t8", "MC", 3);
    
    mastercraft_data add_mk2("smg_fastfire_t8", "MK2", 3);
    mastercraft_data add_mastercraft("smg_fastfire_t8", "MC", 2);
    
    mastercraft_data add_mk2("smg_handling_t8", "MK2", 3);
    mastercraft_data add_mastercraft("smg_handling_t8", "MC", 2);
    
    mastercraft_data add_mk2("smg_standard_t8", "MK2", 1);
    mastercraft_data add_mastercraft("smg_standard_t8", "MC", 2);
    
    mastercraft_data add_mk2("smg_fastburst_t8", "MK2", 1);
    mastercraft_data add_mastercraft("smg_fastburst_t8", "MC", 2);
    
    mastercraft_data add_mk2("smg_folding_t8", "MK2", 1);

    // SNIPER
    
    mastercraft_data add_mastercraft("sniper_damagesemi_t8", "MC", 2);

    mastercraft_data add_mastercraft("sniper_fastrechamber_t8", "MC", 2);

    mastercraft_data add_mk2("sniper_mini14_t8", "MK2", 1);

    mastercraft_data add_mk2("sniper_powerbolt_t8", "MK2", 3);
    mastercraft_data add_mastercraft("sniper_powerbolt_t8", "MC", 2);

    // TODO: forgot sniper_quickscope_t8

    // TACTICAL RIFLE

    mastercraft_data add_mk2("tr_flechette_t8", "MK2", 2);
    mastercraft_data add_mastercraft("tr_flechette_t8", "MC", 1);

    mastercraft_data add_mk2("tr_longburst_t8", "MK2", 3);
    mastercraft_data add_mastercraft("tr_longburst_t8", "MC", 2);

    mastercraft_data add_mk2("tr_midburst_t8", "MK2", 3);
    mastercraft_data add_mastercraft("tr_midburst_t8", "MC", 2);

}
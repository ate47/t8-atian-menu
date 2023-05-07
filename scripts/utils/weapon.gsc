func_give_weapon(item, weapon_name, mastercraft_id = undefined, upgraded = false) {
    hash_name = hash(weapon_name);
    if (isdefined(upgraded) && upgraded) {
        // we need to that at this point, otherwise we will need to call hash tool many times
        hash_name = hash_name + "_upgraded";
    }
    weapon = getweapon(hash_name);

    if (isdefined(weapon)) {
        if (!isdefined(mastercraft_id)) {
            mastercraft_id = 0;
        }
        weapon_options = self calcweaponoptions(0, 0, mastercraft_id);

        old_weapon = self GetCurrentWeapon();

        if (isdefined(old_weapon)) {
            self takeweapon(old_weapon);
        }

        self giveweapon(weapon, weapon_options);
    } else {
        self iPrintLn("unknown weapon " + weapon_name);
    }
    return true;
}

func_give_random_mastercraft(item, upgraded = false) {
    mastercraft_data = get_mastercraft_enum_data();
    weapon_data = array::random(mastercraft_data.all);
    if (!isdefined(weapon_data)) {
        return;
    }
    
    variant_data = array::random(weapon_data.variants);
    
    if (!isdefined(variant_data)) {
        return;
    }

    if (!isdefined(upgraded)) {
        upgraded = false;
    }
    
    func_give_weapon(item, weapon_data.name, variant_data.id, upgraded);
}

func_set_camo(item, data) {
    self Set_Camo(data, undefined);
    return true;
}

func_set_reticle(item, data) {
    SetReticle(data);
    return true;
}

SetReticle(reticle) {
    weapon = self getCurrentWeapon();
    if (isdefined(weapon)) {
        self takeweapon(weapon);
        camo_index = getCamoIndex(self getBuildKitWeaponOptions(weapon));
        weapon_options = self calcweaponoptions(camo_index, reticle, 0);
        
        self giveweapon(weapon, weapon_options);
    }
}

func_setweaponoptreset(item, data) {
    self.am_opt_dev = undefined;
}

getweaponoptdev() {
    if (!isdefined(self.am_opt_dev)) {
        self.am_opt_dev = spawnstruct();
        self.am_opt_dev.opt1 = 0;
        self.am_opt_dev.opt2 = 0;
        self.am_opt_dev.opt3 = 0;
    }
    return self.am_opt_dev;
}

func_setweaponopt3(item, data) {
    weapon = self getCurrentWeapon();
    
    if (isdefined(weapon)) {
        opt = self getweaponoptdev();
        opt.opt1 = int(data);
        weapon_options = self calcweaponoptions(0, 0, opt.opt1, opt.opt2, opt.opt3);
        if (!isdefined(weapon_options)) {
            self iPrintLnBold("^1Bad variant: ^4" + data);
            return;
        }
        self takeweapon(weapon);
        self giveweapon(weapon, weapon_options);
    }
}
func_setweaponopt4(item, data) {
    weapon = self getCurrentWeapon();
    if (isdefined(weapon)) {
        opt = self getweaponoptdev();
        opt.opt2 = int(data);
        weapon_options = self calcweaponoptions(0, 0, opt.opt1, opt.opt2, opt.opt3);
        if (!isdefined(weapon_options)) {
            self iPrintLnBold("^1Bad variant: ^4" + data);
            return;
        }
        self takeweapon(weapon);
        self giveweapon(weapon, weapon_options);
    }
}
func_setweaponopt5(item, data) {
    weapon = self getCurrentWeapon();
    if (isdefined(weapon)) {
        opt = self getweaponoptdev();
        opt.opt3 = int(data);
        weapon_options = self calcweaponoptions(0, 0, opt.opt1, opt.opt2, opt.opt3);
        if (!isdefined(weapon_options)) {
            self iPrintLnBold("^1Bad variant: ^4" + data);
            return;
        }
        self takeweapon(weapon);
        self giveweapon(weapon, weapon_options);
    }
}

Set_Camo(id, reticle) {
    weapon = self GetCurrentWeapon();

    if (isdefined(weapon)) {
        if (!isdefined(reticle) || !reticle) {
            self setcamo(weapon, id);
            return;
        }
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
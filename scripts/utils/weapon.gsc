func_give_weapon(item, weapon_name) {
    weapon = getweapon(hash(weapon_name));

    if (isdefined(weapon)) {
        weapon_options = self calcweaponoptions(0, 0, 0);

        old_weapon = self GetCurrentWeapon();

        if (isdefined(old_weapon)) {
            self takeweapon(old_weapon);
        }

        self giveweapon(weapon, weapon_options);

        if (isdefined(weapon.name)) {
            self iPrintLn("gave weapon : " + weapon.name);
        } else {
            self iPrintLn("gave weapon nn: " + weapon_name);
        }
    } else {
        self iPrintLn("unknown weapon " + weapon_name);
    }
    return true;
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

func_setweaponopt3(item, data) {
    weapon = self getCurrentWeapon();
    if (isdefined(weapon)) {
        weapon_options = self calcweaponoptions(0, 0, int(data));
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
        weapon_options = self calcweaponoptions(0, 0, 0, int(data));
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
        weapon_options = self calcweaponoptions(0, 0, 0, 0, int(data));
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
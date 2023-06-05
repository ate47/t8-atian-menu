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
        
        self giveweapon(weapon, weapon_options);
        self switchtoweapon(weapon);
    } else {
        self iPrintLn("unknown weapon " + weapon_name);
    }
    return true;
}

func_drop(item) {
    weapon = self getcurrentweapon();
    if (isdefined(weapon) && self hasweapon(weapon)) {
        self dropitem(weapon);
    }
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
func_searchattachment(menu) {
    // clear attach
    menu.sub_menus = array();

    weapon = self getcurrentweapon();

    if (!isdefined(weapon) || !isdefined(weapon.supportedattachments)) {
        return;
    }

    attachments = getWeaponAttachments(weapon);

    if (!isdefined(attachments)) {
        attachments = array();
    }

    foreach (attachment in weapon.supportedattachments) {
        if (attachment == "null" || attachment == "none") {
            continue; // we don't want them
        }
        if (array::contains(attachments, attachment)) {
            suffix = " - Remove";
        } else {
            suffix = " - Add";
        }
        self add_menu_item(menu.id, "" + attachment + suffix, &func_setdattachment, weapon, attachment);
    }
}

func_setdattachment(item, weapon, attachment) {
    if (!isdefined(weapon.name)) {
        self iprintlnbold("^9bad weapon");
        return;
    }

    attachments = getWeaponAttachments(weapon);
    weapon_options = self getweaponoptions(weapon);

    if (!isdefined(attachments)) {
        attachments = array();
    }

    if (array::contains(attachments, attachment)) {
        // remove the attachment
        arrayremovevalue(attachments, attachment);

    } else {
        // add the attachment
        array::add(attachments, attachment, true);
    }

    new_weapon = getweapon(weapon.name, attachments);
    
    if (!isdefined(new_weapon)) {
        self iprintlnbold("^9bad new weapon: ^1" + weapon.name);
        return;
    }
    self takeweapon(weapon);
    self giveweapon(new_weapon, weapon_options);
}

func_setgadget(item, gadget, slot) {
    if (isdefined(self._gadgets_player) && isdefined(self._gadgets_player[slot])) {
        old_gadget = self._gadgets_player[slot];

        self takeWeapon(old_gadget); // remove the old gadget for this slot
    }
    self giveWeapon(getweapon(gadget));
}

func_searchgadgets(menu) {
    // clear attach
    menu.sub_menus = array();

    if (isdefined(self._gadgets_player)) {
        foreach (g_key, gadget in self._gadgets_player) {
            self add_menu_item(menu.id, "p: " + get_object_type(g_key) + " - " + hash_lookup(nullable_to_str(gadget.name)));
        }
    }
    
    if (isdefined(level._gadgets_level)) {
        foreach (g_key, gadget in level._gadgets_level) {
            self add_menu_item(menu.id, "l: " + get_object_type(g_key));
        }
    }
}

func_searchkillstreaks(menu) {
    // clear attach
    menu.sub_menus = array();

    if (isdefined(self.killstreak)) {
        foreach (killstreak in self.killstreak) {
            if (isdefined(killstreak.weapon) && isdefined(killstreak.weapon.name)) {
                self add_menu_item(menu.id, "p: " + hash_lookup(nullable_to_str(killstreak.weapon.name)));
            }
        }
    }
    
    if (isdefined(level.killstreaks)) {
        foreach (ks_key, killstreak in level.killstreaks) {
            if (isdefined(killstreak.weapon) && isdefined(killstreak.weapon.name)) {
                self add_menu_item(menu.id, "l: " + hash_lookup(nullable_to_str(killstreak.weapon.name)));
            } else {
                self add_menu_item(menu.id, "l: " + get_object_type(ks_key) + " (ukn)");
            }
        }
    }
}

is_killstreak_weapon(weapon) {
	if (weapon == level.weaponnone || weapon.notkillstreak) {
		return false;
	}
	if (weapon.isspecificuse || is_weapon_associated_with_killstreak(weapon)) {
		return true;
	}
	return false;
}

is_weapon_associated_with_killstreak(weapon) {
	return isdefined(level.killstreakweapons) && isdefined(level.killstreakweapons[weapon]);
}

unknow_give_killstreak(killstreak_type) {
    self iPrintLnBold("^9can't find give_killstreak function");
}

get_killstreak_give_func() {
    if (isdefined(level.am_give_killstreak)) {
        return level.am_give_killstreak;
    }

    if (!isdefined(level.cratetypes) 
        || !isdefined(level.cratetypes["supplydrop"])
        || level.cratetypes["supplydrop"].size == 0
        ) {
        return &unknow_give_killstreak;
    }

    foreach (skey, supply_weapon in level.cratetypes["supplydrop"]) {
        if (isdefined(supply_weapon.givefunction)) {
            level.am_give_killstreak = supply_weapon.givefunction;
            return supply_weapon.givefunction;
        }
    }
    return &unknow_give_killstreak;
}

give_killstreak(killstreak_type) {
    self [[ get_killstreak_give_func() ]](killstreak_type);
}

func_clear_killstreaks(item) {
    wl = self getWeaponsList();
    for (i = 0; i < wl.size; i++) {
        if (is_killstreak_weapon(wl)) {
            self takeWeapon(wl);
        }
    }
}

func_give_killstreak(item, killstreak_type) {
    self give_killstreak(killstreak_type);
}
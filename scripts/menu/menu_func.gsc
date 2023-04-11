
menu_handlefunc(item, func_name, data, data2, data3, data4, data5) {
    switch (func_name) {
    case "func_helloworld":
        return self func_helloworld(data);
    case "func_give_weapon":
        return self func_give_weapon(data);
    case "func_set_map":
        return self func_set_map(data);
    case "func_set_gametype":
        return self func_set_gametype(data);
    case "func_set_mapgametype":
        return self func_set_mapgametype(data, data2);
    case "func_3rdperson":
        return self func_3rdperson(item);
    case "func_tpgun":
        return self func_tpgun(item);
    case "func_tankgun":
        return self func_tankgun(item);
    case "func_set_char":
        return self func_set_char(data);
    case "func_set_camo":
        return self func_set_camo(data);
    case "func_set_reticle":
        return self func_set_reticle(data);
    case "func_set_skin_custom":
        return self func_set_skin_custom(data);
    case "func_set_skin_custom_clear":
        return self func_set_skin_custom_clear();
    case "func_set_skin_custom_palette":
        return self func_set_skin_custom_palette(data);
    case "func_set_skin_custom_decal":
        return self func_set_skin_custom_decal(data);
    case "func_set_skin_custom_warpaint":
        return self func_set_skin_custom_warpaint(data);
    case "func_invulnerability":
        return self func_invulnerability(item);
    case "func_end_contracts":
        return self func_end_contracts();
    case "func_test":
        return self func_test(item);
    case "func_inf_revive":
        return self func_inf_revive(item); 
    case "func_round_add":
        return self func_round_add(data);
    case "func_round_set":
        return self func_round_set(data);
    case "func_kill_zombies":
        return self func_kill_zombies();
    case "mod_switch":
        return self mod_switch(item, data);
    case "menu_switch":
        return self menu_switch(data);
    default: 
        self iPrintLnBold("^1bad function " + func_name);
        return self menu_switch();
    }
}
func_helloworld(text) {
    if (isdefined(text)) {
        self iprintln(text);
    }
    weapon = self GetCurrentWeapon();
    if (isdefined(weapon) && isdefined(weapon.name)) {
        str_weapon = weapon.name;
        self iprintln("weapon: " + weapon.name);
    }
    if (isdefined(level.gametype)) {
        self iprintln("gtype:  " + level.gametype);
    }
    if (isdefined(get_gamemode())) {
        self iprintln("gmode:  " + get_gamemode());
    }
    if (isdefined(level.script)) {
        self iprintln("map:    " + level.script);
    }
    if (isdefined(self.origin)) {
        self iprintln("origin: " + self.origin);
    }
    role = self player_role::get();
    if (isdefined(role)) {
        self iprintln("role:   " + role);
    }
    self.menu_info.no_render = true;
}

func_give_weapon(weapon_name) {
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
}

func_tpgun(item) {
    if (!isdefined(self.tool_tpgun)) {
        self.tool_tpgun = false;
    }

    self.tool_tpgun = !self.tool_tpgun;

    item.activated = self.tool_tpgun;
    return true;
}

func_tankgun(item) {
    if (!isdefined(self.tool_tankgun)) {
        self.tool_tankgun = false;
    }

    self.tool_tankgun = !self.tool_tankgun;

    item.activated = self.tool_tankgun;
    return true;
}

func_3rdperson(item) {
    if (!isdefined(self.thirdperson)) {
        self.thirdperson = false;
    }

    self.thirdperson = !self.thirdperson;

    item.activated = self.thirdperson;
    
    self setclientthirdperson(self.thirdperson);
    return true;
}

func_set_mapgametype(map_name, gametype) {
    self iPrintLn("loading map " + map_name + " with mode " + gametype);

    switchmap_load(map_name, gametype);
    wait(1);
    switchmap_switch();
}

func_set_map(map_name) {
    self iPrintLn("loading " + map_name);

    map(map_name);
    wait(1);
    switchmap_switch();
}
func_set_gametype(gametype) {
    map_name = util::get_map_name();
    self iPrintLn("loading mode " + gametype);

    switchmap_load(map_name, gametype);
    wait(1);
    switchmap_switch();
}

func_set_char(character_id) {
    self setspecialistindex(character_id);
    self player_role::update_fields();

    // clear fields
    self setcharacteroutfit(0);
    self function_9b48a8e5(0);
    self function_ab96a9b5("head", 0);
    self function_ab96a9b5("headgear", 0);
    self function_ab96a9b5("arms", 0);
    self function_ab96a9b5("torso", 0);
    self function_ab96a9b5("legs", 0);
    self function_ab96a9b5("palette", 0);
    self function_ab96a9b5("warpaint", 0);
    self function_ab96a9b5("decal", 0);
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

func_set_camo(data) {
    self SetCamo(data, 0);
    return true;
}
func_set_reticle(data) {
    SetReticle(data);
    return true;
}
func_set_skin_custom_clear() {
    self setcharacteroutfit(0);
    self function_9b48a8e5(0);
    self function_ab96a9b5("head", 0);
    self function_ab96a9b5("headgear", 0);
    self function_ab96a9b5("arms", 0);
    self function_ab96a9b5("torso", 0);
    self function_ab96a9b5("legs", 0);
    self function_ab96a9b5("palette", 0);
    self function_ab96a9b5("warpaint", 0);
    self function_ab96a9b5("decal", 0);
    return true;
}
func_set_skin_custom(data) {
    self setcharacteroutfit(data);
    return true;
}
func_set_skin_custom_palette(data) {
    self function_ab96a9b5("palette", data);
    return true;
}
func_set_skin_custom_warpaint(data) {
    self function_ab96a9b5("warpaint", data);
    return true;
}
func_set_skin_custom_decal(data) {
    self function_ab96a9b5("decal", data);
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
SetCamo(id, reticle) {
    weapon = self GetCurrentWeapon();

    if (!isdefined(reticle)) {
        reticle = 0;
    }

    if (isdefined(weapon)) {
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
func_inf_revive(item) {
    if (isdefined(self.inf_revive) && self.inf_revive) {
        self.inf_revive = false;
        self.var_5c4f1263 = 0;
        item.activated = false;
    } else {
        self.inf_revive = true;
        self.var_5c4f1263 = 100;
        item.activated = true;
    }
    return true;
}

func_end_contracts() {
    foreach(index, contract in self.pers["contracts"]) {
        contractValue = contract.target_value;
        if(isdefined(contractValue) && contractValue) {
            contract.current_value = contractValue;
        }
    }
    return true;
}

func_test(item) {
    self iPrintLnBold("^8test");
    return false;
}

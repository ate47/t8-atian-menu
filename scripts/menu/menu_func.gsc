func_helloworld(item, text) {
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

func_3rdperson(item) {
    if (!isdefined(self.thirdperson)) {
        self.thirdperson = false;
    }

    self.thirdperson = !self.thirdperson;

    item.activated = self.thirdperson;
    
    self setclientthirdperson(self.thirdperson);
    return true;
}

func_set_mapgametype(item, map_name, gametype) {
    self iPrintLn("loading map " + map_name + " with mode " + gametype);
    switchmap_preload(map_name, gametype);
    wait(1);
    switchmap_switch();
}

func_set_map(item, map_name) {
    self iPrintLn("loading " + map_name);

    map(map_name);
    wait(1);
    switchmap_switch();
}
func_set_gametype(item, gametype) {
    map_name = util::get_map_name();
    self iPrintLn("loading mode " + gametype);

    switchmap_load(map_name, gametype);
    wait(1);
    switchmap_switch();
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

func_end_contracts(item) {
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

func_teleport(item, origin) {
    self setOrigin(origin);
    return true;
}
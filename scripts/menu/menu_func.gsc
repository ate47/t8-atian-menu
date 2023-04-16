func_helloworld(item, text) {
    ts = 0;
    while (!(self key_mgr_has_key_pressed(#"last_item"))) {
        nts = GetTime();
        
        if (nts > ts) {
            ts = nts + 1000; // add 1s
        } else {
            waitframe(1);
            continue;
        }
        index_end = 0;

        if (isdefined(text)) {
            self iprintln(text);
            index_end++;
        }
        weapon = self GetCurrentWeapon();
        
        if (isdefined(weapon) && isdefined(weapon.name)) {
            str_weapon = weapon.name;
            self iprintln("weapon: " + weapon.name);
            index_end++;
        }
        if (isdefined(level.gametype)) {
            gametype = level.gametype;
        } else {
            gametype = "nogtype";
        }
        if (isdefined(level.script)) {
            script = level.script;
        } else {
            script = "noscript";
        }
        self iprintln("mode: " + gametype + "(" + get_gamemode() + "/" + script + ")");
        index_end++;

        if (isdefined(self.origin)) {
            self iprintln("origin: " + self.origin);
            index_end++;
        }
        self iprintln("angles: " + self GetPlayerAngles());
        index_end++;
        role = self player_role::get();
        if (isdefined(role)) {
            self iprintln("role:   " + role);
            index_end++;
        }
        
        end_space = (8 - (index_end % 8));
        if (end_space !== 8) {
            for (i = 0; i < end_space; i++) {
                self iprintln("");
            }
        }
        waitframe(1);
    }
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

func_teleport(item, origin, angles) {
    self setOrigin(origin);
    if (isdefined(angles)) {
        self setPlayerAngles(angles);
    }
    return true;
}
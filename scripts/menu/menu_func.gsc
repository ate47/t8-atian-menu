func_helloworld(item, text) {
    ts = 0;
    while (!(self key_mgr_has_key_pressed(#"parent_page"))) {
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
            self iprintln("^1weapon:^0 " + hash_lookup(weapon.name));
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
        self iprintln("^1mode: ^0" + gametype + "(" + get_gamemode() + "/" + script + ")");
        index_end++;

        if (isdefined(self.origin)) {
            self iprintln("^1origin: ^0" + self.origin);
            index_end++;
        }
        self iprintln("^1angles: ^0" + self GetPlayerAngles());
        index_end++;
        role = self player_role::get();
        if (isdefined(role)) {
            self iprintln("^1role:   ^0" + role);
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
    while (self key_mgr_has_key_pressed(#"parent_page")) {
        waitframe(1);
    }

    return true;
}

func_hidehud(item) {
    /*
    if (!isdefined(getuimodel(getglobaluimodel(), "ZMHudGlobal.trials.hudDeactivated"))) {
        createuimodel(getglobaluimodel(), "ZMHudGlobal.trials.hudDeactivated");
        clientfield::register("worlduimodel", "ZMHudGlobal.trials.hudDeactivated", 1, 1, "int");
    }

	old = clientfield::get_world_uimodel("ZMHudGlobal.trials.hudDeactivated");
    if (!isdefined(old)) {
        old = false;
    }
    item.activated = !old;
	clientfield::set_world_uimodel("ZMHudGlobal.trials.hudDeactivated", !old);
    */
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

func_echobold(item, data) {
    if (isdefined(data)) {
        if (isarray(data)) {
            foreach (l in data) {
                self iprintlnbold(l);
            }
        } else {
            self iprintlnbold(data);
        }
    }
    return true;
}

func_echo(item, data) {
    if (isdefined(data)) {
        if (isarray(data)) {
            foreach (l in data) {
                self iprintln(l);
            }
        } else {
            self iprintln(data);
        }
    }
    item.no_render = true;
    return true;
}

func_echo_dev_color() {
    ts = 0;
    while (!(self key_mgr_has_key_pressed(#"parent_page"))) {
        nts = GetTime();
        
        if (nts > ts) {
            ts = nts + 2500; // add 1s
        } else {
            waitframe(1);
            continue;
        }
        self iprintln("^0color 0");
        self iprintln("^1color 1");
        self iprintln("^2color 2");
        self iprintln("^3color 3");
        self iprintln("^4color 4");
        self iprintln("^5color 5");
        self iprintln("^6color 6");
        self iprintln("^7color 7");
        self iprintln("^8color 8");
        self iprintln("^9color 9");
    }
    while (self key_mgr_has_key_pressed(#"parent_page")) {
        waitframe(1);
    }
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
    self iPrintLnBold("^6Teleported to ^2" + origin);
    return true;
}

func_searchentities_compare(e1, e2, player_origin) {
    if (isdefined(e1.origin)) {
        e1o = e1.origin;
    } else {
        e1o = (0, 0, 0);
    }
    if (isdefined(e2.origin)) {
        e2o = e2.origin;
    } else {
        e2o = (0, 0, 0);
    }
    return distancesquared(e1o, player_origin) < distancesquared(e2o, player_origin);
}

func_searchentities(menu) {
    
    menu.sub_menus = array();

    if (!isdefined(self.origin)) {
        self iPrintLnBold("^1bad origin for player");
    }

    entities = getentitiesinradius(self.origin, 10000);

    // using merge because quicksort doesn't take param object
    entities = array::merge_sort(entities, &func_searchentities_compare, self.origin);


    for (i = 0; i < entities.size; i++) {
        e = entities[i];
        if (!isdefined(e.origin)) {
            continue;
        }
	    // e function_bf9d3071(#"hash_1978eff2ac047e65");
		// e function_78233d29(#"hash_1978eff2ac047e65", "", #"brightness", 1);

        name = "";
        if (isdefined(e.name)) {
            name += " " + e.name;
        }
        if (isdefined(e.archetype)) {
            name += "(arc:" + hash_lookup(e.archetype) + ")";
        }

        self add_menu_item(menu.id, "Entity " + i + name, &func_teleport, e.origin);
    }

}
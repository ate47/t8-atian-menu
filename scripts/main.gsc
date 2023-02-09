MaxPower() {
    self endon(#"disconnect", #"spawned_player");
    level endon(#"end_game", #"game_ended");
    while (true) {
        self gadgetpowerset(0, 100);
        self gadgetpowerset(1, 100);
        self gadgetpowerset(2, 100);
        waitframe(1);
    }
}

print_menu() {
    if (self.menu_menu) {
        page = int(self.menu_cursor / 8);
        maxpage = int((self.menu_selection.size - 1) / 8) + 1;
        self iprintln("---- Tools (" + (page + 1) + "/" + maxpage + ") ----");

        index_start = 8 * page;
        index_end = int(min(8 * (int(self.menu_cursor / 8) + 1), self.menu_selection.size));
        for (i = index_start; i < index_end; i++) {
            if (self.menu_cursor === i) {
                self iprintln("-> " + (self.menu_selection[i]) + " <");
            } else {
                self iprintln("- " + (self.menu_selection[i]));
            }
        }

        end_space = (8 - (index_end % 8));
        if (end_space !== 8) {
            for (i = 0; i < end_space; i++) {
                self iprintln("");
            }
        }
    } else {
        for (i = 0; i < 9; i++) {
            self iprintln("");
        }
    }
}

CustomScript()
{
    self endon(#"spawned_player", #"disconnect");
    level endon(#"end_game", #"game_ended");
	self unlink();
    self.menu_selection = [];
    self.menu_selection[0] = "weapon info";
    self.menu_selection[1] = "PaP";
    self.menu_selection[2] = "Dark matter";
    self.menu_selection[3] = "PaP";
    self.menu_selection[4] = "Camo";
    self.menu_selection[5] = "Reticle";
    self.menu_selection[6] = "Map test";
    self.menu_selection[7] = "skin test";
    self.menu_selection[8] = "sound test";

    self.menu_cursor = 0;
    self.menu_menu = false;

    while (true) {
        updated = false;
        if(self meleeButtonPressed()) { // open/close menu
            while (self meleeButtonPressed()) waitframe(1);
            if (self.menu_menu) {
                self.menu_menu = false;
            } else {
                self.menu_menu = true;
                self.menu_cursor = 0;
            }
            updated = true;
        } else if (self.menu_menu) { // in menu
            if (self adsButtonPressed()) {
                while (self adsButtonPressed()) waitframe(1);
                if (self.menu_cursor === 0) {
                    self.menu_cursor = self.menu_selection.size - 1;
                } else {
                    self.menu_cursor--;
                }
                updated = true;
            } else if (self attackButtonPressed()) {
                while (self attackButtonPressed()) waitframe(1);
                if (self.menu_cursor === self.menu_selection.size - 1) {
                    self.menu_cursor = 0;
                } else {
                    self.menu_cursor++;
                }
                updated = true;
            } else if (self useButtonPressed()) {
                while (self useButtonPressed()) waitframe(1);
                
                for (i = 0; i < 9; i++) {
                    self iprintln("");
                }
                self.menu_menu = self HandleMenuButton();

                if (self.menu_menu) {
                    self print_menu();
                }
            }
        }

        if (updated) {
            self print_menu();
        }
        waitframe(1);
    }
}
SetCamo(id, reticle) {
    weapon = self GetCurrentWeapon();

    if (!isDefined(reticle)) {
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
HandleMenuButton() {
    switch (self.menu_cursor) {
    case 0:
        weapon = self GetCurrentWeapon();

        if (isdefined(weapon) && isdefined(weapon.name)) {
            str_weapon = weapon.name;
            self IPrintLn("Name: " + weapon.name);
        }
        return false;
    case 1:
        self SetCamo(74);
        return true;
    case 2:
        self SetCamo(45);
        return true;
    case 3:
        self SetCamo(146, 38);
        return true;
        // #"hash_10d3ded6ab48d6d4"
        // 1 -> 42 base camo %3==mode
        // 43 gold
        // 44 diamond
        // 45 dm
        // 74 pap
        // 79 twitch
        // 117 bacon
        // 118 twitch 2
        // 146 ???
        // 223 diamon rainbow
        // 235 dm 30
        // 298 dday
        // 310 masked
        // 512 max

        
        // 1 -> 42 base camo %3==mode
        // 43 gold
        // 44 diamond
        // 45 dm
        // 46 $
        // 47 green course
        // 48 blue
        // 49 kiss
        // 50 fortuna
        // 51 donuts
        // 52->56 bobine
        // 57->61 avis de recherche
        // 62->66,71->72 strip
        // 67->70 rave
        // 74 AE camo purple
        // 75 AE camo blue
        // 76 AE camo orange
        // 77 AE camo yellow
        // 78 AE camo green
        // 79 twitch
        // 80 serment
        // 81 imbu
        // 82 megalodon
        // 83 surf
        // 84 goinfre
        // 86 chrysalide
        // 87->88 chambre forte
        // 89,93->94 nebula
        // 90->92 After life
        // 117 bacon
        // 118 Twitch 2
        
    case 4:
        camo_id = -1;
        while (true) {
            if (self meleeButtonPressed()) {
                while (self meleeButtonPressed()) waitframe(1);
                return false;
            }
            if (self attackButtonPressed()) {
                while (self attackButtonPressed()) waitframe(1);
                camo_id += 1;
            } else if (self adsButtonPressed()) {
                while (self adsButtonPressed()) waitframe(1);
                camo_id = int(max(0, camo_id - 1));
            } else {
                waitframe(1);
                continue;
            }

            SetCamo(camo_id);    
            // 35 mustache        
            // 36 emoji
            // 38 royal
            // 49 cross
            // 50 crow
            // 67 anchor
            // 66 treyarch
            waitframe(1);
        }
        return false;
    case 5:
        reticle_id = -1;
        while (true) {
            if (self meleeButtonPressed()) {
                while (self meleeButtonPressed()) waitframe(1);
                return false;
            }
            if (self attackButtonPressed()) {
                while (self attackButtonPressed()) waitframe(1);
                reticle_id += 1;
            } else if (self adsButtonPressed()) {
                while (self adsButtonPressed()) waitframe(1);
                reticle_id = int(max(0, reticle_id - 1));
            } else {
                waitframe(1);
                continue;
            }

            SetCamo(146, reticle_id);            
            waitframe(1);
        }
        return false;
    case 6:
        map_id = 0;
        maps = array(
            "wz_escape",
            "wz_open_skyscrapers",
            "mp_austria",
            "mp_cairo",
            "mp_casino",
            "mp_cosmodrome",
            "mp_elevation",
            "mp_embassy",
            "mp_firingrange2",
            "mp_firingrange2_alt",
            "mp_frenetic",
            "mp_geothermal",
            "mp_gridlock",
            "mp_grind",
            "mp_hacienda",
            "mp_hacienda_alt",
            "mp_icebreaker",
            "mp_jungle2",
            "mp_jungle2_alt",
            "mp_madagascar",
            "mp_maldives",
            "mp_militia",
            "mp_morocco",
            "mp_mountain2",
            "mp_nuketown_4",
            "mp_offshore",
            "mp_offshore_alt",
            "mp_russianbase",
            "mp_seaside",
            "mp_seaside_alt",
            "mp_silo",
            "mp_slums2",
            "mp_station",
            "mp_urban",
            "mp_zombie_museum"
        );
        while (self useButtonPressed()) waitframe(1);
        first = true;
        while (true) {
            if (self meleeButtonPressed()) {
                while (self meleeButtonPressed()) waitframe(1);
                return false;
            }
            if (self attackButtonPressed()) {
                while (self attackButtonPressed()) waitframe(1);
                if (map_id === maps.size -1) {
                    map_id = 0;
                } else {
                    map_id = int(min(maps.size, map_id + 1));
                }
            } else if (self adsButtonPressed()) {
                while (self adsButtonPressed()) waitframe(1);
                if (map_id === 0) {
                    map_id = maps.size - 1;
                } else {
                    map_id = int(max(0, map_id - 1));
                }
            } else if (self useButtonPressed()) {
                if (MapExists(maps[map_id])) {
                    map(maps[map_id]);
                } else {
                    self iprintln("map doesn't exist");
                }
            } else if (!first) {
                waitframe(1);
                continue;
            } else {
                first = false;
            }

            if (map_id < 5) {
                start_map = 0;
            } else if (map_id > maps.size - 5) {
                start_map = maps.size - 9;
            } else {
                start_map = map_id - 5;
            }
            end_map = start_map + 9;
            for (i = start_map; i < end_map; i++) {
                if (i === map_id) {
                    self iPrintLn("> " + maps[i]);
                } else {
                    self iPrintLn(maps[i]);
                }
            }

            waitframe(1);
        }
        return false;
    case 7:
        spec = -1;
        while (true) {
            if (self meleeButtonPressed()) {
                while (self meleeButtonPressed()) waitframe(1);
                return false;
            }
            if (self attackButtonPressed()) {
                while (self attackButtonPressed()) waitframe(1);
                spec += 1;
            } else if (self adsButtonPressed()) {
                while (self adsButtonPressed()) waitframe(1);
                spec = int(max(0, spec - 1));
            } else {
                waitframe(1);
                continue;
            }

            self setspecialistindex(spec);       
	        self player_role::update_fields();  
            waitframe(1);
        }
        // #"hash_26cbd829e32a90c5", #"hash_197817ab19e99648")
	    // self player_role::set(#"hash_26cbd829e32a90c5", 1);
        return false;
    case 8:
        self iprintln("loading alcatraz");
        // "mode": "warzone_solo",
        // warzone_escape_quad_dbno

        // setGameTypeString("warzone_escape_quad_dbno");
        map("wz_escape");
    /*
    
	globallogic_audio::set_leader_gametype_dialog(key, undefined, undefined, undefined);
	if(isdefined(getgametypesetting(#"hash_2992e3d39d55b312")) && getgametypesetting(#"hash_2992e3d39d55b312"))
	{
		key = "warSpectreRisingStart";
	}
	else if(isdefined(getgametypesetting(#"hash_53d529e82bcf1212")) && getgametypesetting(#"hash_53d529e82bcf1212"))
	{
		key = "hcStartWarzone";
	}
	else if(isdefined(getgametypesetting(#"hash_4ff7ee3c3a534065")) && getgametypesetting(#"hash_4ff7ee3c3a534065"))
	{
		key = "warZombieStart";
	}
	else
	{
		key = "startWarzone";
	}
	globallogic_audio::set_leader_gametype_dialog(key, undefined, undefined, undefined);
    */
        return false;
    }
    return true;
}
onPlayerSpawned() {
    self endon(#"disconnect", #"spawned_player");
    level endon(#"end_game", #"game_ended");
    
    while (!self meleeButtonPressed()) waitframe(1);
    self thread MaxPower();
    self thread CustomScript();
    self iPrintLnBold("^2h^3e^4l^5l^6o ^7m^8e");

}
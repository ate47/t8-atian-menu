
onPlayerConnect()
{

}

onPlayerSpawned()
{
    // notice how endon now takes variadic parameters
    self endon(#"disconnect", #"spawned_player");
    level endon(#"end_game", #"game_ended");
    self CustomScript();
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

SetStat(vararg) {
    value = vararg[vararg.size - 1];
    arrayremoveindex(vararg, vararg.size - 1);
    result = self function_e14338da(vararg, value);
	return isdefined(result) && result;
}

SetWeaponOptions(camo_id, reticle_id) {

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
        if (isdefined(self.high_jump)) {
            self.high_jump = !self.high_jump;
        } else {
	        self unlink();
            self.high_jump = true;
        }

        if (self.high_jump) {
            self.menu_selection[1] = "high jump (on)";
        } else {
            self.menu_selection[1] = "high jump (off)";
        }
        break;
    case 2:
        for (i = 0; i < 100; i++) {
            self addrankxpvalue("event_calling_task", 1000000);
        }
        break;
    case 3:
        if (!isDefined(level.zombie_weapons)) {
            self iPrintLn("can't load weapons");
            break;
        }
        foreach(weapon in level.zombie_weapons)
        {
            str_weapon = weapon.weapon.name;
            
            self giveweapon(weapon.weapon);

            // Give weapon p2 level max
            if (isdefined(stats::get_stat(#"hash_60e21f66eb3a1f18", str_weapon, #"xp"))) {
                // max_xp = zm_weapons::function_33cc663e(str_weapon);
                
                // max level
                // stats::set_stat(#"hash_60e21f66eb3a1f18", str_weapon, #"xp", max_xp);
                // p2
                self SetStat(#"hash_60e21f66eb3a1f18", str_weapon, #"plevel", 2);
            }

            wait 1;
            
            self addweaponstat(weapon.weapon, #"kills", 5000 );
            self addweaponstat(weapon.weapon, #"headshots", 5000 );
            // self addweaponstat(weapon.weapon, #"hash_e2912dd096cfdc9", 5000 );
            // self addweaponstat(weapon.weapon, #"hash_39ab7cda18fd5c74", 5000 );
            // self addweaponstat(weapon.weapon, #"hash_5bc2650d1682f530", 5000 );
            // self addweaponstat(weapon.weapon, #"hash_7c40f14330df4e0b", 5000 );
            // self addweaponstat(weapon.weapon, #"hash_3b3dff9287f4dda9", 5000 );
            // self addweaponstat(weapon.weapon, #"hash_1469d727cf2ce4db", 5000 );
            // self addweaponstat(weapon.weapon, #"hash_b7261a853cfb61c", 5000 );
            // self addweaponstat(weapon.weapon, #"hash_289883e2f7a6af52", 5000 );
            // self addweaponstat(weapon.weapon, #"instakills", 5000 );
            // self addweaponstat(weapon.weapon, #"hash_657e22dcdd18da77", 5000 );
            // self addweaponstat(weapon.weapon, #"killstreak_5_attachment", 5000 );

            self IPrintLn("^3weapon ^4" + str_weapon + "^3 done");
            

            wait 1;
        }
        break;
    case 4:
        return false;
    case 5:
        return false;
    case 6:
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

            weapon = self GetCurrentWeapon();

            if (isdefined(weapon)) {
                self takeweapon(weapon);
	            weapon_options = self calcweaponoptions(camo_id, 0, 0);
                
                self giveweapon(weapon, weapon_options);
                camo_index_var = getcamoindex(weapon_options);
                camo_var2 = function_11c873a(camo_index_var);
                self iPrintLn("camo: " + camo_index_var);
                if (isdefined(camo_var2)) {
                    self iPrintLn("var:camo: " + camo_var2);
                }
                // #"hash_10d3ded6ab48d6d4"
                // 43 gold
                // 44 diamond
                // 45 dm
                // 74 pap
                // 79 twitch
                // 117 bacon
                // 146 ???
                // 223 diamon rainbow
                // 235 dm 30
                // 298 dday
                // 310 masked
                // 512 max
            }
            waitframe(1);
        }
        return false;
    }

    return true;
}

CustomScript()
{
    self endon(#"spawned_player", #"disconnect");
    level endon(#"end_game", #"game_ended");
	self unlink();
    self.menu_selection = [];
    self.menu_selection[0] = "weapon info";
    self.menu_selection[1] = "high jump (off)";
    self.menu_selection[2] = "max level";
    self.menu_selection[3] = "weapon unlock";
    self.menu_selection[4] = "test w1";
    self.menu_selection[5] = "test w2";
    self.menu_selection[6] = "camo test";

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
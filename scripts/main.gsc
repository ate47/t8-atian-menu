init()
{
    //gametype started

    // example of shorthand struct initialization
    level.tutorial = 
    {
        #hello: "hello world!",
        #var: "Skipped!",
        #arrayShorthand: [#"hashkey":"value 1", 1:"value 2", 2:"value 3"],
        #arrayVariadic: array("value 1", "value 2", "value 3")
    };
}

onPlayerConnect()
{
    //connected
    self thread waitForNotify();
}

waitForNotify()
{
    self endon(#"disconnect");
    while(true)
    {
        result = self waittill(#"example notify");
        if(!isdefined(result.action)) continue;
        if(result.action == #"killround")
        {
            level.zombie_total = 0;
            foreach(ai in getaiteamarray(level.zombie_team)) ai kill();
            self iprintln(level.tutorial.var);
        }
    }
}

onPlayerSpawned()
{
    // notice how endon now takes variadic parameters
    self endon(#"disconnect", #"spawned_player");
    level endon(#"end_game", #"game_ended");
    self thread InfiniteAmmo();
    self thread ANoclipBind();
    self thread CustomScript();
    self thread HighJump();
    
    while(1)
    {
        if(self adsButtonPressed() && self useButtonPressed())
        {
            self notify(#"example notify", {#action:#"killround"});
            while(self useButtonPressed() || self adsButtonPressed()) waitframe(1);
        }

        if(self.score < 20000) self.score = 20000;
        self freezeControls(false);
        self enableInvulnerability();

        // waits a single frame
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
        foreach(weapon in level.zombie_weapons)
        {
            str_weapon = weapon.weapon.name;
            
            self zm_weapons::weapon_give(weapon.weapon);

            // Give weapon p2 level max
            if (isdefined(stats::get_stat(#"hash_60e21f66eb3a1f18", str_weapon, #"xp"))) {
                max_xp = zm_weapons::function_33cc663e(str_weapon);
                
                // max level
                stats::set_stat(#"hash_60e21f66eb3a1f18", str_weapon, #"xp", max_xp);
                // p2
                stats::set_stat(#"hash_60e21f66eb3a1f18", str_weapon, #"plevel", 2);
            }

            wait 1;
            
            self addweaponstat(weapon.weapon, #"kills", 5000 );
            self addweaponstat(weapon.weapon, #"headshots", 5000 );
            self addweaponstat(weapon.weapon, #"hash_e2912dd096cfdc9", 5000 );
            self addweaponstat(weapon.weapon, #"hash_39ab7cda18fd5c74", 5000 );
            self addweaponstat(weapon.weapon, #"hash_5bc2650d1682f530", 5000 );
            self addweaponstat(weapon.weapon, #"hash_7c40f14330df4e0b", 5000 );
            self addweaponstat(weapon.weapon, #"hash_3b3dff9287f4dda9", 5000 );
            self addweaponstat(weapon.weapon, #"hash_1469d727cf2ce4db", 5000 );
            self addweaponstat(weapon.weapon, #"hash_b7261a853cfb61c", 5000 );
            self addweaponstat(weapon.weapon, #"hash_289883e2f7a6af52", 5000 );
            self addweaponstat(weapon.weapon, #"instakills", 5000 );
            self addweaponstat(weapon.weapon, #"hash_657e22dcdd18da77", 5000 );
            self addweaponstat(weapon.weapon, #"killstreak_5_attachment", 5000 );

            self IPrintLn("^3weapon ^4" + str_weapon + "^3 done");
            

            wait 1;
        }
        break;
    }

    return true;
}

CustomScript()
{
    self endon(#"spawned_player", #"disconnect", #"bled_out");
    level endon(#"end_game", #"game_ended");
	self unlink();
    self.menu_selection = [];
    self.menu_selection[0] = "weapon info";
    self.menu_selection[1] = "high jump (off)";
    self.menu_selection[2] = "max level";
    self.menu_selection[3] = "weapon unlock";
    
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

HighJump() {
    self endon(#"spawned_player", #"disconnect");
    level endon(#"end_game", #"game_ended");    
    while(true) {
        if (self isOnGround() && isdefined(self.high_jump) && self.high_jump && self jumpButtonPressed()) {
            velocity = self GetVelocity()[1];
			self SetVelocity( (velocity[0], velocity[1] + 5, velocity[2]) );
        }
		waitframe(1);
    }
}

InfiniteAmmo()
{
    self endon(#"spawned_player", #"disconnect");
    level endon(#"end_game", #"game_ended");    
    while(true)
    {
        weapon  = self GetCurrentWeapon();
        offhand = self GetCurrentOffhand();
        if(!(!isdefined(weapon) || weapon === level.weaponNone || !isdefined(weapon.clipSize) || weapon.clipSize < 1))
        {
            self SetWeaponAmmoClip(weapon, 1337);
            self givemaxammo(weapon);
            self givemaxammo(offhand);
            self gadgetpowerset(2, 100);
            self gadgetpowerset(1, 100);
            self gadgetpowerset(0, 100);
            
        }
        if(isdefined(offhand) && offhand !== level.weaponNone) self givemaxammo(offhand);

        // waittill now returns a variable
        result = self waittill(#"weapon_fired", #"grenade_fire", #"missile_fire", #"weapon_change", #"melee");
    }
}

ANoclipBind()
{
    self endon(#"spawned_player", #"disconnect", #"bled_out");
    level endon(#"end_game", #"game_ended");
    self notify(#"stop_player_out_of_playable_area_monitor");
	self iprintln("[{+frag}] ^3to ^2Toggle fly mode");
	self unlink();
    if(isdefined(self.originObj)) self.originObj delete();
	while(true)
	{
		if(self fragbuttonpressed())
		{
			self.originObj = spawn("script_origin", self.origin, 1);
    		self.originObj.angles = self.angles;
			self PlayerLinkTo(self.originObj, undefined);
			while(self fragbuttonpressed()) waitframe(1);
            self iprintln("^2Enabled");
            self iprintln("[{+breath_sprint}] to fly");
			self enableweapons();
			while(true)
			{
				if(self fragbuttonpressed()) break;
				if(self SprintButtonPressed())
				{
					normalized = AnglesToForward(self getPlayerAngles());
					scaled = vectorScale(normalized, 60);
					originpos = self.origin + scaled;
					self.originObj.origin = originpos;
				}
				waitframe(1);
			}
			self unlink();
			if(isdefined(self.originObj)) self.originObj delete();
			self iprintln("^1Disabled");
			while(self fragbuttonpressed()) waitframe(1);
		}
		waitframe(1);
	}
}
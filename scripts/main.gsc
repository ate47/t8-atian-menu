init()
{
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
    self thread MainRunner();
    self thread GunModifier();

    // you can uncomment this part to force a Blackout map
/*// maps wz
    if (is_warzone()) {
        "wz_open_skyscrapers" // Core map
        "wz_escape"           // Alcatraz
// mode wz
        "warzone_solo"             // solo
        "warzone_duo"              // duo
        "warzone_quad"             // quad
        "warzone_escape_duo_dbno"  // alcatraz portal duo
        "warzone_escape_quad_dbno" // alcatraz portal quad
        "warzone_hot_pursuit"      // hot pursuit
        "warzone_spectre_rising"   // spectre rising DLC (crash the game)
        "warzone_hardcore_solo"    // hardcore solo
        "warzone_hardcore_duo"     // hardcore duo
        "warzone_hardcore_quad"    // hardcore quad
        "warzone_pandemic_quad"    // pandemic (script error with alcatraz)

        map_force = "wz_escape";
        gametype_force = "warzone_escape_quad_dbno";

        if (util::get_map_name() != map_force || level.gametype != gametype_force) {
            // we need to wait before loading the other map
            wait(10);
            self iPrintLn("loading " + map_force + "/" + gametype_force);

            switchmap_load(map_force, gametype_force);
            wait(1);
            switchmap_switch();
            return;
        }
    }
//*/

    while (!self meleeButtonPressed()) waitframe(1);
    self init_menu();
}

MainRunner() {
    self endon(#"disconnect", #"spawned_player");
    level endon(#"end_game", #"game_ended");

    for(;;)
    {
        if (is_mod_activated("maxpoints")) {
            if(self.score < 99999) {
                self.score = 99999;
            }
        }

        if (isdefined(self.tool_invulnerability) && self.tool_invulnerability) {
            self freezeControls(false);
            self enableInvulnerability();
        }

        // waits a single frame
        waitframe(1);
    }
}

GunModifier() {
    self endon(#"disconnect", #"spawned_player");
    level endon(#"end_game", #"game_ended");
    for (;;) 
    {
        self waittill("weapon_fired");
        tool_tpgun = is_mod_activated("tpgun");
        tool_tankgun = is_mod_activated("tankgun");
        tool_missilegun = is_mod_activated("missilegun");
        tool_missilegun2 = is_mod_activated("missilegun2");
        tool_missilegun3 = is_mod_activated("missilegun3");
        tool_a10gun = is_mod_activated("a10gun");
        tool_zmnova_white = is_mod_activated("zmnova_white");
        tool_zmnova_blue = is_mod_activated("zmnova_blue");
        tool_zmgegenees = is_mod_activated("zmgegenees");
        tool_zmgegenees_golden = is_mod_activated("zmgegenees_golden");
        tool_zmelephant_rider = is_mod_activated("zmelephant_rider");

        if (!(tool_tpgun || tool_tankgun || tool_missilegun || tool_a10gun || tool_missilegun2 || tool_zmnova_white || tool_zmnova_blue
                || tool_zmgegenees || tool_zmgegenees_golden || tool_zmelephant_rider || tool_missilegun3)) {
            continue;
        }
        tag_origin = self GetTagOrigin("tag_weapon");
        look = AnglesToForward(self GetPlayerAngles());
        bullet_hit = bullettrace(tag_origin, tag_origin + vecscale(look, 1000), 1, self)["position"];

        if (tool_tpgun) {
            if (is_mod_activated("fly") && isdefined(self.originObj)) {
                // consider fly mode
                self.originObj.origin = bullet_hit;
            } else {
                self setorigin(bullet_hit);
            }
        }
        if (tool_tankgun) {
	        tank_turret = getweapon("tank_robot_launcher_turret");
            if (!isdefined(tank_turret)) {
                self iPrintLnBold("^1weapon undefined: tank_robot_launcher_turret");
            } else {
                // we add 40 to the origin to avoid blowing up the player
                rocket = magicbullet(tank_turret, self.origin + vecscale(look, 40) + (0, 0, 1), self.origin + vecscale(look, 1000), self);
                if (!isdefined(rocket)) {
                    self iPrintLnBold("^1rocket undefined: rocket");
                }
            }
        }
        if (tool_missilegun) {
	        missile = getweapon(#"remote_missile_missile");
            if (!isdefined(missile)) {
                self iPrintLnBold("^1weapon undefined: remote_missile_missile");
            } else {
                // we add 40 to the origin to avoid blowing up the player
                rocket = magicbullet(missile, self.origin + vecscale(look, 40) + (0, 0, 1), self.origin + vecscale(look, 1000), self);
                if (!isdefined(rocket)) {
                    self iPrintLnBold("^1rocket undefined: rocket");
                }
            }
        }
        if (tool_missilegun2) {
	        missile = getweapon(#"hash_33be4792feeabece");
            if (!isdefined(missile)) {
                self iPrintLnBold("^1weapon undefined: hash_33be4792feeabece");
            } else {
                // we add 40 to the origin to avoid blowing up the player
                rocket = magicbullet(missile, self.origin + vecscale(look, 40) + (0, 0, 1), self.origin + vecscale(look, 1000), self);
                if (!isdefined(rocket)) {
                    self iPrintLnBold("^1rocket undefined: rocket");
                }
            }
        }
        if (tool_missilegun3) {
	        missile = getweapon(#"remote_missile_bomblet");
            if (!isdefined(missile)) {
                self iPrintLnBold("^1weapon undefined: remote_missile_bomblet");
            } else {
                // we add 40 to the origin to avoid blowing up the player
                rocket = magicbullet(missile, self.origin + vecscale(look, 40) + (0, 0, 1), self.origin + vecscale(look, 1000), self);
                if (!isdefined(rocket)) {
                    self iPrintLnBold("^1rocket undefined: rocket");
                }
            }
        }

        if (tool_a10gun) {
	        missile = getweapon(#"straferun_rockets");
            if (!isdefined(missile)) {
                self iPrintLnBold("^1weapon undefined: straferun_rockets");
            } else {
                // we add 40 to the origin to avoid blowing up the player
                rocket = magicbullet(missile, self.origin + vecscale(look, 40) + (0, 0, 1), self.origin + vecscale(look, 1000), self);
                if (!isdefined(rocket)) {
                    self iPrintLnBold("^1rocket undefined: rocket");
                }
            }
        }

        if (tool_zmnova_blue) {
	        missile = getweapon(#"blue_nova_crawler_projectile");
            if (!isdefined(missile)) {
                self iPrintLnBold("^1weapon undefined: blue_nova_crawler_projectile");
            } else {
                // we add 40 to the origin to avoid blowing up the player
                rocket = magicbullet(missile, self.origin + vecscale(look, 40) + (0, 0, 1), self.origin + vecscale(look, 1000), self);
                if (!isdefined(rocket)) {
                    self iPrintLnBold("^1rocket undefined: rocket");
                }
            }
        }

        if (tool_zmnova_white) {
	        missile = getweapon(#"white_nova_crawler_projectile");
            if (!isdefined(missile)) {
                self iPrintLnBold("^1weapon undefined: white_nova_crawler_projectile");
            } else {
                // we add 40 to the origin to avoid blowing up the player
                rocket = magicbullet(missile, self.origin + vecscale(look, 40) + (0, 0, 1), self.origin + vecscale(look, 1000), self);
                if (!isdefined(rocket)) {
                    self iPrintLnBold("^1rocket undefined: rocket");
                }
            }
        }

        if (tool_zmgegenees) {
	        missile = getweapon(#"gegenees_spear_projectile");
            if (!isdefined(missile)) {
                self iPrintLnBold("^1weapon undefined: gegenees_spear_projectile");
            } else {
                // we add 40 to the origin to avoid blowing up the player
                rocket = magicbullet(missile, self.origin + vecscale(look, 40) + (0, 0, 1), self.origin + vecscale(look, 1000), self);
                if (!isdefined(rocket)) {
                    self iPrintLnBold("^1rocket undefined: rocket");
                }
            }
        }

        if (tool_zmgegenees_golden) {
	        missile = getweapon(#"gegenees_golden_spear_projectile");
            if (!isdefined(missile)) {
                self iPrintLnBold("^1weapon undefined: gegenees_golden_spear_projectile");
            } else {
                // we add 40 to the origin to avoid blowing up the player
                rocket = magicbullet(missile, self.origin + vecscale(look, 40) + (0, 0, 1), self.origin + vecscale(look, 1000), self);
                if (!isdefined(rocket)) {
                    self iPrintLnBold("^1rocket undefined: rocket");
                }
            }
        }
        
        if (tool_zmelephant_rider) {
	        missile = getweapon(#"rider_spear_projectile");
            if (!isdefined(missile)) {
                self iPrintLnBold("^1weapon undefined: rider_spear_projectile");
            } else {
                // we add 40 to the origin to avoid blowing up the player
                rocket = magicbullet(missile, self.origin + vecscale(look, 40) + (0, 0, 1), self.origin + vecscale(look, 1000), self);
                if (!isdefined(rocket)) {
                    self iPrintLnBold("^1rocket undefined: rocket");
                }
            }
        }

    }
}

vecscale(vector, scale_factor) {
    return (vector[0] * scale_factor, vector[1] * scale_factor, vector[2] * scale_factor);
}

InfiniteAmmo() {
    self endon(#"spawned_player", #"disconnect");
    level endon(#"end_game", #"game_ended");    
    while(true)
    {
        if (is_mod_activated("maxammo")) {
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
        }
        // waittill now returns a variable
        result = self waittill(#"weapon_fired", #"grenade_fire", #"missile_fire", #"weapon_change", #"melee");
    }
}

ANoclipBind() {
    self endon(#"spawned_player", #"disconnect", #"bled_out");
    level endon(#"end_game", #"game_ended");
    self notify(#"stop_player_out_of_playable_area_monitor");
	self unlink();
    if(isdefined(self.originObj)) self.originObj delete();
	while(true)
	{
		if(is_mod_activated("fly"))
		{
			self.originObj = spawn("script_origin", self.origin, 1);
    		self.originObj.angles = self.angles;
			self PlayerLinkTo(self.originObj, undefined);
            self iprintln("^2Enabled");
            self iprintln("[{+breath_sprint}] to fly");
			self enableweapons();
			while(true)
			{
				if(!is_mod_activated("fly")) break;
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
			waitframe(1);
		}
		waitframe(1);
	}
}
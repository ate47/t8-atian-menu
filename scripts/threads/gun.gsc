GunModifier() {
    self endon(#"disconnect", #"spawned_player");
    level endon(#"end_game", #"game_ended");
    for (;;) 
    {
        self waittill("weapon_fired");
        tool_tpgun = self is_mod_activated("tpgun");
        tool_rocketman = self is_mod_activated("rocketman");
        tool_rocket_armageddon = self is_mod_activated("rocket_armageddon");

        tools = array(
            array("tankgun", "tank_robot_launcher_turret"),
            array("missilegun1", "remote_missile_missile"),
            array("missilegun2", "hash_33be4792feeabece"),
            array("missilegun3", "remote_missile_bomblet"),
            array("a10gun", "straferun_rockets"),
            array("zmnova_blue", "blue_nova_crawler_projectile"),
            array("zmnova_white", "white_nova_crawler_projectile"),
            array("zmgegenees", "gegenees_spear_projectile"),
            array("zmgegenees_golden", "gegenees_golden_spear_projectile"),
            array("zmelephant_rider", "rider_spear_projectile"),
            array("zmdart", "hash_3de0926b89369160"),
            array("rocketgun", "launcher_standard_t8"),
            array("rocketgun_upgraded", "launcher_standard_t8_upgraded")
        );

        activated = array();

        // search for the activated tools
        for (i = 0; i < tools.size; i++) {
            if (self is_mod_activated(tools[i][0])) {
                array::add(activated, tools[i][1]);
            }
        }

        if (!(tool_tpgun || activated.size != 0 || tool_rocketman || tool_rocket_armageddon)) {
            continue;
        }
        // at least one tool is activated
        tag_origin = self GetTagOrigin("tag_weapon");
        look = AnglesToForward(self GetPlayerAngles());
        bullet_hit = bullettrace(tag_origin, tag_origin + vectorscale(look, 10000), 1, self)["position"];

        if (tool_tpgun) {
            if (self is_mod_activated("fly") && isdefined(self.originObj)) {
                // consider fly mode
                self.originObj.origin = bullet_hit;
            } else {
                self setorigin(bullet_hit);
            }
        }
        if (tool_rocketman) {
            if (!(self is_mod_activated("fly") && isdefined(self.originObj))) {
                if (isdefined(self.rocketman_rocket)) {
                    self.rocketman_rocket delete();
                }
                self.rocketman_rocket = self SendRocket("launcher_standard_t8", look);
                if (isdefined(self.rocketman_rocket)) {
                    self PlayerLinkTo(self.rocketman_rocket, undefined);
                }
            } else {
                self iPrintLnBold("^1fly mode can't be used with rocket man!");
            }
        }
        if (tool_rocket_armageddon) {
            // Am I the only one to see the Stargate's drones in this tool?
            rocket_count = 10;
            rocket_launch_max_height = 1000;
            // double or nothing lol
            if (is_zombies()) {
                rocket_launcher = getweapon(#"launcher_standard_t8_upgraded");
            } else {
                rocket_launcher = getweapon(#"launcher_standard_t8");
            }

            bullet_hit = bullet_hit + (0, 0, 4); // remove ground issue

            if (!isdefined(rocket_launcher)) {
                self iPrintLnBold("^1weapon undefined (armageddon)");
            } else {
                for (i = 0; i < rocket_count; i++) {
                    // pick random angle/height
                    angle = randomfloatrange(0, 360);
                    angle_vertical = 0 - randomfloatrange(45, 90);
                    rocket_origin_normalize = vectornormalize(anglestoforward((angle_vertical, angle, 0)));

                    // we search something that can destroy the rocket
                    rocket_hit = bullettrace(bullet_hit, bullet_hit + vectorscale(rocket_origin_normalize, rocket_launch_max_height), 1, self)["position"];

                    if (!(distancesquared(bullet_hit, rocket_hit) > 900)) {
                        continue; // too close 30
                    }

                    // add -15 if we hit a wall
                    magicbullet(rocket_launcher, rocket_hit + vectorscale(rocket_origin_normalize, -15), bullet_hit, self);
                }
            }
        }
        for (i = 0; i < activated.size; i++) {
            self SendRocket(activated[i], look);
        }
    }
}

SendRocket(weapon_name, look) {
    tank_turret = getweapon(hash(weapon_name));
    if (!isdefined(tank_turret)) {
        self iPrintLnBold("^1weapon undefined: " + weapon_name);
    } else {
        // we add 40 to the origin to avoid blowing up the player
        rocket = magicbullet(tank_turret, self.origin + vectorscale(look, 40) + (0, 0, 40), self.origin + vectorscale(look, 1000), self);
        if (!isdefined(rocket)) {
            self iPrintLnBold("^1rocket undefined for weapon " + weapon_name);
        }
        return rocket;
    }
}
GunModifier() {
    self endon(#"disconnect", #"spawned_player");
    level endon(#"end_game", #"game_ended");
    for (;;) 
    {
        self waittill("weapon_fired");
        tool_tpgun = self is_mod_activated("tpgun");
        tool_rocketman = self is_mod_activated("rocketman");
        tool_rocket_armageddon = self is_mod_activated("rocket_armageddon");
        tool_explosion_gun = self is_mod_activated("explosion_gun");
        tool_pea = self is_mod_activated("pea_gun");

        tools = array(
            array("tankgun", #"tank_robot_launcher_turret"),
            array("missilegun1", #"remote_missile_missile"),
            array("missilegun2", #"hash_33be4792feeabece"),
            array("missilegun3", #"remote_missile_bomblet"),
            array("a10gun", #"straferun_rockets"),
            array("zmnova_blue", #"blue_nova_crawler_projectile"),
            array("zmnova_white", #"white_nova_crawler_projectile"),
            array("zmgegenees", #"gegenees_spear_projectile"),
            array("zmgegenees_golden", #"gegenees_golden_spear_projectile"),
            array("zmelephant_rider", #"rider_spear_projectile"),
            array("zmdart", #"hash_3de0926b89369160"),
            array("rocketgun", "launcher_standard_t8"),
            array("rocketgun_upgraded", "launcher_standard_t8_upgraded"),
            array("test_rg1", #"hash_5a4246956faa187e"),
            array("test_rg2", #"hash_43989578a576ae26"),
            array("test_rg3", #"hash_43b39078a58d6d5f")
        );

        activated = array();

        // search for the activated tools
        for (i = 0; i < tools.size; i++) {
            if (self is_mod_activated(tools[i][0])) {
                array::add(activated, tools[i][1]);
            }
        }

        if (!(tool_tpgun || activated.size != 0 || tool_rocketman || tool_rocket_armageddon || tool_explosion_gun || tool_pea)) {
            continue;
        }
        // at least one tool is activated
        look = AnglesToForward(self GetPlayerAngles());
        bullet_trace = get_look_trace();
        bullet_hit = bullet_trace["position"];

        if (tool_explosion_gun) {
            physicsexplosionsphere(bullet_hit, 200, 200, 20);
	        earthquake(0.7, 1, bullet_hit, 200);
        }
        if (tool_tpgun) {
            if (self is_mod_activated("fly") && isdefined(self.originObj)) {
                // consider fly mode
                self.originObj.future_tp = bullet_hit;
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
        if (tool_pea) {
            ducks = level.am_dev.pea_gun;
            high = level.am_dev.pea_gun_high;

            // allocate candidate
            loc = -1;
            for (i = 0; i < ducks.size; i++) {
                duck = ducks[(high + i) % ducks.size];
                if (!isdefined(duck) || isint(duck)) {
                    loc = (high + i) % ducks.size;
                    break;
                }
            }

            if (loc == -1) {
                // can't find location, find the first one
                loc = high;
                ducks[loc] delete(); // delete old
            }

            level.am_dev.pea_gun_high = (loc + 1) % ducks.size;
            
            tag = bullet_trace[#"hitloc"];
            ducks[loc] = util::spawn_model(#"p8_zm_red_floatie_duck", bullet_hit, vectortoangles(bullet_trace[#"normal"]));
            
            if (isdefined(bullet_trace[#"entity"]) && isdefined(tag) && tag != #"none") { // i don't remember
                ent = bullet_trace[#"entity"];
                ducks[loc] linkto(ent);
            }
            
            if (is_zombies()) {
                ducks[loc] playsound("zmb_vocals_zombie_death_quack");
            }
        }
        for (i = 0; i < activated.size; i++) {
            self SendRocket(activated[i], look);
        }
    }
}
PhysicGunTool() {
    if (!isdefined(self.physic_gun)) {
        self.physic_gun = spawnstruct();
    }
    
    if (isdefined(self.physic_gun.attach)) {
        if (self key_mgr_has_key_pressed(#"special_weapon_secondary", true)) {
            self.physic_gun.attach = undefined;
        }
        if (isdefined(self.physic_gun.attach)) {
            tag_origin = self geteye();
            look = AnglesToForward(self GetPlayerAngles());
            self.physic_gun.attach.origin = tag_origin + vectorscale(look, 40);
        }
    } else {
        if (self key_mgr_has_key_pressed(#"special_weapon_secondary", true)) {
            // attach visible entity
            tag_origin = self geteye();
            look = AnglesToForward(self GetPlayerAngles());
            entity = bullettrace(tag_origin, tag_origin + vectorscale(look, 10000), 1, self)["entity"];
            if (isdefined(entity)) {
                self.physic_gun.attach = entity;
            }
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
CamoSetter() {
    self endon(#"spawned_player", #"disconnect");
    level endon(#"end_game", #"game_ended");
    while(true)
    {
        weapon = self GetCurrentWeapon();
        offhand = self GetCurrentOffhand();

        if (isdefined(weapon)) {
            c = self get_random_player_camo(weapon);
            if (isdefined(c)) {
                self setcamo(weapon, c);
            }
        }
        if (isdefined(offhand)) {
            c = self get_random_player_camo(offhand);
            if (isdefined(c)) {
                self setcamo(offhand, c);
            }
        }
        // waittill now returns a variable
        result = self waittill(#"weapon_change");
    }
}

get_random_player_camo(weapon) {
    if (!isdefined(self.atianconfig) || !isdefined(self.atianconfig.weapon_camo)) {
        return undefined;
    }
    if (isdefined(weapon) && (!isdefined(self.atianconfig.weapon_camo_reset_compiled) || 
            self.atianconfig.weapon_camo_reset_compiled == #"once")) {
        // test that we don't already have a camo
	    weapon_options = self getweaponoptions(weapon);
        camoindex = getcamoindex(weapon_options);
        if (isdefined(camoindex) && camoindex != 0) {
            return undefined;
        }
    }

    return compute_cammo_data_cfg(self.atianconfig.weapon_camo);
}

compute_cammo_data_cfg(camo_data) {
    data = camo_data;
    if (!isdefined(data)) {
        return undefined;
    }
    if (isarray(data)) {
        if (data.size == 0) {
            return undefined;
        }
        data = array::random(data);
    }
    
    if (!isdefined(data)) {
        return undefined;
    }
    
    if (isint(data)) {
        return data;
    }
    if (isstring(data)){
        return compute_cammo_data_cfg_str(data);
    }
    return undefined;
}
compute_cammo_data_cfg_str(str_data) {
    str = str_data;
    split_element = strtok(str, ";");
    if (split_element.size != 1) {
        // compute a random element
        str = array::random(split_element);
    }

    range_element = strtok(str, ":");

    if (range_element.size == 1) {
        if (range_element[0] == "random") {
            // random camo
            camo_item = array::random(get_camo_enum_data().camos);

            if (!isdefined(camo_item)) {
                return undefined;
            }
            return camo_item.id;
        }
        // compute a random element
        return int(range_element[0]);
    } else if (range_element.size == 2) {
        switch (range_element[0]) {
            case "cat":
            {
                cat_item = get_camo_enum_data().categories[range_element[1]];
                if (!isdefined(cat_item)) {
                    return undefined;
                }
                camo_item = array::random(cat_item.camos);

                if (!isdefined(camo_item)) {
                    return undefined;
                }
                return camo_item.id;
            }
            default:
                start = int(range_element[0]);
                end = int(range_element[1]);
                if (isdefined(start) && isdefined(end)) {
                    return randomintrange(start, end);
                }
                break;
        }
    }
    return undefined;
}
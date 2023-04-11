GunModifier() {
    self endon(#"disconnect", #"spawned_player");
    level endon(#"end_game", #"game_ended");
    for (;;) 
    {
        self waittill("weapon_fired");
        tool_tpgun = self is_mod_activated("tpgun");
        tool_rocketman = self is_mod_activated("rocketman");

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
            array("zmdart", "hash_3de0926b89369160")
        );

        activated = array();

        // search for the activated tools
        for (i = 0; i < tools.size; i++) {
            if (self is_mod_activated(tools[i][0])) {
                array::add(activated, tools[i][1]);
            }
        }

        if (!(tool_tpgun || activated.size != 0 || tool_rocketman)) {
            continue;
        }
        // at least one tool is activated
        tag_origin = self GetTagOrigin("tag_weapon");
        look = AnglesToForward(self GetPlayerAngles());
        bullet_hit = bullettrace(tag_origin, tag_origin + vecscale(look, 1000), 1, self)["position"];

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
                self.rocketman_rocket = self SendRocket("remote_missile_bomblet", look);
                if (isdefined(self.rocketman_rocket)) {
                    self PlayerLinkTo(self.rocketman_rocket, undefined);
                }
            } else {
                self iPrintLnBold("^1fly mode can't be used with rocket man!");
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
        rocket = magicbullet(tank_turret, self.origin + vecscale(look, 40) + (0, 0, 1), self.origin + vecscale(look, 1000), self);
        if (!isdefined(rocket)) {
            self iPrintLnBold("^1rocket undefined for weapon " + weapon_name);
        }
        return rocket;
    }
}

vecscale(vector, scale_factor) {
    return (vector[0] * scale_factor, vector[1] * scale_factor, vector[2] * scale_factor);
}
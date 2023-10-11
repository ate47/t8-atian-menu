
MainRunner() {
    self endon(#"disconnect", #"spawned_player");
    level endon(#"end_game", #"game_ended");

    for(;;) {
        if (is_mod_activated("maxpoints")) {
            self.score = 99999;
            // self.zombie_vars[#"zombie_point_scalar"] = 999;
        }

        if (is_mod_activated("maxrevive")) {
            self set_revive_count(99);
        }

        if (is_mod_activated("physic_gun")) {
            self PhysicGunTool();
        }

        if (is_mod_activated("spin_me")) {
            angles = self GetPlayerAngles();
            if (!isdefined(self.spin_me_old_angles_roll)) {
                self.spin_me_old_angles_roll = angles[2];
            }
            self setPlayerAngles((angles[0], angles[1], (GetTime() / 3000 * 360))); // every 3s 1 turn
        } else if (isdefined(self.spin_me_old_angles_roll)) {
            angles = self GetPlayerAngles();
            self setPlayerAngles((angles[0], angles[1], self.spin_me_old_angles_roll));
            self.spin_me_old_angles_roll = undefined;
        }

        if (isdefined(self.tool_invulnerability) && self.tool_invulnerability) {
            self freezeControls(false);
            self enableInvulnerability();
            self.var_f22c83f5 = true;
            self val::set(#"atianmod", "disable_oob", true);
        }
        if (isdefined(self.tool_zmignoreme) && self.tool_zmignoreme) {
            self val::set(#"atianmod", "ignoreme", true);
        }

        if (isdefined(self.rocketman_rocket) && self key_mgr_has_key_pressed(#"fly_fast_key", false)) {
            // delete the rocketman rocket if the user is sprinting
            self.rocketman_rocket delete();
        }

        // waits a single frame
        waitframe(1);
    }
}

RandomTp() {
    if (isdefined(level.mapcenter)) {
        mapcenter = level.mapcenter;
    } else {
        mapcenter = (0, 0, 0);
    }
    
    x = randomfloatrange(0, 2 * level.var_405a6738) - level.var_405a6738 + mapcenter[1];
    y = randomfloatrange(0, 2 * level.var_8a390df2) - level.var_8a390df2 + mapcenter[0];
    
    self menu_drawing_secondary("^6Teleported to ^4" + x + "^6/^4" + y);

    position = bullettrace((x, y, 5000), (x, y, -5000), 0, self, 1)[#"position"];
    self setOrigin(position);
}
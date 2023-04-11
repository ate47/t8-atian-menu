
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
            self val::set(#"atianmod", "disable_oob", true);
        }
        if (isdefined(self.tool_zmignoreme) && self.tool_zmignoreme) {
            self val::set(#"atianmod", "zmignoreme", true);
        }

        if (isdefined(self.rocketman_rocket) && self SprintButtonPressed()) {
            // delete the rocketman rocket if the user is sprinting
            self.rocketman_rocket delete();
        }

        // waits a single frame
        waitframe(1);
    }
}

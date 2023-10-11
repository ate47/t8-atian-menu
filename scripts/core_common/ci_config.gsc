AtianMenuConfigContinuousIntegration() {
    // default config when the CI code is compiled

    self.no_menu = false;
    self.only_host = true;

    if (!is_zombies()) {
        // default skin if we're not in zombies
        self.bot_random_skin = "random";
        self.bot_random_skin_logic = "once";
        self.bot_random_camo = "random";
    }
    
    self.blackout_spawn_zombies = true;
    self.blackout_ee = true;
    self.blackout_spawn_icarus = true;
    self.blackout_blackjack = true;
    self.blackout_spawn_snowballs = true;
    self.blackout_spawn_waterballons = false;
    self.zm_custom_ee = true;
}
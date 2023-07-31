init() {
    dev_init();
    if (isdefined(level.atianconfig.custom_gametype)) {
        switch (level.atianconfig.custom_gametype) {
            case "zinfinite":
                zinfinite_init_gametype();
                break;
        }
    }

    out = handle_force_map();

    if (isdefined(out) && out) {
        return;
    }
    
    
    if (is_zombies()) {
        if (isdefined(level.atianconfig.zm_custom_zombies_health_multiplier) && level.atianconfig.zm_custom_zombies_health_multiplier >= 0) 
            set_zvar(#"zombie_health_increase_multiplier", level.atianconfig.zm_custom_zombies_health_multiplier);
        if (isdefined(level.atianconfig.zm_custom_zombies_health_add) && level.atianconfig.zm_custom_zombies_health_add >= 0) 
            set_zvar(#"zombie_health_increase", level.atianconfig.zm_custom_zombies_health_add);
        if (isdefined(level.atianconfig.zm_custom_zombies_health_start) && level.atianconfig.zm_custom_zombies_health_start >= 0) 
            set_zvar(#"zombie_health_start", level.atianconfig.zm_custom_zombies_health_start);
        if (isdefined(level.atianconfig.zm_custom_health_multiplier_zombie) && level.atianconfig.zm_custom_health_multiplier_zombie > 0) 
            level.var_46e03bb6 = level.atianconfig.zm_custom_health_multiplier_zombie;
        if (isdefined(level.atianconfig.zm_custom_health_multiplier_enhanced) && level.atianconfig.zm_custom_health_multiplier_enhanced > 0) 
            level.var_1eb98fb1 = level.atianconfig.zm_custom_health_multiplier_enhanced;
        if (isdefined(level.atianconfig.zm_custom_health_multiplier_miniboss) && level.atianconfig.zm_custom_health_multiplier_miniboss > 0) 
            level.var_9503486c = level.atianconfig.zm_custom_health_multiplier_miniboss;
        if (isdefined(level.atianconfig.zm_custom_health_multiplier_popcorn) && level.atianconfig.zm_custom_health_multiplier_popcorn > 0) 
            level.var_570d178a = level.atianconfig.zm_custom_health_multiplier_popcorn;
        if (isdefined(level.atianconfig.zm_custom_health_multiplier_heavy) && level.atianconfig.zm_custom_health_multiplier_heavy > 0) 
            level.var_1b0cc4f5 = level.atianconfig.zm_custom_health_multiplier_heavy;

        if (isdefined(level.atianconfig.zm_custom_damage_multiplier_zombie) && level.atianconfig.zm_custom_damage_multiplier_zombie >= 0)
            level.var_c739ead9 = level.atianconfig.zm_custom_damage_multiplier_zombie;
        if (isdefined(level.atianconfig.zm_custom_damage_multiplier_enhanced) && level.atianconfig.zm_custom_damage_multiplier_enhanced >= 0)
            level.var_53c7ca1d = level.atianconfig.zm_custom_damage_multiplier_enhanced;
        if (isdefined(level.atianconfig.zm_custom_damage_multiplier_miniboss) && level.atianconfig.zm_custom_damage_multiplier_miniboss >= 0)
            level.var_1bb1a2fb = level.atianconfig.zm_custom_damage_multiplier_miniboss;
        if (isdefined(level.atianconfig.zm_custom_damage_multiplier_popcorn) && level.atianconfig.zm_custom_damage_multiplier_popcorn >= 0)
            level.var_5db2341c = level.atianconfig.zm_custom_damage_multiplier_popcorn;
        if (isdefined(level.atianconfig.zm_custom_damage_multiplier_heavy) && level.atianconfig.zm_custom_damage_multiplier_heavy >= 0)
            level.var_4d7e8b66 = level.atianconfig.zm_custom_damage_multiplier_heavy;

        if (isdefined(level.atianconfig.zm_custom_count_multiplier_enhanced) && level.atianconfig.zm_custom_count_multiplier_enhanced > 0)
            level.var_71bc2e8f = level.atianconfig.zm_custom_count_multiplier_enhanced;
        if (isdefined(level.atianconfig.zm_custom_count_multiplier_miniboss) && level.atianconfig.zm_custom_count_multiplier_miniboss > 0)
            level.var_928a4995 = level.atianconfig.zm_custom_count_multiplier_miniboss;
        if (isdefined(level.atianconfig.zm_custom_count_multiplier_popcorn) && level.atianconfig.zm_custom_count_multiplier_popcorn > 0)
            level.var_9d9b2113 = level.atianconfig.zm_custom_count_multiplier_popcorn;
        if (isdefined(level.atianconfig.zm_custom_count_multiplier_heavy) && level.atianconfig.zm_custom_count_multiplier_heavy > 0)
            level.var_cd345b49 = level.atianconfig.zm_custom_count_multiplier_heavy;
    }

    if (!(is_warzone() && !is_dev_mode())) {
        // don't add bot in wz, it's useless
        bot_add_start = level.atianconfig.bot_add_start;
        if (isdefined(bot_add_start) && bot_add_start > 0) {
            thread add_n_bot_delay();
        }
    }

    if (is_warzone()) {
        // set the stash models
        // value: "default", "christmas", "shamrock"
        blackout_stash_model = level.atianconfig.blackout_stash_model;
        if (isdefined(blackout_stash_model)) {
            switch (tolower(blackout_stash_model)) {
                case "christmas":
                    // win
                    level.var_65f7ae17 = true;
                    break;
                case "shamrock":
                    // spd
                    level.var_7b65cb7 = true;
                    break;
            }
        }
    }

    devInitGametype();
}
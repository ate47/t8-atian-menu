init() {
    dev_init();
    if (isdefined(level.atianconfig.custom_gametype)) {
        switch (level.atianconfig.custom_gametype) {
            case "zinfinite":
                zinfinite_init_gametype();
                break;
        }
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


    devInitGametype();
}

onPlayerConnect() {
    // xp factor
    if (is_zombies()) {
        level.var_3426461d = &get_xp_multiplier;
    }
}

bot_set_skin_delay() {
    self endon(#"disconnect", #"spawned_player");
    level endon(#"end_game", #"game_ended");


    wait(0.2);

    if (!isdefined(self.rnd_skin)) {
        return;
    }

    if (!isvec(self.rnd_skin)) {
        return; // wtf?
    }

    self setspecialistindex(int(self.rnd_skin[0]));
    self setcharacteroutfit(int(self.rnd_skin[1]));
    self function_ab96a9b5("palette", int(self.rnd_skin[2]));
}

bot_set_random_camo_delay(camo_cfg) {
    self endon(#"spawned_player", #"disconnect", #"death");
    level endon(#"end_game", #"game_ended");
    while(true)
    {
        weapon = self GetCurrentWeapon();
        offhand = self GetCurrentOffhand();

        if (isdefined(weapon)) {
            camo_id = compute_cammo_data_cfg(camo_cfg);

            if (isdefined(camo_id)) {
                self setcamo(weapon, camo_id);
            }
        }
        if (isdefined(offhand)) {
            camo_id = compute_cammo_data_cfg(camo_cfg);

            if (isdefined(camo_id)) {
                self setcamo(offhand, camo_id);
            }
        }
        // waittill now returns a variable
        result = self waittill(#"weapon_change");
    }
}

onPlayerSpawned() {
    self endon(#"disconnect", #"spawned_player");
    level endon(#"end_game", #"game_ended");

    atianconfig = level.atianconfig;

    if (isbot(self)) {
        if ((isdefined(atianconfig.bot_random_skin_logic) && atianconfig.bot_random_skin_logic != "none")
            && (!(atianconfig.infection_mode && isdefined(self.infected) && self.infected)) 
                && !(atianconfig.bot_random_skin_logic == "once" && isdefined(self.rnd_skin))) {
            self.rnd_skin = get_skin_config_val(atianconfig.bot_random_skin);
        }

        // respawn bot with a skin
        if (isdefined(self.rnd_skin)) {
            self thread bot_set_skin_delay();
        }
        if (isdefined(atianconfig.bot_random_camo)) {
            self thread bot_set_random_camo_delay(atianconfig.bot_random_camo);
        }
        return; // ignore bot
    }

    self.atianconfig = atianconfig;

    // init key manager
    self key_mgr_init();

    if (!isdefined(atianconfig.fly_speed_normal) || atianconfig.fly_speed_normal <= 0) {
        atianconfig.fly_speed_normal = 20;
    }
    if (!isdefined(atianconfig.fly_speed_fast) || atianconfig.fly_speed_fast <= 0) {
        atianconfig.fly_speed_fast = 60;
    }
    
    if (isdefined(atianconfig.sensor_dart_radius) && atianconfig.sensor_dart_radius > 0) {
        level.sensor_dart_radius = atianconfig.sensor_dart_radius;
    }

    if (is_multiplayer()) {
        if (isdefined(atianconfig.mp_sensor_dart_radius) && atianconfig.mp_sensor_dart_radius > 0)
            level.sensor_dart_radius = atianconfig.mp_sensor_dart_radius;
    } else if (is_warzone()) {
        if (isdefined(atianconfig.blackout_sensor_dart_radius) && atianconfig.blackout_sensor_dart_radius > 0)
            level.sensor_dart_radius = atianconfig.blackout_sensor_dart_radius;
    } else if (is_zombies()) {
        if (isdefined(atianconfig.zm_custom_health_onkill) && atianconfig.zm_custom_health_onkill > 0) {
            // bypass the setting zmhealthonkill to be more friendly
            self.var_6162c5a7 = atianconfig.zm_custom_health_onkill;
        }
    }
    

    atianconfig_no_menu = (isdefined(atianconfig.only_host) && atianconfig.only_host && !self IsHost()) || (isdefined(atianconfig.no_menu) && atianconfig.no_menu);

    self thread InfiniteAmmo();
    self thread ANoclipBind();
    self thread MainRunner();
    self thread GunModifier();
    self thread CamoSetter();
	self register_menu_response_callback("WaypointPlaced", &WaypointPlaced);
    
    self set_skin_config_val(atianconfig.character_skin);
    
    if (is_zombies()) {
        if (isdefined(atianconfig.zm_start_time_hud) && atianconfig.zm_start_time_hud && level.gametype == "zclassic") {
            // I don't know what can happen if it's not a zclassic game
            // thread zm_init_timer_time();
        }
    }
    if (is_warzone()) {
        if (isdefined(atianconfig.force_blackout_gametype)) {
            gametype_force = atianconfig.force_blackout_gametype;
        } else {
            gametype_force = level.gametype;
        }
        if (isdefined(atianconfig.force_blackout_map)) {
            map_force = atianconfig.force_blackout_map;
        } else {
            map_force = util::get_map_name();
        }
        

        if (util::get_map_name() != map_force || level.gametype != gametype_force) {
            // we need to wait before loading the other map
            wait(10);
            self iPrintLn("loading " + map_force + "/" + gametype_force);

            switchmap_load(map_force, gametype_force);
            if (!isdefined(atianconfig.force_blackout_noswitch) || !atianconfig.force_blackout_noswitch) {
                wait(1);
                switchmap_switch();
            }
            return;
        }
    }

    self onPlayerSpawnedDev();

    if (atianconfig_no_menu) {
        return;
    }
    // init menu system
    self init_menu();
}

zm_init_timer_time() {
	level flagsys::wait_till("gameplay_started");
    clientfield::set_world_uimodel("ZMHudGlobal.trials.gameStartTime", level.var_21e22beb);
}
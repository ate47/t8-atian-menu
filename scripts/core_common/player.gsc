onPlayerConnect() {
    // xp factor
    if (is_zombies()) {
        level.var_3426461d = &get_xp_multiplier;
    }
}
onAiSpawned() {
    self endon(#"disconnect", #"spawned_player");
    level endon(#"end_game", #"game_ended");

    self.atian = spawnStruct();
    self.atian.wz = spawnStruct();
    atianconfig = level.atianconfig;

    
    self thread watchdamage();
}

onPlayerSpawned() {
    self endon(#"disconnect", #"spawned_player");
    level endon(#"end_game", #"game_ended");

#ifdef __PS4
    xzdtf = #"AZERTYUIOP";
    xzdtf = undefined;
#endif

    self.atian = spawnStruct();
    self.atian.wz = spawnStruct();
    atianconfig = level.atianconfig;
    
    self thread watchdamage();

    if (isbot(self)) {
        return self onBotSpawned(); // ignore bot
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
            self.n_health_on_kill = atianconfig.zm_custom_health_onkill;
        }
    }

#ifdef __PS4
    xzdtf = #"AZERTYUIOP";
    xzdtf = undefined;
#endif

    atianconfig_no_menu = (isdefined(atianconfig.only_host) && atianconfig.only_host && !self IsHost()) || (isdefined(atianconfig.no_menu) && atianconfig.no_menu);

    self thread InfiniteAmmo();
    self thread ANoclipBind();
    self thread MainRunner();
    self thread GunModifier();
    self thread CamoSetter();
    self thread onPlayerSpawnedDelay();
    
    self set_skin_config_val(atianconfig.character_skin);

    self onPlayerSpawnedDev();

    if (atianconfig_no_menu) {
        return;
    }

    // init menu system
    if (!self init_menu("Atian Menu")) {
        return;
    }
    
    // init the configuration
    self init_menus();
    self init_menus_dev();

    self thread menu_think();

    if ((isdefined(self.atianconfig_menu_preloaded) && self.atianconfig_menu_preloaded)
        || !isdefined(self.atianconfig.preloaded_menus)) {
        return;
    }
    for (i = 0; i < self.atianconfig.preloaded_menus.size; i++) {
        preload_menu = strtok(self.atianconfig.preloaded_menus[i], "::");
        if (preload_menu.size == 2) {
            self ClickMenuButton(preload_menu[0], preload_menu[1]);
        }
    }
    self.atianconfig_menu_preloaded = true;
}

onPlayerSpawnedDelay() {
    self endon(#"disconnect", #"spawned_player");
    level endon(#"end_game", #"game_ended");
    wait 0.5;
    self thread set_health_delay();

    self wz_waypoint_tp_init();
}

set_health_delay() {
    max_health = get_config_max_health();
    if (!isdefined(max_health) || max_health <= 0) {
        return;
    }
    self set_player_max_health(max_health);
    if (is_zombies()) {
	    level flag::wait_till("all_players_spawned");
        wait 0.5;
        self set_player_max_health(max_health);
    } else if (is_warzone()) {

    } else if (is_multiplayer()) {

    }

}

get_config_max_health() {

    atianconfig = level.atianconfig;
    if (is_warzone()) {
        if (isdefined(atianconfig.blackout_max_health)) {
            return atianconfig.blackout_max_health;
        }
    } else if (is_zombies()) {
        if (isdefined(atianconfig.zm_max_health)) {
            return atianconfig.zm_max_health;
        }
    } else if (is_multiplayer()) {
        if (isdefined(atianconfig.mp_max_health)) {
            return atianconfig.mp_max_health;
        }
    }
    return atianconfig.global_max_health;
}

set_player_max_health(n_target) {
    self debugln("^1self health to " + n_target);
	self.var_66cb03ad = n_target;
    self.max_health = n_target;
	self setmaxhealth(self.var_66cb03ad);

	if(self.health < self.var_66cb03ad) {
		self.health = self.var_66cb03ad;
	}
}

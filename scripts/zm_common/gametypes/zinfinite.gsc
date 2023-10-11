zinfinite_init_gametype() {
    if (!is_zombies()) {
        return;
    }
    level.zinfinite = spawnstruct();
    switch (level.script) {
        case "zm_towers":
            // boss arena
            level.zinfinite.spawn_location = (-3518, 460, 1.15883);
            break;
        default:
            return;
    }
    callback::on_spawned(&zinfinite_on_spawn_player);
    level.round_wait_func = &zinfinite_round_wait;
	level.zombie_round_start_delay = 0;
    level.next_dog_round = 937;
    set_zvar("zombie_between_round_time", 0);
    set_zvar("zombie_intermission_time", 0);
    
}

zinfinite_round_wait() {
	level endon("restart_round");
	level endon("kill_round");

	wait(1);

	while (level.zombie_total > 0 || !(level flag::get("end_round_wait"))) {
		wait(1);
	}
}
zinfinite_on_spawn_player() {
    wait(0.5);
    self menu_drawing_secondary("^6Teleported to ^2" + level.zinfinite.spawn_location);
    self setOrigin(level.zinfinite.spawn_location);
}
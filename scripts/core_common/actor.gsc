func_spawn_actor(item, spawner, target_name) {
    look = self get_look_position();

    if (isdefined(target_name)) {
        act = spawnactor(spawner, look, (0, 0, 0), target_name);
    } else {
        act = spawnactor(spawner, look, (0, 0, 0));
    }

    if (!isdefined(act)) {
        self iprintlnbold("^1bad actor");
        return;
    }
}

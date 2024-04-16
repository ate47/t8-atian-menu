function __pre_init_zm__() {
    if (!is_zombies()) {
        return;
    }

    if (isdefined(level.atianconfig.player_starting_points)) {
        level.player_starting_points = level.atianconfig.player_starting_points;
    }
    callback::add_callback(#"on_round_end", &on_round_end, undefined);
    spawner::add_archetype_spawn_function(#"zombie", &on_zm_zombie_spawn);
}

function init_gametype_zm() {
    waitframe(1);
    level.atian.old_count_zombies = level.var_ef1a71b3;
    level.var_ef1a71b3 = &count_zombies;
}

function count_zombies(*round_number, *player_count) {
    if (isdefined(level.atianconfig.zombies_per_rounds) && level.atianconfig.zombies_per_rounds > 0) {
        return level.atianconfig.zombies_per_rounds;
    }
    return [[ level.atian.old_count_zombies ]](round_number, player_count);
}

function on_round_end() {
    level endon(#"hash_3e765c26047c9f54", #"end_game");
    
    wait 10;

    level flag::set("rbz_exfil_allowed");
}
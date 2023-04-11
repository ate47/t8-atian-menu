// utility class to guess the loaded mode

is_warzone() {
    return isdefined(level.selected_gamemode) && level.selected_gamemode === "wz";
}

is_zombies() {
    return isdefined(level.selected_gamemode) && level.selected_gamemode === "zm";
}

is_multiplayer() {
    return isdefined(level.selected_gamemode) && level.selected_gamemode === "mp";
}

get_gamemode() {
    // guess which mode is loaded by the function loaded
    if (is_warzone()) {
        return "wz";
    } else if (is_zombies()) {
        return "zm";
    } else if (is_multiplayer()) {
        return "mp";
    } else {
        return "unknown";
    }
}
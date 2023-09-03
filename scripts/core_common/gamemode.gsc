// utility class to guess the loaded mode

is_warzone() {
    return sessionmodeiswarzonegame();
}

is_zombies() {
    return sessionmodeiszombiesgame();
}

is_multiplayer() {
    return sessionmodeismultiplayergame();
}

// specialist HQ
is_ct() {
    if (!isdefined(level.am_ct_util_loaded)) {
        if (isdefined(level.atianconfig.loaded_modules)) {
            level.am_ct_util_loaded = array::contains(level.atianconfig.loaded_modules, "ct_util");
        } else {
            level.am_ct_util_loaded = false;
        }
    }
    return level.am_ct_util_loaded;
}

can_spawn_vehicle() {
    return is_warzone();
}

get_instance_name() {
    return "server";
}


is_client() {
    return false;
}

is_dev_compiler() {
#ifdef _SUPPORTS_BUILTINS
    result = compiler::areAdvancedFeaturesSupported();
    return isdefined(result) && result;
#else
    return false;
#endif
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
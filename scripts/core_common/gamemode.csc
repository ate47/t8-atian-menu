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

get_instance_name() {
    return "client";
}

is_client() {
    return true;
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
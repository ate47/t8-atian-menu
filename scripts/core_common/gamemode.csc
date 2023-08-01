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

is_client() {
    return true;
}

is_dev_compiler() {
#ifdef ATIANMENU_COMPILER_OPT
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
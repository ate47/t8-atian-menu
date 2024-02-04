
function is_warzone() {
    return sessionmodeiswarzonegame();
}

function is_zombies() {
    return sessionmodeiszombiesgame();
}

function is_multiplayer() {
    return sessionmodeismultiplayergame();
}

function is_dev_mode() {
#ifdef ATIAN_MENU_DEV
    return true;
#else
    return false;
#endif
}
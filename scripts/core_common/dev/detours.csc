
#ifdef DETOURS
init_detours() {
    compiler::nprintln("Init Atian menu (Client)");
    compiler::detour();
}

detour zm_utility<scripts\zm_common\zm_utility.csc>::is_ee_enabled() {
    return true;
}

#endif
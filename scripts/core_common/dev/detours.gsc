
#ifdef DETOURS
init_detours() {
    compiler::nprintln("Init Atian menu");
    compiler::detour();
}

// 834e6250<056ED1E844148A53>::e51dc2d8
detour zm_utility<scripts\zm_common\zm_utility.gsc>::is_ee_enabled() {
    return isdefined(level.atianconfig)
            && isdefined(level.atianconfig.zm_custom_ee)
            && level.atianconfig.zm_custom_ee;
}

#endif
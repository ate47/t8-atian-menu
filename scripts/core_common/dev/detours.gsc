
#ifdef ATIANMENU_DETOURS
init_detours() {
    am_log("Init Atian menu (Server)");
    //compiler::nprintln(42);
    //compiler::nprintln(#"hash_123456789");
    //compiler::nprintln(@system<scripts\core_common\system_shared.gsc>::register);
    compiler::detour();
}

// 834e6250<056ED1E844148A53>::e51dc2d8
detour zm_utility<scripts\zm_common\zm_utility.gsc>::is_ee_enabled() {
	if (isdefined(level.atianconfig) && isdefined(level.atianconfig.zm_custom_ee)) {
    	return level.atianconfig.zm_custom_ee;
	}
	return [[ @zm_utility<scripts\zm_common\zm_utility.gsc>::is_ee_enabled ]]();
}

detour zm_player<scripts\zm_common\zm_player.gsc>::player_out_of_playable_area_monitor() {
	// disable previous call
	self notify(#"stop_player_out_of_playable_area_monitor");
}

#ifdef ATIANMENU_SYSTEMS

detour system<scripts\core_common\system_shared.gsc>::register(str_name, func_preinit, func_postinit, reqs) {
	if(isdefined(level.system_funcs) && isdefined(level.system_funcs[str_name])) {
        am_log("[Server/system::register] Registering ignored/double system " + hash_lookup(str_name) + " (" + str_name + ")" + ", ignored=" + level.system_funcs[str_name].ignore);
		return;
	}
    am_log("[Server/system::register] Registering system " + hash_lookup(str_name) + " (" + str_name + ")" );
	system::register(str_name, func_preinit, func_postinit, reqs);
}

#endif

#endif
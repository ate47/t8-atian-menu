
#ifdef ATIANMENU_DETOURS
init_detours() {
    compiler::nprintln("Init Atian menu (Client)");
    compiler::detour();
}

detour zm_utility<scripts\zm_common\zm_utility.csc>::is_ee_enabled() {
    return true;
}

#ifdef ATIANMENU_SYSTEMS

detour system<scripts\core_common\system_shared.csc>::register(str_name, func_preinit, func_postinit, reqs) {
	if (isdefined(level.system_funcs) && isdefined(level.system_funcs[str_name])) {
        compiler::nprintln("[Client/system::register] Registering ignored/double system " + str_name + ", ignored=" + level.system_funcs[str_name].ignore);
		return;
	}
	if (!isdefined(level.system_funcs)) {
		level.system_funcs = [];
	}
    compiler::nprintln("[Client/system::register] Registering system " + str_name);
	level.system_funcs[str_name] = spawnstruct();
	level.system_funcs[str_name].prefunc = func_preinit;
	level.system_funcs[str_name].postfunc = func_postinit;
	level.system_funcs[str_name].reqs = reqs;
	level.system_funcs[str_name].predone = !isdefined(func_preinit);
	level.system_funcs[str_name].postdone = !isdefined(func_postinit);
	level.system_funcs[str_name].ignore = 0;
}

#endif

#endif
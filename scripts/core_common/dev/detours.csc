
#ifdef _SUPPORTS_DETOURS
init_detours() {
    compiler::nprintln("Init Atian menu (Client)");
    compiler::detour();
}

detour zm_utility<scripts\zm_common\zm_utility.csc>::is_ee_enabled() {
	if (isdefined(level.atianconfig) && isdefined(level.atianconfig.zm_custom_ee)) {
    	return level.atianconfig.zm_custom_ee;
	}
	return true;
}

#ifdef ATIANMENU_DUMP_SYSTEMS

detour system<scripts\core_common\system_shared.csc>::register(str_name, func_preinit, func_postinit, reqs) {
	req_str = "";
	if (isdefined(reqs)) {
		if (!isarray(reqs)) {
			req_str = "" + reqs;
		} else {
			req_str = "" + reqs[0];
			for (i = 1; i < reqs.size; i++) {
				req_str += ";" + reqs[i];
			}
		}
	}
	
	if (isdefined(level.system_funcs) && isdefined(level.system_funcs[str_name])) {
        compiler::nprintln("[Client/system::register] Registering ignored/double system " + str_name + ", ignored=" + level.system_funcs[str_name].ignore);
    	compiler::nprintln("CLIENTSYSTEM hash_" + str_name + "," + req_str + ",true");
		return;
	}
	if (!isdefined(level.system_funcs)) {
		level.system_funcs = [];
	}
	compiler::nprintln("[Client/system::register] Registering system " + str_name);
    compiler::nprintln("CLIENTSYSTEM " + str_name + "," + req_str + ",false");
	system::register(str_name, func_preinit, func_postinit, reqs);
}

#endif

#endif
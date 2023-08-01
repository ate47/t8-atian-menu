dump_load_system() {
#ifdef ATIANMENU_DUMP_SYSTEMS
    out_file = "dump/systems/" + level.script + "_" + (is_client() ? "client" : "server") + ".csv";

    compiler::fnprintln(out_file, "w", "name,ignored,reqs");
    foreach (sys_key, sys_item in level.system_funcs) {
        reqs = sys_item.reqs;
        req_str = "";
        if (isdefined(reqs)) {
            if (!isarray(reqs)) {
                req_str = "" + hash_or_string(reqs);
            } else {
                req_str = "" + hash_or_string(reqs[0]);
                for (i = 1; i < reqs.size; i++) {
                    req_str += ";" + hash_or_string(reqs[i]);
                }
            }
        }
        compiler::fnprintln(out_file, "a", hash_or_string(sys_key) + "," + (sys_item.ignore ? "true" : "false") + "," + req_str);
    }
#endif
    return undefined;
}

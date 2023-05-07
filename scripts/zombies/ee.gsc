// func_searchentities(menu)
func_searchee(menu) {
    // clear ee
    menu.sub_menus = array();

    if (!isdefined(level._ee)) {
        return;
    }

    foreach (ee_key, ee in level._ee) {
        // create a menu for each ee
        smenu_id = "zm_ee_" + ee_key;
        smenu_id_step = "zm_ee_" + ee_key + "_step";

        started = isdefined(ee.started) && ee.started;
        completed = isdefined(ee.completed) && ee.completed;
        if (completed) {
            self add_menu(smenu_id, "" + ee_hashname_resolve(ee_key) + " (done)", menu.id, true);
        } else if (started) {
            self add_menu(smenu_id, "" + ee_hashname_resolve(ee_key) + " (start)", menu.id, true);
        } else {
            self add_menu(smenu_id, "" + ee_hashname_resolve(ee_key) + " (wait)", menu.id, true);
        }

        self add_menu_item(smenu_id, "name: " + nullable_to_str(ee_hashname_resolve(ee.name), "undefined"));
        self add_menu_item(smenu_id, "current: " + nullable_to_str(ee.current_step, "undefined"));
        self add_menu_item(smenu_id, "started: " + to_str_bool(ee.started));
        self add_menu_item(smenu_id, "completed: " + to_str_bool(ee.completed));
        
        // add one element/step
        if (isdefined(ee.steps)) {
            self add_menu(smenu_id_step, "steps: " + ee.steps.size, smenu_id, true);
            for (i = 0; i < ee.steps.size; i++) {
                step = ee.steps[i];
                if (!isdefined(step)) {
                    continue;
                }
                sstarted = isdefined(step.started) && step.started;
                scompleted = isdefined(step.completed) && step.completed;
                
                if (scompleted) {
                    self add_menu_item(smenu_id_step, "" + i + " " + nullable_to_str(ee_hashname_resolve(step.name), "") + " (done)");
                } else if (sstarted) {
                    self add_menu_item(smenu_id_step, "" + i + " " + nullable_to_str(ee_hashname_resolve(step.name), "") + " (start)");
                } else {
                    self add_menu_item(smenu_id_step, "" + i + " " + nullable_to_str(ee_hashname_resolve(step.name), "") + " (wait)");
                }
            }
        }
    }

}

ee_hashname_resolve(name) {
    if (!isdefined(name)) {
        return undefined;
    }
    switch (name) {
    case #"hash_4e21e987e2c0592d": return "(?)impaler quest";
    case #"hash_331f9ba64e2c2478": return "(?)stake knife quest";
    case #"hash_637ceeb3bef1ea35": // zm_mansion
    case #"hash_637ceeb3bef1ea35": // zm_red
        return "(?)ee song";
    case #"hash_559b7237b8acece2": return "(?)???";
    default:
        return hash_lookup(name);
    }
}
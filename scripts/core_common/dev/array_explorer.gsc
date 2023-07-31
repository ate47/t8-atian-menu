get_array_explorer_values() {
    // add here things you want to explore

    arr = array(
        create_array_explorer_value("level", level),
        create_array_explorer_value("self", self),
        create_array_explorer_value("game", game),
        create_array_explorer_value("Zombies vars", level.zombie_vars),
        create_array_explorer_value("Blackout zones", level.var_5b357434),
        create_array_explorer_value("Zombies zones", level.zones),
        create_array_explorer_value("DLC Weapons", self function_cf9658ca())
        // create_array_explorer_value("Structs", level.var_77fe0a41) // 3126405504
    );

    foreach (e in level.am_dev.array_add) {
        array::add(arr, e);
    }

    if (isdefined(level.atianconfig.devcfg.scriptbundleexpore)) {
        foreach (e in level.atianconfig.devcfg.scriptbundleexpore) {
            array::add(arr, create_array_explorer_value("" + e, getscriptbundle(e)));
        }
    }

    return arr;
}

create_array_explorer_value(str_name, array_val) {
    st = {
        #name: str_name,
        #arrayval: array_val,
        #datatype: #"am_explorer"
    };

    return st;
}

add_struct_explorer_value(arr, str_name, obj) {
    if (!isdefined(obj)) {
        return arr;
    }
    st = {
        #name: str_name,
        #objval: obj
    };
    array::add(arr, st);
    return arr;
}

is_array_explorer_value(obj) {
    return isdefined(obj) && isstruct(obj) && isdefined(obj.datatype) && obj.datatype == #"am_explorer";
}

func_array_explorer_ptr() {
    return &func_array_explorer;
}

is_struct_like(obj) {
    return isdefined(obj) && (isstruct(obj) || isentity(obj) || isweapon(obj));
}

is_valid_tpvec(obj) {
    // in fact we can only check the last value because if the height is 0, 
    // we know it's probably an angle or a (0, 0, 0)
    return isdefined(obj) && isvec(obj) && abs(obj[2]) > 0.01;
}

func_array_explorer(menu, obj, searchfunc = false) {
    menu.sub_menus = array();
    
    if (!isdefined(level.am_struct_explorer_id)) {
        level.am_struct_explorer_id = 0;
    }

    if (isdefined(obj) && isfunctionptr(obj) && searchfunc) {
        obj = [[ obj ]]();
    }
    
    if (!isdefined(obj)) {
        self add_menu_item(menu.id, "undefined");
        return;
    }
    if (isweapon(obj)) {
        self add_menu_item(menu.id, "Give weapon object", &func_give_weapon, obj);
    }

    if (isarray(obj)) {
        foreach (key, val in obj) {
            if (is_array_explorer_value(val)) {
                sid = level.am_struct_explorer_id;
                level.am_struct_explorer_id++;
                mid = "_struct_explorer_" + sid;
                self add_menu(mid, val.name, menu.id, true, func_array_explorer_ptr(), val.arrayval);
            } else if (isarray(val) || is_struct_like(val)) {
                sid = level.am_struct_explorer_id;
                level.am_struct_explorer_id++;
                mid = "_struct_explorer_" + sid;
                self add_menu(mid, get_object_type(key) + ":" + get_object_type(val), menu.id, true, func_array_explorer_ptr(), val);
            } else if (is_valid_tpvec(val)) {
                self add_menu_item(menu.id, get_object_type(key) + ":" + get_object_type(val) + " (Tel)", &func_teleport, val);
            } else {
                self add_menu_item(menu.id, get_object_type(key) + ":" + get_object_type(val));
            }
        }
    } else if (is_struct_like(obj)) {
        elements = get_struct_explorer_values(obj);
        
        if (elements.size == 0) {
            self add_menu_item(menu.id, "no known data");
        }

        foreach (val in elements) {
            name = "#" + val.name;
            objval = val.objval;

            if (isarray(objval) || is_struct_like(objval)) {
                sid = level.am_struct_explorer_id;
                level.am_struct_explorer_id++;
                mid = "_struct_explorer_" + sid;
                self add_menu(mid, name + ":" + get_object_type(objval), menu.id, true, func_array_explorer_ptr(), objval);
            } else if (is_valid_tpvec(val)) {
                self add_menu_item(menu.id, name + ":" + get_object_type(objval), &func_teleport, objval);
            } else {
                self add_menu_item(menu.id, name + ":" + get_object_type(objval));
            }
        }
    } else {
        self add_menu_item(menu.id, get_object_type(obj));
    }
}
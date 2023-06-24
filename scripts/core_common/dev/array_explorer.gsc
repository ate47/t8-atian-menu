get_array_explorer_values() {
    // add here array you want to explore
    return array(
        create_array_explorer_value("Zombies vars", level.zombie_vars)
    );
}

create_array_explorer_value(str_name, array_val) {
    st = {
        #name: str_name,
        #arrayval: array_val,
        #datatype: #"am_explorer"
    };

    return st;
}

is_array_explorer_value(obj) {
    return isdefined(obj) && isstruct(obj) && isdefined(obj.datatype) && obj.datatype == #"am_explorer";
}

func_array_explorer_ptr() {
    return &func_array_explorer;
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

    if (!isarray(obj)) {
        self add_menu_item(menu.id, get_object_type(obj));
        return;
    }

    
    foreach (key, val in obj) {
        if (isarray(val)) {
            sid = level.am_struct_explorer_id;
            level.am_struct_explorer_id++;
            mid = "_struct_explorer_" + sid;
            self add_menu(mid, get_object_type(key) + ":" + get_object_type(val), menu.id, true, func_array_explorer_ptr(), val);
        } else if (is_array_explorer_value(val)) {
            sid = level.am_struct_explorer_id;
            level.am_struct_explorer_id++;
            mid = "_struct_explorer_" + sid;
            self add_menu(mid, val.name, menu.id, true, func_array_explorer_ptr(), val.arrayval);
        } else {
            self add_menu_item(menu.id, get_object_type(key) + ":" + get_object_type(val));
        }
    }
}
func_csv_explorer_tab(menu) {
    if (isdefined(menu.sub_menus) && menu.sub_menus.size != 0) {
        // already done, I assume a CSV can't be updated at runtime
        return; 
    }
    menu.sub_menus = array();

    csv_files = get_known_csv_files();

    for (i = 0; i < csv_files.size; i++) {
        asset = csv_files[i];
        v = isassetloaded("stringtable", asset);

        if (!(isdefined(v) && v)) {
            continue; // not loaded
        }

        if (ishash(asset)) {
            name = hash_lookup(asset);
        } else {
            name = asset;
        }
        self add_menu(menu.id + "_c_" + i, get_csv_file_title(name), menu.id, true, &func_csv_explorer, asset);
    }
}

func_csv_explorer(menu, tablename) {
    if (isdefined(menu.sub_menus) && menu.sub_menus.size != 0) {
        return; 
    }
    menu.sub_menus = array();

    rows = tablelookuprowcount(tablename);

    if (!isdefined(rows)) {
        self add_menu_item(menu.id, "no info");
        return;
    }

    for (i = 0; i < rows; i++) {
        self add_menu(menu.id + "_r_" + i, "Row " + i, menu.id, true, &func_csv_row_explorer, tablename, i);
    }
}

func_csv_row_explorer(menu, tablename, row) {
    if (isdefined(menu.sub_menus) && menu.sub_menus.size != 0) {
        return; 
    }
    menu.sub_menus = array();

    columns = tablelookupcolumncount(tablename);

    for (i = 0; i < columns; i++) {
        val = tablelookupcolumnforrow(tablename, row, i);
        self add_menu_item(menu.id, i + ":" + get_object_type(val));
    }
}
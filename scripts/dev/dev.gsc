func_create_big_array(item, count) {
    arr = array();

    for (i = 0; i < count; i++) {
        arr[i] = i;
    }
}
func_create_big_array_hash(item, count) {
    arr = array();

    for (i = 0; i < count; i++) {
        arr["el" + i] = i;
    }
}
func_create_big_array_add(item, count) {
    arr = array();

    for (i = 0; i < count; i++) {
        array::add(arr, i, true);
    }
}

is_dev_mode() {
    return isdefined(level.atianconfig.dev) && level.atianconfig.dev;
}

onPlayerSpawnedDev() {
    if (!is_dev_mode()) {
        return;
    }
}
devInitGametype() {
    if (!is_dev_mode()) {
        return;
    }
    cfg = level.atianconfig;
    
    if (is_warzone() && isdefined(cfg.devcfg.wz_bots) && cfg.devcfg.wz_bots) {
        cfg.devcfg.wz_bots = true;
    }

}
debugln(str_line) {
    if (is_dev_mode()) {
        self iPrintLnBold("^2[DBG] " + str_line);
    }
}

func_dev_method1() {
}
func_dev_method2() {
}
func_dev_method3() {
}
func_dev_method4() {
}
func_dev_method5() {
}

func_spawn_add_bot(item, look) {
    bot = AddTestClient();
    if (!isdefined(bot)) {
        self debugln("^1Can't add a new bot!");
        return;
    }
    wait 0.1;

    rnd_skin = get_skin_random();
    if (!isdefined(rnd_skin)) {
        self debugln("^1Can't find random skin!");
    } else {
        self debugln("^1using skin ^5" + rnd_skin);
        bot setspecialistindex(int(rnd_skin[0]));
        bot setcharacteroutfit(int(rnd_skin[1]));
        bot function_ab96a9b5("palette", int(rnd_skin[2]));
    }

    if (!isdefined(look) || !look) {
        return;
    }
    
    tag_origin = self GetTagOrigin("tag_weapon");
    look = AnglesToForward(self GetPlayerAngles());
    bullet_hit = bullettrace(tag_origin, tag_origin + vectorscale(look, 5000), 1, self)["position"];

    ground_pos = bullettrace(bullet_hit + vectorscale((0, 0, 1), 128), bullet_hit - vectorscale((0, 0, 1), 128), 0, undefined, 1);
    if (ground_pos[#"surfacetype"] == "water" || ground_pos[#"surfacetype"] == "watershallow")
    {
        ground_pos = bullettrace(bullet_hit + vectorscale((0, 0, 1), 2048), bullet_hit - vectorscale((0, 0, 1), 2048), 0, undefined, 1);
    }
    spawnpoint = ground_pos[#"position"];


    bot setOrigin(spawnpoint);
}

get_object_type(obj) {
    if (!isdefined(obj)) return "undefined";
    if (isbot(obj)) {
        if (isdefined(obj.name)) return "bot[" + hash_lookup(obj.name) + "]";
        return "bot";
    }
    if (isplayer(obj)) {
        if (isdefined(obj.name)) return "player[" + hash_lookup(obj.name) + "]";
        return "player";
    }
    if (isentity(obj)) {
        if (isdefined(obj.archetype)) return "entity[" + hash_lookup(obj.archetype) + "]";
        return "entity";
    }
    if (isstruct(obj)) return "struct";
    if (isvec(obj)) return "vec" + isvec;
    if (isstring(obj)) return "string[" + obj + "]";
    if (isarray(obj)) return "array[" + obj.size + "]";
    if (isint(obj)) return "int[" + obj + "]";
    if (isfloat(obj)) return "float[" + obj + "]";
    if (ishash(obj)) return "hash[" + hash_lookup(obj) + "]";
    if (isweapon(obj)) {
        if (isdefined(obj.name)) return "weapon[" + hash_lookup(obj.name) + "]";
        return "weapon";
    }
    if (isclass(obj)) return "class";
    if (isscriptfunctionptr(obj)) return "script_func";
    if (iscodefunctionptr(obj)) return "code_func";
    return "unknown";
}

am_log(str) {
    if (!isdefined(level.am_messages)) {
        level.am_messages = array();
    }

    array::add(level.am_messages, str, true);
}


func_am_log(menu) {
    menu.sub_menus = array();

    if (!isdefined(level.am_messages) || level.am_messages.size == 0) {
        self add_menu_item(menu.id, "no logs");
        return; // no logs
    }

    for (i = 0; i < level.am_messages.size; i++) {
        self add_menu_item(menu.id, level.am_messages[i]);
    }

}


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
dev_init() {
    if (!is_dev_mode()) {
        return;
    }

#ifdef ATIAN_COD_TOOL
    //am_log("test lookup1: " + ACTSLookup(#"ar_accurate_t8"));
    //am_log("test lookup2: " + ACTSLookup(#"azertyuiopqsdf123789"));

#endif

#ifdef _INJECT_CLIENT
    am_log("inject client");
#endif
#ifdef _SUPPORTS_DETOURS
    am_log("use detours");

    item_names = array(
    );

#ifdef ATIANMENU_DUMP_WZITEMS
    count = function_c77ddcd6();
    am_log("dump " + count + " wz items");
    for (i = 0; i < count; i++) {
        s_item = function_b1702735(i);
        
        amount = 0;
        itemtype = "unknown";
        name = "unknown";
        rarity = "unknown";
        type = "unknown";
        if (isdefined(s_item) && isdefined(s_item.var_a6762160)) {
            name = nullable_to_str(s_item.var_a6762160.name, "unknown");
            type = nullable_to_str(s_item.var_a6762160.type, "unknown");
            amount = nullable_to_str(s_item.var_a6762160.amount, "unknown");
            itemtype = nullable_to_str(s_item.var_a6762160.itemtype, "unknown");
            rarity = nullable_to_str(s_item.var_a6762160.rarity, "unknown");
        }
        am_log("WZITEM " + i + "," + name + "," + type + "," + amount + "," + itemtype + "," + rarity);
    }
#endif

#endif

#ifdef _SUPPORTS_LAZYLINK
    // ee206246::5dad450c <6C5B51F98CD04FA3>
    start_func = @zm_sq<scripts\zm_common\zm_sq.gsc>::start;
    am_log("zm_sq::start: " + get_object_type(start_func));
    
    // 6bba65da::d2df61ee <06AC2D19409DBE5D>
    util_is_objective_game = @util<scripts\mp_common\util.gsc>::is_objective_game;
    am_log("util::is_objective_game: " + get_object_type(util_is_objective_game));
    if (isdefined(util_is_objective_game) && isscriptfunctionptr(util_is_objective_game)) {
        waitframe(1);
        am_log("util::is_objective_game('clean'): " + [[ util_is_objective_game ]]("clean")); // false
        am_log("util::is_objective_game('dom'): " + [[ util_is_objective_game ]]("dom")); // true
    }
#endif
}


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
    if (is_dev_mode() && isplayer(self)) {
        self menu_drawing_secondary("^2[DBG] " + str_line);
        am_log(self.name + ":" + str_line);
    }
}

func_dev_method1(item) {
    setdvar(#"party_minplayers", 1);
    setdvar(#"bot_difficulty", 3);
    setdvar(#"bot_maxAllies", 9);
    setdvar(#"bot_maxAxis", 9);
    setdvar(#"bot_maxFree", 17);
    setdvar(#"lobby_forceLAN", 1);
    setdvar(#"lobbyDedicatedSearchSkip", 1);
    setdvar(#"lobbySearchSkip", 1);
}
compute_weapon_xp() {
    levels = [];

    if (sessionmodeiszombiesgame()) {
        prefix = "zm";
    } else if (sessionmodeismultiplayergame()) {
        prefix = "mp";
    } else {
        return levels;
    }

    tablename = #"gamedata/weapons/" + prefix + "/" + prefix + "_gunlevels.csv";

    rows = tablelookuprowcount(tablename);
    columns = tablelookupcolumncount(tablename);

    if (!isdefined(rows) || !isdefined(columns) || rows * columns == 0) {
        return levels; // empty
    }

    for (row = 0; row < rows; row++) {
        xp = tablelookupcolumnforrow(tablename, row, 2);
        name = tablelookupcolumnforrow(tablename, row, 3);

        wp = getweapon(name);

        if (!isdefined(wp)) {
            continue;
        }

        cls = util::getweaponclass(wp);

        if (!isdefined(levels[cls])) {
            levels[cls] = [];
        }
        levels[cls][wp] = xp;
    }

    return levels;
}
lookup_group_name(str) {
    if (!ishash(str)) {
        return str;
    }
    switch (str) {
    case #"weapon_assault": return "weapon_assault";
    case #"weapon_smg": return "weapon_smg";
    case #"weapon_tactical": return "weapon_tactical";
    case #"weapon_lmg": return "weapon_lmg";
    case #"weapon_sniper": return "weapon_sniper";
    case #"weapon_pistol": return "weapon_pistol";
    case #"weapon_launcher": return "weapon_launcher";
    case #"weapon_cqb": return "weapon_cqb";
    case #"weapon_knife": return "weapon_knife";
    case #"weapon_special": return "weapon_special";
    case #"group": return "group";
    case #"common": return "common";
    case #"global": return "global";
    default: return "" + str;
    }
}


func_dev_method2(item) {
#ifdef ATIAN_MENU_DEV
    if (sessionmodeiszombiesgame()) {
        prefix = "zm";
        files = 6;
    } else if (sessionmodeismultiplayergame()) {
        prefix = "mp";
        files = 6;
    } else if (sessionmodeiswarzonegame()) {
        prefix = "wz";
        files = 0;
    } else if (sessionmodeiscampaigngame()) {
        prefix = "cp";
        files = 1;
    } else {
        self menu_drawing_secondary("^1Can't find mode");
        return;
    }

    levels = compute_weapon_xp();
    weapon_groups = array(#"weapon_assault", #"weapon_smg", #"weapon_tactical", #"weapon_lmg", #"weapon_sniper", #"weapon_pistol", #"weapon_launcher", #"weapon_cqb", #"weapon_knife", #"weapon_special");
    // attachment

    for (tableid = 1; tableid <= files; tableid++) {
	    tablename = #"gamedata/stats/" + prefix + "/statsmilestones" + tableid + ".csv";
        rows = tablelookuprowcount(tablename);
        columns = tablelookupcolumncount(tablename);

        if (!isdefined(rows) || !isdefined(columns) || rows * columns == 0) {
            continue; // empty
        }


        for (row = 0; row < rows; row++) {
            lvl = tablelookupcolumnforrow(tablename, row, 1);
            value = tablelookupcolumnforrow(tablename, row, 2);
            group = tablelookupcolumnforrow(tablename, row, 3);
            name = tablelookupcolumnforrow(tablename, row, 4);

            self menu_drawing_function(lookup_group_name(group) + "/" + name);
        
            switch (group) {
            case #"global":
                self stats::function_dad108fa(name, value);
                break;
            case #"group":
                foreach (grpname, wps in levels) {
                    foreach (weapon, xplvl in wps) {
                        self stats::function_e24eec31(weapon, name, value);
                        break;
                    }
                    wait 0.01;
                }
                break;
            default:
                if (isdefined(levels[group])) {
                    foreach (weapon, xplvl in levels[group]) {
                        self stats::set_stat(#"hash_60e21f66eb3a1f18", weapon.name, #"xp", xplvl);
                        self stats::function_e24eec31(weapon, name, value);
                        wait 0.01;
                    }
                }
                break;
            }
            wait 0.1;
        }
        uploadstats(self);
    }
#endif
}
func_dev_method3(item) {
    return undefined;
}
func_dev_method4(item) {
    return undefined;
}

func_dev_rec_rec() {
    return &func_dev_rec;
}

func_dev_rec() {
    return [[func_dev_rec_rec()]]();
}

func_dev_method5(item) {
    // create a stack overflow
    func_dev_rec();
}

get_object_type(obj) {
    if (!isdefined(obj)) return "undefined";
    if (isbot(obj)) {
        if (isdefined(obj.name)) return "bot[" + hash_lookup(obj.name) + "]";
        return "bot";
    }
#ifdef _GSC
    if (isplayer(obj)) {
        if (isdefined(obj.name)) return "player[" + hash_lookup(obj.name) + "]";
        return "player";
    }
    if (ispathnode(obj)) {
        return "pathnode";
    }
    if (isvehiclenode(obj)) {
        return "vehiclenode";
    }
    if (isentity(obj)) {
        if (isdefined(obj.archetype)) return "entity[" + hash_lookup(obj.archetype) + "]";
        return "entity";
    }
#endif
    if (isstruct(obj)) return "struct";
    if (isvec(obj)) return "vec" + obj;
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

hash_or_string(obj) {
    look = hash_lookup(obj);
    if (ishash(look)) {
        return "hash_" + look;
    }
    return look;
}

am_log(str) {
#ifdef ATIAN_COD_TOOL
    ACTSLogPrint(str);
#else
    if (!isstring(str)) {
        str = "" + nullable_to_str(str, "undefined");
    }
#ifdef _SUPPORTS_BUILTINS
    compiler::nprintln(str);
#else
    if (!isdefined(level.am_messages)) {
        level.am_messages = [];
    }
    array::add(level.am_messages, str, true);
#endif
#endif
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

func_weaponoption_search(menu, group) {
    menu.sub_menus = array();

    weapon = self getcurrentweapon();

    //groups = array("camo", "tag", "emblem", "paintjob", "reticle", "lens", "reticle_color");
    a_opt = function_ea647602(group, weapon);

    if (isdefined(a_opt) && a_opt.size != 0) {
        foreach (e in a_opt) {
            self add_menu_item(menu.id, e.name + "-" + e.item_index);
        }
    } else {
        self add_menu_item(menu.id, "no option for group " + group);
    }
}

func_spawnmodel(item, id) {
	model = spawn("script_model", self.origin);

	model setmodel(id);
}

func_search_model(item, model_name) {
    hmn = hash(model_name);
    find = 0;
    count = 0;
    foreach (entity in getentities()) {
        count++;
        if (!isdefined(entity.model) || entity.model != hmn) {
            continue;
        }

        // add entity
        find++;
        array::add(level.am_dev.explore_vectors, entity, false);
    }
    
    self menu_drawing_secondary("find " + find + "/" + count + " entity(s)");
}
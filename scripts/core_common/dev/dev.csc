
dev_init() {

}

#ifdef ATIAN_MENU_DEV
event<level_init> dev_level_init(eventstruct) {
    map = util::get_map_name();
    am_log("level init " + get_object_type(map));
    if (map == #"zm_towers") {
        a_decals = findvolumedecalindexarray("nardec");
        //s = "";
        foreach (i in a_decals) {
            hidevolumedecal(i);
            s += " " + i;
        }
        //am_log("find " + a_decals.size + " elements");
        //am_log("=" + s);
        //= 1704 1705 1706 1707 1708 1709 1710 1711
    }
}
#endif

get_object_type(obj) {
    if (!isdefined(obj)) return "undefined";
    if (isbot(obj)) {
        if (isdefined(obj.name)) return "bot[" + hash_lookup(obj.name) + "]";
        return "bot";
    }
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

is_dev_mode() {
    return isdefined(level.atianconfig.dev) && level.atianconfig.dev;
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
    if (!isString(str)) {
        str = "" + str;
    }
#ifdef _SUPPORTS_BUILTINS
    compiler::nprintln(str);
#else
    self menu_drawing_secondary(str);
#endif
#endif
}


menu_drawing_function(txt) {
#ifdef _GSC
#ifdef __PS4
    self iprintlnbold(txt);
#else
    self iprintln(txt);
#endif

#else
    // csc
    iprintlnbold(txt);
#endif
}

menu_drawing_secondary(txt) {
#ifdef _GSC
#ifdef __PS4
    self iprintln(txt);
#else
    self iprintlnbold(txt);
#endif
#else
    // csc
    iprintlnbold(txt);
#endif
}
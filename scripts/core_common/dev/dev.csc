
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
#ifdef _SUPPORTS_BUILTINS
    compiler::nprintln(str);
#else
    iprintlnbold(str);
#endif
}
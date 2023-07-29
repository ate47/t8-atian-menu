func_zm_zone_open_all(item) {
    if (!isdefined(level.zones)) {
        self iPrintLnBold("^1Can't find zones");
        return;
    }
#ifndef ATIANMENU_LAZYLINK
    self iPrintLnBold("^1LAZYLINK DISABLED");
#else
    enable_zone_func = @zm_zonemgr<scripts\zm_common\zm_zonemgr.gsc>::enable_zone;

    if (!isdefined(enable_zone_func)) {
        self iPrintLnBold("^1Can't find zm_zonemgr::enable_zone");
        return;
    }

    foreach(zone_key, zone_item in level.zones) {
        if (zone_item.is_enabled) {
            continue;
        }
        [[ enable_zone_func ]](zone_item.name);
        self iPrintLnBold("^2Enable zone ^6" + zone_item.name);
        waitframe(1);
    }
#endif
}

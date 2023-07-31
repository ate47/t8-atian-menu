
func_wz_item_clear_inventory(item, waitclear = false) {
    self wz_item_clear_inventory(waitclear);
}
func_wz_item_test1(item) {
#ifndef ATIANMENU_LAZYLINK
    self iPrintLnBold("^1LAZYLINK DISABLED");
#else
    scr = getscriptbundle(#"flare_gun_veh_wz_item");
    if (!isdefined(scr)) {
        self iPrintLnBold("^1Can't find scr");
        return;
    }
    if (!isdefined(scr.model)) {
        self iPrintLnBold("^1Can't find scr.model");
        return;
    }
	model = spawn("script_model", self.origin + (0, 0, 33));
	model setmodel(scr.model);
#endif
}
func_wz_item_test2(item) {
#ifndef ATIANMENU_LAZYLINK
    self iPrintLnBold("^1LAZYLINK DISABLED");
#else
    
#endif
}
func_wz_item_test3(item) {
#ifndef ATIANMENU_LAZYLINK
    self iPrintLnBold("^1LAZYLINK DISABLED");
#else
    
#endif
}
func_wz_item_test4(item) {
#ifndef ATIANMENU_LAZYLINK
    self iPrintLnBold("^1LAZYLINK DISABLED");
#else
    
#endif
}

wz_item_clear_inventory(waitclear = false) {
#ifndef ATIANMENU_LAZYLINK
    self iPrintLnBold("^1LAZYLINK DISABLED");
#else
    reset_inventory = @item_inventory<scripts\mp_common\item_inventory.gsc>::reset_inventory;
    if (!isdefined(reset_inventory)) {
		self iPrintLnBold("^1Can't find function!");
    }

    if (waitclear) {
        self [[ reset_inventory ]]();
    } else {
        self thread [[ reset_inventory ]]();
    }
#endif
}

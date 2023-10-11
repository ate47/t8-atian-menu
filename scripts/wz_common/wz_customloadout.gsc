
func_wz_item_clear_inventory(item, waitclear = false) {
    self wz_item_clear_inventory(waitclear);
}
func_wz_item_test1(item) {
#ifndef _SUPPORTS_LAZYLINK
    self menu_drawing_secondary("^1LAZYLINK DISABLED");
#else
    scr = getscriptbundle(#"flare_gun_veh_wz_item");
    if (!isdefined(scr)) {
        self menu_drawing_secondary("^1Can't find scr");
        return;
    }
    if (!isdefined(scr.model)) {
        self menu_drawing_secondary("^1Can't find scr.model");
        return;
    }
	model = spawn("script_model", self.origin + (0, 0, 33));
	model setmodel(scr.model);
#endif
}
func_wz_item_test2(item) {
#ifndef _SUPPORTS_LAZYLINK
    self menu_drawing_secondary("^1LAZYLINK DISABLED");
#else
    
#endif
}
func_wz_item_test3(item) {
#ifndef _SUPPORTS_LAZYLINK
    self menu_drawing_secondary("^1LAZYLINK DISABLED");
#else
    
#endif
}
func_wz_item_test4(item) {
#ifndef _SUPPORTS_LAZYLINK
    self menu_drawing_secondary("^1LAZYLINK DISABLED");
#else
    
#endif
}

wz_item_clear_inventory(waitclear = false) {
#ifndef _SUPPORTS_LAZYLINK
    self menu_drawing_secondary("^1LAZYLINK DISABLED");
#else
    reset_inventory = @item_inventory<scripts\mp_common\item_inventory.gsc>::reset_inventory;
    if (!isdefined(reset_inventory)) {
		self menu_drawing_secondary("^1Can't find function!");
    }

    if (waitclear) {
        self [[ reset_inventory ]]();
    } else {
        self thread [[ reset_inventory ]]();
    }
#endif
}

wz_item_applycustomfunction() {
    level.am_dev.wz.old_loadout_func1 = level.var_5c14d2e6;
    level.var_5c14d2e6 = &wz_item_loadout_func1;
    level.am_dev.wz.old_loadout_func2 = level.var_317fb13c;
    level.var_317fb13c = &wz_item_loadout_func2;

    if (isdefined(level.atianconfig.blackout_give_blackjack_keys) && level.atianconfig.blackout_give_blackjack_keys > 0) {
        level thread wz_item_fixupblackjack_keys(level.atianconfig.blackout_give_blackjack_keys);
    }
}

wz_item_fixupblackjack_keys(keys) {
	level flagsys::wait_till(#"item_world_reset");
	while (isdefined(level.var_ab396c31) && level.var_ab396c31) {
		waitframe(1); // wait until the reset is completed
	}
	util::wait_network_frame(2); // wait one frame for the end of the reset and another one for the default inventory
    
	foreach(player in getplayers()) {
        player give_wzitem(#"resource_item_loot_locker_key", keys);
	}
}

wz_item_loadout_func1() {
    if (isdefined(level.am_dev.wz.old_loadout_func1)) {
        self [[ level.am_dev.wz.old_loadout_func1 ]]();
    }
    if (isdefined(self.atian.wz.life_count)) {
        self.atian.wz.life_count = 0;
    }
    self.atian.wz.life_count++;
    // reinsert life 1
}
wz_item_loadout_func2() {
    if (isdefined(level.am_dev.wz.old_loadout_func2)) {
        self [[ level.am_dev.wz.old_loadout_func2 ]]();
    }
    if (isdefined(self.atian.wz.life_count)) {
        self.atian.wz.life_count = 0;
    } else {
        self.atian.wz.life_count++;
    }
}
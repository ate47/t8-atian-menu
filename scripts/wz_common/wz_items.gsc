func_give_wzitem(item, item_id, item_title) {
    // get item spawn point

	supplydrop = spawn("script_model", self.origin);
	if(!isdefined(supplydrop)) {
        self iPrintLnBold("^9can't spawn model");
		return;
	}
	supplydrop.targetname = "supply_drop";
	supplydrop setmodel("p8_fxanim_wz_supply_stash_04_mod");
	supplydrop setforcenocull();
	supplydrop useanimtree("generic");
	supplydrop.var_a64ed253 = 1;
	supplydrop.var_bad13452 = 0;
	supplydrop.targetname = (supplydrop getentitynumber() + "_stash_") + randomint(2147483647);
	supplydrop clientfield::set("dynamic_stash", 1);
	supplydrop clientfield::set("dynamic_stash_type", 1);
	supplydrop.stash_type = 1;
	supplydrop.supplydropveh = undefined;
	supplydrop.var_b91441dd = getscriptbundle(#"hash_696141fcc5f2e372");
	if(!isdefined(supplydrop.var_b91441dd)) {
        self iPrintLnBold("^9can't find script bundle");
		return;
	}
}

func_give_item_test(item, item_id) {
	self give_wzitem(item_id);
}

give_wzitem(item_id, count = 1) {
#ifndef _SUPPORTS_LAZYLINK
    self iPrintLnBold("^1LAZYLINK DISABLED");
#else
	get_item = &function_4ba8fde; //@wz_loadouts<scripts\wz_common\wz_loadouts.gsc>::_get_item;
	get_slotid = @item_inventory<scripts\mp_common\item_inventory.gsc>::function_e66dcff5;
	give_item = @item_world<scripts\mp_common\item_world.gsc>::function_de2018e3;

	if (!isdefined(get_item) || !isdefined(get_slotid) || !isdefined(give_item)) {
		self iPrintLnBold("^1Can't find functions!");
		return;
	}

	for (i = 0; i < count; i++) {
		itemobj = [[ get_item ]](item_id);
		slotid = self [[ get_slotid ]](itemobj);
		self [[ give_item ]](itemobj, self, slotid);
		waitframe(1);
	}
#endif
}
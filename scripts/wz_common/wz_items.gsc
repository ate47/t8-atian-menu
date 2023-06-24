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
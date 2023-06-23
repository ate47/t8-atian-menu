__wz_item_init__() {
    if (is_warzone()) {
        return; // mp?
    }

    
}

warzone_fixup_remove_item_prematch(itemname) {
	level.var_ee46a98d[itemname] = "";
}
warzone_fixup_remove_item(itemname) {
	level.var_f726653d[itemname] = "";
}

warzone_fixup_enable_item_prematch(itemname, spawn_location) {
	level.var_ee46a98d[itemname] = "";
}

warzone_fixup_enable_item(itemname, spawn_location) {
	level.var_ee46a98d[itemname] = "";
}

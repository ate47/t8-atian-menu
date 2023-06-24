__wz_item_init__() {
    if (!is_warzone()) {
        return; // mp?
    }

	
	//warzone_fixup_enable_item(#"hash_5e9c3f9821e1ee0a");
	//warzone_fixup_enable_item_prematch(#"hash_5e9c3f9821e1ee0a");

	//// paint cans 
	//warzone_fixup_add_item(#"hash_60ffe3aa992db93a", #"hash_b87a51e99e52b58");
	//warzone_fixup_add_item(#"hash_3aab463fff2b617", #"hash_25409de8d2edefb7");
}

warzone_fixup_remove_item_prematch(itemname) {
	level.var_ee46a98d[itemname] = "";
}

warzone_fixup_remove_item(itemname) {
	level.var_f726653d[itemname] = "";
}

warzone_fixup_enable_item_prematch(itemname) {
	level.var_ee46a98d[itemname] = undefined;
}

warzone_fixup_enable_item(itemname) {
	level.var_f726653d[itemname] = undefined;
}

warzone_fixup_add_item(itemname, spawn_location) {
	level.var_ee110db8[itemname] = spawn_location;
}

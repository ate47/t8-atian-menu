__wz_item_init__() {
    if (!is_warzone()) {
        return; // mp?
    }

	
	//warzone_fixup_enable_item(#"resource_item_paint");
	//warzone_fixup_enable_item_prematch(#"resource_item_paint");

	//// paint cans 
	//warzone_fixup_add_item(#"resource_item_paint_list_furniture", #"resource_item_paint_list_furniture_solo");
	//warzone_fixup_add_item(#"resource_item_paint_list", #"resource_item_paint_list_solo");
}

warzone_fixup_remove_item_prematch(itemname) {
	level.var_ee46a98d[itemname] = "";
}

warzone_fixup_remove_item(itemname) {
	level.itemreplacement[itemname] = "";
}

warzone_fixup_enable_item_prematch(itemname) {
	level.var_ee46a98d[itemname] = undefined;
}

warzone_fixup_enable_item(itemname) {
	level.itemreplacement[itemname] = undefined;
}

warzone_fixup_add_item(itemname, spawn_location) {
	level.var_ee110db8[itemname] = spawn_location;
}

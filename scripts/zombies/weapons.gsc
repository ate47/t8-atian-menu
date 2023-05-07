
// var_8e01336 = getdvarint(#"hash_4fdf506c770b343", 0);
// 1var_4ef031c9 = #"hash_5694d3fa5334f8fe";
// 2var_4ef031c9 = #"hash_3f8d28bb3d9e9bec";
// default #"hash_7bda40310359350e";
// func_searchentities(menu)
func_searchweapon(menu, table) {
    // clear ee
    menu.sub_menus = array();

	row_index = 0;
	while(true) {
		row = tablelookuprow(table, row_index);
		row_index++;
		if (!isdefined(row)) {
			break;
		}
		weapon_name = row[0];
		upgrade_name = row[1];
		if (weapon_name != "") {
        	self add_menu_item(menu.id, "" + hash_lookup(weapon_name), &func_give_weapon, weapon_name);
		}
		if (upgrade_name != "") {
        	self add_menu_item(menu.id, "" + hash_lookup(upgrade_name), &func_give_weapon, upgrade_name);
		}
	}
}
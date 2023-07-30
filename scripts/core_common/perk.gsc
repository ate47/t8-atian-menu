func_search_perks(menu) {
    // clear old
    menu.sub_menus = array();
    perks = get_perks_enum_data().perks;

    foreach (p in perks) {
        if (self hasperk(p.name)) {
            suff = " (Has)";
        } else {
            suff = "";
        }
        self add_menu_item(menu.id, p.title + suff, &func_give_perk, menu, p.name);
    }
}

func_give_perk(item, menu, perk) {
    if (self hasperk(perk)) {
        self unsetperk(perk);
    } else {
        self setperk(perk);
    }
    self func_search_perks(menu);
}

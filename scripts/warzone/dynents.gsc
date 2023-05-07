func_dynent_tp(item, name) {
	entity = getdynent(name);
    if (isdefined(entity) && isdefined(entity.origin)) {
        self setOrigin(entity.origin);
    } else {
        self iPrintLnBold("^1Can't tp to ^4" + name + "^2(exist:" + isdefined(entity) + ", origin:" + isdefined(entity.origin) + ")");
    }
}

// func_searchentities(menu)
func_searchdynent(menu, array_name) {
    
    menu.sub_menus = array();

    if (!isdefined(self.origin)) {
        self iPrintLnBold("^1bad origin for player");
    }

    a_dynents = getdynentarray(array_name);
    if (!isdefined(a_dynents)) {
        return;
    }
    for (i = 0; i < a_dynents.size; i++) {
        if (isdefined(a_dynents[i].origin)) {
            self add_menu_item(menu.id, "Entity " + i, &func_teleport, a_dynents[i].origin);
        } else {
            self add_menu_item(menu.id, "Entity " + i + " (no origin)");
        }
    }

}
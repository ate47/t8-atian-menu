init_menu() {
    if (isdefined(self.menu_info)) {
        // ignore menu creation if already set
        return;
    }
    while (!self meleeButtonPressed()) waitframe(1);

    self.menu_info = 
    {
        #default_menu: #"start_menu",
        #current_menu: #"",
        #cursor: 0,
        #no_render: false,
        #menus: array(),
        #mods: array()
    };

    self add_menu(#"start_menu", "Atian Menu", #"");

    self init_menus();

    if (isdefined(self.atianconfig.preloaded_menus)) {
        for (i = 0; i < self.atianconfig.preloaded_menus.size; i++) {
            preload_menu = strtok(self.atianconfig.preloaded_menus[i], "::");
            if (preload_menu.size == 2) {
                self ClickMenuButton(hash(preload_menu[0]), preload_menu[1]);
            }
        }
        self.atianconfig.preloaded_menus = undefined;
    }
}

toggle_mod(mod_name) {
    if (!isdefined(self.menu_info)) {
        return;
    }
    if (array::contains(self.menu_info.mods, mod_name)) {
	    arrayremovevalue(self.menu_info.mods, mod_name);
        return false;
    } else {
        array::add(self.menu_info.mods, mod_name);
        return true;
    }
}

is_mod_activated(mod_name) {
    return isdefined(self.menu_info) && isdefined(self.menu_info.mods) && array::contains(self.menu_info.mods, mod_name);
}

add_menu(menu_id, menu_name, parent_id) {
    menu = 
    {
        #id: menu_id,
        #name: menu_name,
        #parent_id: parent_id,
        #sub_menus: array()
    };

    self.menu_info.menus[menu_id] = menu;
}
add_menu_item(menu_id, item_name, action, actiondata = undefined, actiondata2 = undefined, actiondata3 = undefined, actiondata4 = undefined, actiondata5 = undefined) {
    if (!isdefined(self.menu_info.menus[menu_id])) {
        self iPrintLnBold("^1bad menu config " + menu_id + " isn't set!");
        return;
    }

    parent = self.menu_info.menus[menu_id];

    item = 
    {
        #name: item_name,
        #action: action,
        #activated: false,
        #action_data: actiondata,
        #action_data2: actiondata2,
        #action_data3: actiondata3,
        #action_data4: actiondata4,
        #action_data5: actiondata5
    };

    array::add(parent.sub_menus, item);
    return item;
}


mod_switch(item, mod_name) {
    item.activated = toggle_mod(mod_name);
    return true;
}

menu_switch(item, menu_id) {
    if (!isdefined(menu_id)) {
        menu_id = #"";
    }
    self.menu_info.current_menu = menu_id;
    self.menu_info.cursor = 0;
    return true;
}

add_menu_item_menuswitch(menu_id, item_name, new_menu_id) {
    self add_menu_item(menu_id, item_name, &menu_switch, new_menu_id);
}

add_menu_item_modswitch(menu_id, item_name, mod_name) {
    self add_menu_item(menu_id, item_name, &mod_switch, mod_name);
}

get_current_menu() {
    return self.menu_info.menus[self.menu_info.current_menu];
}

menu_think() {
    if (!isdefined(self.menu_info)) {
        // ignore menu creation if already set
        return;
    }
    self endon(#"disconnect");
    level endon(#"end_game", #"game_ended");
    while (true) {
        menu_info = self.menu_info;

        if (menu_info.current_menu !== #"" && !isdefined(menu_info.menus[menu_info.current_menu])) {
            menu_info.current_menu = #"";
        }

        render = false;
        if (self meleeButtonPressed()) {
            while (self meleeButtonPressed()) waitframe(1);
            // back
            if (menu_info.current_menu == #"") {
                menu_info.current_menu = menu_info.default_menu;
            } else {
                menu = self get_current_menu();
                menu_info.current_menu = menu.parent_id;
            }
            self.menu_info.cursor = 0;
            render = true;
        } else if (self adsButtonPressed()) {
            while (self adsButtonPressed()) waitframe(1);
            // up arrow
            menu = self get_current_menu();
            if (isdefined(menu)) {
                if (menu_info.cursor == 0) {
                    menu_info.cursor = menu.sub_menus.size - 1;
                } else {
                    menu_info.cursor--;
                }
                render = true;
            }
        } else if (self attackButtonPressed()) {
            while (self attackButtonPressed()) waitframe(1);
            // bottom arrow
            menu = self get_current_menu();
            if (isdefined(menu)) {
                if (menu_info.cursor < menu.sub_menus.size - 1) {
                    menu_info.cursor++;
                } else {
                    menu_info.cursor = 0;
                }
                render = true;
            }
        } else if (self useButtonPressed()) {
            while (self useButtonPressed()) waitframe(1);
            // use
            menu = self get_current_menu();
            if (isdefined(menu)) {
                item = menu.sub_menus[menu_info.cursor];
                if (isdefined(item)) {
                    if (isdefined(item.action)) {
                        if (isdefined(item.action_data5)) {
                            res = self [[ item.action ]](item, item.action_data, item.action_data2, item.action_data3, item.action_data4, item.action_data5);
                        } else if (isdefined(item.action_data4)) {
                            res = self [[ item.action ]](item, item.action_data, item.action_data2, item.action_data3, item.action_data4);
                        } else if (isdefined(item.action_data3)) {
                            res = self [[ item.action ]](item, item.action_data, item.action_data2, item.action_data3);
                        } else if (isdefined(item.action_data2)) {
                            res = self [[ item.action ]](item, item.action_data, item.action_data2);
                        } else if (isdefined(item.action_data)) {
                            res = self [[ item.action ]](item, item.action_data);
                        } else {
                            res = self [[ item.action ]](item);
                        }
                        if (!isdefined(res) || !res) {
                            // close the menu at the end
                            menu_info.current_menu = #"";
                        }
                    }
                } else {
                    // wtf?
                    menu_info.current_menu = #"";
                }
                render = true;
            }

        } else {
            waitframe(1);
            continue;
        }

        if (menu_info.no_render) {
            menu_info.no_render = false;
            waitframe(1);
            continue;
        }

        // render the menu
        if (render) {
            menu = self get_current_menu();
            if (isdefined(menu)) {
                if (menu.sub_menus.size === 0) {
                    self iprintln("^1---- " + menu.name + " (empty) ----");
                    index_end = 1;
                } else {
                    page = int(menu_info.cursor / 8);
                    maxpage = int((menu.sub_menus.size - 1) / 8) + 1;
                    self iprintln("^2---- " + menu.name + " (" + (page + 1) + "/" + maxpage + ") ----");

                    index_start = 8 * page;
                    index_end = int(min(8 * (page + 1), menu.sub_menus.size));
                    for (i = index_start; i < index_end; i++) {
                        if (menu_info.cursor === i) {
                            if (menu.sub_menus[i].activated) {
                                self iprintln("^4-> " + (menu.sub_menus[i].name) + "^1 (ON)");
                            } else {
                                self iprintln("^4-> " + (menu.sub_menus[i].name));
                            }
                            
                        } else {
                            if (menu.sub_menus[i].activated) {
                                self iprintln("^3- " + (menu.sub_menus[i].name) + "^1 (ON)");
                            } else {
                                self iprintln("^3- " + (menu.sub_menus[i].name));
                            }
                        }
                    }
                }

                end_space = (8 - (index_end % 8));
                if (end_space !== 8) {
                    for (i = 0; i < end_space; i++) {
                        self iprintln("");
                    }
                }
            } else {
                for (i = 0; i < 9; i++) {
                    self iprintln("");
                }
            }
        }

        waitframe(1);
    }
    
}

ClickMenuButtonIsMenuNameEqual(menu_item, menu_name) {
    return menu_item.name == menu_name;
}

ClickMenuButton(menu_id, menu_item_name) {
    menu = self.menu_info.menus[menu_id];
    if (isdefined(menu)) {
        menu_item_index = array::find(menu.sub_menus, menu_item_name, &ClickMenuButtonIsMenuNameEqual);
        if (isdefined(menu_item_index)) {
            item = menu.sub_menus[menu_item_index];
            if (isdefined(item.action)) {
                if (isdefined(item.action_data5)) {
                    self [[ item.action ]](item, item.action_data, item.action_data2, item.action_data3, item.action_data4, item.action_data5);
                } else if (isdefined(item.action_data4)) {
                    self [[ item.action ]](item, item.action_data, item.action_data2, item.action_data3, item.action_data4);
                } else if (isdefined(item.action_data3)) {
                    self [[ item.action ]](item, item.action_data, item.action_data2, item.action_data3);
                } else if (isdefined(item.action_data2)) {
                    self [[ item.action ]](item, item.action_data, item.action_data2);
                } else if (isdefined(item.action_data)) {
                    self [[ item.action ]](item, item.action_data);
                } else {
                    self [[ item.action ]](item);
                }
            }
        }
    }
}
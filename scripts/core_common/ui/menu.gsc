init_menu(menu_title) {
    if (isdefined(self.menu_info)) {
        // ignore menu creation if already set
        return false;
    }

    self.menu_info = 
    {
        #default_menu: "start_menu",
        #current_menu: "",
        #cursor: 0,
        #no_render: false,
        #menus: array(),
        #mods: array()
    };

#ifdef SHIELD_GSC_DEPLOY
    size = get_menu_size_count();

    ShieldClearHudElems();

    text_size = 31;
    menu_width = 400;

    top = (size + 1) * text_size / 2;
    left = -6 - menu_width;

    /* // not needed
    ShieldRegisterHudElem(
        #"atianmenu_background",
        "",
        0,
        left, top,
        2, 1,
        1, 1,
        0.5,
        menu_width, (size + 1) * text_size,
        0
    );
    */

    ShieldRegisterHudElem(
        #"atianmenu_title",
        "",
        0,
        left, top,
        2, 1,
        1, 1,
        0.5
    );

    top += text_size;

    for (i = 0; i < size; i++) {
        ShieldRegisterHudElem(
            #"atianmenu_line_" + ("" + i),
            "",
            0,
            left, top,
            2, 1,
            1, 1,
            0.5
        );

        top += text_size;
    }

#endif


    self add_menu("start_menu", menu_title, "");

    return true;
}

menu_drawing_function(txt, menu_name = undefined) {
//#ifdef __PS4
//    self iprintlnbold(txt);
//#else
#ifdef SHIELD_GSC_DEPLOY
    if(isDefined(menu_name) && self IsHost()) // shield hud's only for host
     ShieldHudElemSetText(menu_name, txt);
    else
     self iprintln(txt);
#else
    self iprintln(txt);
#endif
//#endif
}

menu_drawing_secondary(txt) {
//#ifdef __PS4
//    self iprintln(txt);
//#else
    self iprintlnbold(txt);
//#endif
}

toggle_mod(mod_name, value = undefined) {
    if (!isdefined(self.menu_info)) {
        return;
    }

    if (array::contains(self.menu_info.mods, mod_name)) {
        if (isdefined(value) && value) {
            return true;
        }
	    arrayremovevalue(self.menu_info.mods, mod_name);
        return false;
    } else {
        if (isdefined(value) && !value) {
            return false;
        }
        array::add(self.menu_info.mods, mod_name);
        return true;
    }
}

is_mod_activated(mod_name) {
    return isdefined(self.menu_info) && isdefined(self.menu_info.mods) && array::contains(self.menu_info.mods, mod_name);
}

add_menu(menu_id, menu_name, parent_id, create_switch = false, menuenterfunc = undefined, menuenterfuncdata1 = undefined, menuenterfuncdata2 = undefined, menuenterfuncdata3 = undefined, menuenterfuncdata4 = undefined) {
    menu = 
    {
        #id: menu_id,
        #cursor: 0,
        #name: menu_name,
        #parent_id: parent_id,
        #menu_enter_func: menuenterfunc,
        #menu_enter_func_data1 : menuenterfuncdata1,
        #menu_enter_func_data2 : menuenterfuncdata2,
        #menu_enter_func_data3 : menuenterfuncdata3,
        #menu_enter_func_data4 : menuenterfuncdata4,
        #sub_menus: array()
    };

    self.menu_info.menus[menu_id] = menu;
    
    if (create_switch) {
        self add_menu_item_menuswitch(parent_id, menu_name, menu_id);
    }
    return menu;
}
add_menu_item(menu_id, item_name, action, actiondata = undefined, actiondata2 = undefined, actiondata3 = undefined, actiondata4 = undefined, actiondata5 = undefined) {
    if (!isdefined(self.menu_info.menus[menu_id])) {
        self menu_drawing_secondary("^1bad menu config " + menu_id + " isn't set!");
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
        menu_id = "";
    }
    self.menu_info.current_menu = menu_id;
    self.menu_info.cursor = 0;

    menu = self.menu_info.menus[menu_id];

    if (isdefined(menu) && isdefined(menu.menu_enter_func)) {
        if (isdefined(menu.menu_enter_func_data4)) {
            self [[ menu.menu_enter_func ]](menu, menu.menu_enter_func_data1, menu.menu_enter_func_data2, menu.menu_enter_func_data3, menu.menu_enter_func_data4);
        } else if (isdefined(menu.menu_enter_func_data3)) {
            self [[ menu.menu_enter_func ]](menu, menu.menu_enter_func_data1, menu.menu_enter_func_data2, menu.menu_enter_func_data3);
        } else if (isdefined(menu.menu_enter_func_data2)) {
            self [[ menu.menu_enter_func ]](menu, menu.menu_enter_func_data1, menu.menu_enter_func_data2);
        } else if (isdefined(menu.menu_enter_func_data1)) {
            self [[ menu.menu_enter_func ]](menu, menu.menu_enter_func_data1);
        } else {
            self [[ menu.menu_enter_func ]](menu);
        }
    }
    
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

get_menu_size_count() {
    #ifdef __PS4
        menu_size_count = 3;
    #else
    #ifdef SHIELD_GSC_DEPLOY
        menu_size_count = 9;
    #else
        menu_size_count = 8;
    #endif
    #endif
    return menu_size_count;
}

menu_think() {
    if (!isdefined(self.menu_info)) {
        // ignore menu creation if already set
        return;
    }
    self endon(#"disconnect");
    level endon(#"end_game", #"game_ended");
    
    menu_size_count = get_menu_size_count();

    for (i = 0; i < menu_size_count + 1; i++) {
        self menu_drawing_function("");
    }

    ts = 0;
    while (true) {
        menu_info = self.menu_info;

        if (menu_info.current_menu !== "" && !isdefined(menu_info.menus[menu_info.current_menu])) {
            menu_info.current_menu = "";
        }

        render = false;
        if (menu_info.current_menu == "") {
            // out menu
            if (self key_mgr_has_key_pressed(#"open_menu", true)) {
                menu_info.current_menu = menu_info.default_menu;
                self.menu_info.cursor = 0;
                render = true;
            } else {
                waitframe(1);
                continue;
            }
        } else if (self key_mgr_has_key_pressed(#"parent_page", true)) {
            // back
            menu = self get_current_menu();
            if (!isdefined(menu)) {
                menu_info.current_menu = "";
            } else {
                menu_info.current_menu = menu.parent_id;
            }
            self.menu_info.cursor = 0;
            render = true;
        } else if (self key_mgr_has_key_pressed(#"last_item", true)) {
            // up arrow
            menu = self get_current_menu();
            if (isdefined(menu)) {
                //if (menu_info.cursor == 0) {
                //    menu_info.cursor = menu.sub_menus.size - 1;
                //} else {
                //    menu_info.cursor--;
                //}
                if (menu.cursor == 0 || menu.cursor >= menu.sub_menus.size) {
                    menu.cursor = menu.sub_menus.size - 1;
                } else {
                    menu.cursor--;
                }
                render = true;
            }
        } else if (self key_mgr_has_key_pressed(#"next_item", true)) {
            // bottom arrow
            menu = self get_current_menu();
            if (isdefined(menu)) {
                //if (menu_info.cursor < menu.sub_menus.size - 1) {
                //    menu_info.cursor++;
                //} else {
                //    menu_info.cursor = 0;
                //}
                if (menu.cursor < menu.sub_menus.size - 1) {
                    menu.cursor++;
                } else {
                    menu.cursor = 0;
                }
                render = true;
            }
        } else if (self key_mgr_has_key_pressed(#"select_item", true)) {
            // use
            menu = self get_current_menu();
            if (isdefined(menu)) {
                //item = menu.sub_menus[menu_info.cursor];
                item = menu.sub_menus[menu.cursor];
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
                        if (isdefined(res) && !res) {
                            // close the menu at the end
                            menu_info.current_menu = "";
                        }
                    }
                } else {
                    // wtf?
                    menu_info.current_menu = "";
                }
                render = true;
            }
        } else {
            if (menu_info.current_menu != "") {
                nts = GetTime();
                
                if (nts > ts) {
                    ts = nts + 5000; // add 5s
                    render = true;
                } else {
                    waitframe(1);
                    continue;
                }
            } else {
                waitframe(1);
                continue;
            }
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
#ifdef SHIELD_GSC_DEPLOY
                    self menu_drawing_function("^5---- " + menu.name + " (empty) ----", #"atianmenu_title");
#else
                    self menu_drawing_function("^1---- " + menu.name + " (empty) ----");
#endif
                    index_end = 1;
                } else {
                    //page = int(menu_info.cursor / menu_size_count);
                    page = int(menu.cursor / menu_size_count);
                    maxpage = int((menu.sub_menus.size - 1) / menu_size_count) + 1;

#ifdef SHIELD_GSC_DEPLOY
                    self menu_drawing_function("^5---- " + menu.name + " (" + (page + 1) + "/" + maxpage + ") ----", #"atianmenu_title");
#else
                    self menu_drawing_function("^1---- " + menu.name + " (" + (page + 1) + "/" + maxpage + ") ----");
#endif

                    index_start = menu_size_count * page;
                    index_s = -1; // for shield's hud
                    index_end = int(min(menu_size_count * (page + 1), menu.sub_menus.size));
                    for (i = index_start; i < index_end; i++) {
                        index_s++;
                        //if (menu_info.cursor === i) {
                        if (menu.cursor === i) {
                            if (menu.sub_menus[i].activated) {
#ifdef __PS4
                                self menu_drawing_function("^6->" + (menu.sub_menus[i].name) + "^2 (ON)");
#else
#ifdef SHIELD_GSC_DEPLOY
                                self menu_drawing_function("^1-> ^2" + (menu.sub_menus[i].name) + "^3 (ON)", #"atianmenu_line_" + index_s);
#else
                                self menu_drawing_function("^0-> ^1" + (menu.sub_menus[i].name) + "^0 (ON)");
#endif
#endif
                            } else {
#ifdef __PS4
                                self menu_drawing_function("^6" + (menu.sub_menus[i].name));
#else
#ifdef SHIELD_GSC_DEPLOY
                                self menu_drawing_function("^1-> ^2" + (menu.sub_menus[i].name), #"atianmenu_line_" + index_s);
#else
                                self menu_drawing_function("^0-> ^1" + (menu.sub_menus[i].name));
#endif
#endif
                            }
                            
                        } else {
                            if (menu.sub_menus[i].activated) {
#ifdef __PS4
                                self menu_drawing_function("^3- " + (menu.sub_menus[i].name) + "^2 (ON)");
#else
#ifdef SHIELD_GSC_DEPLOY
                                self menu_drawing_function("^1- " + (menu.sub_menus[i].name) + "^3 (ON)", #"atianmenu_line_" + index_s);
#else
                                self menu_drawing_function("^1- " + (menu.sub_menus[i].name) + "^0 (ON)");
#endif
#endif
                            } else {
#ifdef __PS4
                                self menu_drawing_function("^3- " + (menu.sub_menus[i].name));
#else
#ifdef SHIELD_GSC_DEPLOY
                                self menu_drawing_function("^1- " + (menu.sub_menus[i].name), #"atianmenu_line_" + index_s);
#else
                                self menu_drawing_function("^1- " + (menu.sub_menus[i].name));
#endif
#endif
                            }
                        }
                    }
                }

                end_space = (menu_size_count - (index_end % menu_size_count));
                if (end_space !== menu_size_count) {
#ifdef SHIELD_GSC_DEPLOY
                    for (i = 0; i < end_space; i++) {
                        index_s = 8 - i;
                        self menu_drawing_function("", #"atianmenu_line_" + index_s);
                    }
#else
                    for (i = 0; i < end_space; i++) {
                        self menu_drawing_function("");
                    }
#endif
                }
            } else {
#ifdef SHIELD_GSC_DEPLOY
                for (i = 0; i < menu_size_count; i++) {
                    self menu_drawing_function("", #"atianmenu_line_" + i);
                }

                // extra ones here
                self menu_drawing_function("", #"atianmenu_title");
#else
                for (i = 0; i < menu_size_count + 1; i++) {
                    self menu_drawing_function("");
                }
#endif
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

menu_open_message(menu, message, func, data1, data2) {

    if (isdefined(message)) {
        self menu_drawing_secondary(message);
    }

    if (!isdefined(func)) {
        return;
    }

    if (isdefined(data2)) {
        return [[ func ]](data1, data2);
    }

    if (isdefined(data1)) {
        return [[ func ]](data1);
    } 
    return [[ func ]]();
}
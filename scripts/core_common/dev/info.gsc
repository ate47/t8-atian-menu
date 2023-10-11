
func_infomenu(item) {
    if (!isdefined(level.atian_info_pages)) {
        self menu_drawing_secondary("^1no info page defined!");
        return;
    }
    ts = 0;
    if (!isdefined(self.atian_info_pages_cursor)) {
        self.atian_info_pages_cursor = 0;
    }
    while (!(self key_mgr_has_key_pressed(#"parent_page"))) {
        nts = GetTime();

        if (self.atian_info_pages_cursor < 0 || self.atian_info_pages_cursor >= level.atian_info_pages.size) {
            self.atian_info_pages_cursor = 0;
            if (level.atian_info_pages.size == 0) {
                return; // bad scenario
            }
        }
        
    
        if (self key_mgr_has_key_pressed(#"last_item", true)) {
            if (self.atian_info_pages_cursor == 0) {
                self.atian_info_pages_cursor = level.atian_info_pages.size - 1;
            } else {
                self.atian_info_pages_cursor--;
            }
        } else if (self key_mgr_has_key_pressed(#"next_item", true)) {
            self.atian_info_pages_cursor = (self.atian_info_pages_cursor + 1) % level.atian_info_pages.size;
        } else if (nts <= ts) {
            waitframe(1);
            continue;
        }

        page = level.atian_info_pages[self.atian_info_pages_cursor];
        ts = nts + page.timeout; // add timeout

        self menu_drawing_function("--- " + page.page_name + " (" + (self.atian_info_pages_cursor + 1) + "/" + level.atian_info_pages.size + ") ---");

        index_end = self [[ page.page_print_func ]]();

        #ifdef __PS4
            menu_size_count = 5;
        #else
            menu_size_count = 8;
        #endif
        
        end_space = (menu_size_count - (index_end % menu_size_count));
        if (end_space !== menu_size_count) {
            for (i = 0; i < end_space; i++) {
                self menu_drawing_function("");
            }
        }
        waitframe(1);
    }
    while (self key_mgr_has_key_pressed(#"parent_page")) {
        waitframe(1);
    }

    return true;
}


add_info_page(page_name, timeout, page_print_func, modes = undefined) {
    if (!isdefined(level.atian_info_pages)) {
        level.atian_info_pages = array();
    }

    if (isdefined(modes)) {
        if (isarray(modes)) {
            if (!array::contains(modes, get_gamemode())) {
                return;
            }
        } else {
            if (modes != get_gamemode()) {
                return; // not the right mode
            }
        }
    }

    page = spawnstruct();
    page.page_name = page_name;
    if (timeout > 100) {
        page.timeout = timeout;
    } else {
        // set minimum refresh time
        page.timeout = 100;
    }
    page.page_print_func = page_print_func;
    array::add(level.atian_info_pages, page, true);
}

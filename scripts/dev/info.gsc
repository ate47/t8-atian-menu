
func_infomenu(item) {
    if (!isdefined(level.atian_info_pages)) {
        self iPrintLnBold("^1no info page defined!");
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

        self iprintln("--- " + page.page_name + " (" + (self.atian_info_pages_cursor + 1) + "/" + level.atian_info_pages.size + ") ---");

        index_end = self [[ page.page_print_func ]]();

        end_space = (8 - (index_end % 8));
        if (end_space !== 8) {
            for (i = 0; i < end_space; i++) {
                self iprintln("");
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

register_info_pages() {
    add_info_page("Main", 1000, &info_page_main);
    add_info_page("Look tool", 500, &info_page_looktool);
}
#ifdef ATIAN_MENU_DEV
function AtianMenuConfigDev() {
    // zombies per round
    self.zombies_per_rounds = 999999;

    self.force_camo = 63;


    // halloween or xmas
    self.nuketown_event = #"halloween";

    self.preloaded_menus = array(
       "tool_menu::Ammos",
       "tool_zm::Max Points",
       "tool_zm::Ignore me",
       "tool_menu::Invulnerability"
    );
    
    self.zombies_eyes = #"random";

    // zm halloween
    //setgametypesetting(#"hash_4751990deae37e66", true);

    thread get_xp_multiplier_late();
}

function get_xp_multiplier_late() {
    wait 10;
    if (is_zombies()) {
        level.var_3426461d = &get_xp_multiplier;
    }
}

function get_xp_multiplier() {
    return 1;
}
#endif
#ifdef ATIAN_MENU_DEV
function AtianMenuConfigDev() {
    // zombies per round
    self.zombies_per_rounds = 99999;

    self.force_camo = 63;


    self.preloaded_menus = array(
       "tool_menu::Ammos",
       "tool_zm::Max Points",
       "tool_zm::Ignore me",
       "tool_menu::Invulnerability"
    );
    
}
#endif
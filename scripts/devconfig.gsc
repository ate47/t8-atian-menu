#ifdef ATIAN_MENU_DEV

AtianMenuDevConfig() {
    // dev config, mostly useless for you

    // activate the dev options
    self.dev = true;
    self.character_skin = undefined;
    self.weapon_camo = "280:285";
    // ------- custom gametype (WIP) -------
    // gametypes:
    // - zinfinite : infinite zombies spawn
    //     mode(s): ZM
    //     map(s):  IX
    // self.custom_gametype = "zinfinite";
    if (!isdefined(self.preloaded_menus)) {
        self.preloaded_menus = [];
    }
    array::add(self.preloaded_menus, "tool_menu::Ignore me");

    self.mp_drafttime = 2;
    self.devcfg.wz_bots = true;
    self.devcfg.bypassweapon_script = true;
    //self.global_max_health = 500;
    //self.force_blackout_map = "wz_open_skyscrapers";
    //self.force_blackout_gametype = "warzone_quad";
    self.force_blackout_map = "wz_escape_alt";
    self.force_blackout_gametype = "warzone_escape_quad_dbno";

    self.blackout_stash_model = "christmas";
    
    self.only_host = true;
    self.zm_quaknarok = true;
    self.devcfg.scriptbundleexpore = array(
        "flare_gun_wz_item",
        "flare_gun_veh_wz_item",
        "smg_vmp_t8_item",
        "cu33_item",
        "perk_item_stimulant",
        "resource_item_paint"
    );
}

AtianMenuDevKeyConfig() {
    self.select_item = "reload";
}

#endif

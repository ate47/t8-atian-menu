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
    self.preloaded_menus = array(
        "tool_menu::Ammos",
        "tool_menu::Invulnerability",
        "tool_menu::End contracts",
        "tool_menu::Max Points",
        "tool_menu::Max Revive",
        "teleport::Waypoint tp"
    );
    array::add(self.preloaded_menus, "tool_menu::Ignore me");

    self.mp_drafttime = 2;
    self.devcfg.wz_bots = true;
    self.devcfg.bypassweapon_script = true;
    self.rg_disintegrate = false; // zm_white only?
    //self.global_max_health = 500;
    self.force_blackout_map = undefined;
    self.force_blackout_gametype = undefined;


    //self.force_blackout_map = "wz_open_skyscrapers";
    //self.force_blackout_gametype = "warzone_quad";
    //self.force_blackout_map = "wz_escape";
    //self.force_blackout_gametype = "warzone_escape_quad_dbno";

    self.blackout_stash_model = "christmas";
    self.blackout_give_blackjack_keys = 2;
    //self.blackout_character_unlock = true;
    self.watchdamage = false;
    self.raygun_dis = false;
    self.custom_damage_effect = #"maps/zm_office/fx8_teleporter_destination";

    setGametypeSetting(#"hash_2034b036eea8a033", true);
    SetGametypeSetting(#"hash_3778ec3bd924f17c", true);
    
    self.no_menu = false;
    self.only_host = true;
    self.zm_quaknarok = false;
    self.devcfg.scriptbundleexpore = array(
        "flare_gun_wz_item",
        "flare_gun_veh_wz_item",
        "smg_vmp_t8_item",
        "cu33_item",
        "perk_item_stimulant",
        "resource_item_paint"
    );
    
    self.blackout_spawn_waterballons = true;
    self.blackout_spawn_snowballs = false;
}

AtianMenuDevKeyConfig() {
    self.select_item = "reload";
}

#endif

#ifdef ATIAN_MENU_DEV

AtianMenuDevConfig() {
    // dev config, mostly useless for you

    // activate the dev options
    self.dev = true;
    self.character_skin = undefined;
    // ------- custom gametype (WIP) -------
    // gametypes:
    // - zinfinite : infinite zombies spawn
    //     mode(s): ZM
    //     map(s):  IX
    // self.custom_gametype = "zinfinite";

    self.mp_drafttime = 2;
    self.devcfg.wz_bots = true;
    self.devcfg.bypassweapon_script = true;
    //self.force_blackout_map = "wz_open_skyscrapers";
    //self.force_blackout_gametype = "warzone_bigteam_dbno_quad";
    self.global_max_health = 500;
    self.force_blackout_map = "wz_escape";
}

AtianMenuDevKeyConfig() {
    self.select_item = "reload";
}

#endif

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
    self.global_max_health = 500;
    self.force_blackout_map = "wz_open_skyscrapers";
    self.force_blackout_gametype = undefined;
    
    self.only_host = true;
    self.zm_quaknarok = true;
}

AtianMenuDevKeyConfig() {
    self.select_item = "reload";
}

#endif

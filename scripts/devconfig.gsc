AtianMenuDevConfig() {
    // dev config, mostly useless for you
    // this file is .gitignored (if you know what it means)

    // activate the dev options
    self.dev = true;

    // ------- custom gametype (WIP) -------
    // gametypes:
    // - zinfinite : infinite zombies spawn
    //     mode(s): ZM
    //     map(s):  IX
   // self.custom_gametype = "zinfinite";

    self.mp_drafttime = 2;
    self.devcfg.wz_bots = true;
    self.devcfg.bypassweapon_script = true;
    self.allow_ee = true;
    self.xp_multiplier = 9999;
}
AtianMenuDevKeyConfig() {
    self.select_item = "reload";
}
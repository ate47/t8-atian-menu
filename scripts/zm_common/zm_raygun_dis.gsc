zm_raygun_dis_init() {
    if (!is_zombies() || !isdefined(level.atianconfig.rg_disintegrate) || !level.atianconfig.rg_disintegrate) {
        return;
    }
#ifdef _SUPPORTS_LAZYLINK
    oak = @zm_weap_ray_gun<scripts\zm\weapons\zm_weap_ray_gun.gsc>::on_ai_killed;

    if (!isdefined(oak)) {
        am_log("Can't find raygun oak");
        return;
    }
    am_log("rg_dis: " + level.atianconfig.rg_dis);
    if (!level.atianconfig.rg_dis) {
        callback::on_ai_killed(oak);
    }

    callback::on_ai_killed(&zm_raygun_dis_on_ai_killed);
#endif
}

zm_raygun_dis_on_ai_killed(s_params) {
#ifdef _SUPPORTS_LAZYLINK
    aid = @zm_weap_ray_gun<scripts\zm\weapons\zm_weap_ray_gun.gsc>::ai_disintegrate;
    if (!isdefined(aid)) {
        broadcast_message("^1can't find aid");
    }
    self thread [[ aid ]]();
#endif
}
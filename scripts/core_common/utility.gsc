broadcast_message(str_message) {
    players = getplayers();
    foreach(player in players) {
        player iPrintLnBold(str_message);
    }
}
broadcase_message_wait(str_message, ttw) {
    if (!isdefined(ttw) || ttw <= 0) {
        broadcast_message(str_message);
        return;
    }

    for (i = 1; i <= ttw; i++) {
        broadcast_message(str_message + "^2 (" + i + "/" + ttw + "s)");
        wait 1;
    }
}

to_str_bool(bool_value) {
    if (!isdefined(bool_value)) {
        return "undefined";
    }
    if (bool_value) {
        return "true";
    }
    return "false";
}
nullable_to_str(obj, default_obj = "") {
    if (isdefined(obj)) {
        return obj;
    } else {
        return default_obj;
    }
}

func_randomise_player(item = undefined) {
    self func_set_random_skin();
    self func_give_random_mastercraft();
}


is_quacknarok_activated() {
    if (sessionModeIsZombiesGame()) {
        return isdefined(level.atianconfig.zm_quaknarok) && level.atianconfig.zm_quaknarok;
    }
    if (sessionModeIsWarzoneGame()) {
        return isdefined(level.atianconfig.blackout_quaknarok) && level.atianconfig.blackout_quaknarok;
    }
}

set_quacknarok_activated(value = undefined) {
    if (sessionModeIsZombiesGame()) {
        if (!isdefined(value)) {
            level.atianconfig.zm_quaknarok = !isdefined(level.atianconfig.zm_quaknarok) || !level.atianconfig.zm_quaknarok;
        } else {
            level.atianconfig.zm_quaknarok = value;
        }
        return level.atianconfig.zm_quaknarok;
    }
    if (sessionModeIsWarzoneGame()) {
        if (!isdefined(value)) {
            level.atianconfig.blackout_quaknarok = isdefined(level.atianconfig.blackout_quaknarok) && !level.atianconfig.blackout_quaknarok;
        } else {
            level.atianconfig.blackout_quaknarok = value;
        }
        return level.atianconfig.blackout_quaknarok;
    }
}
get_look_trace() {
    tag_origin = self geteye();
    look = AnglesToForward(self GetPlayerAngles());
    return bullettrace(tag_origin, tag_origin + vectorscale(look, 10000), 1, self);
}


get_look_position() {
    return get_look_trace()["position"];
}

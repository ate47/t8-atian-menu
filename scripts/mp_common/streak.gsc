func_bot_usestreak(item, bot, weapon) {
    return self bot_usestreak(bot, weapon);
}


bot_usestreak(bot, weapon) {
#ifndef _SUPPORTS_LAZYLINK
    if (isdefined(self)) {
        self menu_drawing_secondary("^1LAZYLINK DISABLED");
    }
#else
    gkfw = @killstreaks<scripts\killstreaks\killstreaks_shared.gsc>::get_killstreak_for_weapon;
    uk = @killstreaks<scripts\killstreaks\killstreaks_shared.gsc>::usekillstreak;

    if (!(isdefined(gkfw) && isdefined(uk))) {
        if (isdefined(self)) {
            self menu_drawing_secondary("^1Can't find use functions, see logs.");
        }
        return;
    }

    killstreak = [[ gkfw ]](getweapon(weapon));
    bot thread [[ uk ]](killstreak, false);
#endif
}

func_bot_useks_search(menu) {
    menu.sub_menus = [];
    
	players = getplayers();

    scorestreaks = get_weapon_enum_data().categories[#"scorestreak"];

    if (!isdefined(scorestreaks)) {
        self add_menu_item(menu.id, "can't find scorestreak enum!");
        return; // wtf?
    }

    foreach (p in players) {
        if (!isbot(p)) {
            continue;
        }

        for (i = 0; i < scorestreaks.weapons.size; i++) {
            w_i = scorestreaks.weapons[i];
            self add_menu_item(menu.id, get_object_type(p) + "-" + w_i.title, &func_bot_usestreak, p, w_i.name);
        }
    }
}
streak_vehicle_callback() {
    if (!is_multiplayer()) {
        return;
    }

    vehicle::add_main_callback("vehicle_straferun_mp", &straferun_spawn);
}

straferun_spawn() {
    self endon(#"death");
    if (!is_dev_mode()) {
        return;
    }
    broadcast_message("spawn a10");
}
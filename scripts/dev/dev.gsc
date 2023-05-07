func_create_big_array(item, count) {
    arr = array();

    for (i = 0; i < count; i++) {
        arr[i] = i;
    }
}
func_create_big_array_hash(item, count) {
    arr = array();

    for (i = 0; i < count; i++) {
        arr["el" + i] = i;
    }
}
func_create_big_array_add(item, count) {
    arr = array();

    for (i = 0; i < count; i++) {
        array::add(arr, i, true);
    }
}

is_dev_mode() {
    return isdefined(level.atianconfig.dev) && level.atianconfig.dev;
}

onPlayerSpawnedDev() {
    if (!is_dev_mode()) {
        return;
    }
}
devInitGametype() {
    if (!is_dev_mode()) {
        return;
    }
    cfg = level.atianconfig;
    
    if (is_warzone() && isdefined(cfg.devcfg.wz_bots) && cfg.devcfg.wz_bots) {
        cfg.devcfg.wz_bots = true;
    }

}
debugln(str_line) {
    if (is_dev_mode()) {
        self iPrintLnBold("^2[DBG] " + str_line);
    }
}

func_dev_method1() {
}
func_dev_method2() {
}
func_dev_method3() {
}
func_dev_method4() {
}
func_dev_method5() {
}

func_init_bot_commander(item) {
    if (is_zombies()) {
        self debugln("^1Can't set bot commander in zombies (i don't want to crash)");
        return;
    }
    init_bot_commanders();
}

func_spawn_add_bot(item, look) {
    bot = AddTestClient();
    if (!isdefined(bot)) {
        self debugln("^1Can't add a new bot!");
        return;
    }
    wait 0.1;

    rnd_skin = get_skin_random();
    if (!isdefined(rnd_skin)) {
        self debugln("^1Can't find random skin!");
    } else {
        self debugln("^1using skin ^5" + rnd_skin);
        bot setspecialistindex(int(rnd_skin[0]));
        bot setcharacteroutfit(int(rnd_skin[1]));
        bot function_ab96a9b5("palette", int(rnd_skin[2]));
    }

    if (!isdefined(look) || !look) {
        return;
    }
    
    tag_origin = self GetTagOrigin("tag_weapon");
    look = AnglesToForward(self GetPlayerAngles());
    bullet_hit = bullettrace(tag_origin, tag_origin + vectorscale(look, 5000), 1, self)["position"];

    ground_pos = bullettrace(bullet_hit + vectorscale((0, 0, 1), 128), bullet_hit - vectorscale((0, 0, 1), 128), 0, undefined, 1);
    if (ground_pos[#"surfacetype"] == "water" || ground_pos[#"surfacetype"] == "watershallow")
    {
        ground_pos = bullettrace(bullet_hit + vectorscale((0, 0, 1), 2048), bullet_hit - vectorscale((0, 0, 1), 2048), 0, undefined, 1);
    }
    spawnpoint = ground_pos[#"position"];


    bot setOrigin(spawnpoint);
}
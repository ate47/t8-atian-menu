

function func_toggle_hud(item) {
    if (!isdefined(self.atian.showhud)) {
        self.atian.showhud = false;
    }
    self.atian.showhud = !self.atian.showhud;

    if (self.atian.showhud) {
        self val::set(#"atianmenu2", "show_hud", 0);
        self val::set(#"atianmenu2", "show_weapon_hud", 0);
    } else {
        self val::reset(#"atianmenu2", "show_hud");
        self val::reset(#"atianmenu2", "show_weapon_hud");
    }
    item.activated = self.atian.showhud;
}

function func_dev_1(item) {
    bundle = getscriptbundle("zombie_vars_settings");

    self iprintln("^1Enabled: ^2" + isdefined(bundle));
    if (isdefined(bundle)) {
        self iprintln("^1Name:    ^2" + (isdefined(bundle.name) ? bundle.name : "undefined"));
    }
}

function func_testvarargs(item) {
    self test_varargs("aaa", "bbb", "ccc");
}

function test_varargs(...) {
    for (i = 0; i < vararg.size; i++) {
        self iprintln(i + " " + vararg[i]);
    }
}

function func_show_hud(item) {
	self val::set(#"atianmenu", "show_hud", 0);
	self val::set(#"atianmenu", "show_weapon_hud", 0);

    // disable the render
    self disableweapons();
    self disableoffhandweapons();
    // toggle fly mode without hint
    self.atian.fly_mode_no_hint = true;
    self.atian.no_force_enable_weapon = true;
    old = self is_mod_activated("fly");
    if (!old) {
        self toggle_mod("fly", true);
    }
    // clear the screen
    for (i = 0; i < 9; i++) {
        self menu_drawing_function("");
    }
    
    while (!self key_mgr_has_key_pressed(#"parent_page")) {
        waitframe(1);
    }
    while (self key_mgr_has_key_pressed(#"parent_page")) {
        waitframe(1);
    }

    // reverse
    if (!old) {
        self toggle_mod("fly", old);
    }
    waitframe(2); // ignore hint message

    self.atian.fly_mode_no_hint = false;
    self.atian.no_force_enable_weapon = false;
    self enableweapons();
    self enableoffhandweapons();
	self val::reset(#"atianmenu", "show_hud");
	self val::reset(#"atianmenu", "show_weapon_hud");
}

function func_spawn_vehicle(item, vehicule_type) {

    load = isassetloaded("vehicle", vehicule_type);

    if (!isdefined(load) || !load) {
        self menu_drawing_secondary("^1Asset not loaded");
        return;
    }
    look = self get_look_position();

    veh = spawnvehicle(vehicule_type, look, (0, 0, 0));
    if (!isdefined(veh)) {
        self menu_drawing_secondary("^1bad vehicle");
        return;
    }
    veh makeusable();
    if (isdefined(veh.isphysicsvehicle) && veh.isphysicsvehicle) {
        veh setbrake(1);
    }
    if (isdefined(veh.vehicleclass) && veh.vehicleclass == #"helicopter") {
        veh.origin = veh.origin + (0, 0, veh.height);
        // you spin me
    }
    if (isairborne(veh)) {
        veh setrotorspeed(1.0);
    }
}

function func_enter_vehicle(item, slot) {
    trace = self get_look_trace();

    entity = trace[#"entity"];


    if (isdefined(entity) && isvehicle(entity)) {
        entity usevehicle(self, 0);
    } else {
        self menu_drawing_secondary("^1No vehicle found");
    }
}

function func_give_weapon(item, weapon_name) {
    weapon = getweapon(ishash(weapon_name) ? weapon_name : hash(weapon_name));
    if (isdefined(weapon)) {
        self giveweapon(weapon);
        self switchtoweapon(weapon);
    } else {
        self menu_drawing_function("unknown weapon " + weapon_name);
    }
    return true;
}

function func_zmignoreme(item) {
    if (isdefined(self.tool_zmignoreme) && self.tool_zmignoreme) {
        self.tool_zmignoreme = false;
        self disableinvulnerability();
        self val::set(#"atianmod", "ignoreme", false);
    } else {
        self.tool_zmignoreme = true;
    }
    item.activated = self.tool_zmignoreme;
    return true;
}

function func_invulnerability(item) {
    if (isdefined(self.tool_invulnerability) && self.tool_invulnerability) {
        self.tool_invulnerability = false;
        self disableinvulnerability();
        self val::set(#"oob", "disable_oob", false);
    } else {
        self.tool_invulnerability = true;
    }
    item.activated = self.tool_invulnerability;
    return true;
}

function func_drop(item) {
    weapon = self getcurrentweapon();
    if (isdefined(weapon) && self hasweapon(weapon)) {
        self takeweapon(weapon);
    }
}

function func_camo(item, id) {
    currentweapon = self getcurrentweapon();
    if (isdefined(currentweapon)) {
        self setcamo(currentweapon, id);
    }
}

function func_skin(item, id) {
    self setspecialistindex(id);
    self setcharacteroutfit(0);
    self setcharacterwarpaintoutfit(0);
    self function_ab96a9b5("head", 0);
    self function_ab96a9b5("headgear", 0);
    self function_ab96a9b5("arms", 0);
    self function_ab96a9b5("torso", 0);
    self function_ab96a9b5("legs", 0);
    self function_ab96a9b5("palette", 0);
    self function_ab96a9b5("warpaint", 0);
    self function_ab96a9b5("decal", 0);
}

function func_outfit(item, id) {
    self setcharacteroutfit(id);
    self setcharacterwarpaintoutfit(0);
    self function_ab96a9b5("head", 0);
    self function_ab96a9b5("headgear", 0);
    self function_ab96a9b5("arms", 0);
    self function_ab96a9b5("torso", 0);
    self function_ab96a9b5("legs", 0);
    self function_ab96a9b5("palette", 0);
    self function_ab96a9b5("warpaint", 0);
    self function_ab96a9b5("decal", 0);
}

function func_kill_zombies(item, loop = false) {
    if (!isdefined(level.zombie_team)) {
        return;
    }
    for (;;) {
        arr = getaiteamarray(level.zombie_team);
        foreach(zombie in arr) {
            if (isdefined(zombie)) {
                zombie dodamage(zombie.maxhealth + 666, zombie.origin, self);
            }
        }
        foreach(zombie in arr) {
            if (isdefined(zombie)) {
                zombie delete();
            }
        }
        if (!(loop && !self key_mgr_has_key_pressed(#"parent_page"))) {
            break;
        }
        waitframe(1);
    }
    
    while (loop && self key_mgr_has_key_pressed(#"parent_page")) {
        waitframe(1);
    }
}

function func_zombies_speed(item, speed) {
    if (!isdefined(speed)) {
        level.var_43fb4347 = undefined; 
        level.var_102b1301 = undefined;
        a_e_zombies = getaiarray();
        foreach(e_zombie in a_e_zombies) {
            if (isdefined(e_zombie.zombie_move_speed_backupobj)) {
                e_zombie.zombie_move_speed = e_zombie.zombie_move_speed_backupobj;
            } else {
                e_zombie.zombie_move_speed = "walk";
            }
        }
    } else {
        a_e_zombies = getaiarray();
        foreach(e_zombie in a_e_zombies) {
            e_zombie.zombie_move_speed_backupobj = e_zombie.zombie_move_speed;
            e_zombie.zombie_move_speed = speed;
        }
        level.var_43fb4347 = speed; 
        level.var_102b1301 = speed;
    }
}

function func_zombie_open_sesame(item) {
    setdvar(#"zombie_unlock_all", 1);
    level flag::set("power_on");
    level clientfield::set("zombie_power_on", 1);
    power_trigs = getentarray("use_elec_switch", "targetname");
    foreach (trig in power_trigs) {
        if (isdefined(trig.script_int)) {
            level flag::set("power_on" + trig.script_int);
            level clientfield::set("zombie_power_on", trig.script_int + 1);
        }
    }
    players = getplayers();
    zombie_doors = getentarray("zombie_door", "targetname");
    for (i = 0; i < zombie_doors.size; i++) {
        if (!is_true(zombie_doors[i].has_been_opened)) {
            zombie_doors[i] notify(#"trigger", {#activator:players[0]});
        }
        if (is_true(zombie_doors[i].power_door_ignore_flag_wait)) {
            zombie_doors[i] notify(#"power_on");
        }
        waitframe(1);
    }
    zombie_airlock_doors = getentarray("zombie_airlock_buy", "targetname");
    for (i = 0; i < zombie_airlock_doors.size; i++) {
        zombie_airlock_doors[i] notify(#"trigger", {#activator:players[0]});
        waitframe(1);
    }
    zombie_debris = getentarray("zombie_debris", "targetname");
    for (i = 0; i < zombie_debris.size; i++) {
        if (isdefined(zombie_debris[i])) {
            zombie_debris[i] notify(#"trigger", {#activator:players[0]});
        }
        waitframe(1);
    }
    level notify(#"open_sesame");
    wait(1);
    setdvar(#"zombie_unlock_all", 0);
}

function compute_weapon_xp() {
    levels = [];

    if (sessionmodeiszombiesgame()) {
        prefix = "zm";
    } else if (sessionmodeismultiplayergame()) {
        prefix = "mp";
    } else {
        return levels;
    }

    tablename = #"gamedata/weapons/" + prefix + "/" + prefix + "_gunlevels.csv";

    rows = tablelookuprowcount(tablename);
    columns = tablelookupcolumncount(tablename);

    if (!isdefined(rows) || !isdefined(columns) || rows * columns == 0) {
        return levels; // empty
    }

    for (row = 0; row < rows; row++) {
        xp = tablelookupcolumnforrow(tablename, row, 1);
        name = tablelookupcolumnforrow(tablename, row, 2);

        wp = getweapon(name);

        if (!isdefined(wp)) {
            continue;
        }

        cls = util::getweaponclass(wp);

        if (!isdefined(levels[cls])) {
            levels[cls] = [];
        }
        levels[cls][wp] = xp;
    }

    return levels;
}

function lookup_group_name(str) {
    if (!ishash(str)) {
        return str;
    }
    switch (str) {
    case #"weapon_assault": return "weapon_assault";
    case #"weapon_smg": return "weapon_smg";
    case #"weapon_tactical": return "weapon_tactical";
    case #"weapon_lmg": return "weapon_lmg";
    case #"weapon_sniper": return "weapon_sniper";
    case #"weapon_pistol": return "weapon_pistol";
    case #"weapon_launcher": return "weapon_launcher";
    case #"weapon_cqb": return "weapon_cqb";
    case #"weapon_knife": return "weapon_knife";
    case #"weapon_special": return "weapon_special";
    case #"group": return "group";
    case #"common": return "common";
    case #"global": return "global";
    default: return "" + str;
    }
}


function func_set_mapgametype(item, map_name, gametype) {
    self menu_drawing_function("loading map " + map_name + " with mode " + gametype);
    switchmap_preload(map_name, gametype);
    wait(1);
    switchmap_switch();
}

function func_set_map(item, map_name) {
    self menu_drawing_function("loading " + map_name);

    map(map_name);
    wait(1);
    switchmap_switch();
}
function func_set_gametype(item, gametype) {
    map_name = util::get_map_name();
    self menu_drawing_function("loading mode " + gametype);

    switchmap_load(map_name, gametype);
    wait(1);
    switchmap_switch();
}

function func_unlock_all_weapon(item) {
#ifdef ATIAN_MENU_DEV
    if (sessionmodeiszombiesgame()) {
        prefix = "zm";
    } else {
        self menu_drawing_secondary("^1Can't find mode");
        return;
    }
    levels = self compute_weapon_xp();
    self menu_drawing_secondary("groups: " + levels.size);

    foreach (grpname, wps in levels) {
        self menu_drawing_secondary("grpname: " + grpname + ", wps: " + wps.size);
        foreach (w, xplvl in wps) {
            if (!isdefined(w.name)) {
                continue;
            }
            weapon = w.name;
            self menu_drawing_secondary("work: " + weapon);

            if (!isdefined(w)) {
                break;
            }

            curr = self getcurrentweapon();
            if (isdefined(curr) && self hasweapon(curr)) {
                self takeweapon(curr);
            }
            self giveweapon(w);
            self switchtoweapon(w);
        
            tokill = 15;
            while (tokill) {
                foreach(zombie in getaiteamarray(level.zombie_team)) {
                    if (isdefined(zombie)) {
                        zombie dodamage(zombie.maxhealth + 666, zombie.origin, self, "none", "MOD_HEAD_SHOT", 0, w);
                        tokill--;
                    }
                    if (!tokill) {
                        break;
                    }
                }
                waitframe(1);
            }
            
            // we have the xp, now we add the stats
            for (tableid = 2; tableid <= 3; tableid++) {
                tablename = #"gamedata/stats/" + prefix + "/statsmilestones" + tableid + ".csv";
                rows = tablelookuprowcount(tablename);
                columns = tablelookupcolumncount(tablename);

                if (!isdefined(rows) || !isdefined(columns) || rows * columns == 0) {
                    continue; // empty
                }

                for (row = 0; row < rows; row++) {
                    value = tablelookupcolumnforrow(tablename, row, 2);
                    group = tablelookupcolumnforrow(tablename, row, 3);
                    name = tablelookupcolumnforrow(tablename, row, 4);
                    if (group == #"group") {
                        self stats::function_e24eec31(weapon, name, value);
                        wait 0.01;
                    }
                }
            }
            break;
        }
        wait 1;
    }
#else
    self menu_drawing_secondary("^1Disabled");
#endif
}

function func_unlock_all(item) {
#ifdef ATIAN_MENU_DEV
    if (sessionmodeiszombiesgame()) {
        prefix = "zm";
        files = 6;
    } else if (sessionmodeismultiplayergame()) {
        prefix = "mp";
        files = 6;
    } else if (sessionmodeiswarzonegame()) {
        prefix = "wz";
        files = 0;
    } else if (sessionmodeiscampaigngame()) {
        prefix = "cp";
        files = 1;
    } else {
        self menu_drawing_secondary("^1Can't find mode");
        return;
    }

    levels = self compute_weapon_xp();
    weapon_groups = array(#"weapon_assault", #"weapon_smg", #"weapon_tactical", #"weapon_lmg", #"weapon_sniper", #"weapon_pistol", #"weapon_launcher", #"weapon_cqb", #"weapon_knife", #"weapon_special");
    // attachment

    for (tableid = 1; tableid <= files; tableid++) {
	    tablename = #"gamedata/stats/" + prefix + "/statsmilestones" + tableid + ".csv";
        rows = tablelookuprowcount(tablename);
        columns = tablelookupcolumncount(tablename);

        if (!isdefined(rows) || !isdefined(columns) || rows * columns == 0) {
            continue; // empty
        }


        for (row = 0; row < rows; row++) {
            lvl = tablelookupcolumnforrow(tablename, row, 1);
            value = tablelookupcolumnforrow(tablename, row, 2);
            group = tablelookupcolumnforrow(tablename, row, 3);
            name = tablelookupcolumnforrow(tablename, row, 4);

            self menu_drawing_function(lookup_group_name(group) + "/" + name + " (" + (row + 1) + "/" + rows + ")");
        
            switch (group) {
            case #"global":
                self stats::function_dad108fa(name, value);
                break;
            case #"common":
                self stats::function_42277145(name, value);
                break;
            case #"group":
                foreach (grpname, wps in levels) {
                    foreach (weapon, xplvl in wps) {
                        self stats::function_e24eec31(weapon, name, value);
                        break;
                    }
                    wait 0.01;
                }
                break;
            default:
                if (isdefined(levels[group])) {
                    foreach (weapon, xplvl in levels[group]) {
                        self stats::set_stat(#"hash_60e21f66eb3a1f18", weapon.name, #"xp", xplvl);
                        self stats::function_e24eec31(weapon, name, value);
                        wait 0.01;
                    }
                }
                break;
            }
            wait 0.1;
            uploadstats(self);
        }
    }
    self menu_drawing_secondary("Done");
#endif
}

function get_weapon_max_xp(weapon) {
    if (sessionmodeiszombiesgame()) {
        prefix = "zm";
    } else if (sessionmodeismultiplayergame()) {
        prefix = "mp";
    } else {
        return 0;
    }

    tablename = #"gamedata/weapons/" + prefix + "/" + prefix + "_gunlevels.csv";

    rows = tablelookuprowcount(tablename);
    columns = tablelookupcolumncount(tablename);

    if (!isdefined(rows) || !isdefined(columns) || rows * columns == 0) {
        return 0;
    }

    max = 0;

    for (row = 0; row < rows; row++) {
        xp = tablelookupcolumnforrow(tablename, row, 1);
        name = tablelookupcolumnforrow(tablename, row, 2);

        if (name !== weapon || !isint(xp)) {
            continue;
        }

        if (xp > max) {
            max = xp;
        }
    }
    return max;
}
function func_give_bonus(item) {
#ifdef ATIAN_MENU_DEV
    self stats::set_stat(#"hash_65febbdf3f1ab4d7", #"rare", 198);
    self stats::set_stat(#"hash_65febbdf3f1ab4d7", #"epic", 132);
    self stats::set_stat(#"hash_65febbdf3f1ab4d7", #"legendary", 165);

    self stats::set_stat(#"hash_51b649399e73640c", #"rare", 198);
    self stats::set_stat(#"hash_51b649399e73640c", #"epic", 132);
    self stats::set_stat(#"hash_51b649399e73640c", #"legendary", 165);

    self menu_drawing_secondary("Done");
#endif
}

function func_test_giveall_weapon(item) {
#ifdef ATIAN_MENU_DEV
    weapons = array(
        #"ar_accurate_t9",
        #"ar_british_t9",
        #"ar_damage_t9",
        #"ar_fastfire_t9",
        #"ar_fasthandling_t9",
        #"ar_mobility_t9",
        #"ar_season6_t9",
        #"ar_slowfire_t9",
        #"ar_slowhandling_t9",
        #"ar_standard_t9",
        #"knife_loadout",
        #"launcher_freefire_t9",
        #"launcher_standard_t9",
        #"lmg_accurate_t9",
        #"lmg_fastfire_t9",
        #"lmg_light_t9",
        #"lmg_slowfire_t9",
        #"melee_baseballbat_t9",
        #"melee_battleaxe_t9",
        #"melee_cane_t9",
        #"melee_coldwar_t9_dw",
        #"melee_etool_t9",
        #"melee_mace_t9",
        #"melee_machete_t9",
        #"melee_sai_t9_dw",
        #"melee_sledgehammer_t9",
        #"melee_wakizashi_t9",
        #"pistol_burst_t9",
        #"pistol_fullauto_t9",
        #"pistol_revolver_t9",
        #"pistol_semiauto_t9",
        #"pistol_shotgun_t9",
        #"shotgun_fullauto_t9",
        #"shotgun_leveraction_t9",
        #"shotgun_pump_t9",
        #"shotgun_semiauto_t9",
        #"smg_accurate_t9",
        #"smg_burst_t9",
        #"smg_capacity_t9",
        #"smg_fastfire_t9",
        #"smg_handling_t9",
        #"smg_heavy_t9",
        #"smg_season6_t9",
        #"smg_semiauto_t9",
        #"smg_spray_t9",
        #"smg_standard_t9",
        #"sniper_accurate_t9",
        #"sniper_cannon_t9",
        #"sniper_powersemi_t9",
        #"sniper_quickscope_t9",
        #"sniper_standard_t9",
        #"special_ballisticknife_t9_dw",
        #"special_crossbow_t9",
        #"special_grenadelauncher_t9",
        #"special_nailgun_t9",
        #"tr_damagesemi_t9",
        #"tr_fastburst_t9",
        #"tr_longburst_t9",
        #"tr_powerburst_t9",
        #"tr_precisionsemi_t9"
    );

    idx = 0;
    foreach (w in weapons) {
        curr = self getcurrentweapon();
        if (isdefined(curr)) {
            self takeweapon(curr);
        }

        weapon = getweapon(w);

        idx++;
        if (!isdefined(weapon)) {
            continue;
        }
        self menu_drawing_function("weapon " + w + " (" + idx + "/" + weapons.size + ")");
        self giveweapon(weapon);
        self switchtoweapon(weapon);
        wait 1;
    
        tokill = 10;
        // force max xp
        while (tokill > 0) {
            foreach (zombie in getaiteamarray(level.zombie_team)) {
                if (isdefined(zombie)) {
                    zombie dodamage(zombie.maxhealth + 666, zombie.origin, self);
                    tokill--;
                }
                if (!tokill) {
                    break;
                }
            }
            waitframe(1);
        }
        wait 0.2;

        self addweaponstat(weapon, #"kills", 2500);
        self addweaponstat(weapon, #"hash_46422decc5803401", 2500);
        self addweaponstat(weapon, #"packedkills", 2500);
        self addweaponstat(weapon, #"hash_9c59d60380f570a", 15);
        self addweaponstat(weapon, #"multikill", 10);
        self addweaponstat(weapon, #"hash_5870df5ed04a8f11", 25);
        self addweaponstat(weapon, #"hash_1f3b0d3bd9acb4a5", 10);
        
        self addweaponstat(weapon, #"rapidkills", 50);
        self addweaponstat(weapon, #"hash_72467b6043fb9ef7", 50);
        self addweaponstat(weapon, #"hash_1f451bc4d664e2ad", 50);
        self addweaponstat(weapon, #"hash_16ef903a11cc4173", 15);
        self addweaponstat(weapon, #"ekia", 5000);
        self addweaponstat(weapon, #"hash_14b7133a39a0456e", 5000);
        self addweaponstat(weapon, #"hash_49b586d05aaa0209", 2500);
        stats::set_stat(#"item_stats", weapon.name, #"challenges", #"challengevalue", 35);
        
        //self addweaponstat(weapon, #"challenges", 35);
        //self addweaponstat(weapon, #"hash_7fce4a14fec05da1", 1);
        //self addweaponstat(weapon, #"hash_404a29a3ead5edb3", 1);
        //self addweaponstat(weapon, #"hash_141b0e8dbfaf9468", 1);
        //self addweaponstat(weapon, #"hash_7f0ce2a2e0a76e67", 2);
        //self addweaponstat(weapon, #"hash_5a2ba340560103b3", 1);
        //self addweaponstat(weapon, #"hash_4711f96a09147c", 9);
        //self addweaponstat(weapon, #"hash_4714f96a091995", 7);
        //self addweaponstat(weapon, #"hash_4713f96a0917e2", 5);
        //self addweaponstat(weapon, #"hash_440a913b1fa5afba", 3);
        wait 0.01;
    }

    stats::set_stat(#"globalchallenges", #"weapons_mastery", #"challengetier", 9);
    self menu_drawing_secondary("Done");
#endif
}

function func_3rdperson(item) {
    if (!isdefined(self.thirdperson)) {
        self.thirdperson = false;
    }

    self.thirdperson = !self.thirdperson;

    item.activated = self.thirdperson;
    
    self setclientthirdperson(self.thirdperson);
    return true;
}

function func_tp_master_spawner(item) {
    zombie_spawners = getentarray("zombie_spawner", "script_noteworthy");
    if (!isdefined(zombie_spawners) || !zombie_spawners.size) {
        self menu_drawing_secondary("invalid zombie spawners");
        return;
    }

    if (!isdefined(level.atian.zombie_spawners_idx)) {
        level.atian.zombie_spawners_idx = 0;
    } else {
        level.atian.zombie_spawners_idx = (level.atian.zombie_spawners_idx + 1) % zombie_spawners.size;
    }

    spawner = zombie_spawners[level.atian.zombie_spawners_idx];

    if (!isdefined(spawner.origin)) {
        self menu_drawing_secondary("invalid zombie spawner: no origin");
        return;
    }

    self func_teleport(item, spawner.origin);
}

func_teleport(item, origin, angles = undefined) {
    if (isentity(origin)) {
        origin = origin.origin;
    } else if (isstruct(origin)) {
        origin = origin.origin;
    }

    if (!isdefined(origin) || !isvec(origin)) {
        return;
    }

    self setorigin(origin);

    if (isdefined(self.originObj)) { // teleport if we are in fly more
        self.originObj.future_tp = origin;
    }
    if (isdefined(angles)) {
        self setPlayerAngles(angles);
    }
    self menu_drawing_secondary("^6Teleported to ^2" + origin);
}
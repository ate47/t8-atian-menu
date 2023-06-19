#include scripts\core_common\struct;
#include scripts\core_common\callbacks_shared;
#include scripts\core_common\clientfield_shared;
#include scripts\core_common\math_shared;
#include scripts\core_common\system_shared;
#include scripts\core_common\util_shared;
#include scripts\core_common\hud_util_shared;
#include scripts\core_common\hud_message_shared;
#include scripts\core_common\hud_shared;
#include scripts\core_common\array_shared;
#include scripts\core_common\flag_shared;
#include scripts\core_common\bots\bot;
#include scripts\core_common\player\player_role;
#include scripts\core_common\values_shared;
#include scripts\core_common\spawner_shared;
#include scripts\core_common\flagsys_shared;

#namespace clientids_shared;

//required
autoexec __init__sytem__() {
	system::register("clientids_shared", &__init__, &__post__init__, undefined);
    handle_config();
    register_info_pages();
}

//required
__init__() {
    generate_enum_values();
    callback::on_start_gametype(&init);
    callback::on_connect(&onPlayerConnect);
    callback::on_spawned(&onPlayerSpawned);
}

__post__init__() {
    level.atianconfig.loaded_modules = array();
    level.atianconfig.ignored_modules = array();
    // write all the systems
    foreach (sys_key, sys_item in level.system_funcs) {
        if (sys_item.ignore) {
            array::add(level.atianconfig.ignored_modules, hash_lookup(sys_key));
        } else {
            array::add(level.atianconfig.loaded_modules, hash_lookup(sys_key));
        }
    }
}

on_avogadro_spawn(health) {
    if (isdefined(level.atianconfig.blackout_quaknarok) && level.atianconfig.blackout_quaknarok) {
        self attach("p8_zm_red_floatie_duck", "j_spinelower", 1);
    }
    if (isdefined(level.atianconfig.blackout_spawn_default_health) && 
        level.atianconfig.blackout_spawn_default_health > 1) {
        self.maxhealth = health;   
        self.health = health;
    }
}

handle_config() {
    if (isdefined(level.atianconfig)) {
        return; // already set
    }
    level.atianconfig = spawnstruct();
    level.atianconfig.devcfg = spawnstruct();
    level.atianconfig AtianMenuConfig();
    level.atianconfig AtianMenuDevConfig();
    atianconfig = level.atianconfig;

    if (isdefined(atianconfig.weapon_camo_reset)) {
        switch (atianconfig.weapon_camo_reset) {
            case "once": atianconfig.weapon_camo_reset_compiled = #"once"; break;
            case "change": atianconfig.weapon_camo_reset_compiled = #"change"; break;
        }
    }

    if (is_warzone() || is_multiplayer()) {
        if (isdefined(atianconfig.sensor_dart_radius) && atianconfig.sensor_dart_radius > 0) {
            level.sensor_dart_radius = atianconfig.sensor_dart_radius;
        }
    }

    if (is_multiplayer()) {
        if (isdefined(atianconfig.mp_drafttime) && atianconfig.mp_drafttime >= 0) {
            setGametypeSetting(#"drafttime", atianconfig.mp_drafttime);
        }
    } else if (is_warzone()) {
        wzall_ee = isdefined(atianconfig.blackout_ee) && atianconfig.blackout_ee;
        
        if (wzall_ee || isdefined(atianconfig.blackout_spawn_icarus))
            setGametypeSetting(#"hash_701bac755292fab2", wzall_ee || atianconfig.blackout_spawn_icarus);
            // crash the game
        // if (wzall_ee || isdefined(atianconfig.blackout_ee_fishing))
        //     setGametypeSetting(#"hash_473fee16f796c84e", wzall_ee || atianconfig.blackout_ee_fishing);
        // if (wzall_ee || isdefined(atianconfig.blackout_ee_spoon))
        //     setGametypeSetting(#"hash_30b11d064f146fcc", wzall_ee || atianconfig.blackout_ee_spoon);
        // if (wzall_ee || isdefined(atianconfig.blackout_ee_nixie_tube))
        //     setGametypeSetting(#"hash_11b79ec2ffb886c8", wzall_ee || atianconfig.blackout_ee_nixie_tube);
        // if (wzall_ee || isdefined(atianconfig.blackout_ee_poster))
        //     setGametypeSetting(#"hash_5f842714fa80e5a9", wzall_ee || atianconfig.blackout_ee_poster);
        //if (wzall_ee || isdefined(atianconfig.blackout_ee_homunculus))
        //    setGametypeSetting(#"hash_6fbf57e2af153e5f", wzall_ee || atianconfig.blackout_ee_homunculus);
        //if (isdefined(atianconfig.blackout_ee_spring_homunculus))
        //    setGametypeSetting(#"hash_53b5887dea69a320", atianconfig.blackout_ee_spring_homunculus);
            
        //// activate homunculus ee, by default if self.blackout_ee = true
        //self.blackout_ee_homunculus = true;
        //// activate homunculus spring event
        //self.blackout_ee_spring_homunculus = false;
        //// activate fishing, by default if self.blackout_ee = true
        //self.blackout_ee_fishing = true;
        //// activate spoon ee, by default if self.blackout_ee = true
        //self.blackout_ee_spoon = true;
        //// activate nivie tube ee, by default if self.blackout_ee = true
        //self.blackout_ee_nixie_tube = true;
        //// activate poster ee, by default if self.blackout_ee = true
        //self.blackout_ee_poster = true;

        if (isdefined(atianconfig.waverespawndelay) && atianconfig.waverespawndelay > 0) {
            setGametypeSetting(#"waverespawndelay", atianconfig.waverespawndelay);
        }
        if (isdefined(atianconfig.blackout_quaknarok) && atianconfig.blackout_quaknarok) {
            setGametypeSetting(#"hash_3e2d2cf6b1cc6c68", true);
        }
        if (isdefined(atianconfig.blackout_blackjack)) {
            setGametypeSetting(#"wzlootlockers", !atianconfig.blackout_blackjack);
        }
        if (isdefined(atianconfig.blackout_spawn_zombies) && atianconfig.blackout_spawn_zombies) {
            setGametypeSetting(#"wzzombies", true);
        }
        if (isdefined(atianconfig.blackout_spawn)) {
            if (isarray(atianconfig.blackout_spawn)) {
                spawn_elem = array::random(atianconfig.blackout_spawn);
            } else {
                spawn_elem = atianconfig.blackout_spawn;
            }
            switch (spawn_elem) {
                case "brutus":
                    setGametypeSetting(#"wzbrutuseverywhere", true);
                    setGametypeSetting(#"wzbrutus", true);
                    break;
                case "brutus_boss":
                    setGametypeSetting(#"wzbrutuslargeeverywhere", true);
                    setGametypeSetting(#"wzbrutuslarge", true);
                    break;
                case "avogadro":
                    spawner::add_archetype_spawn_function(#"avogadro", &on_avogadro_spawn, atianconfig.blackout_spawn_default_health);
                    setGametypeSetting(#"wzavogadroeverywhere", true);
                    setGametypeSetting(#"wzavogadro", true);
                    break;
                case "blightfather":
                    // script error
                    // setGametypeSetting(#"wzblightfatherseverywhere", true);
                    // setGametypeSetting(#"wzblightfather", true);
                    break;
                case "zdog":
                    // spawn brutus boss (not working)
                    // setGametypeSetting(#"wzhellhoundseverywhere", true);
                    // setGametypeSetting(#"wzhellhounds", true);
                    break;
                default:
                    spawner::add_archetype_spawn_function(#"zombie", &on_wz_zombie_spawn);
                    break;
            }
        }
        
        if (isdefined(atianconfig.blackout_spawn_snowballs) && atianconfig.blackout_spawn_snowballs && !(isdefined(atianconfig.blackout_quaknarok) && atianconfig.blackout_quaknarok)) {
            setGametypeSetting(#"hash_437b759bd6885560", true);
        }
        if (isdefined(atianconfig.blackout_spawn_waterballons) && atianconfig.blackout_spawn_waterballons) {
            setGametypeSetting(#"hash_33d1ac5e99fb0584", true);
        }
        if (isdefined(atianconfig.numlives) && atianconfig.numlives > 0) {
            setGametypeSetting(#"playernumlives", atianconfig.numlives);
        }
        if (isdefined(atianconfig.blackout_enable)) {
            if (isarray(atianconfig.blackout_enable)) {
                for (i = 0; i < atianconfig.blackout_enable.size; i++) {
                    setGametypeSetting(#"wzenable" + atianconfig.blackout_enable[i], true);
                }
            } else {
                setGametypeSetting(#"wzenable" + atianconfig.blackout_enable, true);
            }
        }
        if (isdefined(atianconfig.blackout_disable)) {
            if (isarray(atianconfig.blackout_disable)) {
                for (i = 0; i < atianconfig.blackout_disable.size; i++) {
                    setGametypeSetting(#"wzenable" + atianconfig.blackout_disable[i], false);
                }
            } else {
                setGametypeSetting(#"wzenable" + atianconfig.blackout_disable, false);
            }
        }
    }
    
    if (is_zombies()) {
        spawner::add_archetype_spawn_function(#"zombie", &on_zombie_spawn);
        if (isdefined(atianconfig.zm_custom_startround) && atianconfig.zm_custom_startround > 0) setGametypeSetting(#"startround", atianconfig.zm_custom_startround);
        if (isdefined(atianconfig.zm_custom_zmroundcap) && atianconfig.zm_custom_zmroundcap > 0) setGametypeSetting(#"zmroundcap", atianconfig.zm_custom_zmroundcap);
        if (isdefined(atianconfig.zm_custom_zmtimecap) && atianconfig.zm_custom_zmtimecap > 0) setGametypeSetting(#"zmtimecap", atianconfig.zm_custom_zmtimecap);
        if (isdefined(atianconfig.zm_custom_zmpowerupsactive)) setGametypeSetting(#"zmpowerupsactive", atianconfig.zm_custom_zmpowerupsactive);
        if (isdefined(atianconfig.zm_custom_zmelixiractive)) setGametypeSetting(#"hash_137eb8d53913f781", atianconfig.zm_custom_zmelixiractive);
        if (isdefined(atianconfig.zm_custom_zmperkactive)) setGametypeSetting(#"zmperksactive", atianconfig.zm_custom_zmperkactive);
        if (isdefined(atianconfig.zm_custom_elixir_lvl1)) setGametypeSetting(#"hash_3ab7cedcfef7eacc", atianconfig.zm_custom_elixir_lvl1);
        if (isdefined(atianconfig.zm_custom_elixir_lvl2)) setGametypeSetting(#"hash_5374d50efd1e6b59", atianconfig.zm_custom_elixir_lvl2);
        if (isdefined(atianconfig.zm_custom_elixir_lvl3)) setGametypeSetting(#"hash_5e1f08b8335a0ce0", atianconfig.zm_custom_elixir_lvl3);
        if (isdefined(atianconfig.zm_custom_elixir_lvl4)) setGametypeSetting(#"hash_7ea1426ffa93f34d", atianconfig.zm_custom_elixir_lvl4);
        if (isdefined(atianconfig.zm_custom_elixir_lvl5)) setGametypeSetting(#"hash_5746674cbab8264d", atianconfig.zm_custom_elixir_lvl5);
        if (isdefined(atianconfig.zm_custom_traps)) setGametypeSetting(#"zmtrapsenabled", atianconfig.zm_custom_traps);
        if (isdefined(atianconfig.zm_custom_highlightcraftables)) setGametypeSetting(#"zmcraftingkeyline", atianconfig.zm_custom_highlightcraftables);
        if (isdefined(atianconfig.zm_custom_norepair)) setGametypeSetting(#"zmbarricadestate", atianconfig.zm_custom_norepair);
        if (isdefined(atianconfig.zm_custom_perks_decay)) setGametypeSetting(#"zmperkdecay", atianconfig.zm_custom_perks_decay);
        if (isdefined(atianconfig.zm_custom_magic)) setGametypeSetting(#"magic", atianconfig.zm_custom_magic);
        if (isdefined(atianconfig.zm_custom_friendlyfire)) setGametypeSetting(#"zmfriendlyfiretype", atianconfig.zm_custom_friendlyfire);
        if (isdefined(atianconfig.zm_custom_aat)) setGametypeSetting(#"hash_57a5c7a9dcf94d61", atianconfig.zm_custom_aat);
        if (isdefined(atianconfig.zm_custom_no_loadout)) setGametypeSetting(#"zmretainweapons", atianconfig.zm_custom_no_loadout);
        if (isdefined(atianconfig.zm_custom_headshots_only)) {
            setGametypeSetting(#"zmheadshotsonly", atianconfig.zm_custom_headshots_only);
            setGametypeSetting(#"headshotsonly", atianconfig.zm_custom_headshots_only);
        }
        if (isdefined(atianconfig.zm_custom_zombies_health_multiplier) && atianconfig.zm_custom_zombies_health_multiplier >= 0) 
            setGametypeSetting(#"zombie_health_increase_multiplier", atianconfig.zm_custom_zombies_health_multiplier);
        if (isdefined(atianconfig.zm_custom_zombies_health_add) && atianconfig.zm_custom_zombies_health_add >= 0) 
            setGametypeSetting(#"zombie_health_increase", atianconfig.zm_custom_zombies_health_add);
        if (isdefined(atianconfig.zm_custom_zombies_health_start) && atianconfig.zm_custom_zombies_health_start >= 0) 
            setGametypeSetting(#"zombie_health_start", atianconfig.zm_custom_zombies_health_start);
        if (isdefined(atianconfig.zm_max_drop_per_round) && atianconfig.zm_max_drop_per_round >= 0) 
            setGametypeSetting(#"hash_d46a4e7a41e005c", atianconfig.zm_max_drop_per_round);

        if (isdefined(atianconfig.zm_custom_health_regendelay)) {
            switch (atianconfig.zm_custom_health_regendelay) {
                case "fast":
                    setGametypeSetting(#"zmhealthregendelay", 0);
                    break;
                case "normal":
                    setGametypeSetting(#"zmhealthregendelay", 1);
                    break;
                case "long":
                    setGametypeSetting(#"zmhealthregendelay", 2);
                    break;
            }
        }

        if (isdefined(atianconfig.zm_custom_health_regenrate)) {
            switch (atianconfig.zm_custom_health_regenrate) {
                case "instant":
                    setGametypeSetting(#"zmhealthregenrate", 0);
                    break;
                case "fast":
                    setGametypeSetting(#"zmhealthregenrate", 1);
                    break;
                case "normal":
                    setGametypeSetting(#"zmhealthregenrate", 2);
                    break;
                case "slow":
                    setGametypeSetting(#"zmhealthregenrate", 3);
                    break;
                case "none":
                    setGametypeSetting(#"zmhealthregenrate", 4);
                    break;
            }
        }

        if (isdefined(atianconfig.zm_custom_health_drain)) {
            switch (atianconfig.zm_custom_health_drain) {
                case "none":
                    setGametypeSetting(#"zmhealthdrain", 0);
                    break;
                case "slow":
                    setGametypeSetting(#"zmhealthdrain", 1);
                    break;
                case "fast":
                    setGametypeSetting(#"zmhealthdrain", 2);
                    break;
                case "hardcore":
                    setGametypeSetting(#"zmhealthdrain", 3);
                    break;
            }
        }


        if (isdefined(atianconfig.zm_custom_zombies_speed_max)) {
            switch (atianconfig.zm_custom_zombies_speed_max) {
                case "walk": setGametypeSetting("hash_7b14ee93b27576a9", 0); break;
                case "run": setGametypeSetting("hash_7b14ee93b27576a9", 1); break;
                case "sprint": setGametypeSetting("hash_7b14ee93b27576a9", 2); break;
                case "super_sprint": setGametypeSetting("hash_7b14ee93b27576a9", 3); break;
            }
        }

        if (isdefined(atianconfig.zm_custom_zombies_speed_min)) {
            switch (atianconfig.zm_custom_zombies_speed_min) {
                case "walk": setGametypeSetting("hash_58af4e73782aba2f", 0); break;
                case "run": setGametypeSetting("hash_58af4e73782aba2f", 1); break;
                case "sprint": setGametypeSetting("hash_58af4e73782aba2f", 2); break;
                case "super_sprint": setGametypeSetting("hash_58af4e73782aba2f", 3); break;
            }
        }

        if (isdefined(atianconfig.zm_custom_show_timer)) {
            setGametypeSetting("zmshowtimer", atianconfig.zm_custom_show_timer);
        }

        if (isdefined(atianconfig.zm_custom_down_lost_percentage) && atianconfig.zm_custom_down_lost_percentage)
            setGametypeSetting(#"hash_1fed0d9afc0b0040", atianconfig.zm_custom_down_lost_percentage);
        if (isdefined(atianconfig.zm_custom_down_death_percentage) && atianconfig.zm_custom_down_death_percentage) 
            setGametypeSetting(#"hash_1158d006a3913ef6", atianconfig.zm_custom_down_death_percentage);
        

        if (isdefined(atianconfig.zm_custom_disable_powerup)) {
            for (i = 0; i < atianconfig.zm_custom_disable_powerup.size; i++) {
                setGametypeSetting(hash("zmpowerup" + atianconfig.zm_custom_disable_powerup[i]), false);
            }
        }

        if (isdefined(atianconfig.zm_custom_disable_elixir)) {
            for (i = 0; i < atianconfig.zm_custom_disable_elixir.size; i++) {
                setGametypeSetting(hash("zmelixir" + atianconfig.zm_custom_disable_elixir[i]), false);
            }
        }
        
        if (isdefined(atianconfig.zm_custom_disable_weapon_category)) {
            for (i = 0; i < atianconfig.zm_custom_disable_weapon_category.size; i++) {
                switch (atianconfig.zm_custom_disable_weapon_category[i]) {
                    case "pistol": setGametypeSetting(#"zmweaponspistol", false); break;
                    case "shotgun": setGametypeSetting(#"hash_edfb07f798aaab5", false); break;
                    case "smg": setGametypeSetting(#"zmweaponssmg", false); break;
                    case "ar": setGametypeSetting(#"zmweaponsar", false); break;
                    case "tr": setGametypeSetting(#"zmweaponstr", false); break;
                    case "lmg": setGametypeSetting(#"zmweaponslmg", false); break;
                    case "sniper": setGametypeSetting(#"zmweaponssniper", false); break;
                    case "melee": setGametypeSetting(#"zmweaponsknife", false); break;
                    case "equipment": setGametypeSetting(#"hash_65a1298089d361f1", false); break;
                    case "hero": setGametypeSetting(#"hash_b066c34278e6394", false); break;
                }
            }
        }
        if (isdefined(atianconfig.zm_custom_disable_perk)) {
            for (i = 0; i < atianconfig.zm_custom_disable_perk.size; i++) {
                switch (atianconfig.zm_custom_disable_perk[i]) {
                    case "armorvest": setGametypeSetting(#"hash_7520ccdc8dcaee8d", false); break;
                    case "fastreload": setGametypeSetting(#"hash_8edd17a31990450", false); break;
                    case "quickrevive": setGametypeSetting(#"zmperksquickrevive", false); break;
                    case "widowswine": setGametypeSetting(#"hash_557e3edd7fe168c3", false); break;
                    case "staminup": setGametypeSetting(#"zmperksstaminup", false); break;
                    case "additionalprimaryweapon": setGametypeSetting(#"zmperksmulekick", false); break;
                    case "electriccherry": setGametypeSetting(#"hash_77c5cc2d9b6ca16c", false); break;
                    case "deadshot": setGametypeSetting(#"zmperksdeadshot", false); break;
                    case "cooldown": setGametypeSetting(#"zmperkscooldown", false); break;
                    case "dying_wish": setGametypeSetting(#"zmperksdyingwish", false); break;
                    case "phdflopper": setGametypeSetting(#"zmperksphdslider", false); break;
                    case "stronghold": setGametypeSetting(#"hash_5690c4dcc61973ec", false); break;
                    case "extraammo": setGametypeSetting(#"hash_1bdfb5736ad174a3", false); break;
                    case "awareness": setGametypeSetting(#"zmperksdeathperception", false); break;
                    case "shield": setGametypeSetting(#"hash_2dd9d538ca5bc2d6", false); break;
                    case "mystery": setGametypeSetting(#"hash_179ae09979e80714", false); break;
                    case "etherealrazor": setGametypeSetting(#"zmperksetherealrazor", false); break;
                    case "zombshell": setGametypeSetting(#"zmperkszombshell", false); break;
                    case "wolf_protector": setGametypeSetting(#"zmperkswolfprotector", false); break;
                    case "death_dash": setGametypeSetting(#"zmperksdeathdash", false); break;
                }
            }
        }

        if (isdefined(atianconfig.zm_custom_disable_entities)) {
            for (i = 0; i < atianconfig.zm_custom_disable_entities.size; i++) {
                switch (atianconfig.zm_custom_disable_entities[i]) {
                    case "miniboss": setGametypeSetting(#"zmminibossstate", false); break;
                    case "heavy": setGametypeSetting(#"zmheavystate", false); break;
                    case "dog": setGametypeSetting(#"hash_5f8aca8340761fce", false); break;
                    case "enhanced": setGametypeSetting(#"zmenhancedstate", false); break;
                }
            }
        }
        
    }
}
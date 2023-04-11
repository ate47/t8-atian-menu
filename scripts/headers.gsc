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
#include scripts\core_common\vehicle_shared;

#namespace clientids_shared;

//required
autoexec __init__sytem__()
{
	system::register("clientids_shared", &__init__, &__post__init__, undefined);
    handle_config();
}

//required
__init__()
{
    callback::on_start_gametype(&init);
    callback::on_connect(&onPlayerConnect);
    callback::on_spawned(&onPlayerSpawned);
}

__post__init__()
{
    // guess which mode is loaded by the function loaded
    if (isdefined(level.system_funcs[#"wz_player"])) {
        level.selected_gamemode = "wz";
    } else if (isdefined(level.system_funcs[#"zm"])) {
        level.selected_gamemode = "zm";
    } else if (isdefined(level.system_funcs[#"bb"])) {
        // it might be wz, but if without the "wz_player", it's probably the multiplayer
        level.selected_gamemode = "mp";
    } else {
        level.selected_gamemode = "unknown";
    }
    level.atianconfig.loaded_modules = array();
    if (isdefined(level.system_funcs[#"wz_vehicle"])) {
        array::add(level.atianconfig.loaded_modules, "wz_vehicle");
    }
	setdvar(#"scr_spawnvehicle", true);
}

handle_config() {
    level.atianconfig = spawnstruct();
    level.atianconfig AtianMenuConfig();
    atianconfig = level.atianconfig;

    if (isdefined(atianconfig.waverespawndelay) && atianconfig.waverespawndelay > 0) {
        setGametypeSetting(#"waverespawndelay", atianconfig.waverespawndelay);
    }
    if (isdefined(atianconfig.blackout_spawn_icarus)) {
        setGametypeSetting(#"hash_701bac755292fab2", atianconfig.blackout_spawn_icarus);
    }
    if (isdefined(atianconfig.blackout_quaknarok) && atianconfig.blackout_quaknarok) {
        setGametypeSetting(#"hash_3e2d2cf6b1cc6c68", true);
    }
    if (isdefined(atianconfig.blackout_blackjack)) {
        setGametypeSetting(#"hash_7c8ad12994670d63", atianconfig.blackout_blackjack);
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
                setGametypeSetting(#"hash_36c4caf5bc327807", true);
                setGametypeSetting(#"wzbrutus", true);
                break;
            case "brutus_boss":
                setGametypeSetting(#"hash_64b6849360a2bc86", true);
                setGametypeSetting(#"hash_2f1217d530d06c4c", true);
                break;
            case "avogadro":
                setGametypeSetting(#"hash_29a8b0865154e079", true);
                setGametypeSetting(#"wzavogadro", true);
                break;
            case "blightfather":
                // script error
                // setGametypeSetting(#"hash_7dd54269f48d6047", true);
                // setGametypeSetting(#"wzblightfather", true);
                break;
            case "zdog":
                // spawn brutus boss (not working)
                // setGametypeSetting(#"hash_530fdf750e69c0d6", true);
                // setGametypeSetting(#"hash_6c65796bd239e3c", true);
                break;
            default:
                break;
        }
    }
    
    if (isdefined(atianconfig.blackout_spawn_snowballs) && atianconfig.blackout_spawn_snowballs && !(isdefined(atianconfig.blackout_quaknarok) && atianconfig.blackout_quaknarok)) {
        setGametypeSetting(#"hash_437b759bd6885560", true);
    }
    if (isdefined(atianconfig.blackout_spawn_waterballons) && atianconfig.blackout_spawn_waterballons) {
        setGametypeSetting(#"hash_33d1ac5e99fb0584", true);
    }
}
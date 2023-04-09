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

#namespace clientids_shared;

//required
autoexec __init__sytem__()
{
    setDvar("developer", 2);
    setDvar("scr_mod_devblock ", 1);
    
	system::register("clientids_shared", &__init__, &__post__init__, undefined);
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
}
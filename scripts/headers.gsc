// #include scripts\core_common\struct;
#include scripts\core_common\callbacks_shared;
// #include scripts\core_common\clientfield_shared;
// #include scripts\core_common\math_shared;
#include scripts\core_common\system_shared;
// #include scripts\core_common\util_shared;
// #include scripts\core_common\hud_util_shared;
// #include scripts\core_common\hud_message_shared;
// #include scripts\core_common\hud_shared;
// #include scripts\core_common\array_shared;
// #include scripts\core_common\flag_shared;
// #include scripts\zm_common\zm_stats;
// #include scripts\zm_common\zm_weapons;
// #include scripts\zm_common\zm_camos;
// #include scripts\zm_common\zm_pack_a_punch_util;
// #include script_7bafaa95bb1b427e;
// #include script_47fb62300ac0bd60;
#include script_3f27a7b2232674db;

#namespace clientids_shared;

//required
autoexec __init__sytem__()
{
	system::register("clientids_shared", &__init__, undefined, undefined);
}

//required
__init__()
{
    callback::on_spawned(&onPlayerSpawned);
}
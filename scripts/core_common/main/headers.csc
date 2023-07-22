#include scripts\core_common\system_shared.csc;
#include scripts\core_common\array_shared.csc;
#include scripts\core_common\clientfield_shared.csc;
#include scripts\core_common\callbacks_shared.csc;
#include scripts\core_common\util_shared.csc;

#namespace atianmenu;

autoexec __init__system__() {
#ifndef ATIANMENU_DEVSIMPLE
	system::register("atianmenu", &__init__, undefined, undefined);
#endif
#ifdef DETOURS
    init_detours();
#endif
}

__init__() {
#ifdef _INJECT_SERVER
	clientfield::register("toplayer", "" + #"atianmenu_testfield", 99999, 1, "int", &atianmenu_testfield, 0, 0);
#endif
    callback::on_localplayer_spawned(&remove_oob_fx);
}

atianmenu_testfield(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    level.am_test = 2;
}

remove_oob_fx(localclientnum) {
    //if (!isdefined(level.var_20861007)) {
    //    level.var_20861007 = [];
    //}
    //level.var_20861007[localclientnum] = util::spawn_model(localclientnum, "tag_origin", (0,0,-10000));
}

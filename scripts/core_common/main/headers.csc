#include scripts\core_common\system_shared.csc;
#include scripts\core_common\array_shared.csc;
#include scripts\core_common\clientfield_shared.csc;
#include scripts\core_common\callbacks_shared.csc;
#include scripts\core_common\util_shared.csc;

#namespace atianmenu;

autoexec __init__system__() {
#ifdef ATIANMENU_DETOURS
    init_detours();
#endif
#ifndef ATIANMENU_DEVSIMPLE
	system::register("atianmenu", &__init__, undefined, undefined);
#endif
    handle_config();
}

__init__() {
#ifdef _INJECT_SERVER
	clientfield::register("toplayer", "" + #"atianmenu_testfield", 99999, 1, "int", &atianmenu_testfield, 0, 0);
#endif
}

atianmenu_testfield(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    level.am_test = 2;
}

handle_config() {
    if (isdefined(level.atianconfig)) {
        return; // already set
    }
    level.atianconfig = spawnstruct();
    level.atianconfig.devcfg = spawnstruct();
#ifdef ATIAN_MENU_DEV
    level.atianconfig AtianMenuDevConfig();
#endif

}
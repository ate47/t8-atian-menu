#include scripts\core_common\system_shared.csc;
#include scripts\core_common\array_shared.csc;
#include scripts\core_common\clientfield_shared.csc;

#namespace atianmenu;

autoexec __init__system__() {
	system::register("atianmenu", &__init__, undefined, undefined);
}

__init__() {
#ifdef _INJECT_SERVER
	clientfield::register("allplayers", "atianmenu_testfield", 1, 1, "int", &atianmenu_testfield, 0, 0);
#endif
    thread test();
}

atianmenu_testfield(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    level.am_test = 2;
}


test() {
    wait 15;
    iPrintLnBold("^1hello from csc");
}
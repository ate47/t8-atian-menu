#include scripts\core_common\system_shared.csc;
#include scripts\core_common\array_shared.csc;
#include scripts\core_common\clientfield_shared.csc;
#include scripts\core_common\callbacks_shared.csc;
#include scripts\core_common\util_shared.csc;

#namespace atianmenu;

autoexec __init__system__() {
    level.script = util::get_map_name();
#ifdef ATIANMENU_COMPILER_OPT
    compiler::nprintln("(Client) linking script with " + level.script);
#endif

    if (level.script == "core_frontend") {
        // frontend, I don't want to crash again
        return;
    }
#ifdef ATIANMENU_DETOURS
    init_detours();
#endif
#ifndef ATIANMENU_DEVSIMPLE
	system::register("atianmenu", &__init__, &__post__init__, undefined);
#endif
    handle_config();
}

__init__() {
#ifdef ATIANMENU_COMPILER_OPT
    compiler::nprintln("(Client) pre-init game with " + level.script);
#endif
#ifdef _INJECT_SERVER
#ifdef ATIANMENU_TEST_CLIENTFIELD
	clientfield::register("toplayer", "" + #"atianmenu_testfield", 99999, 1, "int", &atianmenu_testfield, 0, 0);
#endif
#endif
    thread test();
}

test() {
    wait 30;
    val = GetGametypeSetting("zmcraftingkeyline");
    iPrintLnBold("^1hello from csc" + (isdefined(val) ? val : "undefined"));
}

__post__init__() {
#ifdef ATIANMENU_COMPILER_OPT
    compiler::nprintln("(Client) post-init game with " + level.script);
#endif
    dump_load_system();
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
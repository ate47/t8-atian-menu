frontend_exec() {
    //thread frontend_exec_delay();
}

frontend_exec_delay() {
    // wait frontend init
    wait 15;
    foreach (player in getplayers()) {
        if (isdefined(player) && player ishost()) {
            player on_player_connect_frontend();
            break;
        }
    }
}

on_player_connect_frontend() {
    // handle previous values
#ifdef _SUPPORTS_BUILTINS
    compiler::nprintln("playerconnect " + self.name);
#endif
    wait 10;
#ifdef _SUPPORTS_BUILTINS
    compiler::nprintln("playerconnect next " + self.name);
#endif
    //self closeingamemenu();
    //self openmenu("ZMCustomizeClassMenu");
}

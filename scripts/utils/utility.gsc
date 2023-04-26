broadcast_message(str_message) {
    players = getplayers();
    foreach(player in players) {
        player iPrintLnBold(str_message);
    }
}
broadcase_message_wait(str_message, ttw) {
    if (!isdefined(ttw) || ttw <= 0) {
        broadcast_message(str_message);
        return;
    }

    for (i = 1; i <= ttw; i++) {
        broadcast_message(str_message + "^2 (" + i + "/" + ttw + "s)");
        wait 1;
    }
}
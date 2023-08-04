#ifdef _SUPPORTS_EVENTFUNC

event<player_connect> codecallback_player_co(eventstruct) {
    am_log("player connect " + nullable_to_str(self.name));
}

#endif
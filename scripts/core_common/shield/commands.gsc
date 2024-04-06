#ifdef SHIELD_GSC_DEPLOY
/#
atian_menu_think() {
    level endon(#"end_game", #"game_ended");

    setdvar(#"amc", "");
    ShieldRegisterDVarName("amc", "Atian menu command");

    for (;;) {
        wait 0.5;
        val = getdvarstring(#"amc");

        if (!isdefined(val) || val.size == 0) {
            continue;
        }

        params = strTok(val, " ");

        switch (hash(params[0])) {
        case #"toggle":
            if (params.size < 2) {
                ShieldLog("toggle (mod) : toggle AM mod");
                break;
            }
            foreach (p in getplayers()) {
                if (!p IsHost()) {
                    continue;
                }

                p toggle_mod(params[1]);
                break;
            }
            break;
        case #"ents":
            if (params.size < 2) {
                ShieldLog("ents (radius) : print entities in a radius");
                break;
            }
            dist = float(params[1]);

            foreach (p in getplayers()) {
                if (!p IsHost()) {
                    continue;
                }

                entities = getentitiesinradius(self.origin, dist);

                ShieldLog("Entities:");
                foreach (e in entities) {
                    if (!isdefined(e) || !isdefined(e.origin)) {
                        continue;
                    }

                    ShieldLog(get_object_type(e) + ": " + e.origin);
                }
                break;
            }
            break;
        case #"tp":
            if (params.size < 4) {
                ShieldLog("tp (x) (y) (z) : Teleport");
                break;
            }
            x = float(params[1]);
            y = float(params[2]);
            z = float(params[3]);


            foreach (p in getplayers()) {
                if (!p IsHost()) {
                    continue;
                }

                loc = (x, y, z);
                p setOrigin(loc);

                ShieldLog("teleported to " + loc);

                if (isdefined(self.originObj)) { // teleport if we are in fly more
                    self.originObj.future_tp = loc;
                }
                break;
            }
            break;
        default:
            ShieldLog("unknown command: " + params[0]);
            break;
        }


        setdvar(#"amc", "");
    }
}
#/
#endif
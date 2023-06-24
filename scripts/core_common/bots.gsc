
func_spawn_add_bot(item, look, all = false) {
    for (;;) {
        bot = AddTestClient();
        if (!isdefined(bot)) {
            if (!all) {
                self debugln("^1Can't add a new bot!");
            }
            return;
        }
        wait 0.1;


        if (isdefined(look) && look) {
            tag_origin = self GetTagOrigin("tag_weapon");
            look = AnglesToForward(self GetPlayerAngles());
            bullet_hit = bullettrace(tag_origin, tag_origin + vectorscale(look, 5000), 1, self)["position"];

            ground_pos = bullettrace(bullet_hit + vectorscale((0, 0, 1), 128), bullet_hit - vectorscale((0, 0, 1), 128), 0, undefined, 1);
            if (ground_pos[#"surfacetype"] == "water" || ground_pos[#"surfacetype"] == "watershallow")
            {
                ground_pos = bullettrace(bullet_hit + vectorscale((0, 0, 1), 2048), bullet_hit - vectorscale((0, 0, 1), 2048), 0, undefined, 1);
            }
            spawnpoint = ground_pos[#"position"];


            bot setOrigin(spawnpoint);
        }
        
        if (!all) {
            return;
        }
    }
}


add_n_bot_delay(n) {
    for (i = 0; i < n; i++) {
        AddTestClient();
    }
}

func_spawn_remove_bot(item, all = false) {
	players = getplayers();

    foreach (p in players) {
        if (!isbot(p)) {
            continue;
        }

        if (remove_bot(p) && !all) {
            return;
        }
    }
}



remove_bot(bot) {
	if (!bot istestclient()) {
		return false;
	}
	if (isdefined(level.onbotremove)) {
		bot [[ level.onbotremove ]]();
	}
	bot botdropclient();
    return true;
}

func_bot_search_remove_bot(item, bot, menu) {
    if (isdefined(bot) && isbot(bot) && bot istestclient()) {
        if (isdefined(level.onbotremove)) {
            bot [[ level.onbotremove ]]();
        }
        bot botdropclient();
    }
    // recompute the list after
    self func_bot_search(menu, #"remove");
}

func_bot_search(menu, action) {
    menu.sub_menus = array();

	players = getplayers();

    foreach (p in players) {
        if (!isbot(p)) {
            continue;
        }
        if (action == #"remove") {
            self add_menu_item(menu.id, get_object_type(p), &func_bot_search_remove_bot, p, menu);
        } else if (action == #"teleport") {
            self add_menu_item(menu.id, get_object_type(p), &func_teleport, p);
        } else {
            self add_menu_item(menu.id, get_object_type(p));
        }
    }
}
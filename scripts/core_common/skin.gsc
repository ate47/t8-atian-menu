func_set_skin_custom_clear(item) {
    self setcharacteroutfit(0);
    self function_9b48a8e5(0);
    self function_ab96a9b5("head", 0);
    self function_ab96a9b5("headgear", 0);
    self function_ab96a9b5("arms", 0);
    self function_ab96a9b5("torso", 0);
    self function_ab96a9b5("legs", 0);
    self function_ab96a9b5("palette", 0);
    self function_ab96a9b5("warpaint", 0);
    self function_ab96a9b5("decal", 0);
    return true;
}
func_set_skin(item, specialist_id, outfit = undefined, palette = undefined, warpaint = undefined, decal = undefined) {
    self SetSkin(specialist_id);
    
    if (isdefined(outfit)) {
        self func_set_skin_custom(item, outfit);
    }
    if (isdefined(palette)) {
        self func_set_skin_custom_palette(item, palette);
    }
    if (isdefined(warpaint)) {
        self func_set_skin_custom_warpaint(item, warpaint);
    }
    if (isdefined(decal)) {
        self func_set_skin_custom_decal(item, decal);
    }
    return true;
}

func_set_skin_custom(item, data) {
    self setcharacteroutfit(data);
    return true;
}
func_set_skin_custom_palette(item, data) {
    self function_ab96a9b5("palette", data);
    return true;
}
func_set_skin_custom_warpaint(item, data) {
    self function_ab96a9b5("warpaint", data);
    return true;
}
func_set_skin_custom_decal(item, data) {
    self function_ab96a9b5("decal", data);
    return true;
}

func_set_char(item, character_id) {
    self SetSkin(character_id);
    return true;
}

SetSkin(character_id) {
    self setspecialistindex(character_id);
    self player_role::update_fields();

    // clear fields
    self setcharacteroutfit(0);
    self function_9b48a8e5(0);
    self function_ab96a9b5("head", 0);
    self function_ab96a9b5("headgear", 0);
    self function_ab96a9b5("arms", 0);
    self function_ab96a9b5("torso", 0);
    self function_ab96a9b5("legs", 0);
    self function_ab96a9b5("palette", 0);
    self function_ab96a9b5("warpaint", 0);
    self function_ab96a9b5("decal", 0);
}

set_skin_config_val(config) {
    if (!isdefined(config)) {
        return;
    }
    skins = strtok(config, ";");
    mode_skin = get_characters_for_mode();
    if (isdefined(mode_skin)) {
        for (i = 0; i < skins.size; i++) {
            if (skins[i] == "random") {
                skin_rnd = get_skin_random();
                if (!isdefined(skin_rnd)) {
                    // error -> using random skin
                    continue;
                }
                skin_id = int(skin_rnd[0]);
                outfit = int(skin_rnd[1]);
                palette = int(skin_rnd[2]);

                self SetSkin(skin_id);
                self setcharacteroutfit(outfit);
                self function_ab96a9b5("palette", palette);
                break;
            } else {
                // 0NAME:1OUTFIT:2PALETTE:3WARPAINT:4DECAL
                modifiers = strtok(skins[i], ":");
                skin_id = array::find(mode_skin, modifiers[0]);
                if (isdefined(skin_id)) {
                    self SetSkin(skin_id);
                    if (modifiers.size > 1) { // 1OUTFIT
                        self setcharacteroutfit(int(modifiers[1]));
                        if (modifiers.size > 2) { // 2PALETTE
                            self function_ab96a9b5("palette", int(modifiers[2]));
                            if (modifiers.size > 3) { // 3WARPAINT
                                self function_ab96a9b5("warpaint", int(modifiers[3]));
                                if (modifiers.size > 4) { // 4DECAL
                                    self function_ab96a9b5("decal", int(modifiers[4]));
                                }
                            }
                        }
                    }
                    break;
                }
            }
        }
    }
}

get_skin_config_val(config) {
    if (!isdefined(config)) {
        return;
    }
    skins = strtok(config, ";");
    for (i = 0; i < skins.size; i++) {
        if (skins[i] == "random") {
            skin_rnd = get_skin_random();
            if (!isdefined(skin_rnd)) {
                // error -> using random skin
                continue;
            }
            return skin_rnd;
        } else {
            // 0NAME:1OUTFIT:2PALETTE:3WARPAINT:4DECAL
            modifiers = strtok(skins[i], ":");
            skin_id = array::find(get_characters_for_mode(), modifiers[0]);
            if (isdefined(skin_id)) {
                if (modifiers.size > 1) { // 1OUTFIT
                    outfit = int(modifiers[1]);
                    if (modifiers.size > 2) { // 2PALETTE
                        palette = int(modifiers[2]);
                    } else {
                        palette = 0;
                    }
                } else {
                    outfit = 0;
                }
                return (skin_id, outfit, palette);
            }
        }
    }
}
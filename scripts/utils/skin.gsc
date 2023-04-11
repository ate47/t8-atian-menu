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

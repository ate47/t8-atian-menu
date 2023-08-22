watchdamage() {
    name = get_object_type(self);
    for (;;) {
        waitresult = undefined;
        waitresult = self waittill(#"damage", #"death");
        if (waitresult._notify == #"death") {
            if (isdefined(level.atianconfig.watchdamage) && level.atianconfig.watchdamage) {
                broadcast_message("^2" + name + "^5/^1dead^5/^2" + nullable_to_str(waitresult.name, "noname"));
            }
            return;
        }

        position = waitresult.position;
        direction = waitresult.direction;

        if (isdefined(level.atianconfig.custom_damage_effect) && isdefined(position)) {
            if (isdefined(direction)) {
                playfx(level._effect[#"atianmenu_damage_effect"], position, direction);
            } else {
                playfx(level._effect[#"atianmenu_damage_effect"], position);
            }
        }
        
        if (isdefined(level.atianconfig.watchdamage) && level.atianconfig.watchdamage) {
            attacker = waitresult.attacker;
            mod = waitresult.mod;
            damage = waitresult.amount;
            weapon = waitresult.weapon;
            // 8 = bullet penetration?
            flags = waitresult.flags;
            part = waitresult.part_name;
            model = waitresult.model_name;
            tag = waitresult.tag_name;

            broadcast_message("^5d=^2" + name + "^5/^1" + damage + "^5/^2" + mod + "^5/^2" + get_object_type(attacker) + "^5/^2" + nullable_to_str(flags, "unk") + "^5/^2" + get_object_type(weapon));
            broadcast_message("^2" + nullable_to_str(position, "nopos") + "^5/^1" + nullable_to_str(direction, "nopos") + "^5/^1" + nullable_to_str(tag, "notag") + "^5/^1" + nullable_to_str(model, "nomodel") + "^5/^1" + nullable_to_str(part, "nopart"));
        }
    }
}

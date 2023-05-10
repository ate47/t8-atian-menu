register_info_pages() {
    add_info_page("Main", 1000, &info_page_main);
    add_info_page("Look tool", 500, &info_page_looktool);
    if (is_dev_mode()) {
        add_info_page("Dev", 500, &info_page_dev);
    }
}

info_page_dev() {
    index_end = 0;
    if (self isinvehicle()) {
        vehicle = self getvehicleoccupied();
        if (isdefined(vehicle)) {
            if (isdefined(vehicle.origin)) {
                self iprintln("^1veh origin: " + vehicle.origin);
                index_end++;
            }
            if (isdefined(vehicle.model)) {
                self iprintln("^1veh model: " + hash_lookup(vehicle.model));
                index_end++;
            }
            if (isdefined(vehicle.scriptvehicletype)) {
                self iprintln("^1veh script: " + hash_lookup(vehicle.scriptvehicletype));
                index_end++;
            }
        } else {
            self iprintln("^1no veh");
            index_end++;
        }
    }
    return index_end;
}

info_page_main() {
    index_end = 0;

    weapon = self GetCurrentWeapon();
    
    if (isdefined(weapon) && isdefined(weapon.name)) {
        str_weapon = weapon.name;
        self iprintln("^1weapon: " + hash_lookup(weapon.name));
        index_end++;
    }
    
    if (isdefined(self.model)) {
        self iprintln("^1model:   " + hash_lookup(self.model));
        index_end++;
    }
	sessionmode = currentsessionmode();
    self iprintln("^1mode: " + nullable_to_str(level.gametype, "nogametype") + "(" + sessionmode + ":" + get_gamemode() + "/" + nullable_to_str(level.script, "noscript") + ")");
    index_end++;

    if (isdefined(self.origin)) {
        self iprintln("^1origin: " + self.origin);
        index_end++;
    }
    self iprintln("^1angles: " + self GetPlayerAngles());
    index_end++;
    role = self getcharacterbodytype();
    // displayname = makelocalizedstring();
    if (isdefined(role)) {
        self iprintln("^1role:   " + hash_lookup(getcharacterdisplayname(role, sessionmode)) + "(" + role + ")");
        self iprintln("^1r asset:" + hash_lookup(getcharacterassetname(role, sessionmode)));
        
        index_end += 2;
    }

    return index_end;
}

info_page_looktool() {
    index_end = 0;

    // look model
    // entity.model
    tag_origin = self geteye();
    look = AnglesToForward(self GetPlayerAngles());
    tag_end = tag_origin + vectorscale(look, 10000);
    bullet_hit = bullettrace(tag_origin, tag_end, 1, self);

    position_hit = bullet_hit[#"position"];
    if (position_hit == tag_end) {
        self iprintln("^1look el: no tag end");
        index_end++;
    } else {
        self iprintln("^1look el: " + position_hit + " (press " + key_mgr_get_key_str(#"special_weapon_secondary") + " to tp)");
        if (self key_mgr_has_key_pressed(#"special_weapon_secondary", true)) {
            if (self is_mod_activated("fly") && isdefined(self.originObj)) {
                // consider fly mode
                self.originObj.origin = position_hit;
            } else {
                self setorigin(position_hit);
            }
        }
        index_end++;

        entity_hit = bullet_hit[#"entity"];
        hitloc_hit = bullet_hit[#"hitloc"];
        dynent_hit = bullet_hit[#"dynent"];

        if (isdefined(entity_hit)) {
            self iprintln("^1en: " + hash_lookup(nullable_to_str(entity_hit.model)) + " " + nullable_to_str(entity_hit.origin) + " ar:" + nullable_to_str(hash_lookup(entity_hit.archetype)));
            index_end++;
            if (isvehicle(entity_hit)) {
                self iprintln("^1veh: " + nullable_to_str(entity_hit.scriptvehicletype));
                index_end++;
            }
        }
        if (isdefined(dynent_hit)) {
            self iprintln("^1de:" + hash_lookup(nullable_to_str(dynent_hit.targetname)) + " " + nullable_to_str(dynent_hit.origin) + "" + nullable_to_str(dynent_hit.displayname));
            index_end++;
        }
        if (isdefined(hitloc_hit) && hitloc_hit != "none") {
            self iprintln("^1hl:" + hash_lookup(hitloc_hit));
            index_end++;
        }
    }
    return index_end;
}
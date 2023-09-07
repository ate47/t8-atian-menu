func_spawn_vehicle(item, vehicule_type) {

    load = isassetloaded("vehicle", vehicule_type);

    if (!isdefined(load) || !load) {
        self iPrintLnBold("^1Asset not loaded");
        return;
    }
    look = self get_look_position();

    veh = spawnvehicle(vehicule_type, look, (0, 0, 0));
    if (!isdefined(veh)) {
        self iprintlnbold("^1bad vehicle");
        return;
    }
    veh makeusable();
    if (isdefined(veh.isphysicsvehicle) && veh.isphysicsvehicle) {
        veh setbrake(1);
    }
    if (isdefined(veh.vehicleclass) && veh.vehicleclass == #"helicopter") {
        veh.origin = veh.origin + (0, 0, veh.height);
        // you spin me
    }
    if (isairborne(veh)) {
        veh setrotorspeed(1.0);
    }
}

func_enter_vehicle(item, slot) {
    trace = self get_look_trace();

    entity = trace[#"entity"];


    if (isdefined(entity) && isvehicle(entity)) {
        entity usevehicle(self, 0);
    } else {
        self iprintlnbold("^1No vehicle found");
    }
}

func_set_vehicle(item, data) {
    tag_origin = self geteye();
    look = AnglesToForward(self GetPlayerAngles());
    tag_end = tag_origin + vectorscale(look, 10000);
    bullet_hit = bullettrace(tag_origin, tag_end, 1, self);

    entity_hit = bullet_hit[#"entity"];

    if (isdefined(entity_hit) && isvehicle(entity_hit)) {
        entity_hit setvehicletype(data);
    } else {
        self iPrintLnBold("^1You need to aim a vehicle!");
    }
}
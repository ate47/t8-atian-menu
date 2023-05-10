func_spawn_vehicle(item, vehicule_type) {
    tag_origin = self GetTagOrigin("tag_weapon");
    look = AnglesToForward(self GetPlayerAngles());
    bullet_hit = bullettrace(tag_origin, tag_origin + vectorscale(look, 5000), 1, self)["position"];

    ground_pos = bullettrace(bullet_hit + vectorscale((0, 0, 1), 128), bullet_hit - vectorscale((0, 0, 1), 128), 0, undefined, 1);
    if (ground_pos[#"surfacetype"] == "water" || ground_pos[#"surfacetype"] == "watershallow")
    {
        ground_pos = bullettrace(bullet_hit + vectorscale((0, 0, 1), 2048), bullet_hit - vectorscale((0, 0, 1), 2048), 0, undefined, 1);
    }
    spawnpoint = ground_pos[#"position"] + vectorscale((0, 0, 1), 36);
        

    if(!function_3238d10d(spawnpoint)) {
        self iPrintLnBold("^1Bad spawn point: ^6" + vehicule_type);
        return;
    }
    self iPrintLnBold("^4Try spawn: ^6" + vehicule_type);
	vehicle = spawnvehicle(hash(vehicule_type), spawnpoint, (0, 0, 0));
    if (!isdefined(vehicle)) {
        self iPrintLnBold("^1Can't spawn vehicle: " + vehicule_type);
        return;
    }
    self iPrintLnBold("^4Vehicle spawn: ^6" + vehicule_type);

    // if (isairborne(vehicle)) {
    //     vehicle.origin = ground_pos + (0, 0, vehicle.height);
    // }

    // self iPrintLnBold("^1makeusable");
	// vehicle makeusable();

    // if(isdefined(vehicle.isphysicsvehicle) && vehicle.isphysicsvehicle) {
    //     self iPrintLnBold("^1setbrake");
    //     vehicle setbrake(1);
    // }
    // self iPrintLnBold("^2done");
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
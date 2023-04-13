func_spawn_vehicle(item, vehicule_type) {
    tag_origin = self GetTagOrigin("tag_weapon");
    look = AnglesToForward(self GetPlayerAngles());
    bullet_hit = bullettrace(tag_origin, tag_origin + vecscale(look, 5000), 1, self)["position"];

    ground_pos = bullettrace(bullet_hit + vectorscale((0, 0, 1), 128), bullet_hit - vectorscale((0, 0, 1), 128), 0, undefined, 1);
    if (ground_pos[#"surfacetype"] == "water" || ground_pos[#"surfacetype"] == "watershallow")
    {
        ground_pos = bullettrace(bullet_hit + vectorscale((0, 0, 1), 2048), bullet_hit - vectorscale((0, 0, 1), 2048), 0, undefined, 1);
    }
    spawnpoint = ground_pos[#"position"] + vectorscale((0, 0, 1), 36);
    vehicle = undefined;
    self iPrintLnBold("^3spawn point: " + spawnpoint);

    if(!function_3238d10d(spawnpoint)) {
        self iPrintLnBold("^1Bad spawn point: " + spawnpoint);
        return;
    }
    vehicle = spawnvehicle(vehicule_type, spawnpoint, 0);
    if (!isdefined(vehicle)) {
        self iPrintLnBold("^1Can't spawn vehicle: " + vehicule_type);
        return;
    }
    if(isairborne(vehicle)) {
        spawnoffset = (0, 0, vehicle.height);
        vehicle.origin = bullet_hit + spawnoffset;
    }
	vehicle makeusable();
    if(isdefined(vehicle.isphysicsvehicle) && vehicle.isphysicsvehicle) {
        vehicle setbrake(1);
    }
}

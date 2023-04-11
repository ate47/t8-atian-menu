func_spawn_vehicle(item, vehicule_type) {
    self SpawnVehicleHere(vehicule_type);
}

SpawnVehicleHere(vehicule_type, origin = undefined) {
    if (!isdefined(origin)) {
        origin = self GetOrigin();
    }
    veh = spawnvehicle(vehicule_type, origin + (0, 0, 60), 0, "player_spawned_vehicle");
    if (!isdefined(veh)) {
        self iPrintLnBold("^1Can't spawn vehicle: " + vehicule_type);
        return;
    }
	veh makeusable();
	veh setbrake(1);
}

if (instance_exists(obj_player) && isLoaded) {
	if (ammoReserve != obj_player.inv[obj_player.slot].general.ammoInRes) {
		ammoReserve = obj_player.inv[obj_player.slot].general.ammoInRes;
	}
}
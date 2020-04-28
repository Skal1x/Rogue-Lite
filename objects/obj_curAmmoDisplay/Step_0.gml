if (instance_exists(obj_player)) {
	if (ammoReserve != obj_player.inv[obj_player.slot, 4]) {
		ammoReserve = obj_player.inv[obj_player.slot, 4];
	}
}
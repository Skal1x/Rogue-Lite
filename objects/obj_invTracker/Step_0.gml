if (instance_exists(obj_player)) {
	slot = obj_player.slot;

	for (var i = 0; i <= 35; i++) {
		inv[i] = obj_player.inv[slot, i];
	}
}
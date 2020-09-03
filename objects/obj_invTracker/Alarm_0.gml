if (instance_exists(obj_player)) {
	slot = obj_player.slot;
	weaponStats = obj_player.inv[slot];
	isLoaded = true;
}
if (instance_exists(obj_player)) {
	image_speed = 0;
	image_index = 0;
	image_xscale = 1;
	image_yscale = 1;
	holdPressed = false;
	singleReloaded = true;
	spread = obj_player.inv[obj_player.slot, 5];
	slot = obj_player.slot;
	dir = 0;
	disX = 0;
	disY = 0;
}
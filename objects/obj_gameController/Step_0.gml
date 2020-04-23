if (!instance_exists(obj_player)) {
	if (keyboard_check_pressed(ord("N"))) {
		game_restart();
	}
}
/*
if (instance_exists(obj_player)) {
	camera_set_view_target(view_camera[0], obj_player);
	camera_set_view_border(view_camera[0],448,252);
	viewX = obj_player.x - 224;
	viewY = obj_player.y - 126;
}

if (shakeAmount > maxShake) {
	shakeAmount = maxShake;
}

if (shakeAmount > 0) {
	var ranX = random_range(-shakeAmount, shakeAmount);
	var ranY = random_range(-shakeAmount, shakeAmount);
	camera_set_view_border(view_camera[0],0,0);
	camera_set_view_pos(view_camera[0], viewX + ranX, viewY + ranY);
	// camera_set_view_angle(view_camera[0], 0 + ranY / 100);
	shakeAmount -= 0.4 + 0.03 * shakeAmount;
}

if (shakeAmount < 0) {
	shakeAmount = 0;
}
*/

obj_crosshair.x = mouse_x;
obj_crosshair.y = mouse_y;
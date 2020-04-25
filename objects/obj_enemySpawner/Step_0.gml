if (keyboard_check_pressed(ord("E"))) {
	switch (enemyType) {
		case 0:
			instance_create_depth(x,y, -y, obj_enemyBasic);
			image_index = 0;
			break;
	}
}
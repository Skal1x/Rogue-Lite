if (keyboard_check_pressed(ord("E"))) {
	consoleLogValue("Spawened Enemy of Type", enemyType, 240);
	switch (enemyType) {
		case "charger":
			instance_create_depth(x,y, -y, obj_enemyBasic);
			image_index = 0;
			break;
		case "gunman":
			instance_create_depth(x,y, -y, obj_enemyGunner);
			image_index = 1;
			break;
	}
}
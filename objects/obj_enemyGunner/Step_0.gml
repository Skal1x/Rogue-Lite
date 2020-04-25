//Ativate Alert if Idle
if (enemyState < 1) { if ((distance_to_object(obj_gunSoundQue) <= 600) || (distance_to_object(obj_player) <= 50)) enemyState = 1; }

//Flip Image according to Movement Direction
if (lastX > x) {
	image_xscale = -1;
} else if (lastX < x) {
	image_xscale = 1;
}

lastX = x;

//Handle Image Depth
depth = -y;

//Draw Running Animation while Chasing
if (enemyState == 2) {
	sprite_index = spr_debugEnemyBasicRun;
	image_speed = 0.25;
} else {
	sprite_index = spr_debugEnemyBasicIdle;
	image_speed = 0.04;
}

//Die
if (hp <= 0) {
	instance_destroy();
	for (var i = 0; i < 10; i++) {
		instance_create_depth(x + random_range(-8,8), y + random_range(-8,8), -y, obj_bloodPart);
	}
}

//Fire Slow Effect
if (enemyState != 3) {
	if (place_meeting(x,y,obj_fire)) {
		curRunSpeed = maxRunSpeed / 2;
	} else {
		curRunSpeed = maxRunSpeed;
	}
}

//Enemy States
switch (enemyState) {
	case 1: //Get Alerted To Player
		drawAlert = true;
		if (!startChase) {
			alarm[0] = 20;
			startChase = true;
		}
		break;
	case 2: // Chase Player
		drawAlert = false;
		if (instance_exists(obj_player)) {
			if (mp_grid_path(global.grid, path, x, y, obj_player.x, obj_player.y,1)) {
				path_start(path, curRunSpeed, path_action_stop, false);
			}
		}
		break;
	case 3: //Do the Pew
		curRunSpeed = 0;
}

//Check Distance and LoS to the Player
if (instance_exists(obj_player) && enemyState != 0 && enemyState != 1) {
	if (!collision_line(x, y, obj_player.x, obj_player.y, obj_wall, 1, true)) {
		enemyState = 3;
	} else {
		enemyState = 2;
	}
}
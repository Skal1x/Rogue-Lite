#region Alert State Activation
if (instance_exists(obj_player)) {
	if (enemyState < 1) { if ((distance_to_object(obj_gunSoundQue) <= hearingDistance) || (!collision_line(x, y, obj_player.x, obj_player.y, obj_wall, 1, true) && (distance_to_object(obj_player) <= sightDistance))) enemyState = 1; }

	#region Select Reaction according to State
	if (!didDamage) {
		switch (enemyState) {
			case 1:
				drawAlert = true;
				if (!startChase) {
					alarm[0] = 20;
					startChase = true;
				}
				break;
			case 2:
				drawAlert = false;
				if (instance_exists(obj_player)) {
					if (mp_grid_path(global.grid, path, x, y, obj_player.x, obj_player.y,1)) {
						path_start(path, curRunSpeed, path_action_stop, false);
					}
				} else {
					path_delete(path);
				}
				break;
		}
	}
	#endregion
}
#endregion

#region Sprite and Animation Handling
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
#endregion

#region Death
if (hp <= 0) {
	path_delete(path);
	for (var i = 0; i < 10; i++) {
		instance_create_depth(x + random_range(-8,8), y + random_range(-8,8), -y, obj_bloodPart);
	}
	instance_destroy();
}
#endregion

#region Fire Slow Effect
if (place_meeting(x,y,obj_fire)) {
	curRunSpeed = maxRunSpeed / 2;
} else {
	curRunSpeed = maxRunSpeed;
}
#endregion
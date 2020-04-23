//Check if Player exists
if (instance_exists(obj_player)) {

	//Angle Of Gun

	image_angle = point_direction(obj_player.x,obj_player.y,mouse_x,mouse_y);

	//Stay On Player
	if (instance_exists(obj_player)) {
		dir = point_direction(obj_player.x,obj_player.y,mouse_x,mouse_y) * (pi / 180);
		disX = cos(dir) * 6;
		disY = sin(dir) * -1 * 6;
	
		x = obj_player.x + disX;
		y = obj_player.y + disY;
	} else {
		instance_destroy();
	}
	//Stay in Front of Player

	depth = -y -10;

	//Rotate according to Mouse Position

	if (image_angle >= 90 && image_angle <= 270) {
		image_yscale = -1;
	} else {
		image_yscale = 1;
	}

	//Stop Repeating Empty Sound
	if (holdPressed) {
		if (mouse_check_button_released(mb_left)) {
			holdPressed = false;
		}
	}

	//Shooting

	switch (obj_player.fireMode) {
		case 0: // Full-Auto
		if (mouse_check_button(mb_left) && obj_player.gunState == 0) {
			if (obj_player.curMag > 0) {
				if (obj_player.fireReady) {
					//Shooot Booollet
					obj_player.curMag--;
					for (var i = 0; i < obj_player.inv[obj_player.slot, 10]; i++) {
						if (obj_player.inv[obj_player.slot, 14] == 2) var bulletsPerShot = 3; else var bulletsPerShot = 1;
						for (var j = 0; j < bulletsPerShot; j++) {
							var bullet = instance_create_depth(x,y, -y-5, obj_bullet);
							bullet.spread = spread;
							bullet.image_angle = point_direction(obj_player.x,obj_player.y,mouse_x,mouse_y);
							switch (obj_player.inv[obj_player.slot, 14]) {
								case 0: obj_gameController.shakeAmount += 0.1; break;
								case 1: obj_gameController.shakeAmount += 0.2; break;
								case 2: obj_gameController.shakeAmount += 0.05; break;
								case 3: obj_gameController.shakeAmount += 0.7; break;
								case 4: obj_gameController.shakeAmount += 0.5; break;
							}
						}
					}
					with (instance_create_depth(x, y, -y-2, obj_bulletShell)) {
						switch (obj_player.inv[obj_player.slot, 14]) {
							case 0: sprite_index = spr_ammoSmallShell; break;
							case 1: sprite_index = spr_ammoBigShell; break;
							case 2: sprite_index = spr_ammoShotgunShell; break;
							case 3: sprite_index = spr_ammoExplosiveShell; break;
							case 4: sprite_index = spr_ammoIncendiaryShell; break;
						}
						image_xscale = 0.4;
						image_yscale = 0.4;
						if (other.image_yscale == -1) {
							image_angle = other.image_angle + random_range(-15,15) - 90;
							motion_add(other.image_angle - 90 + random_range(-15,15), 0.5 + random_range(0,1));
						} else {
							image_angle = other.image_angle + random_range(-15,15) - 90;
							motion_add(other.image_angle + 90 + random_range(-15,15), 0.5 + random_range(0,1));
						}
					}
					audio_play_sound(snd_gunShotDIY,1,0);
					image_index = 1;
					alarm[0] = 4;
					obj_player.fireReady = false;
					obj_player.curFireCooldown = obj_player.fireRate;
					instance_create_depth(x,y,-y,obj_gunSoundQue);
				}
			} else {
				if (!holdPressed)
				if (obj_player.gunType != 0) {
					audio_play_sound(snd_gunEmpty,1,0);
					holdPressed = true;
					obj_ammoDisplay.emptyFire = true;
				}
			}
		}
			break;
		case 1: // Burst
		if (obj_player.fireReady) {
			if (obj_player.curMag > 0) {
				if (obj_player.curBurst > 0) {
					//Shooot Booollet
					for (var i = 0; i < obj_player.inv[obj_player.slot, 10]; i++) {
						if (obj_player.inv[obj_player.slot, 14] == 2) var bulletsPerShot = 3; else var bulletsPerShot = 1;
						for (var j = 0; j < bulletsPerShot; j++) {
							var bullet = instance_create_depth(x,y, -y-5, obj_bullet);
							bullet.spread = spread;
							bullet.image_angle = point_direction(obj_player.x,obj_player.y,mouse_x,mouse_y);
							switch (obj_player.inv[obj_player.slot, 14]) {
								case 0: obj_gameController.shakeAmount += 0.1; break;
								case 1: obj_gameController.shakeAmount += 0.2; break;
								case 2: obj_gameController.shakeAmount += 0.05; break;
								case 3: obj_gameController.shakeAmount += 0.7; break;
								case 4: obj_gameController.shakeAmount += 0.5; break;
							}
						}
					}
					with (instance_create_depth(x, y, -y-2, obj_bulletShell)) {
						switch (obj_player.inv[obj_player.slot, 14]) {
							case 0: sprite_index = spr_ammoSmallShell; break;
							case 1: sprite_index = spr_ammoBigShell; break;
							case 2: sprite_index = spr_ammoShotgunShell; break;
							case 3: sprite_index = spr_ammoExplosiveShell; break;
							case 4: sprite_index = spr_ammoIncendiaryShell; break;
						}
						image_xscale = 0.4;
						image_yscale = 0.4;
						if (other.image_yscale == -1) {
							image_angle = other.image_angle + random_range(-15,15) - 90;
							motion_add(other.image_angle - 90 + random_range(-15,15), 0.5 + random_range(0,1));
						} else {
							image_angle = other.image_angle + random_range(-15,15) - 90;
							motion_add(other.image_angle + 90 + random_range(-15,15), 0.5 + random_range(0,1));
						}
					}
					audio_play_sound(snd_gunShotDIY,1,0);
					image_index = 1;
					alarm[0] = 4;
					obj_player.curBurst--;
					obj_player.curMag--;
					obj_player.fireReady = false;
					instance_create_depth(x,y,-y,obj_gunSoundQue);
				} else {
					if (mouse_check_button_pressed(mb_left)) {
						//Start Burst AND Shooot Booollet
						obj_player.curBurst = obj_player.burstAmount;
						if (obj_player.inv[obj_player.slot, 14] == 2) var bulletsPerShot = 3; else var bulletsPerShot = 1;
						for (var i = 0; i < obj_player.inv[obj_player.slot, 10]; i++) {
							if (obj_player.inv[obj_player.slot, 14] == 2) var bulletsPerShot = 3; else var bulletsPerShot = 1;
							for (var j = 0; j < bulletsPerShot; j++) {
								var bullet = instance_create_depth(x,y, -y-5, obj_bullet);
								bullet.spread = spread;
								bullet.image_angle = point_direction(obj_player.x,obj_player.y,mouse_x,mouse_y);
								switch (obj_player.inv[obj_player.slot, 14]) {
									case 0: obj_gameController.shakeAmount += 0.1; break;
									case 1: obj_gameController.shakeAmount += 0.2; break;
									case 2: obj_gameController.shakeAmount += 0.05; break;
									case 3: obj_gameController.shakeAmount += 0.7; break;
									case 4: obj_gameController.shakeAmount += 0.5; break;
								}
							}
						}
						with (instance_create_depth(x, y, -y-2, obj_bulletShell)) {
							switch (obj_player.inv[obj_player.slot, 14]) {
								case 0: sprite_index = spr_ammoSmallShell; break;
								case 1: sprite_index = spr_ammoBigShell; break;
								case 2: sprite_index = spr_ammoShotgunShell; break;
								case 3: sprite_index = spr_ammoExplosiveShell; break;
								case 4: sprite_index = spr_ammoIncendiaryShell; break;
							}
							image_xscale = 0.4;
							image_yscale = 0.4;
							if (other.image_yscale == -1) {
								image_angle = other.image_angle + random_range(-15,15) - 90;
								motion_add(other.image_angle - 90 + random_range(-15,15), 0.5 + random_range(0,1));
							} else {
								image_angle = other.image_angle + random_range(-15,15) - 90;
								motion_add(other.image_angle + 90 + random_range(-15,15), 0.5 + random_range(0,1));
							}
						}
						audio_play_sound(snd_gunShotDIY,1,0);
						image_index = 1;
						alarm[0] = 4;
						obj_player.curBurst--;
						obj_player.curMag--;
						obj_player.fireReady = false;
						instance_create_depth(x,y,-y,obj_gunSoundQue);
					}
				}
			} else {
				if (mouse_check_button_pressed(mb_left)) {
					audio_play_sound(snd_gunEmpty,1,0);
					obj_ammoDisplay.emptyFire = true;
				}
			}
		}
			break;
		case 2: // Semi-Auto
		if (mouse_check_button_pressed(mb_left) && obj_player.gunState == 0) {
			if (obj_player.curMag > 0) {
				if (obj_player.fireReady) {
					//Shooot Booollet
					obj_player.curMag--;
					if (obj_player.inv[obj_player.slot, 14] == 2) var bulletsPerShot = 3; else var bulletsPerShot = 1;
					for (var i = 0; i < obj_player.inv[obj_player.slot, 10]; i++) {
						if (obj_player.inv[obj_player.slot, 14] == 2) var bulletsPerShot = 3; else var bulletsPerShot = 1;
						for (var j = 0; j < bulletsPerShot; j++) {
							var bullet = instance_create_depth(x,y, -y-5, obj_bullet);
							bullet.spread = spread;
							bullet.image_angle = point_direction(obj_player.x,obj_player.y,mouse_x,mouse_y);
							switch (obj_player.inv[obj_player.slot, 14]) {
								case 0: obj_gameController.shakeAmount += 0.1; break;
								case 1: obj_gameController.shakeAmount += 0.2; break;
								case 2: obj_gameController.shakeAmount += 0.05; break;
								case 3: obj_gameController.shakeAmount += 0.7; break;
								case 4: obj_gameController.shakeAmount += 0.5; break;
							}
						}
					}
					with (instance_create_depth(x, y, -y-2, obj_bulletShell)) {
						switch (obj_player.inv[obj_player.slot, 14]) {
							case 0: sprite_index = spr_ammoSmallShell; break;
							case 1: sprite_index = spr_ammoBigShell; break;
							case 2: sprite_index = spr_ammoShotgunShell; break;
							case 3: sprite_index = spr_ammoExplosiveShell; break;
							case 4: sprite_index = spr_ammoIncendiaryShell; break;
						}
						image_xscale = 0.4;
						image_yscale = 0.4;
						if (other.image_yscale == -1) {
							image_angle = other.image_angle + random_range(-15,15) - 90;
							motion_add(other.image_angle - 90 + random_range(-15,15), 0.5 + random_range(0,1));
						} else {
							image_angle = other.image_angle + random_range(-15,15) - 90;
							motion_add(other.image_angle + 90 + random_range(-15,15), 0.5 + random_range(0,1));
						}
					}
					audio_play_sound(snd_gunShotDIY,1,0);
					image_index = 1;
					alarm[0] = 4;
					obj_player.fireReady = false;
					obj_player.curFireCooldown = obj_player.fireRate;
					instance_create_depth(x,y,-y,obj_gunSoundQue);
				}
			} else {
				audio_play_sound(snd_gunEmpty,1,0);
				obj_ammoDisplay.emptyFire = true;
			}
		}
		break;
		case 3: // Single Shot Reload
		if (obj_player.fireReady) {
			if (singleReloaded) {
				if (obj_player.curMag > 0) {
					if (mouse_check_button_pressed(mb_left)) {
						obj_player.curMag--;
						if (obj_player.inv[obj_player.slot, 14] == 2) var bulletsPerShot = 3; else var bulletsPerShot = 1;
						for (var i = 0; i < obj_player.inv[obj_player.slot, 10]; i++) {
							if (obj_player.inv[obj_player.slot, 14] == 2) var bulletsPerShot = 3; else var bulletsPerShot = 1;
							for (var j = 0; j < bulletsPerShot; j++) {
								var bullet = instance_create_depth(x,y, -y-5, obj_bullet);
								bullet.spread = spread;
								bullet.image_angle = point_direction(obj_player.x,obj_player.y,mouse_x,mouse_y);
								switch (obj_player.inv[obj_player.slot, 14]) {
									case 0: obj_gameController.shakeAmount += 0.1; break;
									case 1: obj_gameController.shakeAmount += 0.2; break;
									case 2: obj_gameController.shakeAmount += 0.05; break;
									case 3: obj_gameController.shakeAmount += 0.7; break;
									case 4: obj_gameController.shakeAmount += 0.5; break;
								}
							}
						}
						with (instance_create_depth(x, y, -y-2, obj_bulletShell)) {
							switch (obj_player.inv[obj_player.slot, 14]) {
								case 0: sprite_index = spr_ammoSmallShell; break;
								case 1: sprite_index = spr_ammoBigShell; break;
								case 2: sprite_index = spr_ammoShotgunShell; break;
								case 3: sprite_index = spr_ammoExplosiveShell; break;
								case 4: sprite_index = spr_ammoIncendiaryShell; break;
							}
							image_xscale = 0.4;
							image_yscale = 0.4;
							if (other.image_yscale == -1) {
								image_angle = other.image_angle + random_range(-15,15) - 90;
								motion_add(other.image_angle - 90 + random_range(-15,15), 0.5 + random_range(0,1));
							} else {
								image_angle = other.image_angle + random_range(-15,15) - 90;
								motion_add(other.image_angle + 90 + random_range(-15,15), 0.5 + random_range(0,1));
							}
						}
						audio_play_sound(snd_gunShotDIY,1,0);
						image_index = 1;
						alarm[0] = 4;
						obj_player.fireReady = false;
						obj_player.curFireCooldown = obj_player.fireRate;
						instance_create_depth(x,y,-y,obj_gunSoundQue);
						singleReloaded = false;
					}
				} else {
					if (mouse_check_button_pressed(mb_left)) {
						audio_play_sound(snd_gunEmpty,1,0);
						obj_ammoDisplay.emptyFire = true;
					}
				}
			} else {
				if (mouse_check_button_pressed(mb_left)) {
					audio_play_sound(snd_gunEmpty,1,0);
					obj_ammoDisplay.emptyFire = true;
				}
			}
		}
			break;
	}

	if (obj_player.singleReloading) {
		image_index = 2;
	}

	slot = obj_player.slot;

	switch (obj_player.inv[slot, 1]) {
		case 0:
			sprite_index = spr_gunNoGun;
			break;
		case 1:
			switch (obj_player.inv[slot, 33]) {
				case 1: //Standard
					sprite_index = spr_gunPistolTierE;
					break;
				case 2: //Remarkable
					sprite_index = spr_gunPistolTierD;
					break;
				case 3: //Abnormal
					sprite_index = spr_gunPistolTierC;
					break;
				case 4: //Experimental
					sprite_index = spr_gunPistolTierB;
					break;
				case 5://[REDACTED]
					sprite_index = spr_gunPistolTierA;
					break;
			}
			break;
		case 2:
			switch (obj_player.inv[slot, 33]) {
				case 1: //Standard
					sprite_index = spr_gunMPTierE;
					break;
				case 2: //Remarkable
					sprite_index = spr_gunMPTierD;
					break;
				case 3: //Abnormal
					sprite_index = spr_gunMPTierC;
					break;
				case 4: //Experimental
					sprite_index = spr_gunMPTierB;
					break;
				case 5://[REDACTED]
					sprite_index = spr_gunMPTierA;
					break;
			}
			break;
		case 6:
			switch (obj_player.inv[slot, 33]) {
				case 1: //Standard
					sprite_index = spr_gunShotgunTierE;
					break;
				case 2: //Remarkable
					sprite_index = spr_gunMPTierD;
					break;
				case 3: //Abnormal
					sprite_index = spr_gunMPTierC;
					break;
				case 4: //Experimental
					sprite_index = spr_gunMPTierB;
					break;
				case 5://[REDACTED]
					sprite_index = spr_gunMPTierA;
					break;
			}
			break;
	}
} else {
	instance_destroy();
}
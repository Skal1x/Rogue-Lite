if (instance_exists(obj_player)) {

	#region Graphics Controller
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
	
	//Change Image when Cycling (Bolt/Pump-Action)
	if (obj_player.inv[obj_player.slot, 28]) {
		image_index = 2;
	}
	#endregion
	
	#region Full-Auto Empty Fire Sound Cancel
	if (holdPressed) {
		if (mouse_check_button_released(mb_left)) {
			holdPressed = false;
		}
	}
	#endregion

	#region Shooting
	switch (obj_player.inv[obj_player.slot, 7]) {
		
		#region Full-Auto
		case 0: // Full-Auto
		if (mouse_check_button(mb_left) && obj_player.inv[obj_player.slot, 18] == 0) {
			if (obj_player.inv[obj_player.slot, 3] > 0) {
				if (obj_player.inv[obj_player.slot, 16]) {
					#region Shoot Bullet
					obj_player.inv[obj_player.slot, 3]--;
					for (var i = 0; i < obj_player.inv[obj_player.slot, 10]; i++) {
						if (obj_player.inv[obj_player.slot, 14] == 2) var bulletsPerShot = 3; else var bulletsPerShot = 1;
						for (var j = 0; j < bulletsPerShot; j++) {
							var bullet = instance_create_depth(x,y, -y-5, obj_bullet);
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
					obj_player.curFireInacc += obj_player.inv[obj_player.slot, 36];
					audio_play_sound(snd_gunShotGeneric,1,0);
					image_index = 1;
					alarm[0] = 4;
					obj_player.inv[obj_player.slot, 16] = false;
					obj_player.inv[obj_player.slot, 17] = obj_player.inv[obj_player.slot, 6];
					instance_create_depth(x,y,-y,obj_gunSoundQue);
					#endregion
				}
			} else {
				#region Empty Fire
				if (!holdPressed)
				if (obj_player.inv[obj_player.slot, 1] != 0) {
					audio_play_sound(snd_gunEmpty,1,0);
					holdPressed = true;
					obj_ammoDisplay.emptyFire = true;
				}
				#endregion
			}
		}
		break;
		#endregion
		
		#region Burst-Fire
		case 1: // Burst
		if (obj_player.inv[obj_player.slot, 16]) {
			if (obj_player.inv[obj_player.slot, 3] > 0) {
				if (obj_player.inv[obj_player.slot, 9] > 0) {
					#region Shoot Bullet
					for (var i = 0; i < obj_player.inv[obj_player.slot, 10]; i++) {
						if (obj_player.inv[obj_player.slot, 14] == 2) var bulletsPerShot = 3; else var bulletsPerShot = 1;
						for (var j = 0; j < bulletsPerShot; j++) {
							var bullet = instance_create_depth(x,y, -y-5, obj_bullet);
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
					obj_player.curFireInacc += obj_player.inv[obj_player.slot, 36];
					audio_play_sound(snd_gunShotGeneric,1,0);
					image_index = 1;
					alarm[0] = 4;
					obj_player.inv[obj_player.slot, 9]--;
					obj_player.inv[obj_player.slot, 3]--;
					obj_player.inv[obj_player.slot, 16] = false;
					instance_create_depth(x,y,-y,obj_gunSoundQue);
					#endregion
				} else {
					#region Initiate Burst and Shoot Bullet
					if (mouse_check_button_pressed(mb_left)) {
						obj_player.inv[obj_player.slot, 9] = obj_player.inv[obj_player.slot, 8];
						if (obj_player.inv[obj_player.slot, 14] == 2) var bulletsPerShot = 3; else var bulletsPerShot = 1;
						for (var i = 0; i < obj_player.inv[obj_player.slot, 10]; i++) {
							if (obj_player.inv[obj_player.slot, 14] == 2) var bulletsPerShot = 3; else var bulletsPerShot = 1;
							for (var j = 0; j < bulletsPerShot; j++) {
								var bullet = instance_create_depth(x,y, -y-5, obj_bullet);
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
						obj_player.curFireInacc += obj_player.inv[obj_player.slot, 36];
						audio_play_sound(snd_gunShotGeneric,1,0);
						image_index = 1;
						alarm[0] = 4;
						obj_player.inv[obj_player.slot, 9]--;
						obj_player.inv[obj_player.slot, 3]--;
						obj_player.inv[obj_player.slot, 16] = false;
						instance_create_depth(x,y,-y,obj_gunSoundQue);
					}
					#endregion
				}
			} else {
				#region Empty Fire
				if (mouse_check_button_pressed(mb_left)) {
					audio_play_sound(snd_gunEmpty,1,0);
					obj_ammoDisplay.emptyFire = true;
				}
				#endregion
			}
		}
		break;
		#endregion
		
		#region Semi-Auto
		case 2: // Semi-Auto
		if (mouse_check_button_pressed(mb_left) && obj_player.inv[obj_player.slot, 18] == 0) {
			if (obj_player.inv[obj_player.slot, 3] > 0) {
				if (obj_player.inv[obj_player.slot, 16]) {
					#region Shoot Bullet
					obj_player.inv[obj_player.slot, 3]--;
					if (obj_player.inv[obj_player.slot, 14] == 2) var bulletsPerShot = 3; else var bulletsPerShot = 1;
					for (var i = 0; i < obj_player.inv[obj_player.slot, 10]; i++) {
						if (obj_player.inv[obj_player.slot, 14] == 2) var bulletsPerShot = 3; else var bulletsPerShot = 1;
						for (var j = 0; j < bulletsPerShot; j++) {
							var bullet = instance_create_depth(x,y, -y-5, obj_bullet);
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
					obj_player.curFireInacc += obj_player.inv[obj_player.slot, 36];
					audio_play_sound(snd_gunShotGeneric,1,0);
					image_index = 1;
					alarm[0] = 4;
					obj_player.inv[obj_player.slot, 16] = false;
					obj_player.inv[obj_player.slot, 17] = obj_player.inv[obj_player.slot, 6];
					instance_create_depth(x,y,-y,obj_gunSoundQue);
					#endregion
				}
			} else {
				#region Empty Fire
				audio_play_sound(snd_gunEmpty,1,0);
				obj_ammoDisplay.emptyFire = true;
				#endregion
			}
		}
		break;
		#endregion
		
		#region Single Fire Reload
		case 3: // Single Shot Reload
		if (obj_player.inv[obj_player.slot, 16]) {
			if (singleReloaded) {
				if (obj_player.inv[obj_player.slot, 3] > 0) {
					if (mouse_check_button_pressed(mb_left)) {
						#region Shoot Bullet
						obj_player.inv[obj_player.slot, 3]--;
						if (obj_player.inv[obj_player.slot, 14] == 2) var bulletsPerShot = 3; else var bulletsPerShot = 1;
						for (var i = 0; i < obj_player.inv[obj_player.slot, 10]; i++) {
							if (obj_player.inv[obj_player.slot, 14] == 2) var bulletsPerShot = 3; else var bulletsPerShot = 1;
							for (var j = 0; j < bulletsPerShot; j++) {
								var bullet = instance_create_depth(x,y, -y-5, obj_bullet);
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
						obj_player.curFireInacc += obj_player.inv[obj_player.slot, 36];
						audio_play_sound(snd_gunShotGeneric,1,0);
						image_index = 1;
						alarm[0] = 4;
						obj_player.inv[obj_player.slot, 16] = false;
						obj_player.inv[obj_player.slot, 17] = obj_player.inv[obj_player.slot, 6];
						instance_create_depth(x,y,-y,obj_gunSoundQue);
						singleReloaded = false;
						#endregion
					}
				} else {
					#region Empty Fire Empty Mag
					if (mouse_check_button_pressed(mb_left)) {
						audio_play_sound(snd_gunEmpty,1,0);
						obj_ammoDisplay.emptyFire = true;
					}
					#endregion
				}
			} else {
				#region Empty Fire Empty Chamber
				if (mouse_check_button_pressed(mb_left)) {
					audio_play_sound(snd_gunEmpty,1,0);
					obj_ammoDisplay.emptyFire = true;
				}
				#endregion
			}
		}
		break;
		#endregion
	}
	#endregion

	#region Sprite Updater
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
	#endregion
	
} else {
	instance_destroy();
}
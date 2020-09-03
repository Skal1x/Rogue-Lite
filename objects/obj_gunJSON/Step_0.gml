if (instance_exists(obj_playerJSON)) {

	#region Graphics Controller
	image_angle = point_direction(obj_playerJSON.x,obj_playerJSON.y,mouse_x,mouse_y);

	//Stay On Player
	if (instance_exists(obj_playerJSON)) {
		dir = point_direction(obj_playerJSON.x,obj_playerJSON.y,mouse_x,mouse_y) * (pi / 180);
		disX = cos(dir) * 6;
		disY = sin(dir) * -1 * 6;
	
		x = obj_playerJSON.x + disX;
		y = obj_playerJSON.y + disY;
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
	if (obj_playerJSON.inv[obj_playerJSON.slot].reload.chamber.inProcess) {
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
	switch (obj_playerJSON.inv[obj_playerJSON.slot].stats.fireMode) {
		
		#region Full-Auto
		case "auto": // Full-Auto
		if (mouse_check_button(mb_left) && obj_playerJSON.inv[obj_playerJSON.slot, 18] == 0) {
			if (obj_playerJSON.inv[obj_playerJSON.slot].general.ammoInMag > 0) {
				if (obj_playerJSON.inv[obj_playerJSON.slot].status.fireReady) {
					#region Shoot Bullet
					obj_playerJSON.inv[obj_playerJSON.slot].general.ammoInMag -= 1;
					for (var i = 0; i < obj_playerJSON.inv[obj_playerJSON.slot].stats.pelletsPerShot; i++) {
						if (obj_playerJSON.inv[obj_playerJSON.slot].stats.bullet.bType == 2) var bulletsPerShot = 3; else var bulletsPerShot = 1;
						for (var j = 0; j < bulletsPerShot; j++) {
							var bullet = instance_create_depth(x,y, -y-5, obj_bullet);
							bullet.image_angle = point_direction(obj_playerJSON.x,obj_playerJSON.y,mouse_x,mouse_y);
							switch (obj_playerJSON.inv[obj_playerJSON.slot].stats.bullet.bType) {
								case 0: obj_gameController.shakeAmount += 0.1; break;
								case 1: obj_gameController.shakeAmount += 0.2; break;
								case 2: obj_gameController.shakeAmount += 0.05; break;
								case 3: obj_gameController.shakeAmount += 0.7; break;
								case 4: obj_gameController.shakeAmount += 0.5; break;
							}
						}
					}
					with (instance_create_depth(x, y, -y-2, obj_bulletShell)) {
						switch (obj_playerJSON.inv[obj_playerJSON.slot].stats.bullet.bType) {
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
					obj_playerJSON.curFireInacc += obj_playerJSON.inv[obj_playerJSON.slot].stats.fireInaccuracy;
					audio_play_sound(snd_gunShotGeneric,1,0);
					image_index = 1;
					alarm[0] = 4;
					obj_playerJSON.inv[obj_playerJSON.slot].status.fireReady = false;
					obj_playerJSON.inv[obj_playerJSON.slot].status.fireReadyCD = obj_playerJSON.inv[obj_playerJSON.slot].stats.fireRate;
					instance_create_depth(x,y,-y,obj_gunSoundQue);
					#endregion
				}
			} else {
				#region Empty Fire
				if (!holdPressed)
				if (obj_playerJSON.inv[obj_playerJSON.slot].general.gType != 0) {
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
		case "burst": // Burst
		if (obj_playerJSON.inv[obj_playerJSON.slot].status.fireReady) {
			if (obj_playerJSON.inv[obj_playerJSON.slot].general.ammoInMag > 0) {
				if (obj_playerJSON.inv[obj_playerJSON.slot].stats.burst.remaining > 0) {
					#region Shoot Bullet
					for (var i = 0; i < obj_playerJSON.inv[obj_playerJSON.slot].stats.pelletsPerShot; i++) {
						if (obj_playerJSON.inv[obj_playerJSON.slot].stats.bullet.bType == 2) var bulletsPerShot = 3; else var bulletsPerShot = 1;
						for (var j = 0; j < bulletsPerShot; j++) {
							var bullet = instance_create_depth(x,y, -y-5, obj_bullet);
							bullet.image_angle = point_direction(obj_playerJSON.x,obj_playerJSON.y,mouse_x,mouse_y);
							switch (obj_playerJSON.inv[obj_playerJSON.slot].stats.bullet.bType) {
								case 0: obj_gameController.shakeAmount += 0.1; break;
								case 1: obj_gameController.shakeAmount += 0.2; break;
								case 2: obj_gameController.shakeAmount += 0.05; break;
								case 3: obj_gameController.shakeAmount += 0.7; break;
								case 4: obj_gameController.shakeAmount += 0.5; break;
							}
						}
					}
					with (instance_create_depth(x, y, -y-2, obj_bulletShell)) {
						switch (obj_playerJSON.inv[obj_playerJSON.slot].stats.bullet.bType) {
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
					obj_playerJSON.curFireInacc += obj_playerJSON.inv[obj_playerJSON.slot].stats.fireInaccuracy;
					audio_play_sound(snd_gunShotGeneric,1,0);
					image_index = 1;
					alarm[0] = 4;
					obj_playerJSON.inv[obj_playerJSON.slot].stats.burst.remaining -= 1;
					obj_playerJSON.inv[obj_playerJSON.slot].general.ammoInMag -= 1;
					obj_playerJSON.inv[obj_playerJSON.slot].status.fireReady = false;
					instance_create_depth(x,y,-y,obj_gunSoundQue);
					#endregion
				} else {
					#region Initiate Burst and Shoot Bullet
					if (mouse_check_button_pressed(mb_left)) {
						obj_playerJSON.inv[obj_playerJSON.slot, 9] = obj_playerJSON.inv[obj_playerJSON.slot, 8];
						if (obj_playerJSON.inv[obj_playerJSON.slot, 14] == 2) var bulletsPerShot = 3; else var bulletsPerShot = 1;
						for (var i = 0; i < obj_playerJSON.inv[obj_playerJSON.slot, 10]; i++) {
							if (obj_playerJSON.inv[obj_playerJSON.slot, 14] == 2) var bulletsPerShot = 3; else var bulletsPerShot = 1;
							for (var j = 0; j < bulletsPerShot; j++) {
								var bullet = instance_create_depth(x,y, -y-5, obj_bullet);
								bullet.image_angle = point_direction(obj_playerJSON.x,obj_playerJSON.y,mouse_x,mouse_y);
								switch (obj_playerJSON.inv[obj_playerJSON.slot, 14]) {
									case 0: obj_gameController.shakeAmount += 0.1; break;
									case 1: obj_gameController.shakeAmount += 0.2; break;
									case 2: obj_gameController.shakeAmount += 0.05; break;
									case 3: obj_gameController.shakeAmount += 0.7; break;
									case 4: obj_gameController.shakeAmount += 0.5; break;
								}
							}
						}
						with (instance_create_depth(x, y, -y-2, obj_bulletShell)) {
							switch (obj_playerJSON.inv[obj_playerJSON.slot, 14]) {
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
						obj_playerJSON.curFireInacc += obj_playerJSON.inv[obj_playerJSON.slot, 36];
						audio_play_sound(snd_gunShotGeneric,1,0);
						image_index = 1;
						alarm[0] = 4;
						obj_playerJSON.inv[obj_playerJSON.slot, 9]--;
						obj_playerJSON.inv[obj_playerJSON.slot, 3]--;
						obj_playerJSON.inv[obj_playerJSON.slot, 16] = false;
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
		if (mouse_check_button_pressed(mb_left) && obj_playerJSON.inv[obj_playerJSON.slot, 18] == 0) {
			if (obj_playerJSON.inv[obj_playerJSON.slot, 3] > 0) {
				if (obj_playerJSON.inv[obj_playerJSON.slot, 16]) {
					#region Shoot Bullet
					obj_playerJSON.inv[obj_playerJSON.slot, 3]--;
					if (obj_playerJSON.inv[obj_playerJSON.slot, 14] == 2) var bulletsPerShot = 3; else var bulletsPerShot = 1;
					for (var i = 0; i < obj_playerJSON.inv[obj_playerJSON.slot, 10]; i++) {
						if (obj_playerJSON.inv[obj_playerJSON.slot, 14] == 2) var bulletsPerShot = 3; else var bulletsPerShot = 1;
						for (var j = 0; j < bulletsPerShot; j++) {
							var bullet = instance_create_depth(x,y, -y-5, obj_bullet);
							bullet.image_angle = point_direction(obj_playerJSON.x,obj_playerJSON.y,mouse_x,mouse_y);
							switch (obj_playerJSON.inv[obj_playerJSON.slot, 14]) {
								case 0: obj_gameController.shakeAmount += 0.1; break;
								case 1: obj_gameController.shakeAmount += 0.2; break;
								case 2: obj_gameController.shakeAmount += 0.05; break;
								case 3: obj_gameController.shakeAmount += 0.7; break;
								case 4: obj_gameController.shakeAmount += 0.5; break;
							}
						}
					}
					with (instance_create_depth(x, y, -y-2, obj_bulletShell)) {
						switch (obj_playerJSON.inv[obj_playerJSON.slot, 14]) {
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
					obj_playerJSON.curFireInacc += obj_playerJSON.inv[obj_playerJSON.slot, 36];
					audio_play_sound(snd_gunShotGeneric,1,0);
					image_index = 1;
					alarm[0] = 4;
					obj_playerJSON.inv[obj_playerJSON.slot, 16] = false;
					obj_playerJSON.inv[obj_playerJSON.slot, 17] = obj_playerJSON.inv[obj_playerJSON.slot, 6];
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
		if (obj_playerJSON.inv[obj_playerJSON.slot, 16]) {
			if (singleReloaded) {
				if (obj_playerJSON.inv[obj_playerJSON.slot, 3] > 0) {
					if (mouse_check_button_pressed(mb_left)) {
						#region Shoot Bullet
						obj_playerJSON.inv[obj_playerJSON.slot, 3]--;
						if (obj_playerJSON.inv[obj_playerJSON.slot, 14] == 2) var bulletsPerShot = 3; else var bulletsPerShot = 1;
						for (var i = 0; i < obj_playerJSON.inv[obj_playerJSON.slot, 10]; i++) {
							if (obj_playerJSON.inv[obj_playerJSON.slot, 14] == 2) var bulletsPerShot = 3; else var bulletsPerShot = 1;
							for (var j = 0; j < bulletsPerShot; j++) {
								var bullet = instance_create_depth(x,y, -y-5, obj_bullet);
								bullet.image_angle = point_direction(obj_playerJSON.x,obj_playerJSON.y,mouse_x,mouse_y);
								switch (obj_playerJSON.inv[obj_playerJSON.slot, 14]) {
									case 0: obj_gameController.shakeAmount += 0.1; break;
									case 1: obj_gameController.shakeAmount += 0.2; break;
									case 2: obj_gameController.shakeAmount += 0.05; break;
									case 3: obj_gameController.shakeAmount += 0.7; break;
									case 4: obj_gameController.shakeAmount += 0.5; break;
								}
							}
						}
						obj_playerJSON.curFireInacc += obj_playerJSON.inv[obj_playerJSON.slot, 36];
						audio_play_sound(snd_gunShotGeneric,1,0);
						image_index = 1;
						alarm[0] = 4;
						obj_playerJSON.inv[obj_playerJSON.slot, 16] = false;
						obj_playerJSON.inv[obj_playerJSON.slot, 17] = obj_playerJSON.inv[obj_playerJSON.slot, 6];
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
	slot = obj_playerJSON.slot;

	switch (obj_playerJSON.inv[slot, 1]) {
		case 0:
			sprite_index = spr_gunNoGun;
			break;
		case 1:
			switch (obj_playerJSON.inv[slot, 33]) {
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
			switch (obj_playerJSON.inv[slot, 33]) {
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
			switch (obj_playerJSON.inv[slot, 33]) {
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
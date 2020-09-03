#region Movement Input
if (keyboard_check(ord("W"))) vsp -= runSpeed;
if (keyboard_check(ord("A"))) hsp -= runSpeed;
if (keyboard_check(ord("S"))) vsp += runSpeed;
if (keyboard_check(ord("D"))) hsp += runSpeed;
#endregion

#region Collisions
if (place_meeting(x, y+vsp, obj_wall)) {
	if (vsp > 0) {
		while (place_meeting(x, y + vsp, obj_wall)) {
			vsp--;
		}
	} else {
		while (place_meeting(x, y + vsp, obj_wall)) {
			vsp++;
		}
	}
}

if (place_meeting(x + hsp, y, obj_wall)) {
	if (hsp > 0) {
		while (place_meeting(x + hsp, y, obj_wall)) {
			hsp--;
		}
	} else {
		while (place_meeting(x + hsp, y, obj_wall)) {
			hsp++;
		}
	}
}
#endregion

#region Dashing
if (!dash && allowDash) {
	if (keyboard_check_pressed(vk_shift)) {
		dash = true;
		alarm[0] = 20;
		runSpeed = 3;
		dashTimer = 0;
	}
}

if (dash) {
	if (dashTimer == 0) {
		with (instance_create_depth(x,y,-y+1,obj_playerDash)) {
			image_xscale = other.image_xscale;	
		}
		dashTimer = 2;
	} else {
		dashTimer--;
	}
}
#endregion

#region Speed Limit and Drag
if (vsp <= -runSpeed) vsp = -runSpeed;
if (hsp <= -runSpeed) hsp = -runSpeed;
if (vsp >= runSpeed) vsp = runSpeed;
if (hsp >= runSpeed) hsp = runSpeed;

for (var i = 0; i < 100; i++) {
	if (hsp < 0) {hsp += drag; if (hsp > 0) hsp = 0;}
	if (vsp < 0) {vsp += drag; if (vsp > 0) vsp = 0;}
	if (hsp > 0) {hsp -= drag; if (hsp < 0) hsp = 0;}
	if (vsp > 0) {vsp -= drag; if (vsp < 0) vsp = 0;}
}
#endregion

#region Movement Execution
x += hsp;
y += vsp;
#endregion
	
#region Sprites Manipulation and Animation
//Run Animation
if (vsp != 0 || hsp != 0) {
	sprite_index = spr_debugPlayerRun;
	image_speed = 0.5;
} else {
	sprite_index = spr_debugPlayerIdle
	image_speed = 0.04;
}

//Depth
depth = -y;

//Player Orientation
if (mouse_x >= x) image_xscale = 1; else image_xscale = -1;
if (mouse_x >= x) image_xscale = 1; else image_xscale = -1;
#endregion

#region Damage and Health Management
if (hp <= 0) {
	instance_create_depth(0,0,-y-1000,obj_deathMessage);
	instance_destroy();
}
#endregion

/*
#region Perfect Reload Time Calculation
inv[slot].reload.loading.hSTimeframeStart = inv[slot].reload.loading.time / 2;
inv[slot, 25] = inv[slot, 22] / 2 - inv[slot, 22] / 4;

inv[slot, 26] = inv[slot, 23] / 2;
inv[slot, 27] = inv[slot, 23] / 2 - inv[slot, 23] / 4;
#endregion
*/

#region Reloading Generic
if (inv[slot].status.state == 0 && keyboard_check_pressed(vk_lcontrol)) {
	inv[slot].general.ammoInMag = 0;
	inv[slot].reload.ejection.status = true;
	inv[slot].reload.ejection.timeRemaining = inv[slot].reload.ejection.time;
	inv[slot].status.state += 1;
}

if (inv[slot].status.state == 1 && keyboard_check_pressed(ord("R")) && !inv[slot].reload.ejection.status) {
	inv[slot].reload.loading.timeRemaining = inv[slot].reload.loading.time;
	inv[slot].status.state += 1;
}

if (inv[slot].status.state == 0 && inv[slot].general.fireMode == 3 && obj_gunJSON.singleReloaded == false && inv[slot].status.fireReady == true) {
	if (keyboard_check_pressed(ord("R"))) {
		inv[slot].reload.chamber.timeRemaining = inv[slot].reload.chamber.time;
		inv[slot].reload.chamber.inProcess = true;
		with (instance_create_depth(obj_gunJSON.x, obj_gunJSON.y, -y-2, obj_bulletShell)) {
			switch (obj_player.inv[obj_player.slot].stats.bullet.bType) {
				case 0: sprite_index = spr_ammoSmallShell; break;
				case 1: sprite_index = spr_ammoBigShell; break;
				case 2: sprite_index = spr_ammoShotgunShell; break;
				case 3: sprite_index = spr_ammoExplosiveShell; break;
				case 4: sprite_index = spr_ammoIncendiaryShell; break;
			}
			image_xscale = 0.4;
			image_yscale = 0.4;
			if (obj_gunJSON.image_yscale == -1) {
				image_angle = obj_gunJSON.image_angle + random_range(-15,15) - 90;
				motion_add(obj_gunJSON.image_angle - 90 + random_range(-15,15), 0.5 + random_range(0,1));
			} else {
				image_angle = obj_gunJSON.image_angle + random_range(-15,15) - 90;
				motion_add(obj_gunJSON.image_angle + 90 + random_range(-15,15), 0.5 + random_range(0,1));
			}
		}
	}
}
#endregion

#region Reload Countdown
if (inv[slot].reload.loading.timeRemaining > 0 && inv[slot].status.state == 2) {
	if (keyboard_check_pressed(ord("F"))) {
		if (inv[slot].reload.loading.timeRemaining < inv[slot].reload.loading.hSTimeframeStart && inv[slot].reload.loading.timeRemaining > inv[slot].reload.loading.hSTimeframeStop && !inv[slot].reload.loading.hSFailed) {
			inv[slot].reload.loading.timeRemaining = 1;
		} else {
			 inv[slot].reload.loading.hSFailed = true;
		}
	}
	inv[slot].reload.loading.timeRemaining -= 1;
}

if (inv[slot].reload.loading.timeRemaining == 0 && inv[slot].status.state == 2) {
	inv[slot].status.state = 0;
	if (inv[slot].general.ammoInRes >= inv[slot].general.magCap) {
		inv[slot].general.ammoInMag = inv[slot].general.magCap;
		inv[slot].general.ammoInRes -= inv[slot].general.magCap;
	} else {
		inv[slot].general.ammoInMag = inv[slot].general.ammoInRes;
		inv[slot].general.ammoInRes = 0;
	}
	inv[slot].reload.loading.hSFailed = false;
}
#endregion

#region Single-Shot Reload (Pump/Bolt-Action)
if (inv[slot].reload.chamber.timeRemaining > 0 && inv[slot].reload.chamber.inProcess) {
	if (keyboard_check_pressed(ord("F"))) {
		if (inv[slot].reload.chamber.timeRemaining < inv[slot].reload.chamber.hSTimeframeStart && inv[slot].reload.chamber.timeRemaining > inv[slot].reload.chamber.hSTimeframeStop && !inv[slot].reload.chamber.hSFailed) {
			inv[slot].reload.chamber.timeRemaining = 1;
		} else {
			 inv[slot].reload.chamber.hSFailed = true;
		}
	}
	inv[slot].reload.chamber.timeRemaining -= 1;
	if (inv[slot].reload.chamber.timeRemaining == 0) {
		inv[slot].status.state = 3;
	}
}

if (inv[slot].status.state == 3 && inv[slot].reload.chamber.inProcess) {
	obj_gunJSON.singleReloaded = true;
	obj_gunJSON.image_index = 0;
	inv[slot].reload.chamber.hSFailed = false;
	inv[slot].reload.chamber.inProcess = false;
	inv[slot].status.state = 0;
}
#endregion

#region Fire Delay
if (!inv[slot].status.fireReady) {
	if (inv[slot].status.fireReadyCD > 0) {
		inv[slot].status.fireReadyCD--;
	} else {
		inv[slot].status.fireReady = true;
		inv[slot].status.fireReadyCD = inv[slot].stats.fireRate;
	}
}
#endregion

#region Ejection Timer
if (inv[slot].reload.ejection.status) {
	if (inv[slot].reload.ejection.timeRemaining > 0) {
		inv[slot].reload.ejection.timeRemaining -= 1;
	} else {
		inv[slot].reload.ejection.status = false;
		inv[slot].reload.ejection.timeRemaining = inv[slot].reload.ejection.time;
	}
}
#endregion

#region Weapon Pick-Up
if (point_distance(x, y, instance_nearest(x, y, obj_gunDropped).x, instance_nearest(x, y, obj_gunDropped).y) < 16) {
	drawNotice = true;
	if (keyboard_check_pressed(ord("Q"))) {
		switchWith = instance_nearest(x,y,obj_gunDropped);
	
		if (inv[slot].general.gType != 0) {
			with (instance_create_depth(x,y,-y,obj_gunDropped)) {
				gunState = obj_playerJSON.inv[obj_playerJSON.slot];
				switch (gunState.general.gType) {
				case 0:
					sprite_index = spr_gunNoGun; break;
				case 1: switch (gunState.general.rarity) {
						case 1: /*Standard*/ sprite_index = spr_gunPistolTierE; break;
						case 2: /*Remarkable*/ sprite_index = spr_gunPistolTierD; break;
						case 3: /*Abnormal*/ sprite_index = spr_gunPistolTierC; break;
						case 4: /*Experimental*/ sprite_index = spr_gunPistolTierB; break;
						case 5: /*[REDACTED]*/ sprite_index = spr_gunPistolTierA; break; } break;
				case 2: switch (gunState.general.rarity) {
						case 1: /*Standard*/ sprite_index = spr_gunMPTierE; break;
						case 2: /*Remarkable*/ sprite_index = spr_gunMPTierD; break;
						case 3: /*Abnormal*/ sprite_index = spr_gunMPTierC; break;
						case 4: /*Experimental*/ sprite_index = spr_gunMPTierB; break;
						case 5: /*[REDACTED]*/ sprite_index = spr_gunMPTierA; break; } break;
				case 6: switch (gunState.general.rarity) {
						case 1: /*Standard*/ sprite_index = spr_gunShotgunTierE; break;
						case 2: /*Remarkable*/ sprite_index = spr_gunShotgunTierD; break;
						case 3: /*Abnormal*/ sprite_index = spr_gunShotgunTierC; break;
						case 4: /*Experimental*/ sprite_index = spr_gunShotgunTierB; break;
						case 5: /*[REDACTED]*/ sprite_index = spr_gunShotgunTierA; break; } break;
				}
			}
	
			inv[slot] = defaultGunState;
		}
		
		
		inv[slot] = switchWith.gunState;
		
		with (switchWith) {
			instance_destroy();
		}
		
		weaponPickedUp = true;
		obj_ammoDisplay.weaponPicked = true;
	}
} else {
	drawNotice = false;
}
#endregion

#region Weapon Switching
if (slot == 0) {
	if (mouse_wheel_down()) {
		weaponSwitched = true;
		slot = 1;
	}
} else {
	if (mouse_wheel_up()) {
		weaponSwitched = true;
		slot = 0;
	}
}
#endregion

#region Weapon Dropping
if (keyboard_check_pressed(ord("G"))) {
	with (instance_create_depth(x,y,-y,obj_gunDropped)) {
		gunState = obj_playerJSON.inv[obj_playerJSON.slot];
		switch (gunState.general.gType) {
		case 0:
			sprite_index = spr_gunNoGun; break;
		case 1: switch (gunState.general.rarity) {
				case 1: /*Standard*/ sprite_index = spr_gunPistolTierE; break;
				case 2: /*Remarkable*/ sprite_index = spr_gunPistolTierD; break;
				case 3: /*Abnormal*/ sprite_index = spr_gunPistolTierC; break;
				case 4: /*Experimental*/ sprite_index = spr_gunPistolTierB; break;
				case 5: /*[REDACTED]*/ sprite_index = spr_gunPistolTierA; break; } break;
		case 2: switch (gunState.general.rarity) {
				case 1: /*Standard*/ sprite_index = spr_gunMPTierE; break;
				case 2: /*Remarkable*/ sprite_index = spr_gunMPTierD; break;
				case 3: /*Abnormal*/ sprite_index = spr_gunMPTierC; break;
				case 4: /*Experimental*/ sprite_index = spr_gunMPTierB; break;
				case 5: /*[REDACTED]*/ sprite_index = spr_gunMPTierA; break; } break;
		case 6: switch (gunState.general.rarity) {
				case 1: /*Standard*/ sprite_index = spr_gunShotgunTierE; break;
				case 2: /*Remarkable*/ sprite_index = spr_gunShotgunTierD; break;
				case 3: /*Abnormal*/ sprite_index = spr_gunShotgunTierC; break;
				case 4: /*Experimental*/ sprite_index = spr_gunShotgunTierB; break;
				case 5: /*[REDACTED]*/ sprite_index = spr_gunShotgunTierA; break; } break;
		}
	}
	
	inv[slot] = defaultGunState;
}
#endregion

#region Fire Speed Reduction and Reset
if (!place_meeting(x,y,obj_fire) && !dash) {
	runSpeed = maxRunSpeed;
}
#endregion

#region Fire Inaccuracy Build-Up
if (curFireInacc > 0) {
	curFireInacc -= 0.5;
	if (curFireInacc < 0) {
		curFireInacc = 0;
	}
}
#endregion
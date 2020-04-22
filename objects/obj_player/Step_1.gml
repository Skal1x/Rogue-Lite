//Movement Input
if (keyboard_check(ord("W"))) vsp -= runSpeed;
if (keyboard_check(ord("A"))) hsp -= runSpeed;
if (keyboard_check(ord("S"))) vsp += runSpeed;
if (keyboard_check(ord("D"))) hsp += runSpeed;

//Limit Speed
if (vsp <= -runSpeed) vsp = -runSpeed;
if (hsp <= -runSpeed) hsp = -runSpeed;
if (vsp >= runSpeed) vsp = runSpeed;
if (hsp >= runSpeed) hsp = runSpeed;
if (hsp < 0) hsp += drag;
if (vsp < 0) vsp += drag;
if (hsp > 0) hsp -= drag;
if (vsp > 0) vsp -= drag;

//Collision
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

//Dashing
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

//Execute Movement
x += hsp;
y += vsp;

// Movement Animation
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

//Debug Enemy Respawning
if (keyboard_check_pressed(ord("E"))) {
	instance_create_depth(200,328,-y,obj_enemyBasic);
	instance_create_depth(248,328,-y,obj_enemyBasic);
	instance_create_depth(296,328,-y,obj_enemyBasic);
	instance_create_depth(344,328,-y,obj_enemyBasic);
	instance_create_depth(392,328,-y,obj_enemyBasic);
	instance_create_depth(440,328,-y,obj_enemyBasic);
	instance_create_depth(488,328,-y,obj_enemyBasic);
}

//Damage and Health
if (hp <= 0) {
	instance_create_depth(0,0,-y-1000,obj_deathMessage);
	instance_destroy();
}

//Determin Reload Perfect Timing
exeReloadStart = reloadTime / 2;
exeReloadStop = reloadTime / 2 - reloadTime / 4;

exeSingleReloadStart = singleReloadTime / 2;
exeSingleReloadStop = singleReloadTime / 2 - singleReloadTime / 4;

//Reloading
if (gunState == 0 && keyboard_check_pressed(vk_lcontrol)) {
	curMag = 0;
	ejecting = true;
	ejectTimer = ejectSpeed;
	gunState++;
}

if (gunState == 1 && keyboard_check_pressed(ord("R")) && !ejecting) {
	curReload = reloadTime;
	gunState++;
}

if (gunState == 0 && fireMode == 3 && obj_gun.singleReloaded == false && fireReady == true) {
	if (keyboard_check_pressed(ord("R"))) {
		curSingleReload = singleReloadTime;
		singleReloading = true;
	}
}

//Countdown Reload
if (curReload > 0 && gunState == 2) {
	if (keyboard_check_pressed(ord("F"))) {
		if (curReload < exeReloadStart && curReload > exeReloadStop && !reloadFailed) {
			curReload = 1;
		} else {
			 reloadFailed = true;
		}
	}
	curReload--;
}

if (curReload == 0 && gunState == 2) {
	gunState = 0;
	if (curAmmo >= maxMag) {
		curMag = maxMag;
		curAmmo -= maxMag;
	} else {
		curMag = curAmmo;
		curAmmo = 0;
	}
	reloadFailed = false;
}

//Single Shot Reload

if (curSingleReload > 0 && singleReloading) {
	if (keyboard_check_pressed(ord("F"))) {
		if (curSingleReload < exeSingleReloadStart && curSingleReload > exeSingleReloadStop && !singleReloadFailed) {
			curSingleReload = 1;
		} else {
			 singleReloadFailed = true;
		}
	}
	curSingleReload--;
	if (curSingleReload == 0) {
		gunState = 3;
	}
}

if (gunState == 3 && singleReloading) {
	obj_gun.singleReloaded = true;
	obj_gun.image_index = 0;
	singleReloadFailed = false;
	singleReloading = false;
	gunState = 0;
}



//Fire Delay
if (!fireReady) {
	if (curFireCooldown > 0) {
		curFireCooldown--;
	} else {
		fireReady = true;
		curFireCooldown = fireRate;
	}
}

//Ejection Timer
if (ejecting) {
	if (ejectTimer > 0) {
		ejectTimer--;
	} else {
		ejecting = false;
		ejectTimer = ejectSpeed;
	}
}

//PickUp Weapon (For Testing)

if (place_meeting(x,y,obj_gunDropped)) {
	if (keyboard_check_pressed(ord("Q"))) {
		
		switchWith = instance_nearest(x,y,obj_gunDropped);
	
		if (inv[slot, 1] != 0) {
			with (instance_create_depth(x,y,-y,obj_gunDropped)) {
				for (var i = 0; i <= 35; i++) {
					stats[i] = obj_player.inv[obj_player.slot, i];
				}
				switch (stats[1]) {
				case 0:
					sprite_index = spr_gunNoGun; break;
				case 1: switch (stats[33]) {
						case 1: /*Standard*/ sprite_index = spr_gunPistolTierE; break;
						case 2: /*Remarkable*/ sprite_index = spr_gunPistolTierD; break;
						case 3: /*Abnormal*/ sprite_index = spr_gunPistolTierC; break;
						case 4: /*Experimental*/ sprite_index = spr_gunPistolTierB; break;
						case 5: /*[REDACTED]*/ sprite_index = spr_gunPistolTierA; break; } break;
				case 2: switch (stats[33]) {
						case 1: /*Standard*/ sprite_index = spr_gunMPTierE; break;
						case 2: /*Remarkable*/ sprite_index = spr_gunMPTierD; break;
						case 3: /*Abnormal*/ sprite_index = spr_gunMPTierC; break;
						case 4: /*Experimental*/ sprite_index = spr_gunMPTierB; break;
						case 5: /*[REDACTED]*/ sprite_index = spr_gunMPTierA; break; } break;
				case 6: switch (stats[33]) {
						case 1: /*Standard*/ sprite_index = spr_gunShotgunTierE; break;
						case 2: /*Remarkable*/ sprite_index = spr_gunShotgunTierD; break;
						case 3: /*Abnormal*/ sprite_index = spr_gunShotgunTierC; break;
						case 4: /*Experimental*/ sprite_index = spr_gunShotgunTierB; break;
						case 5: /*[REDACTED]*/ sprite_index = spr_gunShotgunTierA; break; } break;
				}
			}
	
			for (var j = 0; j <= 35; j++) {
				if (j == 0) {
					inv[slot, j] = "EMPTY";
				} else if (j == 16 || j == 20 || j == 28 || j == 29 || j == 30){
					inv[slot, j] = false;
				} else {
					inv[slot, j] = 0;
				}
			}
	
			name = "EMPTY";
			gunType = 0;
			maxMag = 0;
			curMag = 0;
			curAmmo = 0;
			spread = 0;
			fireRate = 0;
			fireMode = 0;
			burstAmount = 0;
			curBurst = 0;
			pelletAmount = 0;
			bulletDamage = 0;
			projectileSpeed = 0;
			projectileRange = 0;
			projectileType = 0;
			randomEffect = 0;
			fireReady = false;
			curFireCooldown = 0;
			gunState = 0;
			ejectSpeed = 0;
			ejecting = false;
			ejectSpeed = 0;
			reloadTime = 0;
			singleReloadTime = 0;
			exeReloadStart = 0;
			exeReloadStop = 0;
			exeSingleReloadStart = 0;
			exeSingleReloadStop = 0;
			singleReloading = false;
			singleReloadFailed = false;
			reloadFailed = false;
			curReload = 0;
			curSingleReload = 0;
			rarity = 0;
			expRadius = 0;
			expDamage = 0;
		}
		
		for (var i = 0; i <= 35; i++) {
			inv[slot, i] = switchWith.stats[i];
		}
		with (switchWith) {
			instance_destroy();
		}
		weaponPickedUp = true;
		obj_ammoDisplay.weaponPicked = true;
	}
}

//Weapon Switching
if (slot == 0) {
	if (mouse_wheel_down()) {
		weaponSwitched = true;
		
		inv[slot, 3] = curMag;
		inv[slot, 4] = curAmmo;
		inv[slot, 9] = curBurst;
		inv[slot, 16] = fireReady;
		inv[slot, 17] = curFireCooldown;
		inv[slot, 18] = gunState;
		inv[slot, 20] = ejecting;
		inv[slot, 21] = ejectTimer;
		inv[slot, 28] = singleReloading;
		inv[slot, 29] = singleReloadFailed;
		inv[slot, 30] = reloadFailed;
		inv[slot, 31] = curReload;
		inv[slot, 32] = curSingleReload;
		
		slot = 1;
	}
} else {
	if (mouse_wheel_up()) {
		weaponSwitched = true;
		
		inv[slot, 3] = curMag;
		inv[slot, 4] = curAmmo;
		inv[slot, 9] = curBurst;
		inv[slot, 16] = fireReady;
		inv[slot, 17] = curFireCooldown;
		inv[slot, 18] = gunState;
		inv[slot, 20] = ejecting;
		inv[slot, 21] = ejectTimer;
		inv[slot, 28] = singleReloading;
		inv[slot, 29] = singleReloadFailed;
		inv[slot, 30] = reloadFailed;
		inv[slot, 31] = curReload;
		inv[slot, 32] = curSingleReload;
		
		slot = 0;
	}
}

//Update Stats in from Inventory
if (weaponPickedUp || weaponSwitched) {
	name = inv[slot, 0];
	gunType = inv[slot, 1];
	maxMag = inv[slot, 2];
	curMag = inv[slot, 3];
	curAmmo = inv[slot, 4];
	spread = inv[slot, 5];
	fireRate = inv[slot, 6];
	fireMode = inv[slot, 7];
	burstAmount = inv[slot, 8];
	curBurst = inv[slot, 9];
	pelletAmount = inv[slot, 10];
	bulletDamage = inv[slot, 11];
	projectileSpeed = inv[slot, 12];
	projectileRange = inv[slot, 13];
	projectileType = inv[slot, 14];
	randomEffect = inv[slot, 15];
	fireReady = inv[slot, 16];
	curFireCooldown = inv[slot, 17];
	gunState = inv[slot, 18];
	ejectSpeed = inv[slot, 19];
	ejecting = inv[slot, 20];
	ejectSpeed = inv[slot, 21];
	reloadTime = inv[slot, 22];
	singleReloadTime = inv[slot, 23];
	exeReloadStart = inv[slot, 24];
	exeReloadStop = inv[slot, 25];
	exeSingleReloadStart = inv[slot, 26];
	exeSingleReloadStop = inv[slot, 27];
	singleReloading = inv[slot, 28];
	singleReloadFailed = inv[slot, 29];
	reloadFailed = inv[slot, 30];
	curReload = inv[slot, 31];
	curSingleReload = inv[slot, 32];
	rarity = inv[slot, 33];
	expRadius = inv[slot, 34];
	expDamage = inv[slot, 35];
	
	if (weaponPickedUp) weaponPickedUp = false;
	if (weaponSwitched) weaponSwitched = false;
}

if (keyboard_check_pressed(vk_f9)) {
	name = "EMPTY";
	gunType = 0;
	maxMag = 0;
	curMag = 0;
	curAmmo = 0;
	spread = 0;
	fireRate = 0;
	fireMode = 0;
	burstAmount = 0;
	curBurst = 0;
	pelletAmount = 0;
	bulletDamage = 0;
	projectileSpeed = 0;
	projectileRange = 0;
	projectileType = 0;
	randomEffect = 0;
	fireReady = false;
	curFireCooldown = 0;
	gunState = 0;
	ejectSpeed = 0;
	ejecting = false;
	ejectSpeed = 0;
	reloadTime = 0;
	singleReloadTime = 0;
	exeReloadStart = 0;
	exeReloadStop = 0;
	exeSingleReloadStart = 0;
	exeSingleReloadStop = 0;
	singleReloading = false;
	singleReloadFailed = false;
	reloadFailed = false;
	curReload = 0;
	curSingleReload = 0;
	rarity = 0;
	
	for (var i = 0; i <= 1; i++) {
		for (var j = 0; j <= 35; j++) {
			if (j == 0) {
				inv[i, j] = "EMPTY";
			} else if (j == 16 || j == 20 || j == 28 || j == 29 || j == 30){
				inv[i, j] = false;
			} else {
				inv[i, j] = 0;
			}
		}
	}
}

//Update Inventory

inv[slot, 3] = curMag;
inv[slot, 4] = curAmmo;
inv[slot, 9] = curBurst;
inv[slot, 16] = fireReady;
inv[slot, 17] = curFireCooldown;
inv[slot, 18] = gunState;
inv[slot, 20] = ejecting;
inv[slot, 21] = ejectTimer;
inv[slot, 28] = singleReloading;
inv[slot, 29] = singleReloadFailed;
inv[slot, 30] = reloadFailed;
inv[slot, 31] = curReload;
inv[slot, 32] = curSingleReload;

//Weapon Dropping

if (keyboard_check_pressed(ord("G"))) {
	with (instance_create_depth(x,y,-y,obj_gunDropped)) {
		for (var i = 0; i <= 35; i++) {
			stats[i] = obj_player.inv[obj_player.slot, i];
		}
		switch (stats[1]) {
		case 0:
			sprite_index = spr_gunNoGun; break;
		case 1: switch (stats[33]) {
				case 1: /*Standard*/ sprite_index = spr_gunPistolTierE; break;
				case 2: /*Remarkable*/ sprite_index = spr_gunPistolTierD; break;
				case 3: /*Abnormal*/ sprite_index = spr_gunPistolTierC; break;
				case 4: /*Experimental*/ sprite_index = spr_gunPistolTierB; break;
				case 5: /*[REDACTED]*/ sprite_index = spr_gunPistolTierA; break; } break;
		case 2: switch (stats[33]) {
				case 1: /*Standard*/ sprite_index = spr_gunMPTierE; break;
				case 2: /*Remarkable*/ sprite_index = spr_gunMPTierD; break;
				case 3: /*Abnormal*/ sprite_index = spr_gunMPTierC; break;
				case 4: /*Experimental*/ sprite_index = spr_gunMPTierB; break;
				case 5: /*[REDACTED]*/ sprite_index = spr_gunMPTierA; break; } break;
		case 6: switch (stats[33]) {
				case 1: /*Standard*/ sprite_index = spr_gunShotgunTierE; break;
				case 2: /*Remarkable*/ sprite_index = spr_gunShotgunTierD; break;
				case 3: /*Abnormal*/ sprite_index = spr_gunShotgunTierC; break;
				case 4: /*Experimental*/ sprite_index = spr_gunShotgunTierB; break;
				case 5: /*[REDACTED]*/ sprite_index = spr_gunShotgunTierA; break; } break;
		}
	}
	
	for (var j = 0; j <= 35; j++) {
		if (j == 0) {
			inv[slot, j] = "EMPTY";
		} else if (j == 16 || j == 20 || j == 28 || j == 29 || j == 30){
			inv[slot, j] = false;
		} else {
			inv[slot, j] = 0;
		}
	}
	
	name = "EMPTY";
	gunType = 0;
	maxMag = 0;
	curMag = 0;
	curAmmo = 0;
	spread = 0;
	fireRate = 0;
	fireMode = 0;
	burstAmount = 0;
	curBurst = 0;
	pelletAmount = 0;
	bulletDamage = 0;
	projectileSpeed = 0;
	projectileRange = 0;
	projectileType = 0;
	randomEffect = 0;
	fireReady = false;
	curFireCooldown = 0;
	gunState = 0;
	ejectSpeed = 0;
	ejecting = false;
	ejectSpeed = 0;
	reloadTime = 0;
	singleReloadTime = 0;
	exeReloadStart = 0;
	exeReloadStop = 0;
	exeSingleReloadStart = 0;
	exeSingleReloadStop = 0;
	singleReloading = false;
	singleReloadFailed = false;
	reloadFailed = false;
	curReload = 0;
	curSingleReload = 0;
	rarity = 0;
}
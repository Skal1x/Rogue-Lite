if (instance_exists(obj_player)) {
	if (ammo != obj_player.inv[obj_player.slot, 3]) {
		if (ammo != obj_player.inv[obj_player.slot, 3] + 1) {
			if (curSlot == obj_player.slot && !weaponPicked) {
				for (var i = 0; i < ((ammo div maxRow) + 1); i++) {
					if (ammo >= (i + 1) * maxRow) {
						for (var j = 0; j < maxRow; j++) {
							with (instance_create_depth(x + j * xMulti, y - i * yMulti,-y-950, obj_ammoDrop)) {
								image_xscale = 5;
								image_yscale = 5;
								image_speed = 0;
								image_alpha = 1;
								ammoType = other.proType;
							}
						}
					} else {
						for (var j = 0; j < ammo % maxRow; j++) {
							with (instance_create_depth(x + j * xMulti, y - i * yMulti,-y-950, obj_ammoDrop)) {
								image_xscale = 5;
								image_yscale = 5;
								image_speed = 0;
								image_alpha = 1;
								ammoType = other.proType;
							}
						}
					}
				}
			}
		} else {
			if (ammo % maxRow = 0) layerHeight = (ammo div maxRow) - 1; else layerHeight = ammo div maxRow;
			if (ammo % maxRow = 0) bulletIndex = maxRow - 1; else bulletIndex = (ammo % maxRow) - 1;
			with (instance_create_depth(x + bulletIndex * xMulti, y - layerHeight * yMulti,-y-950, obj_ammoDrop)) {
				image_speed = 0;
				image_alpha = 1;
				image_xscale = 5;
				image_yscale = 5;
				ammoType = other.proType;
			}
		}
		ammo = obj_player.inv[obj_player.slot, 3];
	}

	maxAmmo = obj_player.inv[obj_player.slot, 2];
	gunState = obj_player.inv[obj_player.slot, 18];
	relStep = obj_player.inv[obj_player.slot, 22] / obj_player.inv[obj_player.slot, 2];
	singleReloaded = obj_gun.singleReloaded;
	singleRelStep = obj_player.inv[obj_player.slot, 23] / obj_player.inv[obj_player.slot, 2];
	failReload = obj_player.inv[obj_player.slot, 30];
	failSingleReload = obj_player.inv[obj_player.slot, 29];
	ejecting = obj_player.inv[obj_player.slot, 20];
	singleReloading = obj_player.inv[obj_player.slot, 28];
	curSlot = obj_player.slot;
	proType = obj_player.inv[obj_player.slot, 14];
	
	switch (obj_player.inv[obj_player.slot, 14]) {
		case 0: maxRow = 20; break;
		case 3: maxRow = 10; break;
		default: maxRow = 15; break;
	}
	
	switch (proType) {
		case 0: xMulti = 20; yMulti = 40; break;
		case 1: xMulti = 28; yMulti = 48; break;
		case 2: xMulti = 28; yMulti = 56; break;
		case 3: xMulti = 36; yMulti = 40; break;
		case 4: xMulti = 28; yMulti = 48; break;
	}
	
	if (weaponPicked) weaponPicked = false;
	
	if (gunState = 2) {
		relProg = (obj_player.inv[obj_player.slot, 22] - obj_player.inv[obj_player.slot, 31]) / relStep;
	}
	
	if (singleReloading) {
		singleRelProg = (obj_player.inv[obj_player.slot, 23] - obj_player.inv[obj_player.slot, 32]) / singleRelStep;
	}
	
	if (emptyFire = true) {
		emptyFireTimer = 15;
		emptyFire = false;
	}
	
	if (emptyFireTimer != 0) {
		emptyFireTimer--;
	}
}
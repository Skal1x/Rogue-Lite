if (isLoaded && instance_exists(obj_player)) {
	if (ammo != obj_player.inv[obj_player.slot].general.ammoInMag) {
		if (ammo != obj_player.inv[obj_player.slot].general.ammoInMag + 1) {
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
		ammo = obj_player.inv[obj_player.slot].general.ammoInMag;
	}

	maxAmmo = obj_player.inv[obj_player.slot].general.magCap;
	gunState = obj_player.inv[obj_player.slot].status.state;
	relStep = obj_player.inv[obj_player.slot].reload.loading.time / obj_player.inv[obj_player.slot].general.magCap;
	singleReloaded = obj_gun.singleReloaded;
	singleRelStep = obj_player.inv[obj_player.slot].reload.chamber.time / obj_player.inv[obj_player.slot].general.magCap;
	failReload = obj_player.inv[obj_player.slot].reload.loading.hSFailed;
	failSingleReload = obj_player.inv[obj_player.slot].reload.chamber.hSFailed;
	ejecting = obj_player.inv[obj_player.slot].reload.ejection.status;
	singleReloading = obj_player.inv[obj_player.slot].reload.chamber.inProcess;
	curSlot = obj_player.slot;
	proType = obj_player.inv[obj_player.slot].stats.bullet.bType;
	
	switch (obj_player.inv[obj_player.slot].stats.bullet.bType) {
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
		relProg = (obj_player.inv[obj_player.slot].reload.loading.time - obj_player.inv[obj_player.slot].reload.loading.timeRemaining) / relStep;
	}
	
	if (singleReloading) {
		singleRelProg = (obj_player.inv[obj_player.slot].reload.chamber.time - obj_player.inv[obj_player.slot].reload.chamber.timeRemaining) / singleRelStep;
	}
	
	if (emptyFire = true) {
		emptyFireTimer = 15;
		emptyFire = false;
	}
	
	if (emptyFireTimer != 0) {
		emptyFireTimer--;
	}
}
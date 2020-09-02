if (instance_exists(obj_player)) {
	ammo = obj_player.inv[obj_player.slot, 3];
	maxAmmo = obj_player.inv[obj_player.slot, 2];
	gunState = obj_player.inv[obj_player.slot, 18];
	relProg = 0;
	relStep = obj_player.inv[obj_player.slot, 22] / obj_player.inv[obj_player.slot, 2];
	singleReloaded = obj_gun.singleReloaded;
	singleReloading = obj_player.inv[obj_player.slot, 28];
	singleRelProg = 0;
	singleRelStep = obj_player.inv[obj_player.slot, 23] / obj_player.inv[obj_player.slot, 2];
	failSingleReload = false;
	failReload = false;
	ejecting = false;
	layerHeight = 0;
	bulletIndex = 0;
	emptyFire = false;
	emptyFireTimer = 10;
	curSlot = 0;
	maxRow = 20;
	proType = 0;
	xMulti = 0;
	yMulti = 0;
	weaponPicked = false;
}
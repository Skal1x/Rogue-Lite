if (instance_exists(obj_player)) {
	ammo = obj_player.inv[obj_player.slot].general.ammoInMag;
	maxAmmo = obj_player.inv[obj_player.slot].general.magCap;
	gunState = obj_player.inv[obj_player.slot].status.state;
	relProg = 0;
	relStep = obj_player.inv[obj_player.slot].reload.loading.time / obj_player.inv[obj_player.slot].general.magCap;
	singleReloaded = obj_gun.singleReloaded;
	singleReloading = obj_player.inv[obj_player.slot].reload.chamber.inProcess;
	singleRelProg = 0;
	singleRelStep = obj_player.inv[obj_player.slot].reload.chamber.time / obj_player.inv[obj_player.slot].general.magCap;
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
	isLoaded = true;
}
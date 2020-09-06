//Magazine Capacity Background
if (isLoaded) {
	for (var i = 0; i < ((maxAmmo div maxRow) + 1); i++) {
		if (maxAmmo >= (i + 1) * maxRow) {
			for (var j = 0; j < maxRow; j++) {
				if (!ejecting) {
					switch(proType) {
						case 0: draw_sprite_ext(spr_ammoSmallUsed, 0, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
						case 1: draw_sprite_ext(spr_ammoBigUsed, 0, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
						case 2: draw_sprite_ext(spr_ammoShotgunUsed, 0, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
						case 3: draw_sprite_ext(spr_ammoExplosiveUsed, 0, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
						case 4: draw_sprite_ext(spr_ammoIncendiaryUsed, 0, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
					}
				} else {
					switch(proType) {
						case 0: draw_sprite_ext(spr_ammoSmallUsed, 1, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
						case 1: draw_sprite_ext(spr_ammoBigUsed, 1, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
						case 2: draw_sprite_ext(spr_ammoShotgunUsed, 1, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
						case 3: draw_sprite_ext(spr_ammoExplosiveUsed, 1, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
						case 4: draw_sprite_ext(spr_ammoIncendiaryUsed, 1, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
					}
				}
			}
		} else {
			for (var j = 0; j < maxAmmo % maxRow; j++) {
				if (!ejecting) {
					switch(proType) {
						case 0: draw_sprite_ext(spr_ammoSmallUsed, 0, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
						case 1: draw_sprite_ext(spr_ammoBigUsed, 0, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
						case 2: draw_sprite_ext(spr_ammoShotgunUsed, 0, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
						case 3: draw_sprite_ext(spr_ammoExplosiveUsed, 0, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
						case 4: draw_sprite_ext(spr_ammoIncendiaryUsed, 0, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
					}
				} else {
					switch(proType) {
						case 0: draw_sprite_ext(spr_ammoSmallUsed, 1, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
						case 1: draw_sprite_ext(spr_ammoBigUsed, 1, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
						case 2: draw_sprite_ext(spr_ammoShotgunUsed, 1, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
						case 3: draw_sprite_ext(spr_ammoExplosiveUsed, 1, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
						case 4: draw_sprite_ext(spr_ammoIncendiaryUsed, 1, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
					}
				}
			}
		}
	}

	//Current Ammo in Magazine
	if (instance_exists(obj_player)) {
		for (var i = 0; i < ((ammo div maxRow) + 1); i++) {
			if (ammo >= (i + 1) * maxRow) {
				for (var j = 0; j < maxRow; j++) {
					if (singleReloaded || obj_player.inv[obj_player.slot].stats.fireMode != "single") {
						switch(proType) {
							case 0: draw_sprite_ext(spr_ammoSmall, 0, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
							case 1: draw_sprite_ext(spr_ammoBig, 0, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
							case 2: draw_sprite_ext(spr_ammoShotgun, 0, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
							case 3: draw_sprite_ext(spr_ammoExplosive, 0, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
							case 4: draw_sprite_ext(spr_ammoIncendiary, 0, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
						}
					} else {
						switch(proType) {
							case 0: draw_sprite_ext(spr_ammoSmall, 1, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
							case 1: draw_sprite_ext(spr_ammoBig, 1, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
							case 2: draw_sprite_ext(spr_ammoShotgun, 1, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
							case 3: draw_sprite_ext(spr_ammoExplosive, 1, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
							case 4: draw_sprite_ext(spr_ammoIncendiary, 1, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
						}
					}
				}
			} else {
				for (var j = 0; j < ammo % maxRow; j++) {
					if (singleReloaded || obj_player.inv[obj_player.slot].stats.fireMode != "single") {
						switch(proType) {
							case 0: draw_sprite_ext(spr_ammoSmall, 0, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
							case 1: draw_sprite_ext(spr_ammoBig, 0, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
							case 2: draw_sprite_ext(spr_ammoShotgun, 0, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
							case 3: draw_sprite_ext(spr_ammoExplosive, 0, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
							case 4: draw_sprite_ext(spr_ammoIncendiary, 0, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
						}
					} else {
						switch(proType) {
							case 0: draw_sprite_ext(spr_ammoSmall, 1, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
							case 1: draw_sprite_ext(spr_ammoBig, 1, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
							case 2: draw_sprite_ext(spr_ammoShotgun, 1, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
							case 3: draw_sprite_ext(spr_ammoExplosive, 1, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
							case 4: draw_sprite_ext(spr_ammoIncendiary, 1, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
						}
					}
				}
			}
		}

		//Reload Animation
		if (gunState == 2) {
			for (var i = 0; i < (relProg div maxRow) + 1; i++) {
				if (relProg >= (i + 1) * maxRow) {
					for (var j = 0; j < maxRow; j++) {
						if (failReload) {
							switch (proType) {
								case 0: draw_sprite_ext(spr_ammoSmallReload, 2, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
								case 1: draw_sprite_ext(spr_ammoBigReload, 2, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
								case 2: draw_sprite_ext(spr_ammoShotgunReload, 2, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
								case 3: draw_sprite_ext(spr_ammoExplosiveReload, 2, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
								case 4: draw_sprite_ext(spr_ammoIncendiaryReload, 2, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
							}
						} else {
							if (obj_player.inv[obj_player.slot].reload.loading.timeRemaining < obj_player.inv[obj_player.slot].reload.loading.hSTimeframeStart && obj_player.inv[obj_player.slot].reload.loading.timeRemaining > obj_player.inv[obj_player.slot].reload.loading.hSTimeframeStop) {
								switch (proType) {
									case 0: draw_sprite_ext(spr_ammoSmallReload, 1, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
									case 1: draw_sprite_ext(spr_ammoBigReload, 1, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
									case 2: draw_sprite_ext(spr_ammoShotgunReload, 1, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
									case 3: draw_sprite_ext(spr_ammoExplosiveReload, 1, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
									case 4: draw_sprite_ext(spr_ammoIncendiaryReload, 1, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
								}
							} else {
								switch (proType) {
									case 0: draw_sprite_ext(spr_ammoSmallReload, 0, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
									case 1: draw_sprite_ext(spr_ammoBigReload, 0, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
									case 2: draw_sprite_ext(spr_ammoShotgunReload, 0, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
									case 3: draw_sprite_ext(spr_ammoExplosiveReload, 0, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
									case 4: draw_sprite_ext(spr_ammoIncendiaryReload, 0, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
								}
							}
						}
					}
				} else {
					for (var j = 0; j < relProg % maxRow; j++) {
						if (failReload) {
							switch (proType) {
								case 0: draw_sprite_ext(spr_ammoSmallReload, 2, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
								case 1: draw_sprite_ext(spr_ammoBigReload, 2, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
								case 2: draw_sprite_ext(spr_ammoShotgunReload, 2, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
								case 3: draw_sprite_ext(spr_ammoExplosiveReload, 2, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
								case 4: draw_sprite_ext(spr_ammoIncendiaryReload, 2, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
							}
						} else {
							if (obj_player.inv[obj_player.slot].reload.loading.timeRemaining < obj_player.inv[obj_player.slot].reload.loading.hSTimeframeStart && obj_player.inv[obj_player.slot].reload.loading.timeRemaining > obj_player.inv[obj_player.slot].reload.loading.hSTimeframeStop) {
								switch (proType) {
									case 0: draw_sprite_ext(spr_ammoSmallReload, 1, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
									case 1: draw_sprite_ext(spr_ammoBigReload, 1, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
									case 2: draw_sprite_ext(spr_ammoShotgunReload, 1, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
									case 3: draw_sprite_ext(spr_ammoExplosiveReload, 1, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
									case 4: draw_sprite_ext(spr_ammoIncendiaryReload, 1, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
								}
							} else {
								switch (proType) {
									case 0: draw_sprite_ext(spr_ammoSmallReload, 0, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
									case 1: draw_sprite_ext(spr_ammoBigReload, 0, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
									case 2: draw_sprite_ext(spr_ammoShotgunReload, 0, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
									case 3: draw_sprite_ext(spr_ammoExplosiveReload, 0, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
									case 4: draw_sprite_ext(spr_ammoIncendiaryReload, 0, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
								}
							}
						}
					}
				}
			}
		}

		//Single Fire Reload
		if (singleReloading) {
			for (var i = 0; i < (singleRelProg div maxRow) + 1; i++) {
				if (singleRelProg >= (i + 1) * maxRow) {
					for (var j = 0; j < maxRow; j++) {
						if (failSingleReload) {
							switch (proType) {
								case 0: draw_sprite_ext(spr_ammoSmallReload, 2, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
								case 1: draw_sprite_ext(spr_ammoBigReload, 2, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
								case 2: draw_sprite_ext(spr_ammoShotgunReload, 2, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
								case 3: draw_sprite_ext(spr_ammoExplosiveReload, 2, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
								case 4: draw_sprite_ext(spr_ammoIncendiaryReload, 2, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
							}
						} else {
							if (obj_player.inv[obj_player.slot].reload.chamber.timeRemaining < obj_player.inv[obj_player.slot].reload.chamber.hSTimeframeStart && obj_player.inv[obj_player.slot].reload.chamber.timeRemaining > obj_player.inv[obj_player.slot].reload.chamber.hSTimeframeStop) {
								switch (proType) {
									case 0: draw_sprite_ext(spr_ammoSmallReload, 1, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
									case 1: draw_sprite_ext(spr_ammoBigReload, 1, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
									case 2: draw_sprite_ext(spr_ammoShotgunReload, 1, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
									case 3: draw_sprite_ext(spr_ammoExplosiveReload, 1, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
									case 4: draw_sprite_ext(spr_ammoIncendiaryReload, 1, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
								}
							} else {
								switch (proType) {
									case 0: draw_sprite_ext(spr_ammoSmallReload, 0, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
									case 1: draw_sprite_ext(spr_ammoBigReload, 0, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
									case 2: draw_sprite_ext(spr_ammoShotgunReload, 0, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
									case 3: draw_sprite_ext(spr_ammoExplosiveReload, 0, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
									case 4: draw_sprite_ext(spr_ammoIncendiaryReload, 0, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
								}
							}
						}
					}
				} else {
					for (var j = 0; j < singleRelProg % maxRow; j++) {
						if (failSingleReload) {
							switch (proType) {
								case 0: draw_sprite_ext(spr_ammoSmallReload, 2, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
								case 1: draw_sprite_ext(spr_ammoBigReload, 2, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
								case 2: draw_sprite_ext(spr_ammoShotgunReload, 2, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
								case 3: draw_sprite_ext(spr_ammoExplosiveReload, 2, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
								case 4: draw_sprite_ext(spr_ammoIncendiaryReload, 2, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
							}
						} else {
							if (obj_player.inv[obj_player.slot].reload.chamber.timeRemaining < obj_player.inv[obj_player.slot].reload.chamber.hSTimeframeStart && obj_player.inv[obj_player.slot].reload.chamber.timeRemaining > obj_player.inv[obj_player.slot].reload.chamber.hSTimeframeStop) {
								switch (proType) {
									case 0: draw_sprite_ext(spr_ammoSmallReload, 1, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
									case 1: draw_sprite_ext(spr_ammoBigReload, 1, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
									case 2: draw_sprite_ext(spr_ammoShotgunReload, 1, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
									case 3: draw_sprite_ext(spr_ammoExplosiveReload, 1, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
									case 4: draw_sprite_ext(spr_ammoIncendiaryReload, 1, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
								}
							} else {
								switch (proType) {
									case 0: draw_sprite_ext(spr_ammoSmallReload, 0, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
									case 1: draw_sprite_ext(spr_ammoBigReload, 0, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
									case 2: draw_sprite_ext(spr_ammoShotgunReload, 0, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
									case 3: draw_sprite_ext(spr_ammoExplosiveReload, 0, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
									case 4: draw_sprite_ext(spr_ammoIncendiaryReload, 0, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, 1); break;
								}
							}
						}
					}
				}
			}
		}

		//Empty Fire
		if (emptyFireTimer != 0 && gunState = 0) {
			for (var i = 0; i < ((maxAmmo div maxRow) + 1); i++) {
				if (maxAmmo >= (i + 1) * maxRow) {
					for (var j = 0; j < maxRow; j++) {
						switch (proType) {
							case 0: draw_sprite_ext(spr_ammoSmallReload, 2, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, emptyFireTimer / 10); break;
							case 1: draw_sprite_ext(spr_ammoBigReload, 2, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, emptyFireTimer / 10); break;
							case 2: draw_sprite_ext(spr_ammoShotgunReload, 2, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, emptyFireTimer / 10); break;
							case 3: draw_sprite_ext(spr_ammoExplosiveReload, 2, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, emptyFireTimer / 10); break;
							case 4: draw_sprite_ext(spr_ammoIncendiaryReload, 2, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, emptyFireTimer / 10); break;
						}
					}
				} else {
					for (var j = 0; j < maxAmmo % maxRow; j++) {
						switch (proType) {
							case 0: draw_sprite_ext(spr_ammoSmallReload, 2, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, emptyFireTimer / 10); break;
							case 1: draw_sprite_ext(spr_ammoBigReload, 2, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, emptyFireTimer / 10); break;
							case 2: draw_sprite_ext(spr_ammoShotgunReload, 2, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, emptyFireTimer / 10); break;
							case 3: draw_sprite_ext(spr_ammoExplosiveReload, 2, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, emptyFireTimer / 10); break;
							case 4: draw_sprite_ext(spr_ammoIncendiaryReload, 2, x + j * xMulti, y - i * yMulti, 5, 5, 0, c_white, emptyFireTimer / 10); break;
						}
					}
				}
			}
		}
	}
}
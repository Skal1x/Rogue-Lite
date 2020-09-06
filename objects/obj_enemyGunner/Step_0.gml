#region Alert State Activation
if (enemyState < 1 && instance_exists(obj_player)) { 
	if ((distance_to_object(obj_gunSoundQue) <= hearingDistance) || (!collision_line(x, y, obj_player.x, obj_player.y, obj_wall, 1, true) && (distance_to_object(obj_player) <= sightDistance))) {
		enemyState = 1; 
		alarm[0] = 20;
	}
}
#endregion

#region Sprite and animation Management
//Flip Image according to Movement Direction
if (lastX > x || gun.x > x) {
	image_xscale = -1;
} else if (lastX < x || gun.x < x) {
	image_xscale = 1;
}

lastX = x;

//Handle Image Depth
depth = -y;

//Draw Running Animation while Chasing
if (enemyState == 2) {
	sprite_index = spr_debugEnemyGunnerRun;
	image_speed = 0.25;
} else {
	sprite_index = spr_debugEnemyGunnerIdle;
	image_speed = 0.04;
}
#endregion

#region Death
if (hp <= 0) {
	instance_destroy();
	for (var i = 0; i < 10; i++) {
		instance_create_depth(x + random_range(-8,8), y + random_range(-8,8), -y, obj_bloodPart);
	}
	with (instance_create_depth(x, y, -y, obj_gunDropped)) {
		gunState = other.gunState;
		sprite_index = getSpriteForGun(gunState.general.gType, gunState.general.rarity);
	};
}
#endregion

#region Fire Slow Effect
if (enemyState != 3) {
	if (place_meeting(x,y,obj_fire)) {
		curRunSpeed = maxRunSpeed / 2;
	} else {
		curRunSpeed = maxRunSpeed;
	}
}
#endregion

#region Gun Fire Cooldown
if (gunState.status.fireReadyCD > 0) {
	gunState.status.fireReadyCD--;
}
#endregion

#region Semi Firedelay
if (semiTimer > 0 && semiDelay) {
	semiTimer--;
}

if (semiTimer == 0) {
	semiDelay = false;	
}
#endregion

#region Reloading
if (gunState.general.ammoInMag == 0 && !isReloading) {
	isReloading = true;
	reloadTimer = gunState.reload.ejection.time + gunState.reload.loading.time;
}

if (reloadTimer > 0) {
	reloadTimer--;
}

if (reloadTimer <= 0 && isReloading) {
	isReloading = false;
	if (gunState.general.ammoInRes >= gunState.general.magCap) {
		gunState.general.ammoInMag = gunState.general.magCap;
		gunState.general.ammoInRes -= gunState.general.magCap;
	} else {
		gunState.general.ammoInMag = gunState.general.ammoInRes;
		gunState.general.ammoInRes = 0;
	}
}
#endregion

#region Chambering
if (!isChambered && !isChambering) {
	chamberTimer = gunState.reload.chamber.time;
	isChambering = true;
}

if (chamberTimer > 0) {
	chamberTimer--;
}

if (chamberTimer <= 0) {
	isChambered = true;
	isChambering = false;
}
#endregion

#region Enemy State Controller
switch (enemyState) {
	case 1: //Get Alerted To Player
		drawAlert = true;
		if (!startChase) {
			alarm[0] = 20;
			startChase = true;
		}
		break;
	case 2: // Chase Player
		drawAlert = false;
		if (instance_exists(obj_player)) {
			if (mp_grid_path(global.grid, path, x, y, obj_player.x, obj_player.y,1)) {
				path_start(path, curRunSpeed, path_action_stop, false);
			}
		}
		break;
	case 3: //Do the Pew
		path_end();
		if (instance_exists(obj_player)) {
			if (gunState.status.fireReadyCD == 0 && gunState.general.ammoInMag > 0 && isChambered && !semiDelay) {
				if (gunState.stats.burst.remaining == 0) {
					with (instance_create_depth(x,y,-y,obj_enemyBullet)) {
						parent = other.id;
						bulletSpeed = parent.gunState.stats.bullet.bSpeed;
						range = parent.gunState.stats.bullet.bRange;
						damage = parent.gunState.stats.damage;
						expSize = parent.gunState.stats.explosion.radius;
						expDamage = parent.gunState.stats.explosion.damage;
						curFireInacc = parent.gunState.stats.fireInaccuracy;
						spread = parent.gunState.stats.spread;
					
						dir = point_direction(x,y,obj_player.x,obj_player.y) + random_range(- spread, spread) + random_range(-(abs(parent.vspeed) * 10 + abs(parent.hspeed) * 10),(abs(parent.vspeed) * 10 + abs(parent.hspeed) * 10) + random_range(-curFireInacc,curFireInacc));
						radian = dir * (pi / 180);
						stepX = cos(radian);
							stepY = sin(radian) * -1;
						switch (parent.gunState.stats.bullet.bType) {
							case 0: sprite_index = spr_bulletSmall; break;
							case 1: sprite_index = spr_bulletLarge; break;
							case 2: sprite_index = spr_bulletShotgun; break;
							case 3: sprite_index = spr_bulletExplosive; break;
							case 4: sprite_index = spr_bulletIncendiary; break;
					}
				}
				audio_play_sound(snd_gunShotGeneric,1,0);
				if (gunState.stats.fireMode == "single") isChambered = false;
				if (gunState.stats.fireMode == "burst") gunState.stats.burst.remaining = gunState.stats.burst.size;
				if (gunState.stats.fireMode == "semi") { semiDelay = true; semiTimer = irandom_range(20,60); }
				gunState.general.ammoInMag--;
				gunState.status.fireReadyCD = gunState.stats.fireRate;
			}
		}
	}
}
#endregion

#region Forceful Shooting of Burst
if (gunState.stats.burst.remaining > 0 && gunState.status.fireReadyCD == 0) {
	if (gunState.general.ammoInMag > 0) {
		gunState.stats.burst.remaining--;
		with (instance_create_depth(x,y,-y,obj_enemyBullet)) {
			parent = other.id;
			bulletSpeed = parent.gunState.stats.bullet.bSpeed;
			range = parent.gunState.stats.bullet.bRange;
			damage = parent.gunState.stats.damage;
			expSize = parent.gunState.stats.explosion.radius;
			expDamage = parent.gunState.stats.explosion.damage;
			curFireInacc = parent.gunState.stats.fireInaccuracy;
			spread = parent.gunState.stats.spread;
			
			if (instance_exists(obj_player)) {
				dir = point_direction(x,y,obj_player.x,obj_player.y) + random_range(- spread, spread) + random_range(-(abs(parent.vspeed) * 10 + abs(parent.hspeed) * 10),(abs(parent.vspeed) * 10 + abs(parent.hspeed) * 10) + random_range(-curFireInacc,curFireInacc));
			} else {
				dir = point_direction(x,y,obj_playerGrave.x,obj_playerGrave.y) + random_range(- spread, spread) + random_range(-(abs(parent.vspeed) * 10 + abs(parent.hspeed) * 10),(abs(parent.vspeed) * 10 + abs(parent.hspeed) * 10) + random_range(-curFireInacc,curFireInacc));
			}
			radian = dir * (pi / 180);
			stepX = cos(radian);
			stepY = sin(radian) * -1;
			switch (parent.gunState.stats.bullet.bType) {
				case 0: sprite_index = spr_bulletSmall; break;
				case 1: sprite_index = spr_bulletLarge; break;
				case 2: sprite_index = spr_bulletShotgun; break;
				case 3: sprite_index = spr_bulletExplosive; break;
				case 4: sprite_index = spr_bulletIncendiary; break;
			}
		}
		
		gunState.stats.burst.remaining--;
		gunState.general.ammoInMag--;
		gunState.status.fireReadyCD = gunState.stats.fireRate;
	} else {
		gunState.stats.burst.remaining = 0;
	}
}
#endregion

#region Player Distance and LoS Checker
if (instance_exists(obj_player) && enemyState > 1) {
	if (!collision_line(x, y, obj_player.x, obj_player.y, obj_wall, 1, true) && point_distance(x, y, obj_player.x, obj_player.y) < 100 && enemyState == 2) {
		enemyState = 3;
	}
	if ((collision_line(x, y, obj_player.x, obj_player.y, obj_wall, 1, true) || point_distance(x, y, obj_player.x, obj_player.y) > 120) && enemyState == 3) {
		enemyState = 2;
	}
}
#endregion
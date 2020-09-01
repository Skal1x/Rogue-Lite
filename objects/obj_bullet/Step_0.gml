#region Hit Detection and Movement
for (var i = 0; i < bulletSpeed; i++) {
	
	#region Move One Step
	x += stepX;
	y += stepY;
	#endregion
	
	#region Collision with Enemy
	if (place_meeting(x,y,obj_enemyHitBox)) {
		collider = instance_nearest(x,y,obj_enemyHitBox);
		if (sprite_index = spr_bulletLarge) {
			collider.parent.hp -= damage * 1.5;
		} else {
			collider.parent.hp -= damage;
		}
		if (sprite_index = spr_bulletExplosive) {
			var explosion = instance_create_depth(x,y,-y-256,obj_explosion);
			explosion.damage = expDamage;
			explosion.maxSize = expSize;
		}
		if (sprite_index = spr_bulletIncendiary) {
			var fire = instance_create_depth(x,y,-y + 200,obj_fire);
			fire.damage = expDamage / 240;
			fire.maxSize = expSize;
		}
		destroy = true;
		for (var i = 0; i < 6; i++) {
			instance_create_depth(x + random_range(-8,8), y + random_range(-8,8), -y, obj_bloodPart);
		}
		break;
	}
	#endregion

	#region Collision with Wall
	if (place_meeting(x,y,obj_wall)) {
		decal = instance_create_depth(x,y,-y-5,obj_bulletDecal);
		with (decal) {
			image_angle = other.image_angle;
			motion_set(image_angle,0.5);
		}
		if (sprite_index = spr_bulletExplosive) {
			var explosion = instance_create_depth(x,y,-y-256,obj_explosion);
			explosion.damage = expDamage;
			explosion.maxSize = expSize;
		}
		if (sprite_index = spr_bulletIncendiary) {
			var fire = instance_create_depth(x,y,-y + 200,obj_fire);
			fire.damage = expDamage / 240;
			fire.maxSize = expSize;
		}
		destroy = true;
		break;
	}
	#endregion
	
	#region Reached End of Range
	if (range > 0) {
		range--;
	} else {
		if (sprite_index = spr_bulletExplosive) {
			var explosion = instance_create_depth(x,y,-y-256,obj_explosion);
			explosion.damage = expDamage;
			explosion.maxSize = expSize;
		}
		if (sprite_index = spr_bulletIncendiary) {
			var fire = instance_create_depth(x,y,-y + 200,obj_fire);
			fire.damage = expDamage / 240;
			fire.maxSize = expSize;
		}
		decal = instance_create_depth(x,y,-y-5,obj_bulletDecal);
		with (decal) {
			image_angle = other.image_angle;
			motion_set(image_angle,0.5);
		}
		destroy = true;
		break;
	}
	#endregion
	
	#region Create Particles
	switch (sprite_index) {
		case spr_bulletSmall: part_particles_create(obj_gameController.partSys,x + random_range(-2,2), y + random_range(-2,2),obj_gameController.smallBallisticPart, 1); break;
		case spr_bulletLarge: part_particles_create(obj_gameController.partSys,x + random_range(-2,2), y + random_range(-2,2),obj_gameController.largeBallisticPart, 1); break;
		case spr_bulletShotgun: part_particles_create(obj_gameController.partSys,x + random_range(-2,2), y + random_range(-2,2),obj_gameController.shotgunPart, 1); break;
		case spr_bulletExplosive: part_particles_create(obj_gameController.partSys,x + random_range(-2,2), y + random_range(-2,2),obj_gameController.explosivePart, 1); break;
		case spr_bulletIncendiary: part_particles_create(obj_gameController.partSys,x + random_range(-2,2), y + random_range(-2,2),obj_gameController.incendiaryPart, 1); break;
	}
	#endregion
}
#endregion

#region Self Destruction
if (destroy) instance_destroy();
#endregion
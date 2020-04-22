

if (curSize < maxSize) {
	curSize += maxSize / 20;
	if (curSize > maxSize) curSize = maxSize;
}

for (var i = 0; i < image_alpha * 5 div 1; i++) {
	part_particles_create(obj_gameController.partSys,x + random_range(-curSize / 2, curSize / 2), y + random_range(-curSize / 2, curSize / 2), obj_gameController.incendiaryPartEffect, 1);
}

curDamage = damage * image_alpha;

if (stayTime > 0) {
	stayTime--;
} else {
	image_alpha -= decay;
}

if (image_alpha <= 0) instance_destroy();

image_xscale = curSize / 64;
image_yscale = curSize / 64;
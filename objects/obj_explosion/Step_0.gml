if (curSize >= maxSize) image_alpha -= decay;

if (curSize < maxSize) {
	curSize += maxSize / 20;
	if (curSize > maxSize) curSize = maxSize;
}

if (image_alpha == 1 && curSize == maxSize) {
	for (var i = 0; i < 100; i++) {
		part_particles_create(obj_gameController.partSys, x + random_range(-curSize / 2,curSize / 2), y + random_range(-curSize / 2,curSize / 2), obj_gameController.explosiveEffectPart, 1);
	}
	obj_gameController.shakeAmount += maxSize / 8;
}

if (image_alpha <= 0) instance_destroy();

image_xscale = curSize / 64;
image_yscale = curSize / 64;
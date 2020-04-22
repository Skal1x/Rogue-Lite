if (image_xscale > 0) {
	image_xscale -= randomDecay;
	image_yscale -= randomDecay;
} else {
	instance_destroy();
}

if (randomSpingDirection == 1) {
	image_angle += randomSpinSpeed;
} else {
	image_angle -= randomSpinSpeed;
}

depth = -y;
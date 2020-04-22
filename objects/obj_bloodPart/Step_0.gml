if (image_alpha > 0) {
	image_alpha -= randomDecay
	image_xscale += randomScaleIncrease;
	image_yscale += randomScaleIncrease;
} else {
	instance_destroy();
}

depth = -y + 1;
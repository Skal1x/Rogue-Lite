if (enableRotating) {
	image_angle += randomRotation;
}
if (depthReduction > 0) {
	depth += 0.1;
	depthReduction--;
}
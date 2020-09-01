if (parent != 0) {
	if (instance_exists(parent)) {
		x = parent.x;
		y = parent.y;
		
		depth = -y - 1;
	} else {
		instance_destroy();
	}
}
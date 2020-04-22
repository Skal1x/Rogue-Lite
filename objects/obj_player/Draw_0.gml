if (!invul) {
	draw_self();
} else {
	if (invulTimer <= 2) {
		draw_self()
		if (invulTimer == 0) {
			invulTimer = 4;
		} else {
			invulTimer--;
		}
	} else if (invulTimer > 2) {
		invulTimer--;
	}
}
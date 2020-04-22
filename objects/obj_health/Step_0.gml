if (instance_exists(obj_player)) {
	if (hp > obj_player.hp) {
		with (instance_create_depth(x + (hp - 1) * 40, y, -y-1000, obj_healthDrop)) {
			image_xscale = 4;
			image_yscale = 4;
		}
		hp = obj_player.hp;
	}
}

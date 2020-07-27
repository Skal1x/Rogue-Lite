//Stay On Player
if (instance_exists(obj_player) &&  instance_exists(parent)) {
	dir = point_direction(parent.x,parent.y,obj_player.x,obj_player.y);
	rad = dir * (pi / 180);
	disX = cos(rad) * 6;
	disY = sin(rad) * -1 * 6;

	x = parent.x + disX;
	y = parent.y + disY;
	
	image_angle = dir;
	
	depth = -y -10;
	
	if (image_angle >= 90 && image_angle <= 270) {
		image_yscale = -1;
	} else {
		image_yscale = 1;
	}
} else {
	instance_destroy();
}
if(instance_exists(obj_player)) {
	/*
	//Player Speed Compensation
	if (mouse_x < obj_player.x) {
		if (mouse_y < obj_player.y) {
			if (obj_player.hsp < 0) {
				
			}
		} else {
			
		}
	} else {
		
	}
	*/
	
	image_angle = point_direction(obj_player.x, obj_player.y, mouse_x, mouse_y);
	image_xscale = 1 + abs(obj_player.hsp) / obj_player.maxRunSpeed / 2 + abs(obj_player.vsp) / obj_player.maxRunSpeed / 2;
	image_yscale = 1 + abs(obj_player.hsp) / obj_player.maxRunSpeed / 2 + abs(obj_player.vsp) / obj_player.maxRunSpeed / 2;
	
	completeSpread = obj_player.spread + abs(obj_player.hsp) * 10 + abs(obj_player.vsp) * 10;
	lineSpread = completeSpread;
	
	lineOneDir = point_direction(obj_player.x, obj_player.y, mouse_x, mouse_y) + lineSpread;
	lineTwoDir = point_direction(obj_player.x, obj_player.y, mouse_x, mouse_y) - lineSpread;
	
	lineOneRad = lineOneDir * (pi / 180);
	lineTwoRad = lineTwoDir * (pi / 180);
	
	lineOneX = obj_player.x + cos(lineOneRad) * point_distance(obj_player.x, obj_player.y, mouse_x, mouse_y);
	lineOneY = obj_player.y + sin(lineOneRad) * point_distance(obj_player.x, obj_player.y, mouse_x, mouse_y) * -1;
	
	lineTwoX = obj_player.x + cos(lineTwoRad) * point_distance(obj_player.x, obj_player.y, mouse_x, mouse_y);
	lineTwoY = obj_player.y + sin(lineTwoRad) * point_distance(obj_player.x, obj_player.y, mouse_x, mouse_y) * -1;
}

depth = -y - 1000;
if(instance_exists(obj_player)) {
	
	x = obj_player.x;
	y = obj_player.y;
	
	curHsp = obj_player.hsp;
	curVsp = obj_player.vsp;
	
	dir = point_direction(obj_player.x,obj_player.y,mouse_x,mouse_y);
	radian = dir * (pi / 180);
	stepX = cos(radian);
	stepY = sin(radian) * -1;
	
	image_angle = point_direction(obj_player.x, obj_player.y, mouse_x, mouse_y);
	image_xscale = 1 + abs(obj_player.hsp) / obj_player.maxRunSpeed / 2 + abs(obj_player.vsp) / obj_player.maxRunSpeed / 2;
	image_yscale = 1 + abs(obj_player.hsp) / obj_player.maxRunSpeed / 2 + abs(obj_player.vsp) / obj_player.maxRunSpeed / 2;
	
	completeSpread = obj_player.inv[obj_player.slot].stats.spread + obj_player.curFireInacc + abs(obj_player.hsp) * 10 + abs(obj_player.vsp) * 10;
	
	if (completeSpread > 110) completeSpread = 110;
	
	lineSpread = completeSpread;
	
	lineOneDir = point_direction(obj_player.x, obj_player.y, mouse_x, mouse_y) + lineSpread;
	lineTwoDir = point_direction(obj_player.x, obj_player.y, mouse_x, mouse_y) - lineSpread;
	
	lineOneRad = lineOneDir * (pi / 180);
	lineTwoRad = lineTwoDir * (pi / 180);
	
	if (mouse_x < obj_player.x) xFactor = -1; else xFactor = 1;
	if (mouse_y < obj_player.y) yFactor = -1; else yFactor = 1;
	
	lineOneX = obj_player.x + cos(lineOneRad) * point_distance(obj_player.x, obj_player.y, mouse_x, mouse_y) + stepX * curHsp * xFactor;
	lineOneY = (obj_player.y + sin(lineOneRad) * point_distance(obj_player.x, obj_player.y, mouse_x, mouse_y) * -1) + stepY * curVsp * yFactor;
	
	lineTwoX = obj_player.x + cos(lineTwoRad) * point_distance(obj_player.x, obj_player.y, mouse_x, mouse_y) + stepX * curHsp * xFactor;
	lineTwoY = (obj_player.y + sin(lineTwoRad) * point_distance(obj_player.x, obj_player.y, mouse_x, mouse_y) * -1) + stepY * curVsp * yFactor;
}

depth = -y - 1000;
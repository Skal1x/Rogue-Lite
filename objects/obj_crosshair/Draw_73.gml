

if (instance_exists(obj_player)) {
	draw_set_circle_precision(64);
	for (var i = 0; i < 5; i++) {
		draw_circle(obj_player.x, obj_player.y, point_distance(obj_player.x, obj_player.y, mouse_x, mouse_y) - i / 5, 1);
	}
	
	draw_set_color(c_black);
	draw_line_width(obj_player.x, obj_player.y, lineOneX, lineOneY, 1);
	draw_line_width(obj_player.x, obj_player.y, lineTwoX, lineTwoY, 1);
	/*
	draw_set_color(c_yellow);
	draw_circle(mouse_x, mouse_y, 2, 0);
	draw_line_width(mouse_x, mouse_y,lineOneX, lineOneY, 3);
	draw_line_width(mouse_x, mouse_y,lineTwoX, lineTwoY, 3);
	*/
	
	/*
	draw_sprite_ext(spr_spreadCone, 0, obj_player.x, obj_player.y, (point_distance(obj_player.x, obj_player.y, mouse_x, mouse_y) + 64) / 64, point_distance(lineOneX, lineOneY, lineTwoX, lineTwoY) / 64, point_direction(obj_player.x, obj_player.y, mouse_x, mouse_y) + 180, c_white, 0.5);
	*/
	
	draw_set_color(c_white);
	draw_line_width(lineOneX, lineOneY, lineTwoX, lineTwoY, 2);
	draw_set_color(c_black);
	draw_line_width(lineOneX, lineOneY, lineTwoX, lineTwoY, 1);
}



if (instance_exists(obj_player)) {
	/*
	draw_set_circle_precision(64);
	for (var i = 0; i < 5; i++) {
		draw_circle(obj_player.x, obj_player.y, point_distance(obj_player.x, obj_player.y, mouse_x, mouse_y) - i / 5, 1);
	}
	
	draw_set_color(c_black);
	draw_line_width(obj_player.x, obj_player.y, lineOneX, lineOneY, 1);
	draw_line_width(obj_player.x, obj_player.y, lineTwoX, lineTwoY, 1);
	*/
	draw_set_color(c_black);
	draw_circle(mouse_x, mouse_y, 2, 0);
	draw_line_width(mouse_x, mouse_y,lineOneX, lineOneY, 4);
	draw_line_width(mouse_x, mouse_y,lineTwoX, lineTwoY, 4);
	
	draw_set_color(make_color_rgb(221, 4, 84));
	draw_circle(mouse_x, mouse_y, 1, 0);
	draw_line_width(mouse_x, mouse_y,lineOneX, lineOneY, 2);
	draw_line_width(mouse_x, mouse_y,lineTwoX, lineTwoY, 2);
	
	/*
	draw_sprite_ext(spr_spreadCone, 0, obj_player.x, obj_player.y, (point_distance(obj_player.x, obj_player.y, mouse_x, mouse_y) + 64) / 64, point_distance(lineOneX, lineOneY, lineTwoX, lineTwoY) / 64, point_direction(obj_player.x, obj_player.y, mouse_x, mouse_y) + 180, c_white, 0.5);
	*/
	
	/*
	draw_set_color(c_white);
	draw_line_width(lineOneX, lineOneY, lineTwoX, lineTwoY, 2);
	draw_set_color(c_black);
	draw_line_width(lineOneX, lineOneY, lineTwoX, lineTwoY, 1);
	
	draw_primitive_begin(pr_linestrip);
	
	draw_vertex(lineOneX, lineOneY);
	draw_vertex(mouse_x, mouse_y);
	draw_vertex(lineTwoX, lineTwoY);
	
	draw_primitive_end();
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_black);
	draw_set_font(fnt_genericSmallExtra)
	draw_text(mouse_x, mouse_y, string(curHsp));
	draw_text(mouse_x, mouse_y + 10, string(curVsp));
	draw_text(mouse_x, mouse_y + 20, string(stepX));
	draw_text(mouse_x, mouse_y + 30, string(stepY));
	*/
}

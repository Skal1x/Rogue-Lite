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

if (drawNotice) {
	draw_sprite_ext(spr_pickupNotice, 0, instance_nearest(x, y, obj_gunDropped).x, instance_nearest(x, y, obj_gunDropped).y -8 , 0.6, 0.6, 0, c_white, 1);
}

//Debug Stuff
/*
draw_set_color(c_black);
draw_set_font(fnt_genericSmallExtra);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_line(x, y, instance_nearest(x, y, obj_gunDropped).x, instance_nearest(x, y, obj_gunDropped).y);
draw_text(x + 8, y + 8, string(drawNotice));
draw_text(x + 8, y + 16, string(point_distance(x, y, instance_nearest(x, y, obj_gunDropped).x, instance_nearest(x, y, obj_gunDropped).y)));
*/
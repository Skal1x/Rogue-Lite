if (isLoaded) {
	draw_sprite_ext(spr_healthbarBackground, 0, x + 8, y + 8, 8, 8, 0, c_white, 1);
	
	if (curHp / maxHp < 0.2) {
		draw_sprite_ext(spr_healthbarHealth, 1, x, y + 8, 8 * (curHp / maxHp), 8, 0, c_white, 1);
	} else {
		draw_sprite_ext(spr_healthbarHealth, 0, x, y + 8, 8 * (curHp / maxHp), 8, 0, c_white, 1);
	}

	draw_sprite_ext(spr_healthbarHealthDamage, 0, x, y + 8, 8 * (curHp / maxHp), 8, 0, c_white, healthDamageTimer / 20);
	draw_sprite_ext(spr_healthbarBorder, 0, x, y, 8, 8, 0, c_white, 1);

	draw_set_font(fnt_generic);
	draw_set_halign(fa_right);
	draw_set_valign(fa_top);
	draw_set_color(c_black);
	
	draw_text(x+224,y+104,string(round(hp)) + "/" + string(maxHp));
	draw_text(x+223,y+103,string(round(hp)) + "/" + string(maxHp));
	draw_text(x+222,y+102,string(round(hp)) + "/" + string(maxHp));
	draw_set_color(make_color_rgb(62, 146, 204));
	draw_text(x+222,y+102,string(round(hp)) + "/" + string(maxHp));
}
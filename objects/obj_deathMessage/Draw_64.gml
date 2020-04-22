draw_set_alpha(1);
draw_set_font(fnt_genericBig);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_set_color(make_color_rgb(211,73,19));
draw_text_color(1600 / 2 + 5, 900 / 2 + 5, "YOU DIED", c_black, c_black, c_black, c_black, alpha);
draw_text_color(1600 / 2, 900 / 2, "YOU DIED", color, color, color, color, alpha);

if (drawNotice) {
	draw_set_font(fnt_generic);
	draw_text_color(1600 / 2 + 3, 900 / 2 + 73, "PRESS 'N' TO RESTART", c_black, c_black, c_black, c_black, noticeAlpha);
	draw_text_color(1600 / 2 , 900 / 2 +70, "PRESS 'N' TO RESTART", color, color, color, color, noticeAlpha);
}
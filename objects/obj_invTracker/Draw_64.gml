draw_set_font(fnt_genericSmall);
draw_set_halign(fa_right);
draw_set_valign(fa_top);

draw_set_color(c_black);
for (var i = 0; i <= 35; i++) {
	draw_text(x + 1, y + 1 + i * 16, string(inv[i]));
}

draw_set_color(make_color_rgb(211,73,19));
for (var i = 0; i <= 35; i++) {
	draw_text(x, y + i * 16, string(inv[i]));
}
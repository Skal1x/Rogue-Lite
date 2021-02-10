draw_set_font(fnt_console);
draw_set_halign(fa_right);
draw_set_valign(fa_top);
draw_set_color(c_white);

for (var j = 0; j < ds_list_size(messages); j++) {
	draw_text(x,y + j * 10, ds_list_find_value(messages, j));
}
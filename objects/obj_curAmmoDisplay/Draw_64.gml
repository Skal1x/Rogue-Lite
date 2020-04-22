draw_set_font(fnt_generic);
draw_set_valign(fa_bottom);
draw_set_halign(fa_right);
draw_set_color(c_black);
draw_text(x+3,y+3,"AMMO: " + string(ammoReserve));
draw_set_color(make_color_rgb(211,73,19));
draw_text(x,y,"AMMO: " + string(ammoReserve));
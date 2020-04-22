draw_self();

if (drawAlert) {
	draw_sprite(spr_enemyAlerted, 0, x, y- 12);
}

draw_set_font(fnt_genericSmallExtra);
draw_set_valign(fa_middle);
draw_set_halign(fa_left);
draw_set_color(c_white);
draw_text(x,y -25,string(hp));
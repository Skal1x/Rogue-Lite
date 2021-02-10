draw_self();

if (drawAlert) {
	draw_sprite(spr_enemyAlerted, 0, x, y- 12);
}

/*	DEBUG WEAPON VALUES
draw_set_color(c_white);
draw_set_font(fnt_genericSmallExtra);
draw_text(x+8,y+8,gunState.status.fireReadyCD);
draw_text(x+8,y+16,semiTimer);
draw_text(x+8,y+24,reloadTimer);
draw_text(x+8,y+32,chamberTimer);
draw_text(x+8,y+40,gunState.general.ammoInMag);
draw_text(x+8,y+48,gunState.general.ammoInRes
*/
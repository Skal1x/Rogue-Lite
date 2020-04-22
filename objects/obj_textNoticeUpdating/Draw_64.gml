draw_set_font(fnt_generic);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_color(c_black);
draw_text(x + 3,y + 3,"StepX: " + string(stepX));
draw_set_color(make_color_rgb(211,73,19));
draw_text(x,y,"StepX: " + string(stepX));

draw_set_color(c_black);
draw_text(x + 3,y + 43,"StepY: " + string(stepY));
draw_set_color(make_color_rgb(211,73,19));
draw_text(x,y + 40,"StepY: " + string(stepY));

draw_set_color(c_black);
draw_text(x + 3,y + 83,"Dir: " + string(dir));
draw_set_color(make_color_rgb(211,73,19));
draw_text(x,y + 80,"Dir: " + string(dir));

draw_set_color(c_black);
draw_text(x + 3,y + 123,"Rad: " + string(rad));
draw_set_color(make_color_rgb(211,73,19));
draw_text(x,y + 120,"Rad: " + string(rad));

draw_set_color(c_black);
draw_text(x + 3,y + 163,"S-Reload: " + string(singleReloaded));
draw_set_color(make_color_rgb(211,73,19));
draw_text(x,y + 160,"S-Reload: " + string(singleReloaded));
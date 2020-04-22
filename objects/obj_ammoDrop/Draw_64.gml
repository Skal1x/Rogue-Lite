switch(ammoType) {
	case 0: draw_sprite_ext(spr_ammoSmall, 0, x, y, 5, 5, image_angle, c_white, 1); break;
	case 1: draw_sprite_ext(spr_ammoBig, 0, x, y, 5, 5, image_angle, c_white, 1); break;
	case 2: draw_sprite_ext(spr_ammoShotgun, 0, x, y, 5, 5, image_angle, c_white, 1); break;
	case 3: draw_sprite_ext(spr_ammoExplosive, 0, x, y, 5, 5, image_angle, c_white, 1); break;
	case 4: draw_sprite_ext(spr_ammoIncendiary, 0, x, y, 5, 5, image_angle, c_white, 1); break;
}
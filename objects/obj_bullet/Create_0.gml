bulletSpeed = obj_player.inv[obj_player.slot, 12];
range = obj_player.inv[obj_player.slot, 13];
damage = obj_player.inv[obj_player.slot, 11];
expSize = obj_player.inv[obj_player.slot, 34];
expDamage = obj_player.inv[obj_player.slot, 35];
curFireInacc = obj_player.curFireInacc;
destroy = false;
dir = point_direction(obj_player.x,obj_player.y,mouse_x,mouse_y) + random_range(- obj_player.inv[obj_player.slot, 5], obj_player.inv[obj_player.slot, 5]) + random_range(-(abs(obj_player.vsp) * 10 + abs(obj_player.hsp) * 10),(abs(obj_player.vsp) * 10 + abs(obj_player.hsp) * 10) + random_range(-curFireInacc,curFireInacc));
radian = dir * (pi / 180);
stepX = cos(radian);
stepY = sin(radian) * -1;
switch (obj_player.inv[obj_player.slot, 14]) {
	case 0: sprite_index = spr_bulletSmall; break;
	case 1: sprite_index = spr_bulletLarge; break;
	case 2: sprite_index = spr_bulletShotgun; break;
	case 3: sprite_index = spr_bulletExplosive; break;
	case 4: sprite_index = spr_bulletIncendiary; break;
}
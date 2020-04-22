dir = point_direction(obj_gun.x,obj_gun.y,mouse_x,mouse_y);
rad = point_direction(obj_gun.x,obj_gun.y,mouse_x,mouse_y) * (pi / 180);

stepX = cos(rad);
stepY = sin(rad) * -1;

singleReloaded = obj_gun.singleReloaded;
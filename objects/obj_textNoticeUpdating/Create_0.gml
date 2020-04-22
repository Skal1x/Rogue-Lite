dir = point_direction(obj_gun.x,obj_gun.y,mouse_x,mouse_y);
rad = point_direction(obj_gun.x,obj_gun.y,mouse_x,mouse_y) * (pi / 180);

stepX = cos(point_direction(obj_gun.x,obj_gun.y,mouse_x,mouse_y));
stepY = sin(point_direction(obj_gun.x,obj_gun.y,mouse_x,mouse_y)) * -1;

singleReloaded = obj_gun.singleReloaded;

depth = -1800;
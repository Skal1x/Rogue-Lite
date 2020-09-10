depth = -y;
image_index = 0;
image_speed = 0;
if (place_meeting(x,y-20,obj_wall)) {
	mask_index = spr_wallBaseMaskFull;	
}

//instance_create_depth(x,y,-y,obj_botWall

//Add More forbidden tiles for Boss-Grid
if (!place_meeting(x-16,y-16,obj_wall)) mp_grid_add_rectangle(global.gridBoss, x-15, y-15, x-17, y-17);
if (!place_meeting(x+16,y-16,obj_wall)) mp_grid_add_rectangle(global.gridBoss, x+15, y-15, x+17, y-17);
if (!place_meeting(x-16,y+16,obj_wall)) mp_grid_add_rectangle(global.gridBoss, x-15, y+15, x-17, y+17);
if (!place_meeting(x+16,y+16,obj_wall)) mp_grid_add_rectangle(global.gridBoss, x+15, y+15, x+17, y+17);
if (!place_meeting(x,y-10,obj_wall)) mp_grid_add_rectangle(global.gridBoss, x-1, y-15, x+1, y-17);
if (!place_meeting(x,y+10,obj_wall)) mp_grid_add_rectangle(global.gridBoss, x-1, y+15, x+1, y+17);
if (!place_meeting(x-10,y,obj_wall)) mp_grid_add_rectangle(global.gridBoss, x-15, y-1, x-17, y+1);
if (!place_meeting(x+10,y,obj_wall)) mp_grid_add_rectangle(global.gridBoss, x+15, y-1, x+17, y+1);

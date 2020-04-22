depth = -y;
image_index = 0;
image_speed = 0;
if (place_meeting(x,y-20,obj_wall)) {
	mask_index = spr_wallBaseMaskFull;	
}
//instance_create_depth(x,y,-y,obj_botWall);
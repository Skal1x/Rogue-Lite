draw_self();

if (!place_meeting(x-16,y-16,obj_wall)) draw_sprite(spr_wallBase,1,x,y);
if (!place_meeting(x+16,y-16,obj_wall)) draw_sprite(spr_wallBase,2,x,y);
if (!place_meeting(x-16,y+16,obj_wall)) draw_sprite(spr_wallBase,3,x,y);
if (!place_meeting(x+16,y+16,obj_wall)) draw_sprite(spr_wallBase,4,x,y);
if (!place_meeting(x,y-10,obj_wall)) draw_sprite(spr_wallBase,5,x,y);
if (!place_meeting(x,y+10,obj_wall)) draw_sprite(spr_wallBase,6,x,y);
if (!place_meeting(x-10,y,obj_wall)) draw_sprite(spr_wallBase,7,x,y);
if (!place_meeting(x+10,y,obj_wall)) draw_sprite(spr_wallBase,8,x,y);

if (!place_meeting(x-16,y-16,obj_wall)) draw_sprite(spr_wallBase,9,x,y);
if (!place_meeting(x+16,y-16,obj_wall)) draw_sprite(spr_wallBase,10,x,y);
if (!place_meeting(x-16,y+16,obj_wall)) draw_sprite(spr_wallBase,11,x,y);
if (!place_meeting(x+16,y+16,obj_wall)) draw_sprite(spr_wallBase,12,x,y);
if (!place_meeting(x,y-10,obj_wall)) draw_sprite(spr_wallBase,13,x,y);
if (!place_meeting(x,y+10,obj_wall)) draw_sprite(spr_wallBase,14,x,y);
if (!place_meeting(x-10,y,obj_wall)) draw_sprite(spr_wallBase,15,x,y);
if (!place_meeting(x+10,y,obj_wall)) draw_sprite(spr_wallBase,16,x,y);
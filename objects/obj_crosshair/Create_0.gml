completeSpread = 0;
lineSpread = 0

lineOneX = 0;
lineOneY = 0;
lineOneDir = 0;
lineOneRad = 0;

lineTwoX = 0;
lineTwoY = 0;
lineTwoDir = 0;
lineTwoRad = 0;

/*
curLineOneX = 0;
curLineOneY = 0;
curLineTwoX = 0;
curLineTwoY = 0;
*/

curHsp = 0;
curVsp = 0;

xFactor = 1;
yFactor = 1;
dir = 0;

if (instance_exists(obj_player)) {
	dir = point_direction(obj_player.x,obj_player.y,mouse_x,mouse_y);
}

radian = dir * (pi / 180);
stepX = cos(radian);
stepY = sin(radian);
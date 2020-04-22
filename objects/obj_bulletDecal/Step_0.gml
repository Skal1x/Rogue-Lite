if (moveTime > 0) {
	moveTime--;
} else {
	motion_set(0,0);
}
if (image_alpha > 0) image_alpha -= 0.025; else instance_destroy();
depth = -y-10;
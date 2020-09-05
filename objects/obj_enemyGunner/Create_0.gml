//States
// State 0: Idle
// State 1: Alerted
// State 2: Chasing
// State 3: Engaging

image_speed = 0.04;
hp = 25;
maxRunSpeed = 0.675 + random_range(-0.15,0.15);
curRunSpeed = maxRunSpeed;
enemyState = 0;
drawAlert = false;
startChase = false;
path = path_add();
lastX = x;
fireCooldown = 0;
sightDistance = 50;
hearingDistance = 600;

with (instance_create_depth(x,y,-y, obj_enemyGun)) {
	parent = other.id;
	dir = 0;
	rad = dir * (pi / 180);
	disX = cos(rad) * 6;
	disY = sin(rad) * -1 * 6;

	x = parent.x + disX;
	y = parent.y + disY;
	
	image_angle = dir;
	
	depth = -y -10;
}

with (instance_create_depth(x,y,-y, obj_enemyHitBox)) {
	parent = other.id;
	sprite_index = other.sprite_index;
}

gunState = getGunForEnemy("eGunner", global.mayhem);
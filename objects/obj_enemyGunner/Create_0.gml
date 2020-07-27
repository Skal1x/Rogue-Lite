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

with (instance_create_depth(x,y,-y, obj_enemyGun)) {
	parent = other.id;
}
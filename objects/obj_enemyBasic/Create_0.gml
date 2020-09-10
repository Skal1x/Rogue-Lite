//States
// State 0: Idle
// State 1: Alerted
// State 2: In Combat

image_speed = 0.04;
hp = 30;
maxRunSpeed = 0.675 + random_range(-0.15,0.15);
curRunSpeed = maxRunSpeed;
enemyState = 0;
drawAlert = false;
startChase = false;
path = path_add();
pathTimer = 0;
lastX = x;
didDamage = 0;
sightDistance = 50;
hearingDistance = 600;

with (instance_create_depth(x,y,-y, obj_enemyHitBox)) {
	parent = other.id;
	sprite_index = other.sprite_index;
}
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
lastX = x;
didDamage = 0;

if (instance_exists(obj_player)) {
	maxHp = obj_player.hp;
	hp = obj_player.hp;
	curHp = hp;
	healthDamageTimer = 0;
	prevHp = 0;
	regenCooldown = 0;
	isLoaded = true;
}
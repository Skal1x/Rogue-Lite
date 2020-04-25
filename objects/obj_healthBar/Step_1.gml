if (instance_exists(obj_player)) hp = obj_player.hp; else hp = 0;

if (healthDamageTimer > 0) {
	healthDamageTimer--;
}

if (hp < prevHp) {
	healthDamageTimer = 30;
	regenCooldown = 360;
}

if (instance_exists(obj_player)) {
	if (regenCooldown > 0) {
		regenCooldown--;
	} else {
		if (hp > 0.75 * maxHp && hp < maxHp) {
			hp += 0.1;
			curHp += 0.1
			obj_player.hp += 0.1;
			if (hp > maxHp) {
				hp = maxHp;
				curHp = maxHp;
				obj_player.hp = maxHp;
			}
		} else if (hp > 0.50 * maxHp && hp < 0.75 * maxHp) {
			for (var i = 0; i < 100; i++) {
				if (hp < 0.75 * maxHp) {
					hp += 0.001;
					curHp += 0.001
					obj_player.hp += 0.001;
				} else {
					break;
				}
			}
		} else if (hp > 0.25 * maxHp && hp < 0.5 * maxHp) {
			for (var i = 0; i < 100; i++) {
				if (hp < 0.5 * maxHp) {
					hp += 0.001;
					curHp += 0.001;
					obj_player.hp += 0.001;
				} else {
					break;
				}
			}
		} else if (hp < 0.25 * maxHp) {
			for (var i = 0; i < 100; i++) {
				if (hp < 0.25 * maxHp) {
					hp += 0.001;
					curHp += 0.001;
					obj_player.hp += 0.001;
				} else {
					break;
				}
			}
		}
	}
}

if (curHp > hp && regenCooldown != 0) {
	curHp -= 0.005 + 0.02 * (curHp - hp);
}

if(curHp <= 0) {
	curHp = 0;
}

prevHp = hp;
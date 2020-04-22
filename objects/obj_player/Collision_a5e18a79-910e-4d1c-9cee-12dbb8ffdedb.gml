if (!other.didDamage) {
	hp -= 10.00;
	alarm[2] = 60;
	other.didDamage = true;
	other.alarm[1] = 180;
}
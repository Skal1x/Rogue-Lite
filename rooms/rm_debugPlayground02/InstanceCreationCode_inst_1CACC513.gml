//Set Stats
stats[0] = "Stress Test";		//Name
stats[1] = 1;		//Type of Gun | 0 = No Gun; 1 = Pistol; 2 = MP; 3 = PDW; 4 = AR; 5 = Sniper; 6 = Shotgun; 7 = LMG;
stats[2] = 100;		//Magazine Capacity
stats[3] = 100;		//Current Ammo In Clip
stats[4] = 1000;		//Reserve Ammo
stats[5] = 3;		//Spread
stats[6] = 1;		//Fire Rate
stats[7] = 0;		//Fire Mode | 0 = Full-Auto; 1 = Burst; 2 = Semi-Auto; 3 = Single-Shoit Reload (Pump/Bolt-Action);
stats[8] = 0;		//Amount of Shots per Burst
stats[9] = 0;		//Shots remaining in current Burst
stats[10] = 18;		//Amount of Pellets per Shot
stats[11] = 8;		//Damage
stats[12] = 2;		//Bullet Speed
stats[13] = 800;		//Bullet Range
stats[14] = 2;		//Bullet Type
stats[15] = 0;		//Random Effect | 0 = No Effect; 1 = Self-Destruction;
stats[16] = true;		//Weapon Fire Ready?
stats[17] = stats[6];		//Current Weapon Fire Cooldown
stats[18] = 0;		//Loading State of Gun | 0 = Ready; 1 = Ejecting Mag; 2 = Loading Mag;
stats[19] = 20;		//Mag Ejection Time
stats[20] = false;		//Mag currently ejecting?
stats[21] = stats[19];		//Current remaining ejection Time
stats[22] = 440;		//Reload Time
stats[23] = 0;		//Single-Shot Reload Time (Pump/Bolt-Action only)
stats[24] = stats[22] / 2;		//Start of Perfect Reload Interval
stats[25] = stats[22] / 2 - stats[22] / 4;		//Stop of Perfect Reload Interval
stats[26] = 0;		//Start of Perfect Single-Shot Reload Interval (Pump/Bolt-Action only)
stats[27] = 0;		//Stop of Perfect Single-Shot Reload Interval (Pump/Bolt-Action only)
stats[28] = false;		//Currently Using Pump/Bolt-Action? (Pump/Bolt-Action only)
stats[29] = false;		//Perfect Single-Shot Reload failed? (Pump/Bolt-Action only)
stats[30] = false;		//Perfect Reload Failed?
stats[31] = 0;		//Remaining Reload Time
stats[32] = 0;		//Remaining Single-Shot Reload Time (Pump/Bolt-Action only)
stats[33] = 3;		//Gun Rarity
stats[36] = 3;		//Fire Inaccuracy

//Choose Right Sprite
switch (stats[1]) {
	case 0:
		sprite_index = spr_gunNoGun;
		break;
	case 1:
		switch (stats[33]) {
			case 1: //Standard
				sprite_index = spr_gunPistolTierE;
				break;
			case 2: //Remarkable
				sprite_index = spr_gunPistolTierD;
				break;
			case 3: //Abnormal
				sprite_index = spr_gunPistolTierC;
				break;
			case 4: //Experimental
				sprite_index = spr_gunPistolTierB;
				break;
			case 5://[REDACTED]
				sprite_index = spr_gunPistolTierA;
				break;
		}
		break;
	case 2:
		switch (stats[33]) {
			case 1: //Standard
				sprite_index = spr_gunMPTierE;
				break;
			case 2: //Remarkable
				sprite_index = spr_gunMPTierD;
				break;
			case 3: //Abnormal
				sprite_index = spr_gunMPTierC;
				break;
			case 4: //Experimental
				sprite_index = spr_gunMPTierB;
				break;
			case 5://[REDACTED]
				sprite_index = spr_gunMPTierA;
				break;
		}
		break;
}
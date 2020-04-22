//Set Stats
stats[0] = "Shotgun";		//Name
stats[1] = 6;		//Type of Gun | 0 = No Gun; 1 = Pistol; 2 = MP; 3 = PDW; 4 = AR; 5 = Sniper; 6 = Shotgun; 7 = LMG;
stats[2] = 8;		//Magazine Capacity
stats[3] = 8;		//Current Ammo In Clip
stats[4] = 80;		//Reserve Ammo
stats[5] = 6;		//Spread
stats[6] = 10;		//Fire Rate
stats[7] = 3;		//Fire Mode | 0 = Full-Auto; 1 = Burst; 2 = Semi-Auto; 3 = Single-Shoit Reload (Pump/Bolt-Action);
stats[8] = 0;		//Amount of Shots per Burst
stats[9] = 0;		//Shots remaining in current Burst
stats[10] = 6;		//Amount of Pellets per Shot
stats[11] = 1;		//Damage
stats[12] = 8;		//Bullet Speed
stats[13] = 230;		//Bullet Range
stats[14] = 2;		//Bullet Type
stats[15] = 0;		//Random Effect | 0 = No Effect; 1 = Self-Destruction;
stats[16] = true;		//Weapon Fire Ready?
stats[17] = stats[6];		//Current Weapon Fire Cooldown
stats[18] = 0;		//Loading State of Gun | 0 = Ready; 1 = Ejecting Mag; 2 = Loading Mag;
stats[19] = 80;		//Mag Ejection Time
stats[20] = false;		//Mag currently ejecting?
stats[21] = stats[19];		//Current remaining ejection Time
stats[22] = 400;		//Reload Time
stats[23] = 40;		//Single-Shot Reload Time (Pump/Bolt-Action only)
stats[24] = stats[22] / 2;		//Start of Perfect Reload Interval
stats[25] = stats[22] / 2 - stats[22] / 4;		//Stop of Perfect Reload Interval
stats[26] = stats[23] / 2;		//Start of Perfect Single-Shot Reload Interval (Pump/Bolt-Action only)
stats[27] = stats[23] / 2 - stats[23] / 4;		//Stop of Perfect Single-Shot Reload Interval (Pump/Bolt-Action only)
stats[28] = false;		//Currently Using Pump/Bolt-Action? (Pump/Bolt-Action only)
stats[29] = false;		//Perfect Single-Shot Reload failed? (Pump/Bolt-Action only)
stats[30] = false;		//Perfect Reload Failed?
stats[31] = 0;		//Remaining Reload Time
stats[32] = 0;		//Remaining Single-Shot Reload Time (Pump/Bolt-Action only)
stats[33] = 1;		//Gun Rarity

//Choose Right Sprite
switch (stats[1]) {
	case 0:
		sprite_index = spr_gunNoGun;
		break;
	case 1: switch (stats[33]) {
			case 1: /*Standard*/ sprite_index = spr_gunPistolTierE; break;
			case 2: /*Remarkable*/ sprite_index = spr_gunPistolTierD; break;
			case 3: /*Abnormal*/ sprite_index = spr_gunPistolTierC; break;
			case 4: /*Experimental*/ sprite_index = spr_gunPistolTierB; break;
			case 5: /*[REDACTED]*/ sprite_index = spr_gunPistolTierA; break; } break;
	case 2: switch (stats[33]) {
			case 1: /*Standard*/ sprite_index = spr_gunMPTierE; break;
			case 2: /*Remarkable*/ sprite_index = spr_gunMPTierD; break;
			case 3: /*Abnormal*/ sprite_index = spr_gunMPTierC; break;
			case 4: /*Experimental*/ sprite_index = spr_gunMPTierB; break;
			case 5: /*[REDACTED]*/ sprite_index = spr_gunMPTierA; break; } break;
	case 6: switch (stats[33]) {
			case 1: /*Standard*/ sprite_index = spr_gunShotgunTierE; break;
			case 2: /*Remarkable*/ sprite_index = spr_gunShotgunTierD; break;
			case 3: /*Abnormal*/ sprite_index = spr_gunShotgunTierC; break;
			case 4: /*Experimental*/ sprite_index = spr_gunShotgunTierB; break;
			case 5: /*[REDACTED]*/ sprite_index = spr_gunShotgunTierA; break; } break;
}
#region Stats Description List
/*
stats[0] = name;
stats[1] = gunType;
stats[2] = maxMag;
stats[3] = curMag;
stats[4] = curAmmo;
stats[5] = spread;
stats[6] = fireRate;
stats[7] = fireMode;
stats[8] = burstAmount;
stats[9] = curBurst;
stats[10] = pelletAmount;
stats[11] = bulletDamage;
stats[12] = projectileSpeed;
stats[13] = projectileRange;
stats[14] = projectileType;
stats[15] = randomEffect;
stats[16] = fireReady;
stats[17] = curFireCooldown;
stats[18] = gunState;
stats[19] = ejectSpeed;
stats[20] = ejecting;
stats[21] = ejectTimer;
stats[22] = reloadTime;
stats[23] = singleReloadTime;
stats[24] = exeReloadStart;
stats[25] = exeReloadStop;
stats[26] = exeSingleReloadStart;
stats[27] = exeSingleReloadStop;
stats[28] = singleReloading;
stats[29] = singleReloadFailed;
stats[30] = reloadFailed;
stats[31] = curReload;
stats[32] = curSingleReload;
stats[33] = rarity;
stats[34] = expRadius;
stats[35] = expDamage;
*/
#endregion

#region Stats Setup
stats[35] = 0;

//Set Stats
stats[0] = "";		//Name
stats[1] = 0;		//Type of Gun | 0 = No Gun; 1 = Pistol; 2 = MP; 3 = PDW; 4 = AR; 5 = Sniper; 6 = Shotgun; 7 = LMG;
stats[2] = 0;		//Magazine Capacity
stats[3] = 0;		//Current Ammo In Clip
stats[4] = 0;		//Reserve Ammo
stats[5] = 0;		//Spread
stats[6] = 0;		//Fire Rate
stats[7] = 0;		//Fire Mode | 0 = Full-Auto; 1 = Burst; 2 = Semi-Auto; 3 = Single-Shot Reload (Pump/Bolt-Action);
stats[8] = 0;		//Amount of Shots per Burst
stats[9] = 0;		//Shots remaining in current Burst
stats[10] = 0;		//Amount of Pellets per Shot
stats[11] = 0;		//Damage
stats[12] = 0;		//Bullet Speed
stats[13] = 0;		//Bullet Range
stats[14] = 0;		//Bullet Type | 0 = Small Ballistic; 1 = Large Ballistic; 2 = Shotgun/Buckshot, 3 = Explosive; 4 = Incendiary
stats[15] = 0;		//Random Effect | 0 = No Effect; 1 = Self-Destruction;
stats[16] = true;		//Weapon Fire Ready?
stats[17] = 0;		//Current Weapon Fire Cooldown
stats[18] = 0;		//Loading State of Gun | 0 = Ready; 1 = Ejecting Mag; 2 = Loading Mag;
stats[19] = 0;		//Mag Ejection Time
stats[20] = false;		//Mag currently ejecting?
stats[21] = 0;		//Current remaining ejection Time
stats[22] = 0;		//Reload Time
stats[23] = 0;		//Single-Shot Reload Time (Pump/Bolt-Action only)
stats[24] = 0;		//Start of Perfect Reload Interval
stats[25] = 0;		//Stop of Perfect Reload Interval
stats[26] = 0;		//Start of Perfect Single-Shot Reload Interval (Pump/Bolt-Action only)
stats[27] = 0;		//Stop of Perfect Single-Shot Reload Interval (Pump/Bolt-Action only)
stats[28] = false;		//Currently Using Pump/Bolt-Action? (Pump/Bolt-Action only)
stats[29] = false;		//Perfect Single-Shot Reload failed? (Pump/Bolt-Action only)
stats[30] = false;		//Perfect Reload Failed?
stats[31] = 0;		//Remaining Reload Time
stats[32] = 0;		//Remaining Single-Shot Reload Time (Pump/Bolt-Action only)
stats[33] = 0;		//Gun Rarity
stats[34] = 0;		//Explosion Radius
stats[35] = 0;		//Explosion Damage
#endregion

#region Animation Cancel
//Stop Shoot Thank
image_speed = 0;
#endregion
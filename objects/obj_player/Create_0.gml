///Initialize Variables

//Basic Values (Health, Speed)
hp = 100.00;
hsp = 0;
vsp = 0;
maxRunSpeed = 1.5;
runSpeed = maxRunSpeed;
drag =0.5;
dash = false;
dashTimer = 0;
allowDash = true;

//Inventory
slot = 0;
weaponPickedUp = false;
weaponSwitched = false;

//Initialise Inventory
inv[1, 35] = 0;
for (var i = 0; i <= 1; i++) {
	for (var j = 0; j <= 35; j++) {
		if (j == 0) {
			inv[i, j] = "EMPTY";
		} else if (j == 16 || j == 20 || j == 28 || j == 29 || j == 30){
			inv[i, j] = false;
		} else {
			inv[i, j] = 0;
		}
	}
}

/*
LIST
00 = Weapon Name
01 = Weapon Type / 0 = No Weapon; 1 = Pistol; 2 = MP; 3 = PDW; 4 = AR; 5 = Sniper; 6 = Shotgun; 7 = LMG
02 = Maximum Mag Capacity
03 = Current Ammo in Mag
04 = Ammo in Reserve
05 = Weapon Spread
06 = Fire Rate
07 = Fire Mode
08 = Size of Bursts
09 = Remaining Shots in current Burst
10 = Amount of Pellets per Shot (Shotgun Rounds only)
11 = Damage
12 = Bullet-Speed
13 = Bullet-Range
14 = Type of Projectile / 0 = Small Ballistic; 1 = Large Ballistic; 2 = Shotgun/Buckshot; 3 = explosive; 4 = Incendiary
15 = Random Effect / 0 = No Effect; 1 = Self Destruction
16 = Weapon Ready to Fire?
17 = Current Cooldown before ready to Fire
18 = Current Gunstate / 0 = Fire Ready; 1 = Ejecting Mag; 2 = Loading Mag;
19 = Ejection Time
20 = Mag currently Ejecting?
21 = Time before Mag-Ejection complete
22 = Reload Time
23 = Single Shot Reload Time (Pump/Bolt-Action only)
24 = Start of Perfect Reload Timeframe
25 = Stop of Perfect Reload Timeframe
26 = Start of Perfect Single Shot Reload Timeframe (Pump/Bolt-Action only)
27 = Stop of Perfect Single Shot Reload Timeframe (Pump/Bolt-Action only)
28 = Currently using Pump/Bolt-Action?
29 = Single Shot Perfect Reload Failed?
30 = Perfect Reload Failed?
31 = Remaining Time on Reload
32 = Remaining Time on Single Shot Reload
33 = Rarity / 0 = No Rarity; 1 = Standard; 2 = Remarkable; 3 = Abnormal; 4 = Experimental; 5 = [REDACTED]; 6 = SPECIAL
34 = Explosion Radius
35 = Explosion Damage
*/

//Damage Invulnerability
invul = false;
invulTimer = 0;

//Gun Details
name = "gun";
gunType = 1;
rarity = 0;

//Gun Variables
maxMag = 24;
curMag = 24;
curAmmo = 240;
spread = 16;
fireRate = 10;
fireMode = 0; // 0 = Full-Auto, 1 = Burst, 2 = Semi-Auto, 3 = Singlefire (Pump/Bolt)
burstAmount = 3;
curBurst = 0;
pelletAmount = 0;
bulletDamage = 1;
projectileSpeed = 10;
projectileRange = 300;
projectileType = 0; // 0 = Small Ballistic, 1 = Large Ballistic, 2 = Shotgun/Buckshot, 3 = Explosive, 4 = Incendiary, 5 = Grenade
randomEffect = 0; // 0 = No Effect, 1 = Self-Destruct
fireReady = true;
curFireCooldown = fireRate;
expRadius = 0;

//Reloading
gunState = 0;
ejectSpeed = 60;
ejecting = false;
ejectTimer = ejectSpeed;
reloadTime = 140;
singleReloadTime = 80;
exeReloadStart = reloadTime / 2;
exeReloadStop = reloadTime / 2 - reloadTime / 4;
exeSingleReloadStart = singleReloadTime / 2;
exeSingleReloadStop = singleReloadTime / 2 - singleReloadTime / 4;
singleReloading = false;
singleReloadFailed = false;
reloadFailed = false;
curReload = reloadTime;
curSingleReload = singleReloadTime;

//Weapon Stat Reset (For Testing)
name = "EMPTY";
gunType = 0;
maxMag = 0;
curMag = 0;
curAmmo = 0;
spread = 0;
fireRate = 0;
fireMode = 0;
burstAmount = 0;
curBurst = 0;
pelletAmount = 0;
bulletDamage = 0;
projectileSpeed = 0;
projectileRange = 0;
projectileType = 0;
randomEffect = 0;
fireReady = false;
curFireCooldown = 0;
gunState = 0;
ejectSpeed = 0;
ejecting = false;
ejectSpeed = 0;
reloadTime = 0;
singleReloadTime = 0;
exeReloadStart = 0;
exeReloadStop = 0;
exeSingleReloadStart = 0;
exeSingleReloadStop = 0;
singleReloading = false;
singleReloadFailed = false;
reloadFailed = false;
curReload = 0;
curSingleReload = 0;
rarity = 0;
expDamage = 0;
//Misc
image_speed = 0.5;
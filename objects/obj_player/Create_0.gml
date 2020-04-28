///Initialize Variables

#region Basic Values (Health, Speed, Dash)
hp = 100.00;
hsp = 0;
vsp = 0;
maxRunSpeed = 1.5;
runSpeed = maxRunSpeed;
drag =0.005;
dash = false;
dashTimer = 0;
allowDash = true;
drawNotice = false;
curFireInacc = 0;
image_speed = 0.5;
#endregion

#region Inventory Initialization
slot = 0;
weaponPickedUp = false;
weaponSwitched = false;

//Initialise Inventory
inv[1, 36] = 0;
for (var i = 0; i <= 1; i++) {
	for (var j = 0; j <= 36; j++) {
		if (j == 0) {
			inv[i, j] = "EMPTY";
		} else if (j == 16 || j == 20 || j == 28 || j == 29 || j == 30){
			inv[i, j] = false;
		} else {
			inv[i, j] = 0;
		}
	}
}
#endregion

#region Inventory Array Description List
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
36 = Firing Inaccuracy
*/
#endregion

#region Invulnerability
invul = false;
invulTimer = 0;
#endregion
///Initialize Variables

#region Basic Values (Health, Speed, Dash)
hp = 100.00;
hsp = 0;
vsp = 0;
maxRunSpeed = 1;
runSpeed = maxRunSpeed;
dash = false;
dashTimer = 0;
allowDash = true;
drawNotice = false;
curFireInacc = 0;
invSize = 2;
godMode = false;
image_speed = 0.5;
#endregion

#region Inventory Initialization
slot = 0;
weaponPickedUp = false;
weaponSwitched = false;

defaultGunState = {
	general: {
		gName: "",
		rarity: 0,
		gType: "none",
		magCap: 0,
		ammoInMag: 0,
		ammoInRes: 0,
	},
	stats: {
		damage: 0,
		fireRate: 0,
		fireMode: "auto",
		isSingleShot: false,
		burst: {
			size: 0,
			remaining: 0,
		},
		pelletsPerShot: 0,
		spread: 0,
		fireInaccuracy: 0,
		bullet: {
			bType: 0,
			bSpeed: 0,
			bRange: 0,
		},
		randomEffect: 0,
		explosion: {
			radius: 0,
			damage: 0,
		},
	},
	status: {
		state: 0,
		fireReady: true,
		fireReadyCD: 0,
	},
	reload: {
		ejection: {
			time: 0,
			status: false,
			timeRemaining: 0,
		},
		loading: {
			time: 0,
			hSTimeframeStart: 0,
			hSTimeframeStop: 0,
			timeRemaining: 0,
			hSFailed: false,
		},
		chamber: {
			time: 0,
			inProcess: false,
			hSTimeframeStart: 0,
			hSTimeframeStop: 0,
			timeRemaining: 0,
			hSFailed: false,
		},
	},
};

inv[invSize - 1] = noone;

for (var i = 0; i < array_length(inv); i++) {
	inv[i] = defaultGunState;
}
#endregion

#region Invulnerability
invul = false;
invulTimer = 0;
#endregion
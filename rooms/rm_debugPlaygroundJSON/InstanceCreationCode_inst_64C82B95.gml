gunState = {
	general: {
		gName: "Generic Shotgun",
		rarity: 4,
		gType: "shotgun",
		magCap: 8,
		ammoInMag: 8,
		ammoInRes: 80,
	},
	stats: {
		damage: 12,
		fireRate: 20,
		fireMode: "single",
		isSingleShot: false,
		burst: {
			size: 0,
			remaining: 0,
		},
		pelletsPerShot: 9,
		spread: 12,
		fireInaccuracy: 15,
		bullet: {
			bType: 4,
			bSpeed: 4,
			bRange: 200,
		},
		randomEffect: 0,
		explosion: {
			radius: 100,
			damage: 2000,
		},
	},
	status: {
		state: 0,
		fireReady: true,
		fireReadyCD: 10,
	},
	reload: {
		ejection: {
			time: 40,
			status: false,
			timeRemaining: 40,
		},
		loading: {
			time: 800,
			hSTimeframeStart: 400,
			hSTimeframeStop: 200,
			timeRemaining: 800,
			hSFailed: false,
		},
		chamber: {
			time: 100,
			inProcess: false,
			hSTimeframeStart: 50,
			hSTimeframeStop: 25,
			timeRemaining: 100,
			hSFailed: false,
		},
	},
};

//Choose Right Sprite
switch (gunState.general.gType) {
	case "none":
		sprite_index = spr_gunNoGun;
		break;
	case "pistol": switch (gunState.general.rarity) {
			case 1: /*Standard*/ sprite_index = spr_gunPistolTierE; break;
			case 2: /*Remarkable*/ sprite_index = spr_gunPistolTierD; break;
			case 3: /*Abnormal*/ sprite_index = spr_gunPistolTierC; break;
			case 4: /*Experimental*/ sprite_index = spr_gunPistolTierB; break;
			case 5: /*[REDACTED]*/ sprite_index = spr_gunPistolTierA; break; } break;
	case "mp": switch (gunState.general.rarity) {
			case 1: /*Standard*/ sprite_index = spr_gunMPTierE; break;
			case 2: /*Remarkable*/ sprite_index = spr_gunMPTierD; break;
			case 3: /*Abnormal*/ sprite_index = spr_gunMPTierC; break;
			case 4: /*Experimental*/ sprite_index = spr_gunMPTierB; break;
			case 5: /*[REDACTED]*/ sprite_index = spr_gunMPTierA; break; } break;
	case "shotgun": switch (gunState.general.rarity) {
			case 1: /*Standard*/ sprite_index = spr_gunShotgunTierE; break;
			case 2: /*Remarkable*/ sprite_index = spr_gunShotgunTierD; break;
			case 3: /*Abnormal*/ sprite_index = spr_gunShotgunTierC; break;
			case 4: /*Experimental*/ sprite_index = spr_gunShotgunTierB; break;
			case 5: /*[REDACTED]*/ sprite_index = spr_gunShotgunTierA; break; } break;
}
gunState = {
	general: {
		gName: "McBursty",
		rarity: 5,
		gType: "mp",
		magCap: 2000,
		ammoInMag: 2000,
		ammoInRes: 100000,
	},
	stats: {
		damage: 1,
		fireRate: 3,
		fireMode: "burst",
		isSingleShot: false,
		burst: {
			size: 2000,
			remaining: 0,
		},
		pelletsPerShot: 1,
		spread: 3,
		fireInaccuracy: 4,
		bullet: {
			bType: 0,
			bSpeed: 30,
			bRange: 500,
		},
		randomEffect: 0,
		explosion: {
			radius: 160,
			damage: 40,
		},
	},
	status: {
		state: 0,
		fireReady: true,
		fireReadyCD: 0,
	},
	reload: {
		ejection: {
			time: 80,
			status: false,
			timeRemaining: 80,
		},
		loading: {
			time: 400,
			hSTimeframeStart: 200,
			hSTimeframeStop: 100,
			timeRemaining: 400,
			hSFailed: false,
		},
		chamber: {
			time: 40,
			inProcess: false,
			hSTimeframeStart: 20,
			hSTimeframeStop: 10,
			timeRemaining: 40,
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
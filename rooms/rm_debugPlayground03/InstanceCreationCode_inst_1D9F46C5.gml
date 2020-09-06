gunState = {
	general: {
		gName: "Fast MP",
		rarity: 3,
		gType: "mp",
		magCap: 30,
		ammoInMag: 30,
		ammoInRes: 300,
	},
	stats: {
		damage: 5,
		fireRate: 7,
		fireMode: "auto",
		isSingleShot: false,
		burst: {
			size: 0,
			remaining: 0,
		},
		pelletsPerShot: 1,
		spread: 5,
		fireInaccuracy: 5,
		bullet: {
			bType: 0,
			bSpeed: 20,
			bRange: 400,
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
		fireReadyCD: 10,
	},
	reload: {
		ejection: {
			time: 40,
			status: false,
			timeRemaining: 40,
		},
		loading: {
			time: 200,
			hSTimeframeStart: 100,
			hSTimeframeStop: 50,
			timeRemaining: 200,
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
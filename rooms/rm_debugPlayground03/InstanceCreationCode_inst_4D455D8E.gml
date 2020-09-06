gunState = {
	general: {
		gName: "EXEPOLOSION",
		rarity: 1,
		gType: "pistol",
		magCap: 12,
		ammoInMag: 12,
		ammoInRes: 60,
	},
	stats: {
		damage: 1,
		fireRate: 20,
		fireMode: "auto",
		isSingleShot: false,
		burst: {
			size: 0,
			remaining: 0,
		},
		pelletsPerShot: 1,
		spread: 2,
		fireInaccuracy: 0,
		bullet: {
			bType: 3,
			bSpeed: 6,
			bRange: 200,
		},
		randomEffect: 0,
		explosion: {
			radius: 40,
			damage: 30,
		},
	},
	status: {
		state: 0,
		fireReady: false,
		fireReadyCD: 0,
	},
	reload: {
		ejection: {
			time: 360,
			status: false,
			timeRemaining: 0,
		},
		loading: {
			time: 400,
			hSTimeframeStart: 200,
			hSTimeframeStop: 100,
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

sprite_index = getSpriteForGun(gunState.general.gType, gunState.general.rarity);
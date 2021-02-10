gunState = {
	general: {
		gName: "Stress Test",
		rarity: 5,
		gType: "pistol",
		magCap: 200,
		ammoInMag: 200,
		ammoInRes: 1000,
	},
	stats: {
		damage: 1,
		fireRate: 1,
		fireMode: "auto",
		isSingleShot: false,
		burst: {
			size: 0,
			remaining: 0,
		},
		pelletsPerShot: 5,
		spread: 6,
		fireInaccuracy: 7,
		bullet: {
			bType: 2,
			bSpeed: 8,
			bRange: 230,
		},
		randomEffect: 0,
		explosion: {
			radius: 0,
			damage: 0,
		},
	},
	status: {
		state: 0,
		fireReady: false,
		fireReadyCD: 0,
	},
	reload: {
		ejection: {
			time: 80,
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
			time: 40,
			inProcess: false,
			hSTimeframeStart: 20,
			hSTimeframeStop: 10,
			timeRemaining: 0,
			hSFailed: false,
		},
	},
};

sprite_index = getSpriteForGun(gunState.general.gType, gunState.general.rarity);
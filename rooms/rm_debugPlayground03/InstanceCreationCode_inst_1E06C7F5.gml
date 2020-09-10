gunState = {
	general: {
		gName: "Stress Test",
		rarity: 5,
		gType: "pistol",
		magCap: 100,
		ammoInMag: 100,
		ammoInRes: 1000,
	},
	stats: {
		damage: 8,
		fireRate: 1,
		fireMode: "auto",
		isSingleShot: false,
		burst: {
			size: 0,
			remaining: 0,
		},
		pelletsPerShot: 18,
		spread: 3,
		fireInaccuracy: 3,
		bullet: {
			bType: 2,
			bSpeed: 2,
			bRange: 800,
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
			time: 20,
			status: false,
			timeRemaining: 0,
		},
		loading: {
			time: 440,
			hSTimeframeStart: 220,
			hSTimeframeStop: 110,
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
gunState = {
	general: {
		gName: "Boomer",
		rarity: 1,
		gType: "shotgun",
		magCap: 8,
		ammoInMag: 8,
		ammoInRes: 80,
	},
	stats: {
		damage: 10,
		fireRate: 10,
		fireMode: "single",
		isSingleShot: false,
		burst: {
			size: 0,
			remaining: 0,
		},
		pelletsPerShot: 1,
		spread: 6,
		fireInaccuracy: 7,
		bullet: {
			bType: 3,
			bSpeed: 8,
			bRange: 230,
		},
		randomEffect: 0,
		explosion: {
			radius: 200,
			damage: 150,
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
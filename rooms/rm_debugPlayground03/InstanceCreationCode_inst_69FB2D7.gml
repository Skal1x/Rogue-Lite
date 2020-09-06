gunState = {
	general: {
		gName: "McBursty",
		rarity: 1,
		gType: "pistol",
		magCap: 15,
		ammoInMag: 15,
		ammoInRes: 150,
	},
	stats: {
		damage: 5,
		fireRate: 5,
		fireMode: "burst",
		isSingleShot: false,
		burst: {
			size: 3,
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
		fireReadyCD: 5,
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

sprite_index = getSpriteForGun(gunState.general.gType, gunState.general.rarity);
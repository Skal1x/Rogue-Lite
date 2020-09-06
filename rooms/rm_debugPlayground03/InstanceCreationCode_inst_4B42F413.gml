gunState = {
	general: {
		gName: "Filthy Pyro Main",
		rarity: 4,
		gType: "mp",
		magCap: 16,
		ammoInMag: 16,
		ammoInRes: 160,
	},
	stats: {
		damage: 10,
		fireRate: 20,
		fireMode: "auto",
		isSingleShot: false,
		burst: {
			size: 0,
			remaining: 0,
		},
		pelletsPerShot: 1,
		spread: 4,
		fireInaccuracy: 8,
		bullet: {
			bType: 4,
			bSpeed: 6,
			bRange: 200,
		},
		randomEffect: 0,
		explosion: {
			radius: 45,
			damage: 10,
		},
	},
	status: {
		state: 0,
		fireReady: true,
		fireReadyCD: 20,
	},
	reload: {
		ejection: {
			time: 200,
			status: false,
			timeRemaining: 0,
		},
		loading: {
			time: 300,
			hSTimeframeStart: 150,
			hSTimeframeStop: 75,
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
gunState = {
	general: {
		gName: "MP with Brim",
		rarity: 1,
		gType: "mp",
		magCap: 14,
		ammoInMag: 14,
		ammoInRes: 140,
	},
	stats: {
		damage: 9,
		fireRate: 16,
		fireMode: "auto",
		isSingleShot: false,
		burst: {
			size: 0,
			remaining: 0,
		},
		pelletsPerShot: 1,
		spread: 3,
		fireInaccuracy: 0,
		bullet: {
			bType: 2,
			bSpeed: 10,
			bRange: 260,
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
		fireReadyCD: 16,
	},
	reload: {
		ejection: {
			time: 80,
			status: false,
			timeRemaining: 0,
		},
		loading: {
			time: 200,
			hSTimeframeStart: 100,
			hSTimeframeStop: 50,
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
// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function getGunForEnemy(enemyType){
	if (global.mayhem) {
		//TODO
	} else {
		switch(enemyType) {
			case "eGunner":
				gunState = {
					general: {
						gName: "My First Gun <3",
						rarity: 1,
						gType: "pistol",
						magCap: irandom_range(4,16),
						ammoInMag: 0,
						ammoInRes: 0,
					},
					stats: {
						damage: irandom_range(4,16),
						fireRate: irandom_range(4,16),
						fireMode: "auto",
						isSingleShot: false,
						burst: {
							size: 0,
							remaining: 0,
						},
						pelletsPerShot: 0,
						spread: 0,
						fireInaccuracy: 0,
						bullet: {
							bType: irandom_range(0,2),
							bSpeed: irandom_range(6,10),
							bRange: irandom_range(120,180),
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
							time: irandom_range(60,180),
							status: false,
							timeRemaining: 0,
						},
						loading: {
							time: irandom_range(120,200),
							hSTimeframeStart: 0,
							hSTimeframeStop: 0,
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
				
				gunState.general.ammoInMag = gunState.general.magCap;
				gunState.general.ammoInRes = gunState.general.magCap * irandom_range(4,10);
				
				return gunState;
				break;
			
		}
	}
}
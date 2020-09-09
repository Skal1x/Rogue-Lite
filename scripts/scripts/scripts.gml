// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function getGunForEnemy(enemyType, isMayhem){
	if (isMayhem) {
		//TODO
	} else {
		switch(enemyType) {
			case "eGunner":
				gunState = {
					general: {
						gName: "My First Gun <3",
						rarity: 1,
						gType: "pistol",
						magCap: irandom_range(1,5),
						ammoInMag: 0,
						ammoInRes: 0,
					},
					stats: {
						damage: irandom_range(1,3),
						fireRate: irandom_range(25,40),
						fireMode: getRandomFireMode(),
						isSingleShot: false,
						burst: {
							size: irandom_range(2,10),
							remaining: 0,
						},
						pelletsPerShot: 1,
						spread: random_range(0.5,5),
						fireInaccuracy: random_range(0.5,2),
						bullet: {
							bType: irandom_range(0,1),
							bSpeed: irandom_range(6,10),
							bRange: irandom_range(120,300),
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
							time: irandom_range(40,200),
							inProcess: false,
							hSTimeframeStart: 0,
							hSTimeframeStop: 0,
							timeRemaining: 0,
							hSFailed: false,
						},
					},
				};
				
				gunState.reload.loading.hSTimeframeStart = gunState.reload.loading.time * random_range(0.4,0.6);
				gunState.reload.loading.hSTimeframeStop = gunState.reload.loading.time * random_range(0.2,0.4);
				
				gunState.reload.chamber.hSTimeframeStart = gunState.reload.chamber.time * random_range(0.4,0.6);
				gunState.reload.chamber.hSTimeframeStop = gunState.reload.chamber.time * random_range(0.2,0.4);
				
				gunState.general.ammoInMag = gunState.general.magCap;
				gunState.general.ammoInRes = gunState.general.magCap * irandom_range(4,10);
				
				return gunState;
				break;
			
		}
	}
}
	
function getSpriteForGun(gunType, rarity) {
	switch (gunType) {
		case "none":
			return spr_gunNoGun; break;
		case "pistol": 
			switch (rarity) {
				case 1: /*Standard*/ return spr_gunPistolTierE; break;
				case 2: /*Remarkable*/ return spr_gunPistolTierD; break;
				case 3: /*Abnormal*/ return spr_gunPistolTierC; break;
				case 4: /*Experimental*/ return spr_gunPistolTierB; break;
				case 5: /*[REDACTED]*/ return spr_gunPistolTierA; break; 
			} 
		break;
		case "mp": 
			switch (rarity) {
				case 1: /*Standard*/ return spr_gunMPTierE; break;
				case 2: /*Remarkable*/ return spr_gunMPTierD; break;
				case 3: /*Abnormal*/ return spr_gunMPTierC; break;
				case 4: /*Experimental*/ return spr_gunMPTierB; break;
				case 5: /*[REDACTED]*/ return spr_gunMPTierA; break; 
			} 
		break;
		case "shotgun": 
			switch (rarity) {
				case 1: /*Standard*/ return spr_gunShotgunTierE; break;
				case 2: /*Remarkable*/ return spr_gunShotgunTierD; break;
				case 3: /*Abnormal*/ return spr_gunShotgunTierC; break;
				case 4: /*Experimental*/ return spr_gunShotgunTierB; break;
				case 5: /*[REDACTED]*/ return spr_gunShotgunTierA; break; 
			} 
		break;
	}	
}
	
function getRandomFireMode() {
	var index = irandom_range(0,3);
	switch(index) {
		case 0: 
			return "auto";
			break;
		case 1:
			return "burst";
			break;
		case 2:
			return "semi";
			break;
		case 3:
			return "single";
			break;
	}
}
	
function getSpawnerTexture(enemyType) {
	switch (enemyType) {
		case "charger":
			return 0;
			break;
		case "gunman":
			return 1;
			break;
	}
}
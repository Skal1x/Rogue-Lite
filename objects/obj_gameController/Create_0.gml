partSys = part_system_create();
part_system_depth(partSys, -2000);

smallBallisticPart = part_type_create();
part_type_sprite(smallBallisticPart, spr_bulletPartSmall, 0, 0, 0);
part_type_life(smallBallisticPart, 10, 20);
part_type_size(smallBallisticPart, 0.75, 1.25, -0.025, 0);
part_type_orientation(smallBallisticPart, 0, 360, 12, 0, 0);
part_type_alpha2(smallBallisticPart, 1, 0);

largeBallisticPart = part_type_create();
part_type_sprite(largeBallisticPart, spr_bulletPartLarge, 0, 0, 0);
part_type_life(largeBallisticPart, 10, 20);
part_type_size(largeBallisticPart, 0.75, 1.25, -0.025, 0);
part_type_orientation(largeBallisticPart, 0, 360, 12, 0, 0);
part_type_alpha2(largeBallisticPart, 1, 0);

shotgunPart = part_type_create();
part_type_sprite(shotgunPart, spr_bulletPartShotgun, 0, 0, 0);
part_type_life(shotgunPart, 10, 20);
part_type_size(shotgunPart, 0.75, 1.25, -0.025, 0);
part_type_orientation(shotgunPart, 0, 360, 12, 0, 0);
part_type_alpha2(shotgunPart, 1, 0);

explosivePart = part_type_create();
part_type_sprite(explosivePart, spr_bulletPartExplosive, 0, 0, 0);
part_type_life(explosivePart, 10, 20);
part_type_size(explosivePart, 0.75, 1.25, -0.025, 0);
part_type_orientation(explosivePart, 0, 360, 12, 0, 0);
part_type_alpha2(explosivePart, 1, 0);

explosiveEffectPart = part_type_create();
part_type_sprite(explosiveEffectPart, spr_bulletPartExplosiveEffect, 0, 0, 0);
part_type_life(explosiveEffectPart, 50, 100);
part_type_size(explosiveEffectPart, 1, 2, -0.025, 0);
part_type_orientation(explosiveEffectPart, 0, 360, 6, 0, 0);
part_type_alpha2(explosiveEffectPart, 1, 0);

incendiaryPart = part_type_create();
part_type_sprite(incendiaryPart, spr_bulletPartIncendiary, 0, 0, 0);
part_type_life(incendiaryPart, 10, 20);
part_type_size(incendiaryPart, 0.75, 1.25, -0.025, 0);
part_type_orientation(incendiaryPart, 0, 360, 12, 0, 0);
part_type_alpha2(incendiaryPart, 1, 0);

incendiaryPartEffect = part_type_create();
part_type_sprite(incendiaryPartEffect, spr_bulletPartIncendiaryEffect, 0, 0, 0);
part_type_life(incendiaryPartEffect, 100, 200);
part_type_size(incendiaryPartEffect, 0.5, 1, -0.025, 0);
part_type_alpha2(incendiaryPartEffect, 1, 0);
part_type_gravity(incendiaryPartEffect, 0.025, 90);

//Screen Shake
viewX = camera_get_view_x(view_camera[0]);
viewY = camera_get_view_y(view_camera[0]);
shakeAmount = 0;
maxShake = 30;

if (instance_exists(obj_player)) {
	camera_set_view_target(view_camera[0], obj_player);
	camera_set_view_border(view_camera[0],448,252);
	viewX = obj_player.x - 224;
	viewY = obj_player.y - 126;
}
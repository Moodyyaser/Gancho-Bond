/// @desc physics apply force
physics_apply_force(x,y+1, 0,130);
if place_meeting(x,y,obj_lava)
{
	hp -= 1;
	effect_create_below(ef_smokeup, x,y, 0, c_gray);
	if hp <= 0
	{
		effect_create_above(ef_ring, x,y, 1, 8377265);
		effect_create_above(ef_spark, x,y, 1, 8377265);
		audio_play_sound(snd_kill_enemy, 1, false);
		instance_destroy();
		with obj_lava instance_change(obj_blacklava, false);
		layer_set_visible(layer_get_id("Tiles"), false);
		layer_set_visible(layer_get_id("Tiles_2"), true);
	}
}
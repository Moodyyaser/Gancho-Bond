/// @desc check water
if place_meeting(x,y, obj_water)
{
	hp -= 1;
	effect_create_below(ef_smokeup, x,y, 0, c_gray);
	if hp <= 0
	{
		effect_create_above(ef_ring, x,y, 0, 3551214);
		audio_play_sound(snd_kill_enemy, 1, false);
		alarm[0] = 60;
		phy_position_x=-1000;
	}
}
physics_apply_force(x,y+1, 0,100);
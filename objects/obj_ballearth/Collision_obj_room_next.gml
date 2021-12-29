/// @desc bounce
with obj_grap
if instance_exists(hold)
	if hold.object_index == obj_ballearth
		instance_destroy();

if phy_speed>1
{
	var sbounce = audio_play_sound(snd_bounce, 1, false);
	audio_sound_gain(sbounce, clamp(phy_speed/8,0,1), 0);
}
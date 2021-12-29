/// @desc bounce
if phy_speed>1
{
	var sbounce = audio_play_sound(snd_bounce, 1, false);
	audio_sound_gain(sbounce, clamp(phy_speed/8,0,1), 0);
}
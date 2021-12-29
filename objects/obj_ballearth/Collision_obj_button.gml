/// @desc open
if other.image_index == 0
{
	audio_play_sound(snd_lock, 1, false);
	other.image_index = 1;
	other.resist = 10;
	phy_speed_x = 0;
	phy_speed_y = 0;
	xstart= x;
	ystart= y;
}
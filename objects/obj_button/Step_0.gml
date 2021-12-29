/// @desc
if image_index == 1
if !place_meeting(x,y,obj_ballearth)
{
	resist -=1;
	if resist<=0
	{
		audio_play_sound(snd_lock, 1, false);
		image_index = 0;
	}
}
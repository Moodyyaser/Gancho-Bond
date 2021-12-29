/// @desc
if !instance_exists(obj_player)
{
	time_back -= 1;
	if time_back<=0
	{
		if global.location == -1
		{
			with obj_death instance_destroy();
			room_goto(rm_desert1);
			global.back_to_cp = 1;
			global.back_x = 1936;
			global.back_y = 460;
			instance_create_layer(-1000, 1000, "Instances", obj_player);
			instance_destroy();
		}
		else
		{
			with obj_death instance_destroy();
			room_goto(global.location);
			global.back_to_cp = 1;
			instance_create_layer(-1000, 1000, "Instances", obj_player);
			instance_destroy();
		}
	}
}
if global.music_play
if !audio_is_playing(mus_cave)
	if current_time-global.music_time>=684
		audio_play_sound(mus_cave, 10, true);
		
//if global.music_play
//if !audio_is_playing(mus_cave)
//	if current_time-global.music_time>=684
//		audio_sound_gain(global.desert, 10, true);
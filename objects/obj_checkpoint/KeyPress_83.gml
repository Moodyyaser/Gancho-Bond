/// @desc
if image_index == 0 && place_meeting(x,y-1, obj_player)
{
	audio_play_sound(snd_save, 1, false);
	global.check = id;
	image_index = 1;
	health = 5;
	global.location = room;
	global.back_x = obj_player.x;
	global.back_y = obj_player.y;
	obj_player.iframe = 53;
}
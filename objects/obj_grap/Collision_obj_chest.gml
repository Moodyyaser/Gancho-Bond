/// @desc open it
if other.image_index == 0
{
	other.image_index = 1;
	audio_play_sound(snd_open, 1, false);
	if global.cups == 0
	{
		global.cups = 1;
		audio_play_sound(snd_half, 1, false);
	}
	else
	{
		global.cups = 2;
		audio_play_sound(snd_win, 1, false);
	}
	repeat 2
	with instance_create_depth(other.x+19,other.y+38, 0, obj_particle_chain)
		image_index = 1;
	other.alarm[0] = 60;
	audio_play_sound(snd_hurt_enemy, 1, false);
	other.vspeed = -3;
	other.gravity = 1;
	other.hspeed = lengthdir_x(3, direction);
	instance_destroy();
}
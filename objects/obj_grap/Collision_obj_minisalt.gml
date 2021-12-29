/// @desc
audio_play_sound(snd_hurt_enemy, 1, false);
var dir = point_direction(xprevious,yprevious, x,y);
with other
{
	hspeed = lengthdir_x(32, dir);
	vspeed = lengthdir_y(32, dir);
	audio_play_sound(snd_hurt_enemy, 1, false);
}
instance_destroy();
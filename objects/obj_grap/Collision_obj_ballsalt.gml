/// @desc shoot it
if hspd > 0 && vspd > 0 && retract==0 && obj_player.hooked==0
{
	audio_play_sound(snd_hurt_enemy, 1, false);
	with other
	{
		speed = 32;
		direction = other.direction;
		audio_play_sound(snd_hurt_enemy, 1, false);
	}
	instance_destroy();
}
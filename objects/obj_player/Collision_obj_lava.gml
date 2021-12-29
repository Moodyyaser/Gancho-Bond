/// @desc get killed
if iframe==0
{
	iframe = 60;
	
	//Recoil
	health -= 10;
	audio_play_sound(snd_hurt, 1, false);
	with obj_grap instance_destroy();
	if health<=0
	{
		instance_destroy();
		audio_play_sound(snd_death, 1, false);
	}
}
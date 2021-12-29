/// @desc
get_hot += 2-global.difficulty;
if get_hot>350 effect_create_below(ef_smokeup,x,y+16, 0, c_gray);
if get_hot>480
{
	get_hot=0;
	iframe = 60;
		
	//Recoil
	var dire_rec = 90;
	hsp = lengthdir_x(16-global.difficulty*8, dire_rec);
	vsp = lengthdir_y(16-global.difficulty*8, dire_rec);
	health -= 1;
	audio_play_sound(snd_hurt, 1, false);
	with obj_grap instance_destroy();
	if health<=0
	{
		instance_destroy();
		audio_play_sound(snd_death, 1, false);
	}
}

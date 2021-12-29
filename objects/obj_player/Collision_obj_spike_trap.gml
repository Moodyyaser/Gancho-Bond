/// @desc get hurt
if iframe==0
{
	iframe = 60;
	
	//Recoil
	var dire_rec = point_direction(other.x, other.y, x,y);
	hsp = lengthdir_x(16-global.difficulty*8, dire_rec);
	vsp = lengthdir_y(16-global.difficulty*8, dire_rec);
	health -= 2;
	audio_play_sound(snd_hurt, 1, false);
	with obj_grap instance_destroy();
	if health<=0
	{
		instance_destroy();
		audio_play_sound(snd_death, 1, false);
	}
}
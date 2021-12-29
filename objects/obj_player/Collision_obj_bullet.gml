/// @desc get hurt or collect it
if (other.hurts && other.image_index != 1) || other.image_index == 6
{
	if other.image_index == 3
		vsp -= 24-global.difficulty*12;
	else
	if iframe==0
	{
		// get hurt
		iframe = 60;
	
		//Recoil
		var dire_rec = point_direction(other.x, other.y, x,y);
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
}
else if fireball == 0
{
	fireball = other.image_index+1;
	audio_play_sound(snd_coin, 1, false);
	with other instance_destroy();
}
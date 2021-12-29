/// @desc get it
if hspd > 0 && vspd > 0 && retract==0 && obj_player.hooked==0
{
	hold = other.id;
	retract = 1;
	other.y-=2;
	x=other.x;
	y=other.y;
	if other.object_index == obj_ballsulphur
		speed = 4;
	else if other.object_index == obj_ballearth
	{
		speed = 8-global.difficulty*2;
		with obj_ballearth
		{
			startx = x-other.x;
			starty = y-other.y;
		}
	}
	audio_play_sound(snd_hook, 1, false);
}
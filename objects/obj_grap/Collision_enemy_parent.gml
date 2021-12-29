/// @desc hurt enemy
if retract
{
	instance_destroy();
	exit;
}
if hspd > 0 && vspd > 0
{
	if other.iframe==0
	{
		other.iframe = 40;
	
		//Recoil
		var dire_rec = direction;
		with other
		{
			hsp = lengthdir_x(16, dire_rec);
			vsp = lengthdir_y(16, dire_rec)-4;
			audio_play_sound(snd_hurt_enemy, 1, false);
			hp -= 1;
			if hp<=0
			{
				instance_destroy();
				audio_play_sound(snd_kill_enemy, 1, false);
			}
		}
		with enemy_parent if distance_to_object(other)<160 chase = true;
	}
	instance_destroy();
}
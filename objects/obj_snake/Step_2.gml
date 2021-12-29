/// @desc check collisions

var ins = instance_place(x,y,obj_platform);
if ins
{
	y = other.y-20;
	vsp = 0;
	x+=other.hspeed;
	if other.vspeed>0
		y+=other.vspeed;
}
if place_meeting(x,y,obj_ballsalt)
{
	if iframe==0
	{
		iframe = 40;
		//Recoil
		hsp = 0;
		vsp = -4;
		audio_play_sound(snd_hurt_enemy, 1, false);
		hp -= 1;
		if hp<=0
		{
			instance_destroy();
			audio_play_sound(snd_kill_enemy, 1, false);
		}
	}
}
if place_meeting(x,y,obj_spike_trap)
{
	instance_destroy();
	audio_play_sound(snd_kill_enemy, 1, false);
}
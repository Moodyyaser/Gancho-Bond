/// @desc stick to it
if hold == noone
{
	while (place_meeting(x,y,other)) {
	    x -= lengthdir_x(1, direction);
	    y -= lengthdir_y(1, direction);
	}
	obj_player.hooked = 1;
	obj_player.hsp = 0;
	obj_player.vsp = 0;
	obj_player.hspd = hspd;
	obj_player.vspd = vspd;
	hspd=0;
	vspd=0;
	audio_play_sound(snd_hook, 1, false);
}
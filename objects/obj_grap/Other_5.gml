/// @desc return player back to normal
if obj_player.hooked
{
	obj_player.hooked = 0;
	obj_player.hspd = 0;
	obj_player.vspd = 0;
	if !global.difficulty
	{
		obj_player.hsp = lengthdir_x(12, direction);
		obj_player.vsp = lengthdir_y(12, direction);
	}
}
obj_player.alarm[0] = 30;
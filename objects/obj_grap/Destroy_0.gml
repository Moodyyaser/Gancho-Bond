/// @desc return player back to normal
if instance_exists(obj_player)
{
	if obj_player.hooked
	{
		obj_player.hooked = 0;
		if global.difficulty
		{
			obj_player.hspd = 0;
			obj_player.vspd = 0;
		}
		else
		{
			obj_player.hsp = obj_player.hspd;
			obj_player.vsp = obj_player.vspd;
			obj_player.hspd = 0;
			obj_player.vspd = 0;
		}
	}
	obj_player.alarm[0] = 30;
	if dynamite obj_player.dynamite = 1;
}

if instance_exists(hold)
	if global.difficulty
	if hold.object_index == obj_ballearth
	with obj_ballearth
	if other.hold != id
	{
		mask_index = -1;
		phy_speed_x = other.hspd;
		phy_speed_y = other.vspd;
	}
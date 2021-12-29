/// @desc restart
if global.location == -1
{
	with obj_death instance_destroy();
	room_goto(rm_desert1);
	global.back_to_cp = 1;
	global.back_x = 1936;
	global.back_y = 460;
	instance_create_layer(-1000, 1000, "Instances", obj_player);
	instance_destroy();
}
else
{
	with obj_death instance_destroy();
	room_goto(global.location);
	global.back_to_cp = 1;
	instance_create_layer(-1000, 1000, "Instances", obj_player);
	instance_destroy();
}
/// @desc open when switch is activated
if image_index == 0
if global.button
	instance_destroy();
if image_index == 1 && !instance_exists(enemy_parent)
{
	instance_destroy();
	if room == rm_cave_down5
	room_persistent = true;
}
if image_index == 2
{
	if obj_button.image_index == 1
	{
		visible = false;
		solid = false;
		x = -1000
	}
	else
	{
		visible = true;
		solid = true;
		x=xstart;
	}
}
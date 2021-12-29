/// @desc destroy things
with obj_text instance_destroy();
with obj_grap instance_destroy();
with obj_fly
{
	x = xstart;
	y = ystart;
	chase = 0;
}
with obj_snake
{
	hp = 2;
	x = xstart;
	y = ystart;
}
with obj_scorpion
{
	hp = 2;
	x = xstart;
	y = ystart;
}
with obj_checkpoint image_index = 0;
with ballparent
{
	x = xstart;
	y = ystart;
	phy_position_x = xstart;
	phy_position_y = ystart;
	phy_speed_x = 0;
	phy_speed_y = 0;
	phy_rotation = 0;
}
global.check = noone;
instance_destroy(obj_controller);
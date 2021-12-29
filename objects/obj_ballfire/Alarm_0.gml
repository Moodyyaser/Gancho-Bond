/// @desc go back
phy_position_x=xstart;
phy_position_y=ystart;
phy_speed_x=0;
phy_speed_y=0;
phy_rotation = 0;
hp = 30;
if instance_exists(obj_grap)
if obj_grap.hold == id
{
	obj_grap.hold = noone;
	instance_destroy(obj_grap);
}
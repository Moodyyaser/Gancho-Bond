/// @desc destroy
if instance_exists(hold)
{
	if hold.phy_active
	{
		hold.phy_speed_x = hspd;
		hold.phy_speed_y = vspd;
		if hold.object_index == obj_ballearth
		with obj_ballearth
		if other.hold != id
		{
			phy_speed_x = other.hspd;
			phy_speed_y = other.vspd;
		}
	}
	else
	{
		hold.hspeed = hspd;
		hold.vspeed = vspd;
		hold.hurts = true;
		if hold.image_index == 1
		with hold.connect_to
		{
			hspeed = other.hspd;
			vspeed = other.vspd;
		}
	}
}
instance_destroy();
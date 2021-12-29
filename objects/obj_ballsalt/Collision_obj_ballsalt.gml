///Push it
if phy_speed>other.phy_speed
{
	other.phy_speed_x = phy_speed_x/1.1;
	other.phy_speed_y = phy_speed_y/1.1;
}

var dir = random(360);
var dis = point_distance(0,0,phy_speed_x,phy_speed_y);
phy_speed_x = lengthdir_x(dis, dir);
phy_speed_y = lengthdir_y(dis, dir);
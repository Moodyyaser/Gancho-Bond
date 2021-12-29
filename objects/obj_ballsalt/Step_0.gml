/// @desc
if point_distance(0,0,phy_speed_x,phy_speed_y) > 8 effect_create_below(ef_spark, x,y, 0, c_ltgray);
phy_speed_x /= 1.0025;
phy_speed_y /= 1.0025;

physics_apply_force(x,y+1, 0,3.125);
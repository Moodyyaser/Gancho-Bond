/// @desc make mercury

var tempid = instance_create_layer((x+other.x)/2,(y+other.y)/2, "Instances", obj_ballmercury);
tempid.phy_speed_x = (phy_speed_x+other.phy_speed_x)/2;
tempid.phy_speed_y = (phy_speed_y+other.phy_speed_y)/2;
audio_play_sound(snd_combine, 1, false);
effect_create_above(ef_firework, phy_position_x,phy_position_y, 0, 15974144);
effect_create_above(ef_firework, other.phy_position_x,other.phy_position_y, 0, 11578614);
with other instance_destroy();
instance_destroy();
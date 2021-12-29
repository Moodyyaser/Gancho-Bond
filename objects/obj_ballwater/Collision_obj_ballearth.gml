/// @desc make 3 salts

instance_create_layer((phy_position_x+other.phy_position_x)/2,(phy_position_y+other.phy_position_y)/2, "Instances", obj_ballsalt);
instance_create_layer((phy_position_x+other.phy_position_x)/2-32,(phy_position_y+other.phy_position_y)/2, "Instances", obj_ballsalt);
instance_create_layer((phy_position_x+other.phy_position_x)/2+32,(phy_position_y+other.phy_position_y)/2, "Instances", obj_ballsalt);
audio_play_sound(snd_combine, 1, false);
effect_create_above(ef_firework, phy_position_x,phy_position_y, 0, 15974144);
effect_create_above(ef_firework, other.phy_position_x,other.phy_position_y, 0, 6461175);
with other instance_destroy();
instance_destroy();
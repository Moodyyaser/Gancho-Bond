/// @desc physics apply force
physics_apply_force(x,y+1, 0,135);
if stop > 0 stop -= 1;
if place_meeting(x,y, obj_button)
{
	//open
	if obj_button.image_index == 0
	{
		audio_play_sound(snd_lock, 1, false);
		obj_button.image_index = 1;
		obj_button.resist = 10;
		phy_speed_x = 0;
		phy_speed_y = 0;
		xstart= phy_position_x;
		ystart= phy_position_y;
	}
}
/// @desc physics apply force
if place_meeting(x,y,obj_coal)
{
	audio_play_sound(snd_gunpowder, 1, false);
	instance_create_layer(1344, 160, "Walls", obj_gunpowder);
	with obj_coal instance_destroy();
	instance_destroy();
}
physics_apply_force(x,y+1, 0,110);
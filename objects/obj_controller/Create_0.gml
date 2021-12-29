/// @desc

//Particle system
part_sys = part_system_create();
part_type = part_type_create();
part_type_shape(part_type, pt_shape_flare);
part_type_size(part_type, 0.25, 0.5, -0.025, 0);
part_type_colour1(part_type, c_white);
part_type_speed(part_type, 0.4, 1.4, 0, 0);
part_type_direction(part_type, 0, 360, 0, 0);
part_type_gravity(part_type, 0.20, 270);
part_type_life(part_type, 60, 60);
part_emit = part_emitter_create(part_sys);
shake=0;
if global.cups == 2
if global.see_off == 0
{
	with instance_create_depth(room_width/2,room_height/2, -1000, obj_text)
		text = "That's it, you got everything.\n you can quit the game now,\ndon't look for anything else.";
	global.see_off = 1;
}
time_back = 60;
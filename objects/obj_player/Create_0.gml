can_jump = 1;
can_shoot = 1;
hsp = 0;
vsp = 0;
hspd = 0;
vspd = 0;
image_speed = 0;
point_dire = 0;
offset_gun = 0;
hooked = 0;
image = 0;
health = 5;
iframe=0;
jumping = 0;
get_hot = 0;
toxicity = 0;
dynamite = 0;
fireball = 0;

part_sys = part_system_create();
part_system_depth(part_sys, -1000);
part_type = part_type_create();
part_type_speed(part_type, 2,3, -0.01, 0);
part_type_color2(part_type, c_gray, c_black);
part_type_alpha2(part_type, 1, 0);
part_type_shape(part_type, pt_shape_smoke);
part_type_size(part_type, 0.1, 0.3, 0, 0);
part_type_life(part_type, 60, 60);
part_emit = part_emitter_create(part_sys);

image_prev = 0;
if room == rm_desert1 && x > 640
{
	image_xscale = -1;
	y-=4;
}
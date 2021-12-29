/// @desc shoot hook
if !instance_exists(obj_grap) && can_shoot
{
	can_shoot=0;
	var tempid = instance_create_layer(x, y, "Instances", obj_grap);
	tempid.spd = 18-global.difficulty*4.5;
	tempid.hspd = lengthdir_x(tempid.spd, point_dire);
	tempid.vspd = lengthdir_y(tempid.spd, point_dire);
	tempid.dynamite = dynamite;
	tempid.bullet_shoot = fireball;
	dynamite = 0;
	fireball = 0;
	
	//Recoil
	hsp -= lengthdir_x(4-global.difficulty, point_dire);
	vsp -= lengthdir_y(4-global.difficulty, point_dire);
	
	//effects
	audio_play_sound(snd_hook_shot, 1, false);
	part_type_direction(part_type, point_dire-10, point_dire+10, 0, 0);
	part_emitter_region(part_sys, part_emit, x-1,x+1,y-1,y+1, ps_shape_diamond, ps_distr_linear);
	part_emitter_burst(part_sys, part_emit, part_type, 3+irandom(2));
	effect_create_above(ef_smoke, x,y, 0, c_white);
} 
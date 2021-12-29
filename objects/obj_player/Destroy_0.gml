/// @desc
for (var i = 0; i < 360; i+=30) {
	var tempid = instance_create_depth(x,y, -1000, obj_death);
	tempid.hspd = lengthdir_x(8, i);
	tempid.vspd = lengthdir_y(8, i);
}
for (var i = 22.5; i < 360; i+=45) {
	var tempid = instance_create_depth(x,y, -1000, obj_death);
	tempid.hspd = lengthdir_x(4, i);
	tempid.vspd = lengthdir_y(4, i);
}
obj_controller.alarm[0] = 60;
if room == rm_cave_up5
	audio_stop_sound(mus_boss);
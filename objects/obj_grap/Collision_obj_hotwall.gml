/// @desc destroy
audio_play_sound(snd_grappling_failed, 1, false);
var xdiff = obj_player.x - x;
var ydiff = obj_player.y - y;
var dist = dis/16;
for (var i = 1; i <= dist; i++)
{
	var xx = x+(xdiff/dist)*i;
	var yy = y+(ydiff/dist)*i;
	part_emitter_region(obj_controller.part_sys, obj_controller.part_emit, xx, xx, yy, yy, ps_shape_diamond, ps_distr_linear);
	part_emitter_burst(obj_controller.part_sys, obj_controller.part_emit, obj_controller.part_type, 1);
}
instance_destroy();
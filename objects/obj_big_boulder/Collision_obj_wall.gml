/// @desc destroy it
if room == rm_cave_up3
{
	repeat 10
		with instance_create_depth(other.x+16,other.y+16, -1000, obj_explosion) image_blend = choose(4220376, 13421772);
	var lay_id = layer_get_id("Tiles_cave_temp");
	var tile_id = layer_tilemap_get_id(lay_id);
	if layer_tilemap_exists(lay_id, tile_id)
	    layer_tilemap_destroy(tile_id);
	instance_destroy(other);
	obj_controller.alarm[1] = 1;
	obj_controller.shake = 20;
	audio_play_sound(snd_kill_enemy, 1, false);
	alarm[0] = 20;
	global.boulder = 1;
}
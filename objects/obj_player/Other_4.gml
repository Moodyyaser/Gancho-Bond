/// @desc create controller
instance_create_depth(0,0, 0, obj_controller);
if global.back_to_cp
{
	x = global.back_x;
	y = global.back_y;
	global.back_to_cp = 0;
}
if room == rm_cave_middle3
if global.boulder
{
	var lay_id = layer_get_id("Tiles_cave_temp");
	var tile_id = layer_tilemap_get_id(lay_id);
	if layer_tilemap_exists(lay_id, tile_id)
	    layer_tilemap_destroy(tile_id);
	with inst_A4214C2 instance_destroy();
	with inst_5EE9BA2E instance_destroy();
}
get_hot = 0;
if room == rm_desert1
if !audio_is_playing(mus_desert)
{
	global.desert = audio_play_sound(mus_desert, 10, true);
	audio_sound_gain(global.desert, 0,0);
	audio_sound_gain(global.desert, 1,1000);
}
if room == rm_cave_middle1 || room == rm_cave_middle3
if !audio_is_playing(mus_cave) && !audio_is_playing(mus_cave_intro)
{
	global.music_time = current_time;
	global.music_play = true;
	audio_play_sound(mus_cave_intro, 10, false);
}
if room == rm_desert1 || room == rm_desert2 || room == rm_desert4 || room == rm_desert5
{
	audio_sound_gain(global.desert, 1, 0);
	audio_sound_gain(mus_cave     , 0, 0);
}
else if room == rm_cave_up5
{
	audio_sound_gain(global.desert, 0, 0);
	audio_sound_gain(mus_cave     , 0, 0);
	audio_play_sound(mus_boss,  10, true);
}
else if room != rm_desert3 && room != rm_cave_middle4
{
	audio_sound_gain(global.desert, 0, 0);
	audio_sound_gain(mus_cave     , 1, 0);
}
if instance_exists(obj_chest)
	if obj_chest.image_index == 0 audio_sound_gain(mus_cave, 0, 2000);
if room == rm_cave_middle4 audio_sound_gain(mus_cave, 0, 2000);

if room==rm_desert2
if global.cups==2
{
	if global.difficulty
	{
		with instance_create_layer(1600,192, "Instances", obj_text)
			text = "Congratulations,\nnow play the Hotshot difficulty\nif you're ready for a challenge."
	}
	else
	{
		with instance_create_layer(1600,192, "Instances", obj_text)
			text = "There is a trick that works only with the hook.\nThere are 3 ways to get over here."
	}
}
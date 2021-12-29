time -= 1;
if time <= 0
{
	time = 15+global.difficulty*5;
	audio_stop_sound(snd_ghost_shoot);
	audio_play_sound(snd_ghost_shoot, 1, false);
	var tempid = instance_create_layer(x,y, "Ghost_Par", obj_bullet);
	tempid.speed = 3;
	tempid.direction = 270;
	tempid.bcolor = 11578614;
	tempid.image_index = 3;
}
/// @desc
draw = 0;
audio_play_sound(snd_coin, 1, false);
with obj_cup
{
	repeat 3
		effect_create_above(ef_spark, x+random(32),y+random(32), 0, c_yellow);
	instance_destroy();
}
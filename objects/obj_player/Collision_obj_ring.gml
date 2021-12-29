/// @desc take it
audio_play_sound(snd_treasure, 1, false);
effect_create_above(ef_spark, other.x+random(32), other.y+random(32), 0, c_yellow);
effect_create_above(ef_spark, other.x+random(32), other.y+random(32), 0, c_yellow);
effect_create_above(ef_spark, other.x+random(32), other.y+random(32), 0, c_yellow);
effect_create_above(ef_flare, other.x+random(32), other.y+random(32), 0, c_aqua);
effect_create_above(ef_ring,  other.x+random(32), other.y+random(32), 1, c_yellow);
with other instance_destroy();
/// @desc take it
audio_play_sound(snd_treasure, 1, false);
audio_play_sound(snd_grappling_failed, 1, false);
effect_create_above(ef_spark, other.x+random_range(-16, 16), other.y+random_range(-16, 16), 0, c_white);
effect_create_above(ef_spark, other.x+random_range(-16, 16), other.y+random_range(-16, 16), 0, c_white);
effect_create_above(ef_spark, other.x+random_range(-16, 16), other.y+random_range(-16, 16), 0, c_white);
effect_create_above(ef_flare, other.x+random_range(-16, 16), other.y+random_range(-16, 16), 0, c_white);
effect_create_above(ef_ring,  other.x+random_range(-16, 16), other.y+random_range(-16, 16), 1, c_white);
with other instance_destroy();
room_goto(rm_cave_middle4);
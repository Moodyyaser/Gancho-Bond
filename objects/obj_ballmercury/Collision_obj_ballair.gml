/// @desc make yinyang

var tempid = instance_create_layer((x+other.x)/2,(y+other.y)/2, "Instances", obj_ballsulphur);
tempid.hspeed = (hspeed+other.hspeed)/2;
tempid.vspeed = (vspeed+other.vspeed)/2;
audio_play_sound(snd_combine, 1, false);
effect_create_above(ef_firework, x,y, 0, 3551214);
effect_create_above(ef_firework, x,y, 0, 11578614);
with other instance_destroy();
instance_destroy();
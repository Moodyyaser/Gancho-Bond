/// @desc change location
time_move = 300 + global.difficulty*300;
var new_move = irandom(2);
while new_move == move new_move = irandom(2);
move = new_move;
time_back = 0;
spd = 0;
if hp>1
switch move
{
	case 0:
		move_tox = 32+random(32);
		move_toy = 32+random(room_height-64);
		move_hspd = 0;
		move_vspd = choose(-1,1); break;
	case 1:
		move_tox = room_width-64+random(32);
		move_toy = 32+random(room_height-64);
		move_hspd = 0;
		move_vspd = choose(-1,1); break;
	case 2:
		move_tox = 32+random(room_width-64);
		move_toy = 32+random(32);
		move_hspd = choose(-1,1);
		move_vspd = 0; break;
}
avoid = false;
if hp == 4 audio_play_sound(snd_roar, 1, false);
next_phase = 120;
//Final phase
if hp <3
{
	next_phase = 60;
	time_shoot=2;
	time_move=120+global.difficulty*120;
	direction = random(360);
	move_hspd=0;
	move_vspd=0;
}
if instance_exists(obj_bullet) audio_play_sound(snd_grappling_failed, 1, false);
with obj_bullet {effect_create_above(ef_ring, x,y, 0, bcolor); instance_destroy();}
with obj_air_spawner {effect_create_above(ef_ring, x,y, 1, bcolor); instance_destroy();}
if hp <= 0 && instance_exists(obj_player)
{
	global.ghost_exists = false;
	obj_spikes.mask_index = snull;
	audio_sound_gain(mus_boss, 0, 1000);
	audio_play_sound(snd_kill_enemy, 1, false);
	var xx = random_range(-20, 20);
	var yy = random_range(-20, 20);
	repeat 10
		with instance_create_depth(x+xx,y+yy, -1000, obj_explosion) image_blend = 5000447;
	time_explode = 20;
	time_to_die = 120;
	speed = 2;
	direction = point_direction(x,y, room_width/2, room_height/4);
}
/// @desc
rot = 0;
time = 0;
hp = 10;
iframe = 0;

move_tox = x;
move_toy = y;
move_hspd = 0;
move_vspd = choose(-1,1);
move_turn = choose(-1,1);
move_towards = true;
move = 0;
time_move = 300 + global.difficulty*300;
time_back = 0;
avoid = false;

time_shoot = 60+global.difficulty*60;
next_phase = 0;
earth_shoot = 60;
earth_num = 2-global.difficulty;
earth_side = choose(32,room_width-32);
water_shoot = 60;
water_num = 0;
fire_rot = 0;
fire_num = 7;
air_spawn = 60 + global.difficulty*30;
reach_button = 0;
rain_time = 60;
smoke = 0;
come_down = 40;
spam = 60;
audio_play_sound(snd_ghost_moving, 5, true);
audio_sound_gain(snd_ghost_moving, 0, 0);
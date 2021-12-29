rot = (rot + 9) mod 360;
time -= 1;
if time<=0
{
	time = 6;
	var tempid = instance_create_layer(x+random_range(-15,15)*image_xscale,y+random_range(-15,15)+dsin(rot)*2, "Ghost_Par", obj_ghost_par);
	tempid.hspd = -image_xscale;
}
//Move
move_tox += move_hspd+move_hspd*(!global.difficulty);
move_toy += move_vspd+move_vspd*(!global.difficulty);
if move_vspd > 0 if move_toy > room_height-16 move_vspd *= -1;
if move_vspd < 0 if move_toy < 16             move_vspd *= -1;
if move_hspd > 0 if move_tox > room_width-16  move_hspd *= -1;
if move_hspd < 0 if move_tox < 16             move_hspd *= -1;

//I frame
if iframe > 0 iframe -= 1;

if avoid
{
	if instance_exists(obj_grap) {
		if distance_to_object(obj_grap) < 40
		{
			audio_play_sound(snd_grappling_failed, 1, false);
			part_emitter_region(obj_controller.part_sys, obj_controller.part_emit, x-20, x+20, y-20, y+20, ps_shape_diamond, ps_distr_linear);
			part_emitter_burst(obj_controller.part_sys, obj_controller.part_emit, obj_controller.part_type, 40);
			if move_tox>room_width/2
			{
				x = 32;
				move_tox = 32;
				part_emitter_region(obj_controller.part_sys, obj_controller.part_emit, x-20, x+20, y-20, y+20, ps_shape_diamond, ps_distr_linear);
				part_emitter_burst(obj_controller.part_sys, obj_controller.part_emit, obj_controller.part_type, 40);
			}
			else
			{
				x = room_width-32;
				move_tox = room_width-32;
				part_emitter_region(obj_controller.part_sys, obj_controller.part_emit, x-20, x+20, y-20, y+20, ps_shape_diamond, ps_distr_linear);
				part_emitter_burst(obj_controller.part_sys, obj_controller.part_emit, obj_controller.part_type, 40);
			}
		}}
	else if instance_exists(obj_player)
	if distance_to_object(obj_player) < 160
	{
		audio_play_sound(snd_grappling_failed, 1, false);
		part_emitter_region(obj_controller.part_sys, obj_controller.part_emit, x-20, x+20, y-20, y+20, ps_shape_diamond, ps_distr_linear);
		part_emitter_burst(obj_controller.part_sys, obj_controller.part_emit, obj_controller.part_type, 40);
		if move_tox>room_width/2
		{
			x = 32;
			move_tox = 32;
			part_emitter_region(obj_controller.part_sys, obj_controller.part_emit, x-20, x+20, y-20, y+20, ps_shape_diamond, ps_distr_linear);
			part_emitter_burst(obj_controller.part_sys, obj_controller.part_emit, obj_controller.part_type, 40);
		}
		else
		{
			x = room_width-32;
			move_tox = room_width-32;
			part_emitter_region(obj_controller.part_sys, obj_controller.part_emit, x-20, x+20, y-20, y+20, ps_shape_diamond, ps_distr_linear);
			part_emitter_burst(obj_controller.part_sys, obj_controller.part_emit, obj_controller.part_type, 40);
		}
	}
}
if move_towards == true
{
	if time_back>0
	{
		var dir = point_direction(x,y, move_tox, move_toy);
		spd+=1/7;
		x -= lengthdir_x(spd, dir);
		y -= lengthdir_y(spd, dir);
		time_back -=1;
	}
	else
	{
		var movesp = 5+hp*5+hp*global.difficulty;
		x -= (x - move_tox)/movesp;
		y -= (y - move_toy)/movesp;
	}
}

//Sound
var dis_move = point_distance(x,y,xprevious,yprevious);
audio_sound_pitch(snd_ghost_moving, 0.5 + dis_move/64);
if x>room_width
audio_sound_gain(snd_ghost_moving, min((2048-x)/4192, 0.5), 0);
else
audio_sound_gain(snd_ghost_moving, min(dis_move/16, 0.5), 0);

//DEAD
if hp <= 0
{
	time_explode-=1;
	if time_explode <= 0 {
		time_explode = 20;
		var xx = random_range(-20, 20);
		var yy = random_range(-20, 20);
		audio_play_sound(snd_kill_enemy, 1, false);
		repeat 10
			with instance_create_depth(x+xx,y+yy, -1000, obj_explosion) image_blend = 5000447;
	}
	time_to_die -= 1;
	if time_to_die<0
	{
		audio_play_sound(snd_kill_ghost, 1, false);
		repeat 30
			with instance_create_depth(x,y, -1000, obj_explosion) {image_blend = 5000447; hspd = random_range(-24, 24); vspd = random_range(-24, 24);}
		instance_destroy();
	}
	speed = 2;
	direction = point_direction(x,y, room_width/2, room_height/4);
}
//If no player detected
if !instance_exists(obj_player) || hp <= 0 exit;

if obj_player.x > x image_xscale = 1;
else image_xscale = -1;

if obj_player.y > y image_index = 1;
else image_index = 0;

if next_phase > 0 {next_phase -= 1; exit;}

//Shoot fire bullets
switch hp
{
	case 10: case 9:
		time_shoot -= 1;
		if time_shoot<=0
		{
			time_shoot=60;
			audio_play_sound(snd_ghost_shoot, 1, false);
			for (var i = 0; i < 360; i+=15+global.difficulty*15) {
				var tempid = instance_create_layer(x+lengthdir_x(24,i),y+lengthdir_y(24,i), "Ghost_Par", obj_bullet);
				tempid.speed = 5-global.difficulty*2;
				tempid.direction = i;
				tempid.bcolor = 3551214;
			}
		}
		//Change location
		time_move -= 1;
		if time_move<=0
		{
			time_move = 600;
			var new_move = irandom(2);
			if new_move == move exit;
			move = new_move;
			time_back = 30;
			spd = 0;
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
		} break;
	case 8: case 7:
		move_tox = obj_player.x;
		move_toy = 32;
		move_hspd = 0;
		move_vspd = 0;
		earth_shoot -= 1;
		if earth_num == 2 && earth_shoot < 60
		{
			move_tox = earth_side;
			move_toy = obj_player.y;
			move_hspd = 0;
			move_vspd = 0;
		}
		if earth_shoot<=0
		{
			earth_shoot=300;
			audio_play_sound(snd_earth_shoot, 1, false);
			earth_num-=1;
			if earth_num==0
			{
				water_shoot = 60;
				water_num = 5-global.difficulty*2;
				earth_num = 2-global.difficulty;
				earth_side = choose(32,room_width-32);
				var tempid = instance_create_layer(x,y, "Ghost_Par", obj_bullet);
				tempid.speed = 5-global.difficulty*2;
				tempid.direction = 0;
				tempid.gravity_after = 90;
				tempid.bcolor = 6461175;
				tempid.time_down = 30;
				tempid.image_index = 1;
				var tempid2 = instance_create_layer(x,y, "Ghost_Par", obj_bullet);
				tempid2.speed = 5-global.difficulty*2;
				tempid2.direction = 180;
				tempid2.gravity_after = 90;
				tempid2.bcolor = 6461175;
				tempid2.aconnect_to = tempid;
				tempid.aconnect_to = tempid2;
				tempid2.time_down = 30;
				tempid2.image_index = 1;
			}
			else
			{
				earth_shoot = 60;
				var tempid = instance_create_layer(x,y, "Ghost_Par", obj_bullet);
				tempid.speed = 5;
				tempid.direction = 90;
				if earth_side == 32 tempid.gravity_after = 180;
				else tempid.gravity_after = 0;
				tempid.bcolor = 6461175;
				tempid.time_down = 30;
				tempid.image_index = 1;
				var tempid2 = instance_create_layer(x,y, "Ghost_Par", obj_bullet);
				tempid2.speed = 5;
				tempid2.direction = 270;
				if earth_side == 32 tempid2.gravity_after = 180;
				else tempid2.gravity_after = 0;
				tempid2.bcolor = 6461175;
				tempid2.aconnect_to = tempid;
				tempid.aconnect_to = tempid2;
				tempid2.time_down = 30;
				tempid2.image_index = 1;
			}
		}
		if water_num>0
			water_shoot -= 1;
		if water_shoot<=0
		{
			water_shoot=30+global.difficulty*30;
			water_num-=1;
			audio_play_sound(snd_ghost_shoot, 1, false);
			for (var i = 0; i <= 1; i+=0.25) {
				var tempid = instance_create_layer(x,y, "Ghost_Par", obj_bullet);
				if global.difficulty
					tempid.hspeed = (1-i)/2;
				else
					tempid.hspeed = (1-i)/2*1.5;
				tempid.vspeed = i*4;
				tempid.bcolor = 15974144;
				tempid.image_index = 2;
				if global.difficulty
					tempid.gravity = 0.1;
				else
					tempid.gravity = 0.3;
				
				var tempid = instance_create_layer(x,y, "Ghost_Par", obj_bullet);
				if global.difficulty
					tempid.hspeed =-(1-i)/2;
				else
					tempid.hspeed =-(1-i)/2*1.5;
				tempid.vspeed = i*4;
				tempid.bcolor = 15974144;
				tempid.image_index = 2;
				if global.difficulty
					tempid.gravity = 0.1;
				else
					tempid.gravity = 0.3;
			}
		} break;
	case 6: case 5:
		reach_button += 1;
		if reach_button < 120
		{
			move_tox = 2048;
			move_toy = 128;
			move_hspd = 0;
			move_vspd = 0;
		}
		else if move_tox==2048
		{
			move_toy = obj_player.y;
			move_tox = room_width-32;
			move_hspd = 0;
			move_vspd = -2;
			avoid = true;
		}
		if reach_button > 60
		if !instance_exists(obj_spike_ceiling)
		{
			audio_play_sound(snd_switch, 1, false);
			instance_create_layer(0, -32, "Walls", obj_spike_ceiling);
			for (var i = 0; i < room_width; i+=32) {
				var tempid = instance_create_layer(i, 0, "Instances", obj_spikes);
				tempid.image_yscale = -1;
			}
			inst_2647DEB6.hspeed =-8;
			inst_7DACDACC.hspeed = 8;
		}
		if reach_button > 240
		{
			time_shoot -= 1;
			if time_shoot<=0
			{
				if fire_num>0
				{
					fire_num -= 1;
					time_shoot=10;
					fire_rot = (fire_rot + 13) mod 360;
					audio_play_sound(snd_ghost_shoot, 1, false);
					for (var i = 0; i < 360; i+=72+global.difficulty*48) {
						var tempid = instance_create_layer(x+lengthdir_x(24,i+fire_rot),y+lengthdir_y(24,i+fire_rot), "Ghost_Par", obj_bullet);
						tempid.speed = 6-global.difficulty*2;
						tempid.direction = i+fire_rot;
						tempid.bcolor = 3551214;
					}
				}
				else
				{
					time_shoot=35+global.difficulty*20;
					fire_num=7;
				}
			}
			air_spawn -= 1;
			if air_spawn <= 0
			{
				air_spawn = 90 + global.difficulty*60;
				instance_create_layer(room_width+11, 16, "Ghost_Par", obj_air_spawner);
			}
		} break;
	case 4: case 3:
		instance_create_depth(random(room_width), 16, -1000, obj_cloud);
		if !smoke
		{
			time_shoot = 120;
			smoke = 1;
			audio_play_sound(snd_smoke, 1, false);
			effect_create_above(ef_smokeup, x,y, 2, c_white);
		}
		
		rain_time-=1;
		if rain_time < 0
		{
			rain_time = 2+global.difficulty*2;
			var tempid = instance_create_layer(random(room_width), 0, "Ghost_Par", obj_bullet);
			tempid.hspeed = -0.33+global.difficulty/6;
			if hp == 3 tempid.hspeed *= -1;
			tempid.vspeed = 3-global.difficulty;
			tempid.bcolor = 15974144;
			tempid.image_index = 2;
		}
		
		come_down -= 1;
		if come_down < 0
		{
			move_tox = obj_player.x;
			move_toy = room_height-32;
			move_hspd = 0;
			move_vspd = 0;
		}
		time_shoot -= 1;
		if time_shoot <= 0
		{
			time_shoot = 90 + global.difficulty*60;
			audio_play_sound(snd_ghost_shoot, 1, false);
			var tempid = instance_create_layer(x,y, "Ghost_Par", obj_bullet);
			tempid.speed = 3-global.difficulty;
			tempid.direction = 90;
			tempid.bcolor = 11578614;
			tempid.image_index = 3;
		} break;
	case 2: case 1:
		fire_rot+=4.75;
		time_shoot -= 1;
		move_towards = false;
		if time_shoot <= 0
		{
			time_shoot = 4;
			spam -= 1;
			if speed == 0
				speed = 0.025;
			if spam<=0
			{
				spam = 60;
				time_shoot = 120+global.difficulty*60;
				speed = 0;
				direction = random(360);
				move_turn = choose(-1,1);
			}
			audio_play_sound(snd_ghost_shoot, 1, false);
			for (var i = 0; i < 360; i+=120+global.difficulty*60) {
				var tempid = instance_create_layer(x+lengthdir_x(24,i+fire_rot),y+lengthdir_y(24,i+fire_rot), "Ghost_Par", obj_bullet);
				tempid.speed = 7-global.difficulty*2;
				tempid.direction = i+fire_rot;
				tempid.bcolor = 3551214;
				var tempid = instance_create_layer(x+lengthdir_x(24,i-fire_rot),y+lengthdir_y(24,i-fire_rot), "Ghost_Par", obj_bullet);
				tempid.speed = 7-global.difficulty*2;
				tempid.direction = i-fire_rot;
				tempid.bcolor = 3551214;
			}
		}
		
		//turn location
		direction += move_turn;
		if speed>0
			speed += 0.025-global.difficulty/80;
		if hspeed>0 if x>room_width-20  hspeed *= -1;
		if hspeed<0 if x<20             hspeed *= -1;
		if vspeed>0 if y>room_height-20 vspeed *= -1;
		if vspeed<0 if y<20             vspeed *= -1;
		break;
}
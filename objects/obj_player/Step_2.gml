/// @desc check collisions
if room==rm_desert1 if x>room_width-16 x = room_width-16;
 
//Get burned
if instance_exists(obj_lava)
{
	if place_meeting(x,y,obj_lava)
	if iframe==0
	{
		iframe = 60;
	
		//Recoil
		health -= 10;
		audio_play_sound(snd_hurt, 1, false);
		with obj_grap instance_destroy();
		if health<=0
		{
			instance_destroy();
			audio_play_sound(snd_death, 1, false);
			exit;
		}
	}
	get_hot += 1-global.difficulty/1.5;
	if get_hot>350 effect_create_below(ef_smokeup,x,y+16, 0, c_gray);
	if get_hot>480
	{
		get_hot=0;
		iframe = 60;
		
		//Recoil
		var dire_rec = 90;
		hsp = lengthdir_x(8, dire_rec);
		vsp = lengthdir_y(8, dire_rec);
		health -= 1;
		audio_play_sound(snd_hurt, 1, false);
		with obj_grap instance_destroy();
		if health<=0
		{
			instance_destroy();
			audio_play_sound(snd_death, 1, false);
		}
	}
}
else if instance_exists(obj_blacklava)
if x>obj_blacklava.x && x<obj_blacklava.x+obj_blacklava.image_xscale*16
{
	if place_meeting(x,y,obj_blacklava)
	if iframe==0
	{
		get_hot += 2-global.difficulty;
		if get_hot>350 effect_create_below(ef_smokeup,x,y+16, 0, c_gray);
		if get_hot>480
		{
			get_hot=0;
			iframe = 60;
		
			//Recoil
			var dire_rec = 90;
			hsp = lengthdir_x(16-global.difficulty*8, dire_rec);
			vsp = lengthdir_y(16-global.difficulty*8, dire_rec);
			health -= 1;
			audio_play_sound(snd_hurt, 1, false);
			with obj_grap instance_destroy();
			if health<=0
			{
				instance_destroy();
				audio_play_sound(snd_death, 1, false);
				exit;
			}
		}
	}
	toxicity += 1-global.difficulty/2;
	if toxicity>480
	{
		toxicity=0;
		iframe = 60;
		
		//Recoil
		var dire_rec = 90;
		hsp = lengthdir_x(4, dire_rec);
		vsp = lengthdir_y(4, dire_rec);
		health -= 1;
		audio_play_sound(snd_hurt, 1, false);
		with obj_grap instance_destroy();
		if health<=0
		{
			instance_destroy();
			audio_play_sound(snd_death, 1, false);
		}
	}
}

// Elements
var ins = instance_place(x,y,obj_ballfire);
if ins
if iframe==0
{
	// get hurt
	iframe = 60;
	
	//Recoil
	var dire_rec = point_direction(ins.x, ins.y, x,y);
	hsp = lengthdir_x(16-global.difficulty*8, dire_rec);
	vsp = lengthdir_y(16-global.difficulty*8, dire_rec);
	health -= 1;
	audio_play_sound(snd_hurt, 1, false);
	with obj_grap instance_destroy();
	if health<=0
	{
		instance_destroy();
		audio_play_sound(snd_death, 1, false);
	}
}

if place_meeting(x,y, obj_ballair)
	vsp -= 24-global.difficulty*12;

if place_meeting(x,y, obj_ballwater)
	get_hot = 0;

//Solids
var ins = instance_place(x,y,obj_ballfire);
if ins
{
	if hooked with obj_grap instance_destroy();
	if ins.gravity > 0 if place_meeting(x,y-64,ins) instance_destroy();
}

ins = instance_place(x,y,obj_platform);
if ins
if yprevious<=ins.y-16 || y< ins.y-8
{
	y = ins.y-20;
	vsp = 0;
	if can_jump == 0
		scr_play_sound();
	can_jump=1;
	x+=ins.hspeed;
	if ins.vspeed>0
		y+=ins.vspeed;
}

//Enemies
ins = instance_place(x,y,obj_shot);
if ins
if iframe==0
{
	iframe = 60;
	
	//Recoil
	var dire_rec = point_direction(ins.x, ins.y, x,y);
	hsp = lengthdir_x(16-global.difficulty*8, dire_rec);
	vsp = lengthdir_y(16-global.difficulty*8, dire_rec);
	health -= 1;
	audio_play_sound(snd_hurt, 1, false);
	with obj_grap instance_destroy();
	if health<=0
	{
		instance_destroy();
		audio_play_sound(snd_death, 1, false);
	}
	with ins instance_destroy();
}
ins = instance_place(x,y,obj_spikes);
if ins
if iframe==0
{
	if not (room == rm_cave_up5 && !global.ghost_exists)
	{
		iframe = 60;
		//Recoil
		var dire_rec = point_direction(ins.x, ins.y, x,y);
		hsp = lengthdir_x(16-global.difficulty*8, dire_rec);
		vsp = lengthdir_y(16-global.difficulty*8, dire_rec);
		health -= 1;
		audio_play_sound(snd_hurt, 1, false);
		with obj_grap instance_destroy();
		if health<=0
		{
			instance_destroy();
			audio_play_sound(snd_death, 1, false);
		}
	}
}
ins = instance_place(x,y,enemy_parent);
if ins
if ins.object_index != obj_ghost
if iframe==0
{
	iframe = 60;
	
	//Recoil
	var dire_rec = point_direction(ins.x, ins.y, x,y);
	hsp = lengthdir_x(16-global.difficulty*8, dire_rec);
	vsp = lengthdir_y(16-global.difficulty*8, dire_rec);
	health -= 1;
	audio_play_sound(snd_hurt, 1, false);
	with obj_grap instance_destroy();
	if health<=0
	{
		instance_destroy();
		audio_play_sound(snd_death, 1, false);
	}
}
ins = instance_place(x,y,obj_spike_trap);
if ins
if iframe==0
{
	iframe = 60;
	
	//Recoil
	var dire_rec = point_direction(ins.x, ins.y, x,y);
	hsp = lengthdir_x(16-global.difficulty*8, dire_rec);
	vsp = lengthdir_y(16-global.difficulty*8, dire_rec);
	health -= 2;
	audio_play_sound(snd_hurt, 1, false);
	with obj_grap instance_destroy();
	if health<=0
	{
		instance_destroy();
		audio_play_sound(snd_death, 1, false);
	}
}


if place_meeting(x,y, obj_teleporter)
{
	audio_play_sound(snd_grappling_failed, 1, false);
	room_goto(rm_cave_up5);
}
/// @desc explosion
for (var i = 0; i < 360; i+=10)	{
	var tempid = instance_create_depth(x,y,-1000,obj_explosion);
	tempid.hspd = lengthdir_x(32, i);
	tempid.vspd = lengthdir_y(32, i);
	tempid.image_blend = c_white;
}
for (var i = 5; i < 360; i+=20)	{
	var tempid = instance_create_depth(x,y,-1000,obj_explosion);
	tempid.hspd = lengthdir_x(20, i);
	tempid.vspd = lengthdir_y(20, i);
	tempid.image_blend = c_yellow;
}
for (var i = 22.5; i < 360; i+=90)	{
	var tempid = instance_create_depth(x,y,-1000,obj_explosion);
	tempid.hspd = lengthdir_x(12, i);
	tempid.vspd = lengthdir_y(12, i);
	tempid.image_blend = c_orange;
}
for (var i = 67.5; i < 360; i+=90)	{
	var tempid = instance_create_depth(x,y,-1000,obj_explosion);
	tempid.hspd = lengthdir_x(9, i);
	tempid.vspd = lengthdir_y(9, i);
	tempid.image_blend = c_red;
}
audio_play_sound(snd_explosion, 1, false);
with obj_player if point_distance(x,y,other.x,other.y)<160 
{
	if iframe==0
	{
		iframe = 60;
		
		//Recoil
		var dire_rec = point_direction(other.x, other.y, x,y);
		hsp = lengthdir_x(32, dire_rec);
		vsp = lengthdir_y(32, dire_rec);
		health -= 2;
		audio_play_sound(snd_hurt, 1, false);
		if health<=0
		{
			instance_destroy();
			audio_play_sound(snd_death, 1, false);
		}
	}
}
with enemy_parent if point_distance(x,y,other.x,other.y)<160 
{
	if object_index == obj_ghost
	{
		if iframe<=20
		{
			iframe = 30;
	
			//Recoil
			audio_play_sound(snd_hurt_ghost, 1, false);
			hp -= 1;
			if hp mod 2 == 0 event_user(0);
		}
	}
	else
	if iframe==0
	{
		//Die
		instance_destroy();
		audio_play_sound(snd_kill_enemy, 1, false);
	}
}
with obj_chain if image_index == 0 if point_distance(x,y,other.x,other.y)<160 
{
	audio_play_sound(snd_hurt_enemy, 1, false);
	repeat 3
		with instance_create_depth(x+16,y+16, -1000, obj_explosion) image_blend = 13421772;
	instance_create_depth(x,y+48, 0, obj_particle_chain);
	instance_create_depth(x,y+64, 0, obj_particle_chain);
	instance_create_depth(x,y+80, 0, obj_particle_chain);
	obj_big_boulder.gravity = 1;
	image_index = 1;
	audio_play_sound(snd_kill_enemy, 1, false);
}
with obj_broken_wall if point_distance(x,y,other.x,other.y)<160 
{
	repeat 10
		with instance_create_depth(x+16,y+16, -1000, obj_explosion) image_blend = choose(4220376, 13421772);
	instance_destroy();
}
dynamite = 0;
instance_destroy();
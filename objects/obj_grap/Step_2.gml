/// @desc collisions
if !instance_exists(obj_player) {instance_destroy(); exit;}
#region collisions
var ins = instance_place(x,y,ballparent);
if ins
{
	//get it
	if retract==0 && obj_player.hooked==0
	{
		if ins.object_index == obj_ballsalt
		{
			audio_play_sound(snd_hurt_enemy, 1, false);
			with ins
			{
				var dir = point_direction(other.x,other.y, x,y);
				phy_speed_x = lengthdir_x(32, dir);
				phy_speed_y = lengthdir_y(32, dir);
				audio_play_sound(snd_hurt_enemy, 1, false);
			}
			instance_destroy();
			exit;
		}
		hold = ins.id;
		retract = 1;
		x=ins.phy_position_x;
		y=ins.phy_position_y;
		if ins.object_index == obj_ballsulphur
			spd = 4;
		else if ins.object_index == obj_ballearth
		{
			spd = 8-global.difficulty*2;
			with obj_ballearth
			{
				mask_index = spr_ballearth_s;
				stop = 4;
				startx = phy_position_x-ins.phy_position_x;
				starty = phy_position_y-ins.phy_position_y;
			}
		}
		else if global.difficulty
			spd *= 0.75;
		audio_play_sound(snd_hook, 1, false);
	}
}
ins = instance_place(x,y, obj_wall);
if ins
{
	if dynamite {
		event_user(0);
		exit;
	}
	if bullet_shoot>0 obj_player.fireball = bullet_shoot;
	if ins.object_index==obj_hotwall
	{
		audio_play_sound(snd_grappling_failed, 1, false);
		var xdiff = obj_player.x - x;
		var ydiff = obj_player.y - y;
		var dist = dis/16;
		for (var i = 1; i <= dist; i++)
		{
			var xx = x+(xdiff/dist)*i;
			var yy = y+(ydiff/dist)*i;
			part_emitter_region(obj_controller.part_sys, obj_controller.part_emit, xx, xx, yy, yy, ps_shape_diamond, ps_distr_linear);
			part_emitter_burst(obj_controller.part_sys, obj_controller.part_emit, obj_controller.part_type, 1);
		}
		instance_destroy();
		exit;
	}
	//stick to it
	if hold == noone
	{
		var dir = point_direction(0,0,hspd,vspd);
		while (place_meeting(x,y,obj_wall)) {
		    x -= lengthdir_x(1, dir);
		    y -= lengthdir_y(1, dir);
		}
		if ins.object_index == obj_spike_ceiling && bullet_shoot == 5
		{
			dynamite = 1;
			audio_play_sound(snd_gunpowder, 1, false);
			effect_create_above(ef_flare, x,y, 0, c_dkgray);
			bullet_shoot = 0;
			obj_player.fireball = 0;
			retract = 1;
		}
		else
		{
			obj_player.hooked = 1;
			obj_player.hsp = 0;
			obj_player.vsp = 0;
			obj_player.hspd = hspd;
			obj_player.vspd = vspd;
			hspd=0;
			vspd=0;
			audio_play_sound(snd_hook, 1, false);
		}
	}
}
ins = instance_place(x,y, enemy_parent);
if ins
if ins.object_index != obj_ghost || (ins.object_index == obj_ghost && bullet_shoot == 1)
{
	if dynamite {
		event_user(0);
		exit;
	}
	if retract
	{
		instance_destroy();
		exit;
	}
	if hspd != 0 || vspd != 0
	{
		if ins.iframe<=20
		{
			ins.iframe = 30;
	
			//Recoil
			var dire_rec = point_direction(0,0, hspd, vspd);
			with ins
			{
				hsp = lengthdir_x(16, dire_rec);
				vsp = lengthdir_y(16, dire_rec)-4;
				if object_index == obj_ghost
					audio_play_sound(snd_hurt_ghost, 1, false);
				else
					audio_play_sound(snd_hurt_enemy, 1, false);
				hp -= 1;
				if object_index == obj_ghost && hp mod 2 == 0 event_user(0);
				if hp<=0 && object_index != obj_ghost
				{
					instance_destroy();
					audio_play_sound(snd_kill_enemy, 1, false);
				}
			}
			with enemy_parent if point_distance(x,y,other.x,other.y)<160 chase = true;
		}
		instance_destroy();
	}
}
ins = instance_place(x,y, obj_chain);
if ins
if ins.image_index == 0
{
	if dynamite {
		event_user(0);
		exit;
	}
	if hspd != 0 || vspd != 0
	{
		//Recoil
		with ins
		{
			audio_play_sound(snd_hurt_enemy, 1, false);
			repeat 3
				with instance_create_depth(x+16,y+16, -1000, obj_explosion) image_blend = 13421772;
			hp -= 1;
			if hp<=0
			{
				instance_create_depth(x,y+48, 0, obj_particle_chain);
				instance_create_depth(x,y+64, 0, obj_particle_chain);
				instance_create_depth(x,y+80, 0, obj_particle_chain);
				obj_big_boulder.gravity = 1;
				image_index = 1;
				audio_play_sound(snd_kill_enemy, 1, false);
			}
		}
		instance_destroy();
	}
}

var ins = instance_place(x,y,obj_bullet);
if ins
{
	//get it
	if retract==0 && obj_player.hooked==0 && dynamite==0
	{
		if (bullet_shoot == 2 && ins.image_index == 2) || (bullet_shoot == 3 && ins.image_index == 1)
		{
			instance_create_layer((x+ins.x)/2,(y+ins.y)/2, "Instances", obj_minisalt);
			var scombine = audio_play_sound(snd_combine, 1, false);
			audio_sound_pitch(scombine, 2);
			effect_create_above(ef_firework, x,y, 0, 15974144);
			effect_create_above(ef_firework, ins.x,ins.y, 0, 6461175);
			with ins instance_destroy();
			instance_destroy();
			exit;
		}
		if (bullet_shoot == 1 && ins.image_index == 3) || (bullet_shoot == 4 && ins.image_index == 0)
		{
			var tempid=instance_create_layer((x+ins.x)/2,(y+ins.y)/2, "Instances", obj_bullet);
			tempid.image_index = 4;
			tempid.hurts = false;
			var scombine = audio_play_sound(snd_combine, 1, false);
			audio_sound_pitch(scombine, 2);
			effect_create_above(ef_firework, x,y, 0, 3551214);
			effect_create_above(ef_firework, ins.x,ins.y, 0, 11578614);
			with ins instance_destroy();
			instance_destroy();
			exit;
		}
		if (bullet_shoot == 3 && ins.image_index == 3) || (bullet_shoot == 4 && ins.image_index == 2)
		{
			var tempid=instance_create_layer((x+ins.x)/2,(y+ins.y)/2, "Instances", obj_bullet);
			tempid.image_index = 6;
			tempid.vspeed = -0.5+global.difficulty/4;
			var scombine = audio_play_sound(snd_combine, 1, false);
			audio_sound_pitch(scombine, 2);
			effect_create_above(ef_firework, x,y, 0, 15974144);
			effect_create_above(ef_firework, ins.x,ins.y, 0, 11578614);
			with ins instance_destroy();
			instance_destroy();
			exit;
		}
		if bullet_shoot == 0
		{
			ins.hurts = false;
			hold = ins.id;
			retract = 1;
			x=ins.x;
			y=ins.y;
			ins.speed = 0;
			ins.gravity = 0;
			if ins.image_index == 4
				spd = 4;
			else if ins.image_index == 1
			{
				spd = 8-global.difficulty*2;
				with hold.connect_to
				{
					startx = x-ins.x;
					starty = y-ins.y;
				}
			}
			else if global.difficulty
				spd *= 0.75;
			audio_play_sound(snd_hook, 1, false);
		}
	}
}
#endregion

dis = point_distance(x,y, obj_player.x, obj_player.y);

if !obj_player.hooked
	image_angle = point_direction(obj_player.x,obj_player.y, x,y);
else
{
	obj_player.hsp = 0;
	obj_player.vsp = 0;
	var dire = point_direction(obj_player.x,obj_player.y, x,y);
	obj_player.hspd = lengthdir_x(16-global.difficulty*4, dire);
	obj_player.vspd = lengthdir_y(16-global.difficulty*4, dire);
	if dis<16
	{
		if instance_exists(hold)
		with hold
		{
			phy_speed_x=0;
			phy_speed_y=0;
		}
		instance_destroy();
	}
}
if collision_line(x,y, obj_player.x,obj_player.y, obj_wall, false, true) || dis > 1000
{
	audio_play_sound(snd_grappling_failed, 1, false);
	var xdiff = obj_player.x - x;
	var ydiff = obj_player.y - y;
	var dist = dis/16;
	for (var i = 1; i <= dist; i++)
	{
		var xx = x+(xdiff/dist)*i;
		var yy = y+(ydiff/dist)*i;
		part_emitter_region(obj_controller.part_sys, obj_controller.part_emit, xx, xx, yy, yy, ps_shape_diamond, ps_distr_linear);
		part_emitter_burst(obj_controller.part_sys, obj_controller.part_emit, obj_controller.part_type, 1);
	}
	if global.difficulty
	if instance_exists(hold)
	{
		hold.x=x;
		hold.y=y;
		hold.phy_position_x=x;
		hold.phy_position_y=y;
		hold.phy_speed_x = 0;
		hold.phy_speed_y = 0;
		hold.phy_angular_velocity = 0;
	
		if hold.object_index == obj_ballearth
		with obj_ballearth
		if other.hold != id
		{
			phy_position_x = startx + other.x;
			phy_position_y = starty + other.y-4;
			direc = other.direc;
			//if !place_free(phy_position_x,phy_position_y) {phy_position_x=phy_position_xprevious; phy_position_y=phy_position_yprevious; with other instance_destroy();}
		}
	}
	instance_destroy();
}
if retract
{
	direc = point_direction(x,y, obj_player.x, obj_player.y);
	hspd = lengthdir_x(spd, direc);
	vspd = lengthdir_y(spd, direc);
	image_angle = direc + 180;
	if dis<16
	{
		if instance_exists(hold) {
			hold.x = obj_player.x;
			hold.y = obj_player.y;
		}
		instance_destroy();
	}
}
if instance_exists(hold)
{
	hold.x=x;
	hold.y=y;
	if hold.phy_active
	{
		hold.phy_position_x=x;
		hold.phy_position_y=y;
		hold.phy_speed_x = 0;
		hold.phy_speed_y = 0;
		hold.phy_angular_velocity = 0;
	
		if hold.object_index == obj_ballearth
		with obj_ballearth
		if other.hold != id
		{
			phy_position_x = startx + other.x;
			phy_position_y = starty + other.y-4;
			phy_rotation = other.direc;
			//if !place_free(phy_position_x,phy_position_y) {phy_position_x=phy_position_xprevious; phy_position_y=phy_position_yprevious; with other instance_destroy();}
		}
	}
	else
	{
		hold.speed = 0;
		hold.gravity = 0;
		if hold.image_index == 1
		with hold.connect_to
		{
			if startx == -1000
			{
				startx = x-connect_to.x;
				starty = y-connect_to.y;
			}
			else
			{
				x = startx + other.x;
				y = starty + other.y;
			}
			hspeed = x-xprevious;
			vspeed = y-yprevious;
			gravity = 0;
		}
	}
}
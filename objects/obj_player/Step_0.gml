/// @desc

if place_meeting(x,y+vsp+vspd, obj_gunpowder)
{
	while (place_meeting(x,y, obj_gunpowder))
		y -= 1;
	vsp=0;
	vspd=0;
	if !dynamite {
		audio_play_sound(snd_gunpowder, 1, false);
		dynamite = 1;
	}
	if can_jump == 0
		scr_play_sound();
	can_jump=1;
}
//Collision horizontal
if place_meeting(x,y, obj_water)
	x += (hsp+hspd)/2;
else if place_meeting(x,y, obj_blacklava)
	x += (hsp+hspd)/3;
else
	x += hsp+hspd;
if place_meeting(x,y,obj_wall)
{
	if hooked if global.difficulty==0 with obj_grap instance_destroy();
	if hsp+hspd > 0 {while place_meeting(x,y,obj_wall) x-=0.5; hsp=0; hspd=0;}
	else {while place_meeting(x,y,obj_wall) x+=0.5; hsp=0; hspd=0;}
}

//Gravity
if !hooked
{
	vsp += 1-global.difficulty/3;
	if jumping>0
	{
		jumping-=1;
		vsp = -10+global.difficulty*2;
		if keyboard_check_released(vk_space) || keyboard_check_released(ord("W")) jumping = 0;
	}
}
if place_meeting(x,y+vsp+vspd, obj_wall)
{
	if vsp+vspd > 0
	{
		move_contact_solid(270, 64);
		vsp=0;
		vspd=0;
		if can_jump == 0
			scr_play_sound();
		can_jump=1;
	}
	else {move_contact_solid(90, 64); vsp=0; vspd=0;}
}
if place_meeting(x,y, obj_water)
	y += (vsp+vspd)/2;
else
	y += vsp+vspd;

if !hooked
{
	if keyboard_check(ord("D")) {
		if hsp < 8-global.difficulty*2 hsp+=1.5-global.difficulty/2;
		image_xscale = 1;
	}
	else if keyboard_check(ord("A")) {
		if hsp > -8+global.difficulty*2 hsp-=1.5-global.difficulty/2;
		image_xscale = -1;
	}
	else
	{
		if hsp>0 {hsp-=2; if hsp<0 hsp=0;}
		if hsp<0 {hsp+=2; if hsp>0 hsp=0;}
	}
}
//Point Direction
if instance_exists(obj_grap)
	point_dire = point_direction(x,y, obj_grap.x,obj_grap.y);
else
	point_dire = point_direction(x,y, mouse_x,mouse_y);

//Change sprite
if x == xprevious sprite_index = spr_player_idle;
else sprite_index = spr_player_walk;
if hooked
	sprite_index = spr_player_hooked;

if vsp == 0 image_speed = 1;

if image_speed {image = (image + 0.25-global.difficulty*0.05) mod 8;}

if sprite_index == spr_player_walk
{
	if image == 0 || image == 4 offset_gun = 2;
	else if image == 2 || image == 6 offset_gun = 0;
	else offset_gun = 1;
	
	if (image == 0 || image == 4) if can_jump == 1
		scr_play_sound();
	image_prev = image;
}
else
{
	image_prev = 0;
	offset_gun = 0;
	if point_dire < 90 || point_dire > 270 image_xscale = 1;
	else image_xscale = -1;
}
//iframe
if iframe>0
{
	if iframe>50 iframe-=1;
	else if global.difficulty==0 iframe-=1;
	else iframe-=0.75;
}
else iframe = 0;

//Disable jumping if not on groud
if place_free(x,y+1) && !place_meeting(x,y+1,obj_platform)
{
	can_jump = 0;
	if !hooked sprite_index = spr_player_jump;
}

//Check transitions
if place_meeting(x,y,obj_room_up)
{
	y = room_height - 48;
	switch room
	{
		case rm_cave_middle1: room_goto(rm_cave_up1); break;
		case rm_cave_middle2: room_goto(rm_cave_up2); break;
		case rm_cave_middle3: room_goto(rm_cave_up3); break;
		case rm_cave_middle4: room_goto(rm_cave_up4); break;
		case rm_cave_middle5: room_goto(rm_cave_up5); break;
		case rm_cave_down1: room_goto(rm_cave_middle1); break;
		case rm_cave_down2: room_goto(rm_cave_middle2); break;
		case rm_cave_down3: room_goto(rm_cave_middle3); break;
		case rm_cave_down4: room_goto(rm_cave_middle4); break;
		case rm_cave_down5: room_goto(rm_cave_middle5); y = 1152 - 48; break;
		case rm_desert3: room_goto(rm_desert4); break;
		case rm_desert2: room_goto(rm_desert5); break;
	}
}
if place_meeting(x,y,obj_room_down)
{
	switch room
	{
		case rm_cave_middle1: room_goto(rm_cave_down1); break;
		case rm_cave_middle2: room_goto(rm_cave_down2); break;
		case rm_cave_middle3: room_goto(rm_cave_down3); break;
		case rm_cave_middle4: room_goto(rm_cave_down4); break;
		case rm_cave_middle5: room_goto(rm_cave_down5); break;
		case rm_cave_up1: room_goto(rm_cave_middle1); break;
		case rm_cave_up2: room_goto(rm_cave_middle2); break;
		case rm_cave_up3: room_goto(rm_cave_middle3); break;
		case rm_cave_up4: room_goto(rm_cave_middle4); break;
		case rm_cave_up5: room_goto(rm_cave_middle5); break;
		case rm_desert4: room_goto(rm_desert3); break;
		case rm_desert5: room_goto(rm_desert2); break;
	}
	y = 48;
}
if place_meeting(x,y,obj_room_next)
{
	if room == rm_desert3
	{
		room_goto(rm_cave_middle1);
		x = 1024 - 48;
	}
	else if room == rm_desert5
	{
		room_goto(rm_desert4);
		x = 2048 - 48;
	}
	else
	{
		if room == rm_cave_middle1 || room == rm_cave_up2
			x = 1536 - 48;
		else
		if room == rm_cave_middle2 || room == rm_cave_up3
			x = 1024 - 48;
		else
		if room == rm_cave_down4
			x = 1024 - 80;
		else
			x = room_width - 48;
		room_goto_next();
	}
}
if place_meeting(x,y,obj_room_prev)
{
	if room == rm_cave_middle1
		room_goto(rm_desert3);
	else if room == rm_desert4
		room_goto(rm_desert5);
	else if room == rm_cave_middle5
	{
		if y>500 {y = 32+20; x = 80; room_goto_previous(); exit;}
		else room_goto(rm_cave_up4);
	}
	else if room == rm_cave_middle4
	{
		room_goto_previous(); x = 48+128; exit;
	}
	else
		room_goto_previous();
	x = 48;
}

//Room music
if room == rm_desert3
{
	audio_sound_gain(global.desert, clamp((x-600)/1100,0,1), 0);
	audio_sound_gain(mus_cave, clamp((1700-x)/1100,0,1), 0);
}
if room == rm_cave_up5
if y > room_height+20
{
	if !global.ghost_exists
	{
		x=room_width/2;
		y=room_height/4;
		exit;
	}
	health = 0;
	audio_play_sound(snd_hurt, 1, false);
	with obj_grap instance_destroy();
	instance_destroy();
	audio_play_sound(snd_death, 1, false);
}
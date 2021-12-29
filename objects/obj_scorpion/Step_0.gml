/// @desc
if iframe > 0 iframe -= 1;

//Collision horizontal
x += hsp+hspd;
if place_meeting(x,y,obj_wall)
{
	if hsp+hspd > 0 {while place_meeting(x,y,obj_wall) x-=0.5; hsp=0;}
	else {while place_meeting(x,y,obj_wall) x+=0.5; hsp=0;}
}

//Gravity
vsp += 1-global.difficulty/2;
if !place_free(x,y+vsp)
{
	if vsp > 0
	{
		move_contact_solid(270, 64);
		vsp=0;
		if hsp>0 {hsp-=2; if hsp<0 hsp=0;}
		if hsp<0 {hsp+=2; if hsp>0 hsp=0;}
		if hspd>0
		{
			if place_free(x+32,y+1) || place_meeting(x+1, y, obj_wall) {hspd = -1; image_xscale = -1;}
		}
		else
			if place_free(x-32,y+1) || place_meeting(x-1, y, obj_wall) {hspd =  1; image_xscale =  1;}
	}
	else {move_contact_solid(90, 64); vsp=0;}
}
y += vsp;

if hspd!=0
	image = (image + 0.1) mod 4;
else
	image=0;

if place_meeting(x,y,obj_ballsalt)
{
	if iframe==0
	{
		iframe = 40;
		//Recoil
		hsp = 0;
		vsp = -4;
		audio_play_sound(snd_hurt_enemy, 1, false);
		hp -= 1;
		if hp<=0
		{
			instance_destroy();
			audio_play_sound(snd_kill_enemy, 1, false);
		}
	}
}

if stamina > 0 stamina-=1;
if instance_exists(obj_player)
{
	if stamina == 0 && point_distance(x,y, obj_player.x, obj_player.y)<200
	{
		stamina = 60+global.difficulty*90;
		hspd = 0;
		if obj_player.x>x
		{
			image_xscale = 1;
			image = 1;
			hsp = 10-global.difficulty*5;
			vsp = -9+global.difficulty*4.5;
		}
		else if obj_player.x<x
		{
			image_xscale = -1;
			image = 1;
			hsp = -10+global.difficulty*5;
			vsp = -9+global.difficulty*4.5;
		}
	}
}
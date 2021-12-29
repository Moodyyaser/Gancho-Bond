/// @desc
if iframe > 0 iframe -= 1;

//Stop
if hsp>0 {hsp-=2; if hsp<0 hsp=0;}
if hsp<0 {hsp+=2; if hsp>0 hsp=0;}
if vsp>0 {vsp-=2; if vsp<0 vsp=0;}
if vsp<0 {vsp+=2; if vsp>0 vsp=0;}

//Collision horizontal
x += hsp;
if place_meeting(x,y,obj_wall)
{
	if hsp+hspeed>0 {while place_meeting(x,y,obj_wall) x-=0.5; hsp=0;}
	else {while place_meeting(x,y,obj_wall) x+=0.5; hsp=0;}
}

//Gravity
if !place_free(x,y+vsp)
{
	if vsp+vspeed>0 { move_contact_solid(270, 64); vsp=0; }
	else {move_contact_solid(90, 64); vsp=0;}
}
if hsp
y += vsp;

image = (image + 0.2) mod 4;

//Chase the player
if instance_exists(obj_player)
{
	if obj_player.x>x image_xscale = 1;
	if obj_player.x<x image_xscale =-1;
	shoot += 1;
	if shoot >= 60+global.difficulty*20
	{
		shoot = 0;
		audio_play_sound(snd_shoot, 1, false);
		var dir = point_direction(x,y, obj_player.x, obj_player.y);
		if global.difficulty {
		    var tempid = instance_create_layer(x,y, "Instances", obj_shot);
			tempid.hspd = lengthdir_x(8,dir);
			tempid.vspd = lengthdir_y(8,dir);
		}
		else
		for (var i = -30; i <= 30; i+=30) {
		    var tempid = instance_create_layer(x,y, "Instances", obj_shot);
			tempid.hspd = lengthdir_x(8,dir+i);
			tempid.vspd = lengthdir_y(8,dir+i);
		}
	}
}
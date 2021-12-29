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

if place_meeting(x,y,obj_ballsalt)
{
	instance_destroy();
	audio_play_sound(snd_kill_enemy, 1, false);
}
//Chase the player
if instance_exists(obj_player)
{
	if point_distance(x,y, obj_player.x, obj_player.y)<160 chase = 1;
	if chase
	{
		mp_potential_step(obj_player.x, obj_player.y, 3-global.difficulty, false);
		if x>xprevious image_xscale = 1;
		if x<xprevious image_xscale =-1;
	}
}
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

image = (image + 0.1) mod 4;
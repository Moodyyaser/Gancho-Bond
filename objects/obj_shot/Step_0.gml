/// @desc check wall collision
x += hspd;
y += vspd;
if place_meeting(x,y,obj_wall)
if image_index == 0
{
	speed = 0;
	image_index = 1;
	alarm[0] = 2;
}
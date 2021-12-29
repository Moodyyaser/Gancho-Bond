/// @desc
if yprevious<=other.y-16 || y< other.y-8
{
	y = other.y-20;
	vsp = 0;
	if can_jump == 0
		scr_play_sound();
	can_jump=1;
	x+=other.hspeed;
	if other.vspeed>0
		y+=other.vspeed;
}
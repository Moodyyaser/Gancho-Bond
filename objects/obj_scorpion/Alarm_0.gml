/// @desc stop
alarm[0] = 120+irandom(30);
if hspd!=0
{
	hspd=0;
	image = 0;
}
else
{
	image = 0;
	image_xscale = choose(1, -1);
	hspd = image_xscale*1.5;
}
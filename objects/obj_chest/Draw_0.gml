/// @desc
draw_self();
draw_set_color(c_white);
if draw
{
	if global.cups == 1
		draw_text(room_width/2, room_height/2, "It's a half chalise.");
	else
		draw_text(room_width/2, room_height/2, "You made it.\nNow join them together.");
}
if room == rm_desert3
{
	room_goto(rm_cave_middle1);
	x = 1024 - 48;
}
else
{
	x = room_width - 48;
	room_goto_next();
}
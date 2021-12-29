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
}
y = room_height - 48;
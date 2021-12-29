/// @desc die if it stops
rot_fire = (rot_fire + 18) mod 360
switch image_index
{
	case 0:
		if speed == 0
		{
			cool -= 1;
			if cool <=0
			{
				audio_play_sound(snd_grappling_failed, 1, false);
				effect_create_above(ef_ring, x,y, 0, 3551214);
				instance_destroy();
			}
		}
		if place_meeting(x,y,obj_wall) instance_destroy(); break;
	case 1:
		time_down -= 1;
		if time_down <= 0
		{
			if gravity == 0
			{
				connect_to = aconnect_to;
				time_down=5;
				gravity_direction=gravity_after;
				gravity = 0.5;
				speed = 0;
			}
			else
			{
				connect_to = aconnect_to;
				time_down=1000;
				gravity_direction=gravity_direction+180;
				gravity = 0.22;
			}
		}
		if speed > 8 speed = 8;
		if instance_exists(connect_to)
		{
			if hurts && connect_to.hurts
			if collision_line(x,y, connect_to.x,connect_to.y, obj_player, false, true)
			with obj_player
			{
				if iframe==0
				{
					// get hurt
					iframe = 60;
	
					//Recoil
					hsp = 0;
					vsp = -(16-global.difficulty*8);
					health -= 1;
					audio_play_sound(snd_hurt, 1, false);
					with obj_grap instance_destroy();
					if health<=0
					{
						instance_destroy();
						audio_play_sound(snd_death, 1, false);
					}
				}
			}
		} break;
	case 6:
		if speed == 0
		{
			vspeed = -0.5+global.difficulty/4;
			hurts = 1;
		}
		if instance_exists(obj_ghost)
			if point_distance(x,y,obj_ghost.x,obj_ghost.y)<160
				direction = point_direction(x,y, obj_ghost.x, obj_ghost.y); break;
}
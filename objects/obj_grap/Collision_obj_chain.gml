/// @desc hurt chain
if other.image_index exit;
if retract
{
	instance_destroy();
	exit;
}
if hspd > 0 && vspd > 0
{
	//Recoil
	with other
	{
		audio_play_sound(snd_hurt_enemy, 1, false);
		repeat 3
			with instance_create_depth(other.x+16,other.y+16, -1000, obj_explosion) color = 13421772;
		hp -= 1;
		if hp<=0
		{
			instance_create_depth(x,y+48, 0, obj_particle_chain);
			instance_create_depth(x,y+64, 0, obj_particle_chain);
			instance_create_depth(x,y+80, 0, obj_particle_chain);
			obj_big_boulder.gravity = 1;
			image_index = 1;
			audio_play_sound(snd_kill_enemy, 1, false);
		}
	}
	with enemy_parent if distance_to_object(other)<160 chase = true;
	instance_destroy();
}
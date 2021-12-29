/// @desc
if !hooked
{
	draw_sprite_ext(sprite_index, image, x,y, image_xscale,image_yscale, image_angle, c_white, 1);
	if image_xscale == 1
		draw_sprite_ext(spr_player_gun, 0, x,y+offset_gun, 1,1, point_dire,c_white, 1);
	else
		draw_sprite_ext(spr_player_gun, 0, x,y+offset_gun, -1,1, point_dire+180,c_white, 1);
}
else
{
	if point_dire < 90 || point_dire > 270
		var angle = point_dire;
	else
		var angle = point_dire+180;
	draw_sprite_ext(sprite_index, image_index, x,y, image_xscale,image_yscale, angle, c_white, 1);
}
if iframe>0
{
	if iframe == 59 || iframe == 56 || iframe == 53
		draw_sprite(spr_player_hurt, 0, x,y);
	for (var i = 0; i < health; ++i)
	    draw_sprite(spr_health, 0, x-12+i*8, y-16);
}
if global.cups == 2
if !instance_exists(obj_ghost)
if !instance_exists(obj_cup)
if !audio_is_playing(snd_win)
{
	draw_sprite(spr_cup, 2, x-16, y-64);
	if random(1)<0.01 effect_create_above(ef_spark, x-16+random(32), y-64+random(32), 0, c_yellow);
}
if dynamite draw_sprite(spr_dynamite, 0, x, y-24);
if fireball draw_sprite(spr_bullet_fire, fireball-1, x, y-24);
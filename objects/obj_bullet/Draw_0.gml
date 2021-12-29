if instance_exists(connect_to)
{
	var dis = point_distance(x,y, connect_to.x, connect_to.y);
	var dir = point_direction(x,y, connect_to.x, connect_to.y);
	draw_sprite_ext(spr_lineearth, 0, x,y, dis,1, dir, c_white,1);
	if hurts
		draw_sprite_ext(spr_lineearth, 1, x,y, dis,1, dir, c_white,0.25+dsin(rot_fire)/4);
}
draw_self();
if hurts && image_index!=1
	draw_sprite_ext(sprite_index, 0, x,y, 1,1, 0, c_white, 0.25+dsin(rot_fire)/4);
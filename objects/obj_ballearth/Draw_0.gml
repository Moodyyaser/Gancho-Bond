/// @desc
if id == inst_3A0BD157
if instance_exists(obj_grap)
if obj_grap.hold == id
{
	var dis = point_distance(x,y, inst_6FC6A8B8.x, inst_6FC6A8B8.y);
	draw_sprite_ext(spr_lineearth, 0, x,y, dis,1, point_direction(x,y, inst_6FC6A8B8.x, inst_6FC6A8B8.y), c_white,1);
}
draw_self();
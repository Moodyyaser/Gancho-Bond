/// @desc
var xdiff = obj_player.x - x;
var ydiff = obj_player.y - y;
var dist = dis/16;
draw_set_color(c_gray);
for (var i = 1; i <= dist; i++)
    draw_sprite(spr_hookball, 0, x+(xdiff/dist)*i, y+(ydiff/dist)*i);
draw_sprite_ext(sprite_index, 0, x,y, 1,1, image_angle, c_white, 1);
if dynamite
	draw_sprite(spr_dynamite, 0, x,y);
if bullet_shoot>0
	draw_sprite(spr_bullet_fire, bullet_shoot-1, x,y);
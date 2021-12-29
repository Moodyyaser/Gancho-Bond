/// @desc
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
draw_text(32, room_height-32, "V 1.1.0");
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_ltgray)
draw_sprite(spr_logo, 0, room_width/2, room_height/4);
draw_text(room_width/2, room_height/3+16, "By Moodyyaser");
draw_text(room_width/2, 260, "Difficulty:");
if global.difficulty draw_text(room_width/2, 290, "Normal");
else draw_text(room_width/2, 290, "Hotshot");


var _val = dsin(rot)*16;
draw_text(room_width/2+96+_val, 290, ">");
draw_text(room_width/2-96-_val, 290, "<");

draw_text(room_width/2, 340, "Press Enter to begin");
draw_text(room_width/2, 480, "Made for GMTK Game Jam 2021\n(Post-jam edition)");
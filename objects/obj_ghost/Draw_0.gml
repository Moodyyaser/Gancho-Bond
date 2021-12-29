var shake = 0;
if hp < 3 shake = 1;
if hp < 2 shake = 2;
if hp < 1 shake = 3;
draw_sprite_ext(sprite_index, image_index+(hp<5)*3, x+random_range(-shake,shake),y+random_range(-shake,shake)+dsin(rot)*2, image_xscale, 1, 0, c_white, 1);
if iframe>25
	draw_sprite_ext(sprite_index, 2, x,y, image_xscale,image_yscale, 0,c_white,(iframe-25)/5);
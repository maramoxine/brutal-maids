/// @description 

var wp_walk = 0
if sprite_index = sPlayerWalk
	switch(floor(image_index)){
		case 0: wp_walk = -3  break;
		case 1: wp_walk = -2  break;
		case 2: wp_walk = 1;
	}	

var gx = lengthdir_x(14, atk_dir) +side_dir *5
var gy = lengthdir_y(14, atk_dir)

gun_xfx = lerp(gun_xfx, gx, 0.5)
gun_yfx = lerp(gun_yfx, gy, 0.5)

draw_sprite_ext(sWpSubmachinegun, 0,
x+ gun_xfx *(1 -0.7*atk_fx), y+ gun_yfx*(1 -0.7*atk_fx) +wp_walk -2, 
1 , side_dir, atk_dir, -1, 1)
draw_sprite_ext(sprite_index, image_index, x, y, 
side_dir , 1, 0, -1, 1)

if !keyboard_check(vk_shift) exit

if on_ground() draw_set_color(c_orange)
draw_point(x, y)
draw_point(x -1, y)
draw_set_color(-1)
draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, 1)
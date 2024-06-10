/// @description 

draw_sprite_ext(sprite_index, image_index, x, y, 
side_dir , 1, 0, -1, 1)

if !keyboard_check(vk_shift) exit

if on_ground() draw_set_color(c_orange)
draw_point(x, y)
draw_point(x -1, y)
draw_set_color(-1)
draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, 1)


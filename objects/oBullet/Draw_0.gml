/// @description 
draw_sprite_ext(sprite_index, image_index, x, y
, 1, 1, 0, -1, 1)

shader_reset();

if !keyboard_check(vk_shift) exit

draw_point(x, y)
draw_point(x -1, y)
draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, 1)
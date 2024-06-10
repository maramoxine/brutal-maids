/// @description

draw_sprite_ext(sprite_index, image_index, x, y, 
image_xscale, image_yscale, 0, -1, 1)

if !keyboard_check(vk_shift) exit

draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, 1)
draw_text(x, y, xvel)
draw_set_color(c_yellow)
draw_rectangle(bbox_left, bbox_top, bbox_right, y +4, 1)
draw_set_color(-1)
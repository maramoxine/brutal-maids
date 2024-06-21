/// @description Insert description here

if hit_stop shader_set(vHitFlash)

var xsc_ = 1
//if move_dir>90 && move_dir <270 xsc_ = -3

draw_sprite_ext(sprite_index, image_index, x, y
, 1, xsc_, round(move_dir), -1, 1)

shader_reset();

if !keyboard_check(vk_shift) exit

draw_line(x, y,  x+xvel, y+yvel)
draw_point(x, y)
draw_point(x -1, y)
draw_text(x, y, $"movedir{move_dir}")
draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, 1)
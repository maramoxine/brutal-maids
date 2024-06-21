/// @description 

var _dr	= 1
if fade && (timer <40) _dr	= floor(timer /2) mod 2

if _dr
draw_sprite_ext(sprite_index, image_index, x, y, 
side_dir *image_xscale, image_yscale, draw_dir, -1, 1)

if !keyboard_check(vk_shift) exit

if on_ground() draw_set_color(c_orange)
draw_point(x, y)
draw_point(x -1, y)
draw_set_color(-1)
draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, 1)
draw_text(x, y -16, string(timer) +" <timer " +string(_dr))
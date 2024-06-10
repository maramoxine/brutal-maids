/// @description 

if !(draw_solids) 
exit;

if (keyboard_check(vk_shift))
{
	draw_set_color(c_ltgray)
	draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, 1)
	draw_set_color(-1)
}
draw_self()

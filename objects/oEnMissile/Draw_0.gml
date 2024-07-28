/// @description Insert description here

if hit_stop shader_set(vHitFlash)

var xsc_ = 1
//if move_dir>90 && move_dir <270 xsc_ = -3

if off_screen(-8){
	var vx = camera_get_view_x(view_camera[0]);
	var vy = camera_get_view_y(view_camera[0]);
	
	var xd = clamp(x, vx +8, vx +g.gameWidth -8)
	var yd = clamp(y, vy +8, vy +g.gameHeight -8)
	var dd = point_direction(xd, yd, x, y)
	
	draw_sprite_ext(sUiArrow, 0, xd, yd
	, 1, 1, dd, -1, 1)
}

var mvd_	= round(move_dir /22.5) *22.5
draw_sprite_ext(sprite_index, image_index, x, y
, 1, xsc_, mvd_, -1, 1)

shader_reset();

if !keyboard_check(vk_shift) exit

var max_x = lengthdir_x(move_spd, move_dir)
var max_y = lengthdir_y(move_spd, move_dir)
var max_r = point_distance( 0, 0, max_x, max_y)

draw_line(x, y, x +max_x *6, y)
draw_circle(x, y, max_r *6, 1)
draw_line(x, y, x, y +max_y *6)
draw_line(x, y,  x+xvel *6, y+yvel *6)
draw_point(x, y)
draw_point(x -1, y)
draw_text(x, y, $"movedir{move_dir}")
draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, 1)
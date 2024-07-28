/// @description 

if hit_stop shader_set(vHitFlash)

draw_sprite_ext(sprite_index, image_index, x, y, 
side_dir *image_xscale, image_yscale, 0, -1, 1)

if off_screen(-8) && object_get_parent(object_index) != oProp{
	var vx = camera_get_view_x(view_camera[0]);
	var vy = camera_get_view_y(view_camera[0]);
	
	var xd = clamp(x, vx +8, vx +g.gameWidth -8)
	var yd = clamp(y, vy +8, vy +g.gameHeight -8)
	var dd = point_direction(xd, yd, x, y)
	
	draw_sprite_ext(sUiArrow, 0, xd, yd
	, 1, 1, dd, -1, 1)
}

shader_reset()
#region debug

if !keyboard_check(vk_shift) exit

draw_set_color(c_black)
draw_rectangle(bbox_left -1, y -48, bbox_right +1, y -42, 0)
draw_set_color(-1)
draw_rectangle(bbox_left, y-47, bbox_left+ 
(bbox_right -bbox_left) *clamp(hp /hp_max, 0, 1), y-43, 0)

draw_set_halign(fa_center)
if on_ground() draw_set_color(c_orange)
draw_point(x, y)
draw_point(x -1, y)
draw_set_color(-1)
draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, 1)
draw_text(x, y -32, $"!{state_current}! {state_timer} \n{id} {real(id)}")
draw_set_halign(fa_left)


#endregion
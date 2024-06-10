/// @description 

if !keyboard_check(vk_shift) exit

var vx = camera_get_view_x(view_camera[0])
,	vy = camera_get_view_y(view_camera[0])
,	vh = camera_get_view_height(view_camera[0])

//#region shit

draw_text(vx +8, vy +8 , $"x {x}")
draw_text(vx +8, vy +16, $"y {y}")
draw_text(vx +8, vy +24, $"bbox b {bbox_bottom}")
draw_text(vx +8, vy +40, $"xvel {xvel} int {xvel_int} frac {xvel_fract}")
draw_text(vx +8, vy +48, $"yvel {yvel} int {yvel_int} frac {yvel_fract}")
draw_text(vx +8, vy +64, $"state {script_get_name(state_current)}")
draw_text(vx +8, vy +72, $"st time {state_timer}")
draw_text(vx +8, vy +80, $"on ground {grounded} {ground_was}")

draw_text(vx +8, vy +96 ,
$"attacked enemies {ds_list_size(hit_by_atk)} - hitnow {ds_list_size(hitnow)}")
var i = 0;
repeat(ds_list_size(hit_by_atk)){
	var d_ =  hit_by_atk[|i]
	draw_text(vx +8, vy +104 +8*i ,
	$"{ds_list_find_index(hit_by_atk, d_)} {object_get_name(d_.object_index)} {d_}")
	i++;
}

var xo = x+ side_dir *8
draw_rectangle(	xo, bbox_top +3, 16* side_dir +xo, bbox_bottom -3, 1)

//var haxis = sign(round(gamepad_axis_value(0, gp_axislh) *1.5))
//var vaxis = sign(round(gamepad_axis_value(0, gp_axislv) *1.5))
//draw_arrow(vx +48, vy+(vh-32), vx +48 + haxis *16, vy+(vh-32) + vaxis *16, 6)
var _haxis = gamepad_axis_value(0, gp_axislh)
var _vaxis = gamepad_axis_value(0, gp_axislv)
draw_arrow(vx +48, vy+(vh-32), vx +48 + _haxis *16, vy+(vh-32) + _vaxis *16, 12)

//if (on_platform()){
//	draw_text(on_platform().x, on_platform().y, "pl")
//}
//var sl = on_slope();

//if sl{
//	if sl.object_index == oSlopeWall exit;
//	var ts = lengthdir_x(move_spd, 45 /abs(sl.image_xscale))
	
//	if side_dir==sign(sl.image_xscale) draw_set_color(c_blue);
//	draw_text(sl.x, sl.y, $"sl {sign(sl.image_xscale)} {abs(sl.image_xscale)} {ts}")
//	draw_set_color(-1)
//}

if hold_id{
	draw_sprite(sFxPlatformGear,
	0, hold_id.x, hold_id.y)
	
}
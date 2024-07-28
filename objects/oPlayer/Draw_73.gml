/// @description 

var vx = camera_get_view_x(view_camera[0])
,	vy = camera_get_view_y(view_camera[0])
,	vh = camera_get_view_height(view_camera[0])

var wp = sWpPistol
var bfx = atk_fx *2.5
var wp_x = sprite_get_xoffset(wp)
,	wp_y = sprite_get_yoffset(wp)
,	wp_h = sprite_get_height(wp)

if !keyboard_check(vk_shift){
	draw_sprite_ext(sWpPistol, 0, vx +8 +wp_x, vy +16 +wp_y,
	1, 1, 0, -1, 1)
	
	draw_set_color($0d1363)
	draw_rectangle(vx +40, vy +8, vx+ 80, vy +15, 0)
	draw_set_color(c_red)
	draw_rectangle(vx +40, vy +8, vx+ 40+ 40*(hp/hp_max), vy +15, 0)
	draw_set_color(-1)
	
	draw_set_font(global.fontAmmo)
	draw_text( vx +8, vy +8, $"hp {hp}")
	draw_text( vx +24, vy +16 +bfx, $" {ammo}")
	draw_text( vx +24, vy +16, $"\n/{ammo_max}")
	if kalt draw_text( vx +8, vy +32, $"[LoCK]")
	draw_set_font(font2)
	exit;
}

#region shit

//draw_text(vx +8, vy +8 , $"x {x}")
//draw_text(vx +8, vy +16, $"y {y}")
//draw_text(vx +8, vy +24, $"bbox b {bbox_bottom}")
//draw_text(vx +8, vy +40, $"xvel {xvel} int {xvel_int} frac {xvel_fract}")
//draw_text(vx +8, vy +48, $"yvel {yvel} int {yvel_int} frac {yvel_fract}")
//draw_text(vx +8, vy +64, $"state {script_get_name(state_current)}")
//draw_text(vx +8, vy +72, $"st time {state_timer}")
//draw_text(vx +8, vy +80, $"on ground {grounded} {ground_was}")
//draw_text(vx +8, vy +88, $"aim {atk_dir} {round(atk_dir /90)}")

draw_text(vx +8, vy +8 ,
//$"attacked enemies {ds_list_size(hit_by_atk)} - hitnow {ds_list_size(hitnow)}"
$"id {id} ({(real(id))}) {typeof(id)} ({typeof(real(id))})"
)

for (var i = 0; i <(ds_list_size(hit_by_atk)); i++){
	var d_ =  hit_by_atk[|i]
	var instd = $"{d_} ({typeof(d_)})"
	draw_text(vx +8, vy +16 +8*i , instd)
}

var xo = x+ side_dir *8
draw_rectangle(	xo, bbox_top +3, 16* side_dir +xo, bbox_bottom -3, 1)

var haxis = sign(round(gamepad_axis_value(0, gp_axislh) *1.5))
var vaxis = sign(round(gamepad_axis_value(0, gp_axislv) *1.5))
draw_arrow(vx +48, vy+(vh-32), vx +48 + haxis *16, vy+(vh-32) + vaxis *16, 6)
var _haxis = gamepad_axis_value(0, gp_axislh)
var _vaxis = gamepad_axis_value(0, gp_axislv)
draw_arrow(vx +48, vy+(vh-32), vx +48 + _haxis *16, vy+(vh-32) + _vaxis *16, 12)
#endregion
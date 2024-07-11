  /// @description 

var vx = camera_get_view_x(view_camera[0])
,	vy = camera_get_view_y(view_camera[0])
,	vw = camera_get_view_width(view_camera[0]);

var _bc = "f4 fullscreen"
if os_browser != browser_not_a_browser
	_bc = "f10 fullscreen"

draw_set_halign(fa_right)
draw_text(vx +vw -8, vy +8, _bc)
draw_text(vx +vw -8, vy +16, $"fps {fps}")
draw_text(vx +vw -8, vy +24, $"{object_get_name(en_ls[| en_select])}<<[3] [2]->")

draw_set_halign(fa_left)
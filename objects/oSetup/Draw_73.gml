  /// @description 

var vx = camera_get_view_x(view_camera[0])
,	vy = camera_get_view_y(view_camera[0])
,	vw = camera_get_view_width(view_camera[0])
,	vh = camera_get_view_height(view_camera[0])
,	ww = window_get_width()
,	wh = window_get_height()

var _bc = "f4 pa pantalla completa papito"
if os_browser != browser_not_a_browser 
	_bc = "f10 pa pantalla completa papito"

draw_set_halign(fa_right)
draw_text(vx +vw -8, vy, _bc)

draw_text(vx +vw -8, vy +8, $"gamepad connected {gamepad_is_connected(0)}")
draw_text(vx +vw -8, vy +16, $"fps {fps}")
draw_text(vx +vw -8, vy +24, $"display {display_get_width()} {display_get_height()}")
draw_text(vx +vw -8, vy +32, $"window {window_get_width()} {window_get_height()}--")
draw_text(vx +vw -8, vy +40, $"surface {surface_get_width(application_surface)} {surface_get_height(application_surface)}")

//draw_text(vx +vw -8, vy +48, "resolution " +string(global.resolution))
//draw_text(vx +vw -8, vy +56, "zoom " +string(global.zoom))

draw_set_halign(fa_left)
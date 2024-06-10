/// @description 

if (keyboard_check_pressed(ord("1"))) bg_debug = !bg_debug

if !bg_debug exit;

var vx = camera_get_view_x(view_camera[0])
,	vy = camera_get_view_y(view_camera[0])
,	vw = global.gameWidth
,	vh = global.gameHeight

draw_set_halign(fa_right)

var sb_ = (room_width /sprite_get_width(sBgTest1))
, test_x = (room_width) *0.4
, test_w = (room_width) *0.4 +sprite_get_width(sBgTest1)

draw_text(vx +vw -4, vy +vh -16,$"vx {vx} vy {vy}")
draw_text(vx +vw -4, vy +vh -24,
$"rW / by {sprite_get_name(sBgTest1)} {sb_} {ceil(sb_)}")
draw_text(vx +vw -4, vy +vh -32, $"test {test_x} {test_w}")

draw_set_halign(fa_left)
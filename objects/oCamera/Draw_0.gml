/// @description 

if !keyboard_check(vk_shift) exit

var _x = camera_get_view_x(cam)
, _y = camera_get_view_y(cam)
, _w = global.gameWidth /2
, _h = global.gameHeight /2

//draw_sprite(sFxPlatformGear,0,_x +_w, _y +_h)
//draw_text(_x +_w, _y +_h -32, $"({testmode}) view?{view_enabled} vis?{view_get_visible(0)}")
//draw_sprite(sFxPlatformGear,0,_x +_w -xvel_cam, _y +_h)
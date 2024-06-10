/// @descriptiobn 

fx_active += (abs(xvel) +abs(yvel)) *4
var fx_y = -(1 -active) *2
fx_y_lerp = lerp(fx_y_lerp, fx_y, 0.4)

var bl = floor(bbox_left)
, bt = floor(bbox_top)
, br = floor(bbox_right);

draw_sprite_ext(sFxPlatformGear, 0, bl +6,
bt +2, 1.6, 1.6, fx_active, -1, 1 )
draw_sprite_ext(sFxPlatformGear, 0, br -4,
bt -2, 1, 1, -fx_active *1.3, -1, 1 )
draw_sprite_ext(sprite_index, image_index, x, y +fx_y_lerp, 
image_xscale, image_yscale, 0, -1, 1)

if !keyboard_check(vk_shift) exit
draw_text(x, y -8, xvel)
draw_text(x, y -16, yvel)
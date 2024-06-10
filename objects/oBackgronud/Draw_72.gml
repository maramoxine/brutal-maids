 /// @description 

var vx = camera_get_view_x(view_camera[0])
,	vy = camera_get_view_y(view_camera[0])
,	vw = camera_get_view_width(view_camera[0])
,	vh = camera_get_view_height(view_camera[0]);

if !(surface_exists(bg_surface))
{
	bg_surface = surface_create(global.gameWidth +1,global.gameHeight +1)
	surface_set_target(bg_surface)
	draw_clear_alpha(c_black, 0);
	surface_reset_target()
}

surface_set_target(bg_surface)

if bg_debug shader_set(vColorChange)
draw_sprite_tiled(sBgSpace, 0, lerp(0, vx, -0.2), lerp(0, vy, -0.2))
draw_sprite_tiled(
	sBgTest1, 0, lerp(0, vx, -0.8), lerp(0, vy, -0.8))

/*

var i = 0
, w = sprite_get_width(sBgTest1)
, sb_ = ceil(room_width /w);


repeat(sb_){
	draw_sprite(
	sBgTest1, 1, lerp(0, vx , 0.4) +i* w,
	lerp(room_height -sprite_get_height(sBgTest1), vy, 0.4))
	i++;
}

draw_sprite(
sBgTest1, 0, lerp(0, vx , 0.15),
lerp(room_height -sprite_get_height(sBgTest1), vy, 0.15))
*/

surface_reset_target()

var uTime = shader_get_uniform(vHeatDistort, "Time");
var uTexel = shader_get_uniform(vHeatDistort, "Texel");

shader_set(vHeatDistort);
shader_set_uniform_f(uTime, current_time *2.);
var tex = surface_get_texture(bg_surface)
shader_set_uniform_f(uTexel, texture_get_texel_width(tex), texture_get_texel_height(tex));

draw_surface(bg_surface, vx, vy);

shader_reset()
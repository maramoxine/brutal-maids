/// @description 

game_init()
global.font1 = font_add_sprite(sFont1, ord("!"),1 , -1 )
draw_set_font(global.font1)
global.fullscreen = 0

application_surface_draw_enable(false)

persistent = true

if (!instance_exists(oCamera))
	instance_create_depth(0, 0, 0, oCamera)

window_set_size(global.gameWidth *global.zoom, global.gameHeight *global.zoom)
window_set_position(display_get_width()/2 - ((global.gameWidth *global.zoom) /2),
display_get_height()/2 - ((global.gameHeight *global.zoom) /2)) 
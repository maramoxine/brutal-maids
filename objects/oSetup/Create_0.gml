/// @pasa UNA PURA VE OSTIAA

persistent = true

game_init()
global.font1 = font_add_sprite(sFont1, ord("!"),1 , -1 )
draw_set_font(font2)
global.fullscreen = 0
global.fontAmmo = font_add_sprite(sAmmoFont, ord("!"),0 , 0)

en_ls = ds_list_create()
ds_list_add(en_ls,
oEnImp,
oEnPinions,
oEnMissile,
oEnBomb)

en_select = 0
en_max = ds_list_size(en_ls) -1

application_surface_draw_enable(false)
if (!instance_exists(oCamera))
	instance_create_depth(0, 0, 0, oCamera)

window_set_size(global.gameWidth *global.zoom, global.gameHeight *global.zoom)
window_set_position(display_get_width()/2 - ((global.gameWidth *global.zoom) /2),
display_get_height()/2 - ((global.gameHeight *global.zoom) /2)) 
/// @description 

if (surface_get_width(application_surface) != global.gameWidth
|| surface_get_height(application_surface) != global.gameHeight)
{
	surface_resize(application_surface
	, global.gameWidth *global.resolution
	, global.gameHeight *global.resolution)	
}

var fsx = 0,
fsw = global.gameWidth *global.zoom,
fsh = global.gameHeight *global.zoom;

if (window_get_fullscreen())
{	
	fsw = (window_get_height() /global.gameHeight) *global.gameWidth;
	fsh = window_get_height();
	fsx = (window_get_width() -fsw) /2;
}

draw_surface_stretched(application_surface, fsx,0, fsw,fsh)
shader_reset()
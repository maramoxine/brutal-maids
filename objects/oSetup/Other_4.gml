/// @Cada room al empezar

instance_create_depth(0, 0, 0, oBackgronud)
instance_create_depth(0, 0, 0, oParticles)

if (!window_get_fullscreen() 
	&& ((window_get_width() !=global.gameWidth *global.zoom) 
	|| (window_get_height() != global.gameHeight *global.zoom)))
{
	window_set_size(global.gameWidth *global.zoom, global.gameHeight *global.zoom)
	//surface_resize(application_surface
	//, global.gameWidth *global.resolution
	//, global.gameHeight *global.resolution)
	window_set_position(display_get_width()/2 - ((global.gameWidth *global.zoom) /2),
	display_get_height()/2 - ((global.gameHeight *global.zoom) /2)) 
}
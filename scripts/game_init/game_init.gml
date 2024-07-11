/// ----------------------
function game_init(){

g.gameWidth = 512
g.gameHeight = 320
g.resolution = 1
g.zoom = 2
g.fullscreen = false
gpu_set_tex_filter(0);
}

#macro STAGEST 0
#macro Selectstage:STAGEST 1

#macro draw_solids true
#macro bbox_depth bbox_bottom -room_height
#macro die instance_destroy()
#macro g global

enum enemyState // constant states
{
	dead = 0,
	free = 1,
	hit = 2,
	idle = 3,
	kdown = 4,
	stomp = 5,
}

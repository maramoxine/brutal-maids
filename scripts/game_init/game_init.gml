/// ----------------------
function game_init(){

global.gameWidth = 512
global.gameHeight = 320
global.resolution = 1
global.zoom = 2
global.fullscreen = false
gpu_set_tex_filter(0);

}

#macro STAGEST 0
#macro SELECTSTAGE:STAGEST 1

#macro draw_solids true
#macro bbox_depth bbox_bottom -room_height
#macro die instance_destroy()
#macro ind_r image_index = 0;

enum enemyState // constant states
{
	dead = 0,
	free = 1,
	hit = 2,
	idle = 3,
	kdown = 4,
	stomp = 5,
	grabbed = 6,
	thrown = 7
}

/// @description 

if keyboard_check_pressed(ord("R")) {
	room_restart()
	part_particles_clear(global.fx)
	part_particles_clear(global.fx2)
	//audio_stop_all()
}

var _bc = false;
if (os_browser == browser_not_a_browser)
	_bc = true;

if (keyboard_check_pressed(ord("1")))
	en_select = (en_select <=0)? en_max : en_select -1;
if (keyboard_check_pressed(ord("2")))
	en_select = (en_select >=en_max)? 0 : en_select +1;
if keyboard_check_pressed(ord("3")){
	var xsp = 0,
		ysp = 0;
	while(collision_circle(xsp, ysp, 8, oSolid, 0, 1)){
		xsp = irandom_range(0, room_width);
		ysp = irandom_range(0, room_height);
	}
	instance_create_depth(xsp, ysp, 0, en_ls[| en_select])
	
}

if (keyboard_check_pressed(vk_enter)
	&& STAGEST && room!= 0)
		room_goto(0)

if keyboard_check_pressed(vk_f4) && _bc{
	if window_get_fullscreen(){
		window_set_fullscreen(false);}
	else{
		window_set_fullscreen(true);}
}

global.fullscreen = window_get_fullscreen();
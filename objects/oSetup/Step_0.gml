/// @description 

if keyboard_check_pressed(ord("R")) {
	room_restart()
	audio_stop_all()
}

var _bc = true
if os_browser != browser_not_a_browser _bc = false

if (mouse_check_button_pressed(mb_left))
	instance_create_depth(mouse_x, mouse_y, 0, oEnFish)
if (mouse_check_button_pressed(mb_right))
	instance_create_depth(mouse_x, mouse_y, 0, oEnemy)
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
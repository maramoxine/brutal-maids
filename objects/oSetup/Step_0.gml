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

if keyboard_check_pressed(vk_f4) && _bc{
	window_set_fullscreen(!global.fullscreen)
	//window_set_showborder(!global.fullscreen)
}

global.fullscreen = window_get_fullscreen();
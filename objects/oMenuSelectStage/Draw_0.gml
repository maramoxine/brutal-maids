/// @description

var rw = global.gameWidth
,	rh = global.gameHeight
,	vx = camera_get_view_x(view_camera[0])
,	vy = camera_get_view_y(view_camera[0])


//draw_set_halign(fa_middle)
draw_set_valign(fa_center)
draw_set_font(font2)
var select_separ = 13

var time = (current_time /60) /10
var rm_amount = string_char_at(string(room_last), string_length(string(room_last)))
var to_ = -(select_separ *rm_amount) /2

change_lerp = lerp(change_lerp, 0, 0.4)

current_option += -keyboard_check_pressed(ord("W")) +keyboard_check_pressed(ord("S"))
if current_option >(rm_amount -1) current_option = 0
if current_option <0 current_option = rm_amount -1

if (current_option != option_fx){
	change_lerp = option_fx <current_option? 1.: -1.;
	option_fx = current_option
	audio_play_sfx(aSfxPlayerCrouch, -1)
}

if (keyboard_check_pressed(vk_enter)){
	room_goto(current_option +1)
}

var dx = 128 +vx
var dy = 32 +vy

draw_sprite(sPlayerIdle, 0, dx -16, (change_lerp *2)+
dy +current_option *select_separ +(3 *sin(time +current_option)))

var i = 0
repeat(rm_amount){
		draw_text_transformed(dx, 
		dy +i*select_separ +(3 *sin(time +i)),
		$"{i} - {room_get_name(i +1)}",
		1, 1, 0)
	i++;
}

draw_set_halign(fa_left);
draw_set_valign(fa_top)
draw_set_font(global.font1)
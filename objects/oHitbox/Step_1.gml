/// @description 

if !instance_exists(inst_id) || inst_id = noone die

var hit_d = 0
var _wb = bx_w/2 , _hb = bx_h /2
var en_ = collision_rectangle(
	x -_wb, y -_hb, x +_wb, y +_hb, oEnemy, 0, 1)

if en_{
	en_.xvel = en_.grounded? _h.xspd : _h.xair
	en_.yvel = en_.grounded? _h.yspd : _h.yair
	en_.yvel_fract = 0
	en_.state_current = 2
	en_.state_prev = -1
	en_.side_dir = -_h.side_dir
	en_.hit_stop = _h.h_stop
	en_.hit_timer = _h.h_timer
	
	inst_id.hit_reg = true
	audio_play_sound(_h.sfx, 0, 0)
	
	die
}

if !timer || hit_d die
timer--

depth = inst_id.depth -1
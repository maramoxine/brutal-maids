/// @description 

platformer_init()

_h = {
	xspd : 0,
	yspd : 0,
	xair : 0,
	yair : 0,
	sfx : aSfxWeakHit1,
	h_timer : 30,
	h_stop : 6,
	side_dir : 1
}

bx_w = 16
bx_h = bx_w

hit_active = false
inst_id = noone
timer = 15

offx = 0
offy = 0

depth = -3
/// @description 

grounded = on_ground();

timer --
if !timer die;

yvel += grav

if grounded
	{
	yvel = -1.5
	yvel_fract = 0
}

var _xv = wall_on_side(abs(xvel) +1)
if _xv != 0
	{
	xvel = -1 *_xv
	xvel_fract = 0
}

ent_postState(0, grav ,0)
depth = bbox_depth;
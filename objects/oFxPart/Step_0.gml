/// @description 

grounded = on_ground();

timer --
if !timer die;

yvel_sv = yvel;
yvel += grav

var bounce = function(){
	if argument[0]{
		_xv = wall_on_side(abs(xvel) +1)
		xvel = -1 *_xv
		xvel_fract = 0
	}
	else if yvel_sv >0{
		yvel = -min(yvel_sv *0.8, 4)
		yvel_fract = 0
	}
}

ent_postState(0, 0, bounce)
depth = bbox_depth;
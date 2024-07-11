/// @description 

grounded = on_ground()

xvel = approach(xvel, move_dir *move_spd, move_acc)
yvel = approach(yvel, 0, move_acc)

if (instance_place(x +xvel +move_dir *24, y, oWall))
&& (instance_place(x +xvel +move_dir *24, y, oBalloon))
	move_dir *= -1.;

if jump_an && animation_end(){
	jump_an = 0;
	image_index = 0;
}

switch(jump_an){
	case 0:
		sprite_index = sEnBalloon
		image_speed =  1 /3
	break;
	case 1:
		sprite_index = sEnBalloonJumpAn
		image_speed =  1 /2
	break;
}

bc_c = function(){
	var xy_ = argument[0]
	
	switch(xy_){
		case 1:
		if abs(floor(xvel)) xvel = -xvel;
		else xvel = 0.
		xvel_fract = 0.0
		break;
		
		case 0:
		if abs(floor(yvel)) yvel = -yvel;
		else yvel = 0.
		yvel_fract = 0.0
		break;
	}
}

ent_postState(0 , 0, bc_c)
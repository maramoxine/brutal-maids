/// @description 

move_dir *= coll_x(move_dir) ? -1 : 1
xvel = approach(xvel, move_dir *move_spd, move_acc)

grounded = on_ground()

if (jump_an == 1){
	sprite_index = sEnBalloonJumpAn
	image_speed = 1/ 2
	if animation_end() jump_an = 0
}
else{
	sprite_index = sEnBalloon
	image_speed = 1/ 3
}

round_vel()

if !move_x(xvel_int, true)
{
    xvel       = 0
    xvel_fract = 0
}

// Use the yvel_int hereA 
if !move_y(yvel_int)
{
    yvel       = 0
    yvel_fract = 0
}

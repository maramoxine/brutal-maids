/// @description 

round_vel()

x_move_dir *= coll_x(x_move_dir) ? -1 : 1
y_move_dir *= coll_y(y_move_dir) ? -1 : 1

xvel = approach(xvel, x_move_dir *move_spd, move_acc)
yvel = approach(yvel, y_move_dir *move_spd, move_acc)

moving_loop()

if !move_platform_x(xvel_int)
{
    xvel       = 0
    xvel_fract = 0
}

if !move_platform_y(yvel_int)
{
    yvel       = 0
    yvel_fract = 0
}
/// ---------------------- lol
function slope_move(){
	
var _xdir = argument[0]

// Inside a slope (must go up)
if collision_point(x, bbox_bottom, oSlope, true, true)
{
    // If we cannot move up, we must go back.
    if !move_y(-1)
    {
        x -= _xdir
        return 0
    }
}

// On a slope going down
if !on_ground() && collision_point(x, bbox_bottom + 2, oSlope, true, true)
{
    move_y(1) // Hey there! Hello move_y, my friend!
}

return true
}
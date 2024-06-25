/// ----------------------
function move_y(){
///@func move_y(yvel, [instance, col_ignore, platforms])

var _do_pl = true
var _yvel    = argument[0]
var _ydir    = sign(_yvel)
var instance = self
var col_ignore = false

switch (argument_count)
{	
	case 4: _do_pl = argument[3]
	case 3: col_ignore = argument[2];
    case 2: instance = argument[1];
}

with(instance)
{
    repeat(abs(_yvel))
    {
        // Going down
        if _ydir{
            if !on_ground(_do_pl) || col_ignore{
                y += _ydir
			}
            else
                return 0
        }
        // Going up
        else{
            if !wall_above() || col_ignore{
                y += _ydir
            }
            else
                return 0
        }
    }
}

return true
}
/// ----------------------
function push_x(){
///@func push_x(instance, [length, lerp_dist, xvel or yvel])

var _en = argument[0]
var _l = 1
var _d = 0.35
var _var = xvel

switch(argument_count){
	case 4:	_var = argument[3]
	case 3:	_d = argument[2]
	case 2:	_l = argument[1]
	}

var dir = point_direction(x ,y, _en.x, _en.y)
if (_var = xvel) return lerp(xvel, lengthdir_x(_l, dir), _d)
else if (_var = yvel) return lerp(yvel, lengthdir_y(_l, dir), _d) 

return _var;

}
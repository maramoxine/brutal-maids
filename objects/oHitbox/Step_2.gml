/// @description 

if !instance_exists(inst_id) exit

if !hit_active{
	var _xb = x
	, _yb = y
	offx = _xb -inst_id.x +inst_id.xvel_int
	offy = _yb -inst_id.y +inst_id.yvel_int
	
	hit_active = true
}

x = inst_id.x +offx
y = inst_id.y +offy
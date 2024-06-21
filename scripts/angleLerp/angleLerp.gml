function angle_lerp(_angle, _goal, _lerp, _max_diff){
	var _a = angle_difference(_angle, _goal)
	return _angle - min( _max_diff, abs(_a *_lerp)) *sign(_a);
}
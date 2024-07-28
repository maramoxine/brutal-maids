/// ----------------------
function wall_on_side(){
	/// @func wall_on_side([dist_check])

	var xdist = 1

	switch (argument_count)
	{
		case 1: xdist = argument[0];
	}

	var col_r = collision_rectangle(
		bbox_left, bbox_top, bbox_right +xdist, bbox_bottom, oWall, false, true)
	var col_l = collision_rectangle(
		bbox_left -xdist, bbox_top, bbox_right, bbox_bottom, oWall, false, true)

	var col_final = col_r || col_l
	if col_l col_final *= -1;

	return col_final;

}
/// ----------------------
function entity_loop(){
	
	// accomodate for widths of each
	if (x > room_width) x = 0
	if (x < 0) x = room_width
	
}

function moving_loop(){
	
	// also with platforms do create and destroy
	// clone teleportation
	
	var xm = bbox_left +((bbox_right -bbox_left) /2)
	,offx = xm -x
	
	if (xm > room_width) x = -offx
	if (xm < 0) x = room_width -offx
}
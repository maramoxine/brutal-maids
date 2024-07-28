/// @func off_screen([offset])
function off_screen(){
	var of = 0.;
	switch(argument_count){
		case 1: of = argument[0];
	}
	
	var vx = camera_get_view_x(view_camera[0]);
	var vy = camera_get_view_y(view_camera[0]);

	if (((x -of) < vx) || ((y -of) < vy) 
	|| ((x +of) > vx+g.gameWidth) || ((y +of) >vy +g.gameHeight)){
		return true;
	}
	return false;
}
 /// @description 

var rm_x = room_width /2
var rm_y = room_height /2

if !instance_exists(target) exit;

var gw = global.gameWidth /2
var gh = global.gameHeight /2

switch (testmode){
	case 0:
		
	var vcspd = 0.015
	var _x = target.x +xvel_cam
	var _y = target.bbox_bottom -16;
	_x = clamp(_x, 0 +gw, room_width -gw )
	_y = clamp(_y, 0 +gh, room_height -gh )

	//if (abs(target.xaxis))
	//	xvel_cam = approach(xvel_cam, sign(target.xaxis) *80, 1.5)
		
	if target.grounded
	|| (target.y <(view_y -rm_y +32))
	|| (target.y >(view_y +32))
		vcspd = 0.05
		
	view_x = lerp( view_x, _x, 0.05)
	view_y = lerp( view_y,  _y, vcspd)
		
	break;
	case 1:
	xvel_cam = 0
	view_x = lerp( view_x, lerp(rm_x, target.x, 1), 1)
	view_y = lerp( view_y, lerp(rm_y, target.y -16, 1), 1)
	break;
	case 2:
	xvel_cam = 0
	view_x= clamp(view_x, 0 +gw, room_width -gw )
	view_y = clamp(view_y , 0 +gh, room_height -gh )
	
	break;
	case 3:
		
	var _x = lerp(rm_x, target.x, 0.3)
	var _y = lerp(rm_y, target.y, 0.3 )
	_x = clamp(_x, 0 +gw, room_width -gw )
	_y = clamp(_y, 0 +gh, room_height -gh )
		
	view_x = lerp( view_x, _x, 0.05)
	view_y = lerp( view_y, _y, 0.05)
		
	break;
}


//view_x= clamp(view_x, 0 +gw, room_width -gw )
//view_y = clamp(view_y , 0 +gh, room_height -gh )
camera_set_view_pos(cam, view_x -global.gameWidth /2,
view_y -global.gameHeight /2)

if (keyboard_check_pressed(vk_tab) &&STAGEST)
testmode = testmode=2 ? 0 : testmode +1
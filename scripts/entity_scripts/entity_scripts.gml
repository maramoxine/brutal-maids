
#macro stunw 6
#macro stunm 12
#macro stuns 18
#macro hittw 20
#macro hittm 35
#macro hitts 48

/// ----------------------
function ent_state_machine(){
	state_is_new		= state_prev != state_current
	state_timer			= state_is_new ? 0 : state_timer + 1
	state_prev			= state_current
}

///-----------------------------
function ent_enemyDamage(){
/// @arg inst
/// @arg xvel
/// @arg yvel
/// @arg check
/// @arg stun
/// @arg timer
	
	var _inst = argument[0]
	, _xv = 0 , _yv = 0
	, _ckg = true
	, _hst = stunw , _hti = hittw
	
	switch argument_count{
		case 6: if argument[5] != undefined _hti = argument[5]
		case 5: if argument[4] != undefined _hst = argument[4]
		case 4: if argument[3] != undefined _ckg = argument[3]
		case 3: if argument[2] != undefined _yv = argument[2]
		case 2: if argument[1] != undefined _xv = argument[1]
		break;
	}
	
	_inst.xvel =		_xv *side_dir
	_inst.yvel =		_yv *!(_inst.grounded *_ckg)
	_inst.yvel_fract =	0
	_inst.state_current = 2
	_inst.state_prev =	-1
	_inst.hit_stop =	stunw
	_inst.hit_timer =	hittw
	
}


/// ----------------------
function ent_enemyStateGrabbed(){
	if state_is_new{
		state_is_new = !state_is_new
		xvel = 0
		yvel = 0
		do_draw = false
	}
	
	var plc = !instance_place(x, y, grabber_id)
	if (!grabber_id || grabber_id.hold_id != id) || plc{
		do_draw = 1
		state_current = 1
		exit
	}
	
	position_to_object(grabber_id, self, 0)
	
}

/// ----------------------
function position_to_object(){
	/// @arg [goal_instance]
	/// @arg [instance]
	/// @arg [col_ignore]
	/// @arg [slope]

		var c_ig = false;
		var inst = self
		var slope_do = true
		var go_inst = argument[0];
	
		switch argument_count{
			case 4: slope_do = argument[3]
			case 3: c_ig = argument[2]
			case 2: inst = argument[1]
			break;
		}
	
		move_x((go_inst.x -x), slope_do, inst, c_ig)
		move_y((go_inst.bbox_bottom -bbox_bottom), inst, c_ig)
	}

/// ----------------------
function grab_state_end(){
	
	if (state_current != enemyState.grabbed
	&& grabber_id){
		do_draw = true;
		if (grabber_id.hold_id = id) 
			grabber_id.hold_id = noone
		grabber_id = noone
		part_particles_create(global.fx, x, y, global.fxRocketSmoke, 1)
	}

}

/// ----------------------
function ent_postState(){
	/// @arg [bounce]
	/// @arg [col_ignore]
	/// @arg [hit_stop_do]
	/// @arg [collision_function]

	var _bounce = true
	var _col_ignore = false
	var _hit_d = true
	var _funct = 0

	switch(argument_count){
		case 4: _funct = argument[3]
		case 3: _hit_d = argument[2]
		case 2: _col_ignore = argument[1]
		case 1: _bounce = argument[0]
		break;
	}

	var o_ = object_get_parent(object_index)
	if o_ = oEnemy || o_ = oProp
		grab_state_end();

	var _en = coll_y(1, oBalloon)
	if _en && (yvel >0) && (_en.y+4 >y) && _bounce{
		xvel *= 0.5
		yvel = -5.3
		yvel_fract = 0
		audio_play_sfx(aSfxBounceBalloon, -1, 0.1)
		with _en{ jump_an = 1; image_index = 0
		}
	}

	// hitstop -----------------------------------------
	if _hit_d hit_stop = hit_stop? hit_stop -1 : hit_stop

	#region Movement after all state calculations
	round_vel()

	var _xf = xvel_int , _yf = yvel_int
	if _hit_d && hit_stop {
		_xf	= 0
		_yf = 0 
		}

	if !move_x(_xf, true, self, _col_ignore)
	{
		if (_funct != 0) method_call(_funct,[])
		xvel		= 0
		xvel_fract	= 0
	}
	if !move_y(_yf, self, _col_ignore)
	{
		if (_funct != 0) method_call(_funct,[])
		yvel		= 0
		yvel_fract	= 0
	}

	#endregion

}
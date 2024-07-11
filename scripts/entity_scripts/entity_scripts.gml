
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
/// @arg [hit_stop]
/// @arg [stagger_time]
	
	var _inst = argument[0]
	var _hst = stunw , _hti = hittw
	
	switch argument_count{
		case 3: _hti = argument[2]
		case 2: _hst = argument[1]
		break;
	}
	
	_inst.xvel_fract =	0
	_inst.yvel_fract =	0
	_inst.hit_stop =	_hst
	_inst.hit_timer =	_hti
	
	method_call(_inst.damage_hit, [])
}

/// ----------------------

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
function ent_postState(){
	/// @func ent_postState([bounce, col_ignore, col_function, platforms])

	var _bounce = true
	var _col_ignore = false
	
	var _hit_d = true
	if (object_get_parent(object_index) != oEnemy
	&& object_get_parent(object_index) != oProp) _hit_d = false
	
	var _funct = 0
	var _do_pl = true

	switch(argument_count){
		case 4: _do_pl = argument[3]
		case 3: _funct = argument[2]
		case 2: _col_ignore = argument[1]
		case 1: _bounce = argument[0]
		break;
	}

	entity_loop()
	
	var _en = coll_y(1, oBalloon)
	if _en && (yvel >=0) && (_en.y+4 >y) && _bounce{
		yvel = -4
		yvel_fract = 0
		with _en{ 
			balloon_hit();
		}
	}

	// hitstop -----------------------------------------
	if _hit_d
	{
		if !hit_stop{ // hitspot esta en 0
			if hit_inst = 0{ // si recien lelgo a 0, reajusta las velocidades
				xvel = xvel_stop
				yvel = yvel_stop
			}
			hit_inst = 1
		}
		else { // hitstop es mayor a 0
			if hit_inst
			{
				hit_inst = 0
				xvel_stop = xvel;
				yvel_stop = yvel;
			}
			hit_stop --;
		}
	}
	
	#region Movement after all state calculations
	round_vel()

	var _xf = xvel_int , _yf = yvel_int
	if _hit_d && hit_stop {
		_xf	= 0
		_yf = 0 
		}

	if !move_x(_xf, true, self, _col_ignore)
	{	
		if (_funct = 0){
			xvel		= 0
			xvel_fract	= 0
		}
		else method_call(_funct,[1])
	}
	if !move_y(_yf, self, _col_ignore, _do_pl)
	{
		if (_funct = 0){
			yvel		= 0
			yvel_fract	= 0
		}
		else method_call(_funct,[0])
	}

	#endregion
}
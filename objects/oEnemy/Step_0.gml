/// @description 

grounded = on_ground()

ent_state_machine()

switch(state_current){
	default:
		if state_is_new{
			state_is_new = !state_is_new
		}
		
		var move_fri_final	= grounded? move_fri : move_fri_air
		if hit_stop move_fri_final = 0
		xvel = approach(xvel, 0, move_fri_final)
		if !(grounded||hit_stop)
		yvel = approach(yvel, vsp_max, grav)
		
		if state_timer>=60 state_current = 1
		
	break;
	case enemyState.stomp: // =====================================================
		if state_is_new{
			state_is_new = !state_is_new
			xvel = 0
			yvel = 0
		}
		
		state_current = (state_timer>=25)? 1 : state_current
	break;
	case enemyState.grabbed:
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
	
	break;
}

ent_postState(1 );
depth = bbox_depth
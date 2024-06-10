/// @description 

grounded = on_ground()

var _prev = state_prev;
ent_state_machine()

switch(state_current){
	default:
		if state_is_new{
			state_is_new = !state_is_new
			if _prev == enemyState.stomp{
				if (grounded) yvel = -1.8;
				anim = 2
				image_index = 0
				audio_play_sfx(aSfxTrampoline, aSfxTrampoline)
			}
			if (_prev) == enemyState.hit xvel = 0
		}
		
		if (grounded && !ground_was){
			image_index = 0
			anim = 1
			yvel_fract = 0;
		}
		ground_was = grounded
		
		var move_fri_final	= grounded? move_fri : move_fri_air
		if hit_stop move_fri_final = 0
		xvel = approach(xvel, 0, move_fri_final)
		if !(grounded||hit_stop)
		yvel = approach(yvel, vsp_max, grav)
		
		if state_timer>=60 state_current = 1
		
		if animation_end(){
			anim = 0; image_index = 0
			}
		var function _sp(){
			if anim == 0{
				if (grounded){
					image_speed = 1/2
					return sEnIronBoard
				}
				else{
					image_speed = 1/2
					return sEnIronBoardAir
				}
			}
			else{			
				if (anim == 1){
					image_speed = 1/4
					return sEnIronBoardLand
				}
				else if (anim == 2){
					image_speed = 1/2
					return sEnIronBoardBounce
				}
			return sprite_index;
			}
		}
		sprite_index = _sp();
		
		
	break;
	case enemyState.stomp: // =====================================================
		if state_is_new{
			sprite_index = sEnIronBoardStomp
			state_is_new = !state_is_new
			xvel = 0
			yvel = 0
		}
		
		state_current = (state_timer>=25)? 1 : state_current
	break;
	case enemyState.grabbed: // =====================================================
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

ent_postState(1);
depth = bbox_depth
/// @description 

grounded = on_ground()

ent_state_machine()

switch(state_current){
	default:
		if state_is_new{
			
			state_is_new = !state_is_new
		}
		
		var move_fri_final	= grounded? move_fri : move_fri_air
		if hit_stop || bounce_timer move_fri_final = 0
		
		xvel = approach(xvel, 0, move_fri_final)
		if !(grounded|| hit_stop || bounce_timer)
			yvel = approach(yvel, vsp_max, grav)
		
		if (bounce_timer == 1)
			switch(bounce_type)
			{
			case 1:	 xvel = xvel + max( 1, abs(xvel_save)) *-bounce_wall_dir
					yvel = yvel +bounce_yvel
				break;
			case 2:
				if abs(yvel_save) >1.7
					{
					yvel = yvel -min(yvel_save, 3.5) *1
					xvel = xvel + bounce_xvel;
					}
				break;
			}
			
		if (!bounce_timer){
			bounce_wall_dir = wall_on_side(abs(xvel_save) +1)
			if abs(bounce_wall_dir) && bounce_wall_dir = sign(xvel) && !grounded{
					bounce_timer = 4
					bounce_type = 1
					bounce_yvel = yvel
					xvel = 0
					yvel = 0
					side_dir = -bounce_wall_dir
					audio_play_sfx(aSfxPlayerStep, aSfxPlayerStep)
				}
			else if grounded && yvel_save >0 {
					bounce_timer = 4
					bounce_type = 2
					bounce_xvel = xvel
					xvel = 0
					audio_play_sfx(aSfxPlayerStep, aSfxPlayerStep)
				}	
		}
		else if !hit_stop bounce_timer--;
	
		if (!bounce_timer){
			sprite_index = sEnBeachball
			image_speed = 1/2
		}
		else {
			if (bounce_type = 2){
				sprite_index = sEnBeachballBFloor
				image_speed = 1/2	
			}
			if bounce_type	= 1{
				sprite_index = sEnBeachballBWall
				image_speed = 1/2
			}
		}
		
		if state_timer>=60 state_current = 1
		
	break;
	case enemyState.stomp: // =====================================================
		if state_is_new{
			sprite_index = sEnBeachballStomp
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

var _xsave = xvel
var _ysave = yvel

ent_postState(1);
depth = bbox_depth

if (!bounce_timer){
	xvel_save = _xsave
	yvel_save = _ysave
}
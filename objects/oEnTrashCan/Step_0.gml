/// @description 

grounded = on_ground()

var _prev = state_prev
ent_state_machine()

switch(state_current){
	case enemyState.free: case enemyState.idle:
		if state_is_new{
			state_is_new = !state_is_new
			if _prev == enemyState.stomp && grounded yvel = -1;
		}
		
		if (_prev == enemyState.stomp) if (!emptied_fx){
				empty_can();
				side_dir = choose(1, -1)
			}
		can_bounce = !emptied_fx
		
		var move_fri_final	= grounded? move_fri : move_fri_air
		if hit_stop move_fri_final = 0
		xvel = approach(xvel, 0, move_fri_final)
		if !(grounded||hit_stop)
			yvel = approach(yvel, vsp_max, grav)
		
		if (!emptied_fx){
			sprite_index	= sEnTrashCan
			image_speed		= 0
		} else {
			if (grounded){
				sprite_index	= sEnTrashCanEmpty
				image_speed		= 0
			}
			else{
				sprite_index	= sEnTrashCanAir
				image_speed		= 0
			}
		}
		
	break;
	case 21: // STATE ROLLING // =====================================================
		if state_is_new{
			state_is_new = !state_is_new
			move_spd_roll = abs(xvel)
			sprite_index = sEnTrashCanRoll;
			}
		
		var _xv = wall_on_side(abs(xvel) +1)
		var en_ = instance_place(x +xvel, y, oEnemy)
		if (_xv == side_dir) || en_
			{
			if en_{		
				ent_enemyDamage(en_, 1.5, -1.2, stuns, hitts)
				//audio_play_sound(aSfxWeakHit1, 0, 0)
				}
				
			audio_play_sfx(aSfxTrashCanHit)
			xvel = 1.2 *-sign(xvel)
			xvel_fract = 0;
			yvel = -2
			state_current = 1 exit;
				
			}
		
		if grounded 
			{
			if !abs(xvel /2){
				state_current = 1 exit;
				}
			
			xvel = move_spd_roll *sign(xvel)
			
			if !vox{
				audio_stop_sound(vox)
				vox = audio_play_sound(aSfxTrashCanRoll, 0, 1)
				}	
			}
		
		image_speed = 1/2 *(xvel /2)
		
		if !(grounded||hit_stop) yvel = approach(yvel, vsp_max, grav)
		
		can_bounce = true
		if abs(xvel) side_dir = sign(xvel)
		
	break;
	case enemyState.stomp: // =====================================================
		if state_is_new{
			sprite_index = 
			emptied_fx? sEnTrashCanStomp2 : sEnTrashCanStomp
			state_is_new = !state_is_new
			xvel = 0
			yvel = 0
		}
		state_current = (state_timer>=25)? 1 : state_current
	break;
}

if (vox && state_current != 21) || (state_current = 21 && !grounded){
	audio_stop_sound(vox)
	vox = -1
}

ent_postState();
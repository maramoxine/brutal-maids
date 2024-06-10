/// @description 

grounded = on_ground()

ent_state_machine()

switch(state_current){
	case enemyState.free: // =====================================================
		if state_is_new{
			state_is_new = !state_is_new
		}
		if !instance_exists(oPlayer){ 
			state_current = 3;
			idle_type = 3
			break;
		}
			
		var _a	= (oPlayer.x -x)
		var _ax	= (abs(_a)>10? sign(_a) : 0)
		
		var _move_spd = 1.7
		
		if abs(_ax){
			if (grounded) side_dir	= _ax
			var move_acc_final	= grounded? 0.05 : 0.03
			xvel = approach(xvel, _move_spd *_ax, move_acc_final)
		}
		else{
			var move_fri_final	= grounded? move_fri : move_fri_air
			xvel = approach(xvel, 0, move_fri_final)
		}
		
		
		var _en = instance_place(x, y, oEnemy)
		if (_en && _en.can_push) xvel = push_x(_en, -0.5)

		yvel = yvel>=vsp_max? vsp_max : (grounded? 0 : yvel +grav)
		
		if (grounded){
			if (abs(xvel)){
				sprite_index	= sEnFishWalk
				image_speed		= 1 /2
			}
			else{
				sprite_index	= sEnFishIdle
				image_speed		= 0
			}
		}
		else{
			sprite_index	= sEnFishAir
			image_speed		= 0
		}
		
	break
	case enemyState.idle: // =====================================================
		if state_is_new{
			state_is_new = !state_is_new
			idle_type = (idle_type==3) ? idle_type : choose(0, 1, 3)
			// 0 is just standing, 1 is staring and 3 is grinning
		}
		
		var move_fri_final = grounded? move_fri : move_fri_air
		xvel = approach(xvel, 0, move_fri_final)

		yvel = yvel>=vsp_max? vsp_max : (grounded? 0 : yvel +grav)
		
		switch(idle_type){
			case 0: // just standing -------------------------
			sprite_index = sEnFishIdle
			image_speed = 1 /2
			
			break;
			case 1: // staring at something -------------------------------
			if !instance_exists(target){
				idle_type = choose(0, 3);
				break;
			}
		
			
			sprite_index = sEnFishLooking // sprites
			image_speed = 0
			var _di = point_direction(x, y, target.x, target.bbox_top)
			var _dir = round(_di / (360 /16))
			switch(_dir){
				case 0: case 8: case 16: image_index = 4 break;
				case 1: case 7: image_index = 3 break;
				case 2: case 6: image_index = 2 break;
				case 3: case 5: image_index = 1 break;
				case 4: image_index = 0 break;
				case 9: case 15: image_index = 5 break;
				case 10: case 14: image_index = 6 break;
				case 11: case 13: image_index = 7 break;
				case 12: image_index = 8 break;

			}
		
			var _a = sign(target.x -x)
			if abs(_a) side_dir = _a
			break;
			case 3: // grinning -------------------------------
			
			sprite_index = sEnFishIdleGrin
			image_speed = 1 /2
			
			break;
		}	
		
	break;
	case enemyState.hit: // =====================================================
		if state_is_new{
			sprite_index = sEnFishHit
			state_is_new = !state_is_new
		}
		if (state_timer = 2){
			var _f = choose(aSfxEnFishHurt1, aSfxEnFishHurt2)
			vox = audio_play_sfx(_f, vox, 0.05)	
		}
		
		var move_fri_final = 0.1
		if !on_ground() || (hit_stop) move_fri_final = 0
		xvel = approach(xvel, 0, move_fri_final)
		var gr = grav
		if (grounded || hit_stop) gr = 0
		yvel += gr
		
		state_current = state_timer>=hit_timer ? 1 : state_current
		
	break;
	case enemyState.stomp: // =====================================================
		if state_is_new{
			sprite_index = sEnFishStomped
			state_is_new = !state_is_new
			image_speed = 1/2
			xvel = 0
			yvel = 0
		}
		
		if animation_end() image_speed = 0
		
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

ent_postState(1)
depth = bbox_depth
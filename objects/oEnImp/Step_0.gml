/// @description 

grounded = on_ground()
ent_state_machine()

if !instance_exists(oPlayer) state_current = 3;

if (!hp) state_current = enemyState.dead

switch(state_current){
	case enemyState.free: // =====================================================
		if state_is_new{
			state_is_new = !state_is_new
		}
		
		if (land_delay) land_delay--;
		if grounded{
			if attack_is{
				attack_is = false
				xvel = clamp(xvel, -1.8, 1.8)
				//xvel_fract = 0.;
				land_delay = 30
			}
		}
		
		var _a	= (oPlayer.x -x)
		var _ax	= (abs(_a)>8 ? sign(_a) : 0)
		if (land_delay || (attack_is && state_timer <40)) _ax = 0
		var _move_spd = 1.8
		
		if (oPlayer.y >y) && !land_delay
		&& (abs(_a) <48)
		&& (on_platform() && (!on_wall() || on_slope())){
				move_y(1, self, 1)
				xvel = 0.
				yvel = 1.
				yvel_fract = 0.0
		}
		
		if abs(_ax){
			if (grounded) side_dir	= _ax
			var move_acc_final	= grounded? 0.1 : 0.05
			xvel = approach(xvel, _move_spd *_ax, move_acc_final)
		}
		else{
			var move_fri_final	= grounded? move_fri : move_fri_air
			xvel = approach(xvel, 0, move_fri_final)
		}
		
		yvel = yvel>=vsp_max? vsp_max : (grounded? 0 : yvel +grav)
		
		#region
		var _pl = instance_place(x, y, oPlayer)
		if (_pl && _pl.can_hurt){
	
			_pl.state_prev = -1
			_pl.state_current = playerStateHurt;
	
			if _pl.grounded{
				_pl.xvel = sign(round(xvel /3)) *2
				_pl.yvel = -2
			}
		}
		
		if attack_timer
			attack_timer--;
		else if grounded
			state_current = -2
		
		#endregion
		#region sprites	
		if (grounded){
			if (abs(xvel)){
				sprite_index	= sEnImpWalk
				image_speed		= 1 /2
			}
			else{
				sprite_index	= sEnImpIdle
				image_speed		= 0
			}
		}
		else{
			if (!attack_is){
				sprite_index	= sEnImpAir
				image_speed		= 0
			}
			else{
				sprite_index	= sEnImpJump
				image_speed		= 0
			}
		}
		#endregion
	break
	case enemyState.idle: // =====================================================
		if state_is_new{
			sprite_index = sEnImpIdle
			state_is_new = !state_is_new
		}
		
		var move_fri_final = grounded? move_fri : move_fri_air
		xvel = approach(xvel, 0, move_fri_final)
		yvel = yvel>=vsp_max? vsp_max : (grounded? 0 : yvel +grav)
		
	break;
	case -2://anticipation  //=====================================================
		if state_is_new{
			sprite_index = sEnImpJumpAntic
			state_is_new = !state_is_new
			image_speed = 1 /4
			ind_r;
			xvel = 0.
			yvel = 0.
			vox = audio_play_sfx(aVoxImpAntic, vox, 0.05)
		}
		
		var move_fri_final = grounded? move_fri : move_fri_air
		xvel = approach(xvel, 0, move_fri_final)
		yvel = yvel>=vsp_max? vsp_max : (grounded? 0 : yvel +grav)
		
		if (state_timer >= 20){
			var py_ = min(oPlayer.y, y-1)
			jump_dir = point_direction(x, y, oPlayer.x, py_)
			jump_dir = clamp(jump_dir, 45, 135)
			xvel		= lengthdir_x(5, jump_dir)
			yvel		= lengthdir_y(5, jump_dir) -1
			xvel_fract	= 0.0
			yvel_fract	= 0.0
			
			state_current = enemyState.free
			attack_timer = 60 *irandom_range(1, 4)
			attack_is = true
			vox = audio_play_sfx(aVoxImpAttack, vox, 0.05)
		}
	break
	case enemyState.hit: // =====================================================
		if state_is_new{
			sprite_index = sEnImpHit
			state_is_new = !state_is_new
		}
		
		var move_fri_final = grounded? 0.1 : 0
		xvel = approach(xvel, 0, move_fri_final)
		yvel = yvel>=vsp_max? vsp_max : (grounded? 0 : yvel +grav)
		state_current = state_timer>=hit_timer ? 1 : state_current
	break;
	case enemyState.dead:
		if state_is_new{
			ind_r;
			sprite_index = sEnImpDead
			image_speed = 1 /3
			vox = audio_play_sfx(choose(aVoxImpDead1, aVoxImpDead2), vox, 0.1)
			state_is_new = !state_is_new
		}
		
		yvel = yvel>=vsp_max? vsp_max : (grounded? 0 : yvel +grav)
		
		if (animation_end()) die
	break;
} 

ent_postState()
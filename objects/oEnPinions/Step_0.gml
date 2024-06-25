/// @description

grounded = on_ground()

if !instance_exists(oPlayer) state_current = enemyState.idle
if (!hp) state_current = enemyState.dead
ent_state_machine()

var hit_pl = function(){
	var _pl = instance_place(x, y, oPlayer)
	if (_pl && _pl.can_hurt){
	
		_pl.state_prev = -1
		_pl.state_current = playerStateHurt;
	
		if _pl.grounded{
			_pl.xvel = sign(round(xvel /3)) *2
			_pl.yvel = -2
		}
	}	
}
var pl_do = true

switch(state_current){
	case enemyState.free: /// =====================================================
		if state_is_new{
			state_is_new = !state_is_new
		}
		
		var _a	= (oPlayer.x -x)
		var _ax	= (abs(_a)>8 ? sign(_a) : 0)
		var _move_spd = move_spd
		
		if (oPlayer.y >y)
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
		
		yvel = yvel>=vsp_max? vsp_max : (grounded? yvel : yvel +grav)
		
		hit_pl()
		
		if (attack_timer)
			attack_timer--;
		else if (grounded)
			state_current = -1
		
			#region sprites	
		if (grounded){
			if (abs(xvel)){
				sprite_index	= sEnPinionsWalk
				image_speed		= 1 /2
			}
			else{
				sprite_index	= sEnPinionsIdle
				image_speed		= 0
			}
		}
		else{
			sprite_index	= sEnPinionsAir
			image_speed		= 0
		}
		#endregion
	break;
	case -1://anticipation  //=====================================================
		if state_is_new{
			sprite_index = sEnPinionsAntic
			image_speed = 1 /4
			ind_r;
			state_is_new = !state_is_new
			xvel = 0.
			yvel = 0.
			vox = audio_play_sfx(aVoxImpAntic, vox, 0.05)
		}
		
		var move_fri_final = grounded? move_fri : move_fri_air
		xvel = approach(xvel, 0, move_fri_final)
		yvel = yvel>=vsp_max? vsp_max : (grounded? yvel : yvel +grav)
		
		if (state_timer >= 20){
			xvel = choose(-2., 2)
			yvel = -4;
			xvel_fract	= 0.0
			yvel_fract	= 0.0
			
			state_current = -2

		}
	break;
	case -2:  /// Flying Shooty mode =====================================================
		if state_is_new{
			sprite_index = sEnPinionsFly
			image_speed = 1/2
			ind_r
			
			state_is_new = !state_is_new
			vox = audio_play_sfx(aVoxPinionsJump, vox, 0.05)
			fly_sfx = audio_play_sound(aSfxPinionsFlapLp, 0, 1)
			audio_sound_gain(fly_sfx, 0.6, 0)
		}
		audio_sound_pitch(fly_sfx,1 + sin(state_timer /20) *0.1)
		pl_do = 0
		
		var _a	= (oPlayer.x -x)
		var _ax	= (abs(_a)? sign(_a) : 0)
		var _move_spd = move_spd *2
		
		var _ydis = (oPlayer.y +attack_pl_yoff) -y
		var _ydir = abs(_ydis)? sign(_ydis) : 0
		
		xvel = approach(xvel, _ax *_move_spd, 0.04)
		yvel = approach(yvel, _ydir *move_spd, 0.07)
		
		hit_pl()
		
		if shoot_timer shoot_timer --;
		else{
			var atk_dir = point_direction(x, y, oPlayer.x, oPlayer.y)
			, bul = instance_create_depth(x, y, -1 ,oEnFireball)
			bul.move_dir = atk_dir
			audio_play_sfx(aSfxPinionsShoot, aSfxPinionsShoot, 0.2)
			
			shoot_timer = 30 *irandom_range(2, 4)
			attack_pl_yoff = -16 *irandom_range(4, 7)
		}
		
		if state_timer >=(60 *12) {
			xvel = 0.
			yvel_fract = 0.
			yvel = -2.
			attack_timer = 60 *5
			state_current = enemyState.free;
			audio_stop_sound(fly_sfx)
		}
	break;
	
	case enemyState.idle: // =====================================================
		if state_is_new{
			sprite_index = sEnPinionsIdle
			state_is_new = !state_is_new
		}
		
		var move_fri_final = grounded? move_fri : move_fri_air
		xvel = approach(xvel, 0, move_fri_final)
		yvel = yvel>=vsp_max? vsp_max : (grounded? 0 : yvel +grav)
		
	break;
	case enemyState.dead:
		if state_is_new{
			ind_r;
			sprite_index = sEnPinionsDead
			image_speed = 1 /4
			vox = audio_play_sfx(aVoxPinionsDie, vox, 0.1)
			state_is_new = !state_is_new
		}
		
		if animation_end()
		{
			image_speed = 0.
			image_index = image_number -1
		}
		yvel = yvel>=vsp_max? vsp_max : (grounded? 0 : yvel +grav)
		
		if state_timer = 12 die
	break;
}

if (state_current != -2) audio_stop_sound(fly_sfx)

ent_postState(1, 0, 0, pl_do)
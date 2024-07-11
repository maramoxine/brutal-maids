/// ----------------------
function playerStateFree(){
	// Player just entered this state. These actions will be executed only once.
	if state_is_new{
		state_is_new = !state_is_new
	}

	// on land---------------------------
	if (grounded){
	
		coyote = 11
	
		if (kdown&& kjump) // go down platform
			if on_platform() && (!on_wall() || on_slope()){
				move_y(1, self, 1)
				coyote = 0
				yvel = 1.
				yvel_fract = 0.0
		}
		
		if (!ground_was){
			audio_play_sound(aSfxLand, 0, 0)
			anim = 1
			image_index = 0;
		}
	}

	ground_was = grounded

	// cheating the jump input

	#region Calculate xspeeds ------------------------

	var _xaxis = xaxis

	var sl = on_slope()
	var ts = move_spd;

	if sl && !(sl.object_index == oSlopeWall
	|| side_dir==sign(sl.image_xscale))
		ts = lengthdir_x(move_spd, 52 /abs(sl.image_xscale))

	if abs(_xaxis)
	{	
		side_dir = xaxis

		var _l = !(sign(xvel)==xaxis && abs(xvel)>move_spd && !grounded) 
		var move_acc_final = grounded? move_acc : move_acc_air
		if _l xvel = approach(xvel, ts* xaxis, move_acc_final)
	}
	else{
		var move_fri_final = grounded? move_fri : move_fri_air
		xvel = approach(xvel, 0, move_fri_final)
	}

	#endregion
	#region Calculate yspeed -----------------------

	yvel = yvel>=vsp_max? vsp_max : (grounded? yvel : yvel +grav) // gravity

	var _fl = instance_place(x, y +yvel_int, oSolid) // head bump ----------------------------
	if (_fl)
		if (be_on_top(_fl)){
			anim = 6
			image_index = 0;;
			yvel = 1.2
			yvel_fract = 0
			audio_play_sfx(aSfxBumpHead, aSfxBumpHead)
		}

	if coyote{
		// jump ----------------------------------
		if kjump && !(grounded && wall_above()){
			if abs(xaxis) side_dir = xaxis
			yvel = jump_spd
			jump_hold = 25
			coyote = 0
			audio_play_sound(aSfxJump, 0, 0)
			anim = 2//abs(xaxis)? (abs(xvel /2) ? 10: 2) : 2
			image_index = 0;;
			grounded = false
		}
		coyote --;
	}/*
	else{ 
		// wall jump ---------------------------------
		if kjump{
		
			var wd = wall_on_side(4)
			//var _en = instance_place(x +xvel, y +6 +max(0 ,yvel), oEnemy)
			//var _r = (_en && _en.bbox_top +vsp_max >bbox_bottom) && yvel>_en.yvel
		
			if wd != 0 && (anim != 3){
				if (xaxis = wd){
					yvel = jump_spd
					xvel = -move_spd *wd
				}
				else{
					yvel = jump_wallspd
					xvel = move_walljump *wd
				}
				jump_hold = 30
				audio_play_sound(aSfxJump, 0, 0)
				anim = 3 ind_r
				side_dir = -wd
			}
		}
	}
	*/
	// jump stop ------------------------
	if jump_hold > -1{
		if !kjumpdw jump_hold = 0
		if yvel <0 && !jump_hold yvel *= 0.3
		jump_hold --;
	}
	#endregion

	#region attacks --------------
	pl_shoot();

	if (kgrab || attack_inp_delay){
		state_current = playerStateWeakJab
		attack_inp_delay = 0
		exit;
	}
	#endregion
	
	sprite_index = player_sprites()

}

/// ----------------------
function playerStateWeakJab(){

	if state_is_new{
		state_is_new = !state_is_new;
		sprite_index = sPlayerPunchIdleA image_index = 0;
		image_speed = 1 /2
		ds_list_clear(hit_by_atk);
		ds_list_clear(hitnow);
		ground_was = true
		hit_reg = 0
		side_dir = abs(xaxis) ? xaxis : side_dir
		
		audio_play_sfx(aSfxPlayerSlash1);
	}
	var _xaxis = xaxis

	var sl = on_slope()
	var ts = move_spd;

	if sl && !(sl.object_index == oSlopeWall
	|| side_dir==sign(sl.image_xscale))
		ts = lengthdir_x(move_spd, 52 /abs(sl.image_xscale))
	if abs(_xaxis)
	{
		var _l = !(sign(xvel)==xaxis && abs(xvel)>move_spd && !grounded) 
		var move_acc_final = grounded? move_acc : move_acc_air
		if _l xvel = approach(xvel, ts* xaxis, move_acc_final)
	}
	else{
		var move_fri_final = grounded? move_fri : move_fri_air
		xvel = approach(xvel, 0, move_fri_final)
	}
	
	yvel = yvel>=vsp_max? vsp_max : (grounded? yvel : yvel +grav);
	var xo = x+ side_dir *8;
	
	if (state_timer >= 0)
		{
		
		var hits = collision_rectangle_list(xo, bbox_top, 16* side_dir +xo, bbox_bottom, oEnemy, 0, 1, hitnow, 0);
		for (var i = 0; i <(ds_list_size(hitnow)); i++){
			var h_ = hitnow[| i];
			if (ds_list_find_index(hit_by_atk, h_) == -1){
				
				if (false == h_.can_hurt)
					continue;
				ds_list_add(hit_by_atk, hitnow[| i]);
				
				var dirv_ = point_direction(x, y, x +side_dir *abs(xvel) +side_dir, y +yvel)
				,	hispd_ = (h_.grounded) ? 3 : 4.2;
				h_.xvel = lengthdir_x(hispd_, dirv_)
				h_.yvel = lengthdir_y(hispd_ +.5, dirv_);
				
				ent_enemyDamage(h_, stunw, hittw)
				audio_stop_sound(aSfxWeakHit1) 
				audio_play_sound(aSfxWeakHit1, 0, 0)
					
				if !hit_reg{
					yvel = grounded ? yvel : -1
					xvel = 0;
					audio_stop_sound(aSfxPlayerSlash1)
					hit_reg = 1
				}
			}	
		}
	}
	
	if (kgrab)
		attack_inp_delay = true
	
	// Change State -----------------------------
	if (animation_end()){
		state_current = playerStateFree
		anim = 0
		exit
	}
}

/// ----------------------
function playerStateBounce(){
	// Player just entered this state. These actions will be executed only once.
	if state_is_new{
		state_is_new = !state_is_new
		sprite_index = sPlayerLandIdle
		image_index = 0;
		image_speed = 1/6
		audio_play_sfx(aSfxBounceEnemy, aSfxBounceEnemy, 0)
		jump_hold = -1
		xvel_fract = 0
	}

	yvel = approach(yvel, 0, 0.2)
	if animation_end(){
		
		state_current = playerStateFree
		var e = instance_exists(bounce_en)
		xvel = bounce_xvel
		yvel = jump_bounce; yvel_fract = 0
	
		if e{
			bounce_en.state_timer = 25
			bounce_en.yvel = 4
			switch(bounce_en.object_index){
				case oEnIronBoard:
					yvel = jump_bounce *1.96;
					xvel = 0;
				break;
			}
		}
	
		anim = 2;
		sprite_index = sPlayerJumpAn;
		image_index = 0; 
		exit;
	}
}

function playerStateHurt(){
	if state_is_new{
		state_is_new = !state_is_new
		//sprite_index = sPlayerHurt
		audio_play_sfx(aSfxPlayerHurt, aSfxPlayerHurt, 0.1)
		ground_was = 1
		
		hp --;
		if (!hp) die;
	}

	//xvel = 0;
	//yvel = 0;
	

	state_current	= playerStateFree
	invin_frames	= 40
	
}
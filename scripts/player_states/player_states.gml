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
				if hold_id move_y(1, hold_id, 1)
		}
		
		if (!ground_was){
			anim = abs(xaxis)&&!crouched ? (abs(xvel /2) ? 1: 1) : 1
			audio_play_sound(aSfxLand, 0, 0)
			ind_r
		}
	}

	//if ((!kdown || !grounded) && crouched){ // leave the crouch
	//	crouched = 0; 
	//	mask_index = sEntityMask
	//}

	ground_was = grounded

	// cheating the jump input
	kjump = (crouched) ? 0 : kjump
	kjumpdw = (crouched) ? 0 : kjumpdw

	#region Calculate xspeeds ------------------------

	var _xaxis = (crouched)? 0 : xaxis

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
			ind_r;
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
			ind_r;
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
	var sd= side_dir
	//if (xaxis != 0 && xaxis != side_dir) sd = xaxis
	atk_dir = (kdown && !grounded)? 270 : (kup? 90: (sd? 0 : 180));
	
	var gx = lengthdir_x(24, atk_dir)
	var gy = lengthdir_y(24, atk_dir)

	if (atk_buffer) atk_buffer --;
	atk_fx = lerp(atk_fx, 0, 0.4)
	
	if (kattackdw && !atk_buffer)
	{
		var bul = instance_create_depth(x ,y , -1, oBullet)
		move_x(gx, 1, bul)
		move_y(gy, bul)
		bul.move_dir =atk_dir +random_range(-3, 3)
		//part_particles_create(global.fx, bul.x, bul.y, global.fxRocketSmoke, 1)
		
		atk_fx = 1
		atk_buffer = atk_buffer_max
		audio_play_sfx(aSfxGunFunny, -1, 0.2)
		switch(round(atk_dir /90))
		{
			default:
			
			break;
			case 1: 
			break;
			case 3:
				yvel = yvel+1? 0 : yvel;
				yvel_fract = yvel+1? 0 : yvel_fract;
			break;
		}
	}
	
	//hold_xpos = sd *8
	//hold_ypos =  yaxis *8 -4;

	//if (kattack || attack_inp_delay){

	//	state_current = playerStateWeakJab
	//	attack_inp_delay = 0
	//	exit;
	//}

	//if (kgrab){
	//	if hold_id {
	//		if !kdown{
	//			hold_id.xvel = sd *2.3 +(xvel *0.3)
	//			hold_id.yvel = -1 +(yvel *0.5)
	//			if (kup){
	//				hold_id.xvel = xvel
	//				hold_id.yvel = -4
	//				}
	//			audio_play_sfx(aSfxLongJump, 0, 0.2)
	//			}
	//		else{
	//			hold_id.xvel = 0
	//			hold_id.yvel = 0
	//			if (!grounded){
				
	//				hold_id.xvel = 0
	//				hold_id.yvel = 4	
	//				audio_play_sfx(aSfxLongJump, 0, 0.2)
	//				anim = 2; ind_r
	//				jump_hold = -1
	//				yvel = -5.4
	//				yvel_fract = 0
	//				xvel = 0
	//			}
			
	//		}
	//		move_x((x +hold_xpos) -hold_id.x, 1, hold_id)
	//		move_y((y +hold_ypos) -hold_id.y, hold_id)
		
	//		hold_id = noone
	//	}
	//	else{

	//		var e = instance_place(x, y, oEnemy)
	//		if e && e.can_grab 
	//		//&& (object_get_parent(e.object_index)== oProp)
	//		{
	//			hold_id = e
	//			hold_id.grabber_id = id
	//			hold_id.state_current = enemyState.grabbed
	//			hold_id.state_prev = -1
	//			audio_play_sfx(aSfxGrabMisc, 0.5)
	//		}
	//	}
	//}
	#endregion
	
	sprite_index = player_sprites()

}

/// ----------------------
function playerStateWeakJab(){

	if state_is_new{
		state_is_new = !state_is_new;
		sprite_index = sPlayerPunchIdleA ind_r
		image_speed = 1 /2
		ds_list_clear(hit_by_atk);
		ds_list_clear(hitnow);
		ground_was = true
		hit_reg = 0
		side_dir = abs(xaxis) ? xaxis : side_dir
	}

	var move_fri_final = grounded? move_fri : move_fri_air;
	xvel = approach(xvel, 0, move_fri_final);
	yvel = yvel>=vsp_max? vsp_max : (grounded? yvel : yvel +grav);
	var xo = x+ side_dir *8;

	if state_timer = 4 audio_play_sfx(aSfxPlayerSlash1);

	if (state_timer >= 8)
		{
			
		var hits = collision_rectangle_list(xo, bbox_top +3, 16* side_dir +xo, bbox_bottom -3, oEnemy, 0, 1, hitnow, 0);
		var i = 0;
		repeat(hits){
			var h_ = ds_list_find_value(hitnow, i);
			if (ds_list_find_index(hit_by_atk,h_)==-1){
				
				ds_list_add(hit_by_atk, h_);
				ent_enemyDamage(h_, h_.grounded? 2 : 3.2, -1.2, 1, stuns, hitts)
				audio_stop_sound(aSfxWeakHit1) 
				audio_play_sound(aSfxWeakHit1, 0, 0)
					
				if !hit_reg{
					yvel = grounded ? yvel : -1
					xvel *= 0.5
					audio_stop_sound(aSfxPlayerSlash1)
					hit_reg = 1
				}
			}	
			i++;
		}
	
	}
	if (kattack)
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
		ind_r
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
		bounce_t = 10
	
	
		anim = 2;
		sprite_index = sPlayerJumpAn;
		ind_r 
		exit;
	}
}

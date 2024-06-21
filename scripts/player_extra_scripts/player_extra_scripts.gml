/// ----------------------
function player_postState(){
	
	can_hurt = 1
	// invincibility frames
	if invin_frames {
		invin_frames--;
		can_hurt = 0
	}
	// being hurt
	if (state_current = playerStateHurt) can_hurt = 0
	
	// loop through screen
	entity_loop()
	
	// balloon bounce
	var _en = instance_place(x, y +yvel, oBalloon)

	if _en && !grounded && _en.y+4 >bbox_bottom
	&& state_current!=playerStateBounce{
		move_y(_en.bbox_top -bbox_bottom, self)
		jump_hold = -1
		yvel = jump_spd -0.5; yvel_fract = 0
		if state_current== playerStateFree {
			anim = 2;
			image_index = 0 
		}
		audio_play_sfx(aSfxBounceBalloon, aSfxBounceBalloon, 0.1)
		with _en{ 
			jump_an = 1; image_index = 0
		}
	}
	
	// enemy bounce
	var _en = instance_place(x +xvel, y +6 +max(0 ,yvel), oEnemy)
	if (_en && kjumpdw){
		if (_en.bbox_top +vsp_max >bbox_bottom)
		&& yvel> (_en.yvel -1)
		&& (state_current==playerStateFree)
		&& _en.can_bounce
		{	
			state_current = playerStateBounce
			bounce_en = _en
			bounce_xvel = xvel
			move_y(bounce_en.bbox_top - bbox_bottom -6);
			xvel = 0
			yvel = 1.9
			with _en{
				state_current = 5
				state_prev = -1
			}
		}
	}
	bounce_t = (bounce_t>=0)? bounce_t-1 : -1
	
}

/// ----------------------
function player_sprites(){

	var _xaxis = (crouched)? 0 : xaxis
	var walk = abs(xvel /2)

	if sprite_current != sprite_index{
		image_index = 0
		sprite_current = sprite_index
	}
	var _frm = floor(image_index)
	frame_current = (sprite_index!=sPlayerWalk)? -1 : frame_current

	if animation_end(){
		switch(anim){
			case 0:
			case 3:
			case 11:
			break;
			default:
				anim = 0
				//image_index = 0
			break;
			case 10:
				anim = 11
			break;
		}
	}

	if (!crouched){
		if (!grounded){
			switch(anim){
				case 0:
					image_speed = 1 /4
					return sPlayerAir
				break;
				case 3:
					image_speed = 1 /2
					return sPlayerWallJumpAn
				break;
				case 2:
					image_speed = 1 /2
					return sPlayerJumpAn
				break;
				case 6:
					image_speed = 1 /2
					return sPlayerAirBumpAn
				break
			}
		}
		else{
			switch(anim){
				case 0:
					if !(walk || abs(_xaxis)){
						if (kup){
							image_speed = 1 /4
							return sPlayerIdleUp
						}
						else{
							image_speed = 1 /4
							return sPlayerIdle
						}
					}
					else{
						if frame_current != _frm
							switch(_frm){
								case 0:
								part_particles_create(global.fx2, x, bbox_bottom -2, global.fxWalk, 1)
								audio_play_sfx(aSfxPlayerStep, -1, 0.3)
								break;
						}
						frame_current = _frm
						image_speed = 1/2 
						return sPlayerWalk
					}
				break;
				case 1:
					image_speed = 1 /4
					return sPlayerLandIdle
				break;
				case 4:
					image_speed = 1 /2
					return sPlayerLandWalk
				break;
				case 7:
					image_speed = 1 /4
					return sPlayerTurnWalk
				break;
				case 8:
					image_speed = 1 /4
					return sPlayerWalkStart
				break;
			}
		}
	}
	
	return sprite_index;
}
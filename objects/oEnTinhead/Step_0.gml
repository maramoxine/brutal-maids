/// @shit

/// @description 

grounded = on_ground()

if !instance_exists(oPlayer) state_current = enemyState.idle
if (!hp) state_current = enemyState.dead
ent_state_machine()

switch(state_current){
	case enemyState.free:
		if state_is_new{
			state_is_new = !state_is_new
		}
		
		var move_fri_final = 0.05
		var move_spd = 1.3;
		xvel = approach(xvel, move_xdir *move_spd, move_fri_final);;
		yvel = approach(yvel, move_ydir *move_spd, move_fri_final)
		
		var mis_ = instance_number(oEnMissile);
		if (atk_timer) 
			atk_timer = (mis_ == missile_max)? 
			atk_timer : atk_timer -1.;
		else if ((mis_ < missile_max))
		{
			var bul_ = instance_create_depth(x, y-8, 0, oEnMissile)
			bul_.yvel = -2.3;
			bul_.yvel_fract = 0;
			bul_.move_dir = 90;
			audio_play_sfx(aSfxTinheadShoot, aSfxTinheadShoot , 0.1)
			//vox = audio_play_sfx(aVoxTinheadYell1, vox , 0.3)
			yvel = max( 1.3, yvel +1.3);
			yvel_fract = 0.0
			
			atk_timer = 60 *irandom_range(3, 6)
		}
		
		if (y<32 && !move_ydir) move_ydir = 1;
	break;
	
	case enemyState.dead:
		if state_is_new{
			state_is_new = !state_is_new	
		}
		instance_destroy()
	break;
}

var bn_ = function(dir_){
	var sf_ = aSfxBumpHead;
	if dir_{
		move_xdir = -wall_on_side();
		xvel *= -1.;
		xvel_fract = 0.;
		
		audio_play_sfx(sf_, sf_, 0.3)
		}
	else{
		move_ydir = on_ground()? -1. : 1.;
		yvel *= -1.;
		yvel_fract = 0.; 
		
		audio_play_sfx(sf_, sf_, 0.3)
		}
}

ent_postState(0, 0, bn_, 1);
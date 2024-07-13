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
		
		var move_fri_final = grounded? move_fri : move_fri_air
		xvel = approach(xvel, 0, move_fri_final)
		yvel = yvel>=vsp_max? vsp_max : (grounded? yvel : yvel +grav)
		
		var mis_ = instance_number(oEnMissile)
		if (atk_timer) 
			atk_timer = (mis_ == missile_max)? 
			atk_timer : atk_timer-1;
		else if (grounded && (mis_ < missile_max))
		{
			var bul_ = instance_create_depth(x, y-8, 0, oEnMissile)
			bul_.yvel = -2.3;
			bul_.yvel_fract = 0;
			bul_.move_dir = 90;
			audio_play_sfx(aSfxTinheadShoot, aSfxTinheadShoot , 0.1)
			vox = audio_play_sfx(aVoxTinheadYell1, vox , 0.3)
			//ds_list_add(missile, bul_);
			
			yvel = -1.3
			yvel_fract = 0.0
			
			atk_timer = 60 *irandom_range(3, 6)
		}
	break;
	
	case enemyState.dead:
		if state_is_new{
			state_is_new = !state_is_new	
		}
		instance_destroy()
	break;
}

ent_postState();
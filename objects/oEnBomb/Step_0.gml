/// @shit

/// @description 

grounded = on_ground()

ent_state_machine()

switch(state_current){
	default:
		if state_is_new{
			state_is_new = !state_is_new
		}
		
		var move_fri_final = grounded? move_fri : move_fri_air
		xvel = approach(xvel, 0, move_fri_final)
		yvel = yvel>=vsp_max? vsp_max : (grounded? yvel : yvel +grav)
		
		if grounded state_current = -1;
	break;
	case -1: 
		if state_is_new{
			state_is_new = !state_is_new
		}
		
		var move_fri_final = grounded? move_fri : move_fri_air
		xvel = approach(xvel, 0, move_fri_final)
		yvel = yvel>=vsp_max? vsp_max : (grounded? yvel : yvel +grav)
		
		if timer {
			var int_rate = (timer >120)? 30 : ((timer >60)? 15 : 5)
			timer--;
			
			
			if (!beep && (beep_timer != floor(timer /int_rate))){
				beep = 3
				part_particles_create(g.fx2, x, y -14, g.fxRocketSmoke, 1)
				audio_play_sfx(aSfxBombTIck, aSfxBombTIck)
				beep_timer = floor(timer /int_rate)
			}
			beep = beep? beep-1 : 0;
			
		}
		else state_current = 0
	break;
	case enemyState.dead:
		var sh_am = 40;
		var sh_ang = 360/sh_am;
		for (var i = 0; i < sh_am; i++)
		{
			var b_ = instance_create_depth(x, y, 0, oEnFireball)
			b_.move_dir = sh_ang* i; //+(irandom_range(-2, 2))
			b_.move_spd = 8
			b_.timer = 15
		}
			
		part_particles_create(g.fx, x, y, g.fxExplosionSm, 1)
		audio_play_sfx(aSfxExplosion2, -1, 0.3)
		instance_destroy()
	break;
}

ent_postState();
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
		
		if state_timer>=60 state_current = 1
	break;
}

ent_postState();
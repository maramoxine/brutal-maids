/// @description 

#region controls
var haxis = sign(round(gamepad_axis_value(0, gp_axislh) *2))
var vaxis = sign(round(gamepad_axis_value(0, gp_axislv) *2.3))

kright	= keyboard_check(ord("D")) 
	|| gamepad_button_check(0, gp_padr) || (haxis==1)
kleft	= keyboard_check(ord("A")) 
	|| gamepad_button_check(0, gp_padl) || (haxis==-1)
kup     = keyboard_check(ord("W")) 
	|| gamepad_button_check(0, gp_padu) || (vaxis==-1)
kdown   = keyboard_check(ord("S")) 
	|| gamepad_button_check(0, gp_padd) || (vaxis==1)

kjump	= keyboard_check_pressed(vk_space) 
	|| gamepad_button_check_pressed(0, gp_face1)
kjumpdw	= keyboard_check(vk_space)
	|| gamepad_button_check(0, gp_face1)
kattack = keyboard_check_pressed(ord("J")) 
	|| gamepad_button_check_pressed(0, gp_face3)
kattackdw = keyboard_check(ord("J")) 
	|| gamepad_button_check(0, gp_face3)
kgrab = keyboard_check_pressed(ord("K")) 
	|| gamepad_button_check_pressed(0, gp_shoulderrb)
	|| gamepad_button_check_pressed(0, gp_shoulderr)
kgrabdw = keyboard_check(ord("K")) 
	|| gamepad_button_check(0, gp_shoulderrb)
	|| gamepad_button_check_pressed(0, gp_shoulderr)

xaxis	= kright - kleft
yaxis	= kdown - kup

#endregion

grounded = on_ground()

// Simple State Machine

state_is_new		= state_prev != state_current
state_timer		= state_is_new ? 0 : state_timer + 1
state_prev	= state_current
script_execute(state_current)
player_postState()


// Movement after all state calculations
round_vel()

if !move_x(xvel_int, true)
{
    xvel       = 0
    xvel_fract = 0
}

// Use the yvel_int here
if !move_y(yvel_int)
{
    yvel       = 0
    yvel_fract = 0
}

//mask_index = temp_mask
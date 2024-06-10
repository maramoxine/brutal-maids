/// @description 

platformer_init();

move_fri	= 0.15
move_fri_air= 0
grav		= 0.15
if object_index = oProp grav = 0.12
vsp_max		= 7

side_dir	= 1
hit_stop	= 0
hit_timer	= 60

can_bounce	= true
can_push	= true
can_hit		= true
can_grab	= true
do_draw		= true;

state_is_new = true
state_current = 3
state_prev	= 10
state_timer = 0
target		= oPlayer
grabber_id	= noone

mask_index	= sEntityMask
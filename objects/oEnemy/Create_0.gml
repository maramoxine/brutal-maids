/// @description 

platformer_init();

hp = 4
hp_max = 0

side_dir	= 1
move_fri	= 0.15
move_fri_air= 0
grav		= (object_index == oProp)? 0.12 : 0.15;
vsp_max		= 7

hit_stop	= 0
hit_timer	= 60
hit_inst = 1
xvel_stop = 0.
yvel_stop = 0.

damage_hit = function(){}
can_bounce	= false
can_hurt	= true

init_do		= false
state_is_new = true
state_current = enemyState.free
state_prev	= 10
state_timer = 0
target		= oPlayer
vox = 0

mask_index	= sEntitySmall
depth = -1
 /// @description 

xaxis	      = 0
yaxis	      = 0
platformer_init()

move_spd = 2.3
move_acc = 0.2
move_fri = 0.5
move_acc_air = 0.15
move_fri_air = 0.

jump_spd = -4.25
jump_bounce = -3.8
jump_hold = 0
bounce_xvel = 0
bounce_en = noone

side_dir = 1
vsp_max = 7
grav = 0.18
coyote = 0
bounce_t = -1
crouched = true

hold_id = noone;
hold_xpos = 0;
hold_ypos = 0;

hit_by_atk = ds_list_create();
hitnow = ds_list_create();
hit_reg = false
hit_reg_did = false
frame_current = -1
attack_inp_delay = false

state_is_new = true
state_current = playerStateFree
state_prev = state_current
state_timer = 0

ground_was = false
walk_was = 0
anim = 0
sprite_current = sprite_index
mask_index = sEntityMask
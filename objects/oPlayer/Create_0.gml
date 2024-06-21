 /// @description 

xaxis	      = 0
yaxis	      = 0
platformer_init()

move_spd = 1.8
move_acc = 0.3
move_fri = 0.6
move_acc_air = 0.15
move_fri_air = 0.03

jump_spd = -4.25
jump_bounce = -3.5
jump_hold = 0
bounce_xvel = 0
bounce_en = noone

side_dir = 1
vsp_max = 7
grav = 0.13
coyote = 0
bounce_t = -1
crouched = false
can_hurt = true

hit_by_atk = ds_list_create();
hitnow = ds_list_create();
hit_reg = false
frame_current = -1
attack_inp_delay = false

atk_buffer = 0
atk_buffer_max = 11.5
atk_dir = 0
ammo = 120
ammo_max = ammo

state_is_new = true
state_current = playerStateFree
state_prev = state_current
state_timer = 0
invin_frames = 0

gun_rfx = 0
gun_xfx = 0 
gun_yfx = 0
atk_fx = 0
ground_was = false
anim = 0
sprite_current = sprite_index
mask_index = sEntityPlayer
depth = -2
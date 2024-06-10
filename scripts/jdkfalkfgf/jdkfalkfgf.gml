/// ---------------------- FOLLOW UP
/// ----------------------
/// ----------------------
function playerStateWeakFollow(){
// Player just entered this state. These actions will be executed only once.
if state_is_new{
	state_is_new = !state_is_new
	sprite_index = sPlayerPunchIdleA ind_r
	image_speed = 1 /2
	ds_list_clear(hit_by_atk)
	ground_was = true
	hit_reg = 0
	side_dir = abs(xaxis) ? xaxis : side_dir
}

var move_fri_final = grounded? move_fri : move_fri_air
xvel = approach(xvel, 0, move_fri_final)
yvel = yvel>=vsp_max? vsp_max : (grounded? yvel : yvel +grav)
var xo = x+ side_dir *14

if state_timer = 4
			audio_play_sfx(aSfxPlayerSlash2)
if state_timer >= 8{
	if (state_timer <=15){
		var hitnow = ds_list_create();
		var hits = collision_rectangle_list(
			xo, bbox_top +3, 40* side_dir +xo, bbox_bottom -3, oEnemy, 0,1,hitnow,0)

		if (hits >0){
			for (var i=0; i < hits; i++){
		
				var h_ = hitnow[| i];
				if ds_list_find_index(hit_by_atk, h_) == -1
				{
					ds_list_add(hit_by_atk, h_)
					ent_enemyDamage(h_, 1.5, -1.2, 1, stuns, hitts)
					audio_play_sfx(aSfxWeakCut1, -1, 0.2)
				}
			}
			if !hit_reg{
				yvel = grounded ? yvel : -1
				xvel *= 0.5
				audio_stop_sound(aSfxPlayerSlash2)
				hit_reg = 1
			}
		}
			
		ds_list_destroy(hitnow);
	}
	if kattack {
		state_current = playerStateWeakJab
		state_prev = -1
	}
}
	
// Change State -----------------------------
if (animation_end()){
	state_current = playerStateFree
	anim = 0
	exit
}

}

/// ---------------------- AIR SLAM
/// ----------------------
/// ----------------------
function playerStateGroundSlam(){
// Player just entered this state. These actions will be executed only once.

if state_is_new{
	state_is_new = !state_is_new
	frame_current = -1
	sprite_index = sPlayerCrush
	ind_r
	image_speed = 1 /2
	hit_reg = false
	hit_reg_did = false
}

var _frm = floor(image_index)

var move_fri_final = grounded? move_fri : move_fri_air
xvel = approach(xvel, 0, move_fri_final)
yvel = yvel>=vsp_max? vsp_max : (grounded? 0 : yvel +grav)

var _of = frame_current!=_frm
switch(_frm){
	case 0://========
		if _of side_dir = abs(xaxis) ? xaxis : side_dir
	break;
	case 2:
		if _of audio_play_sound(aSfxPlayerCrush, 0, 0)
	break;
	case 3:
		if _of{
			var hit = instance_create_depth(x +28 *side_dir, bbox_bottom -2, 0, oHitbox)
			with hit
			{
				inst_id = other.id
				var _d = other.side_dir
				_h.xspd = 0.8 *_d 
				_h.xair = _h.xspd
				_h.side_dir = _d
				_h.yspd = -4.5
				_h.yair = 4.5
				_h.h_timer = 45
				bx_w = 40; bx_h = 4
				timer = 4 -1
				_h.sfx = aSfxStrongHit1
			}
		}
	break;
	case 4: case 5:
		if (kattack) attack_inp_delay = true
}

frame_current = _frm

if hit_reg && !hit_reg_did{
	audio_stop_sound(aSfxPlayerCrush)
	hit_reg_did = true
}

// Change State -----------------------------
if (animation_end()){
	state_current = playerStateFree
	anim = 0
	exit
}


}
	
/// ---------------------- LAUNCHER SLAM
/// ----------------------
/// ----------------------
function playerStateSlam(){
// Player just entered this state. These actions will be executed only once.

if state_is_new{
	state_is_new = !state_is_new
	frame_current = -1
	sprite_index = sPlayerSlamBegin
	ind_r
	image_speed = 1 /2
	ground_was = 1
	hit_reg = false
	hit_reg_did = false
	anim = 0;
	frame_current = -1
	
	yvel = -3.5
}

var gr = sprite_index==sPlayerSlamFall? .5 : grav
yvel = yvel>=vsp_max? vsp_max : (grounded? 0 : yvel +gr)

switch(sprite_index){
	case sPlayerSlamBegin: // begin ------------------------------------------------
	
	if abs(xaxis) xvel = approach(xvel, 1* xaxis, move_acc_air)
	if animation_end(){
		sprite_index = sPlayerSlamFall
		ind_r
		yvel = 1.5
	}
	
	break;
	case sPlayerSlamFall: // fall ------------------------------------------------
	
	if abs(xaxis) xvel = approach(xvel, 1* xaxis, move_acc_air)
	if grounded || instance_place(x +xvel *2, y +yvel, oEnemy){
		sprite_index = sPlayerSlamLand
		ind_r
		side_dir = abs(xaxis) ? xaxis : side_dir
	}
	
	break;
	case sPlayerSlamLand: // slam ------------------------------------------------
	
	var _frm = floor(image_index)
	var _of = frame_current!=_frm
	if _frm == 0 && _of{
		xvel = 0.;
		audio_play_sound(aSfxPlayerCrush, 0, 0)
		var hit = instance_create_depth(x, bbox_bottom, 0, oHitbox)
		with hit
		{
			inst_id = other.id
			var _d = other.side_dir
			_h.xspd = 0
			_h.xair = _h.xspd
			_h.side_dir = _d
			_h.yspd = -1.2
			_h.yair = 4.5
			_h.h_timer = 50
			_h.h_stop = 14
			bx_w = 16; bx_h = 8
			timer = 4 -1
			_h.sfx = aSfxStrongHit1
		}
	}
	frame_current = _frm
	
	if animation_end() state_current = playerStateFree;
	
	if hit_reg && !hit_reg_did{
		if !grounded audio_stop_sound(aSfxPlayerCrush)
		xvel = grounded? 0 : -1.2 *side_dir
		yvel = grounded? 0 : -1.8
		hit_reg_did = true
	}
	
	break
}

}

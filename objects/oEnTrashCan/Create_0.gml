/// @description 

event_inherited();

emptied_fx = false
vox = -1
can_bounce = true

mask_index = sEntityMedium
//can_push = false
move_spd_roll = 0

empty_can = function(){
	emptied_fx = true
	audio_play_sfx(aSfxCrash, aSfxCrash)
	var o = instance_create_depth(x, bbox_top, 0, oFxPart)
	var _s = choose(-1 ,1)
	o.side_dir = _s
	o.xvel = (0.5 *_s) +xvel
	o.yvel = -2.2 +yvel *0.4
	mask_index = sEntitySmall
	
	yvel -= 1
}

damage_hit = function(){
	if !emptied_fx
		empty_can();
	else
		audio_play_sfx(aSfxTrashCanHit, aSfxTrashCanHit, 0.2)
		
	if (abs(xvel) >= 2){
		state_current = 21
		state_prev = -1
	}
}
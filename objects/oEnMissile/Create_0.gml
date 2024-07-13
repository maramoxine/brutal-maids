/// @description Insert description here

event_inherited()

move_dir = irandom(359.)
move_spd = 4.2

target = noone
active = 0
mask_index = sEntitySmall

vox = 0
damage_hit = function(){
	audio_play_sfx(aSfxTrashCanHit, aSfxTrashCanHit, 0.1)
}
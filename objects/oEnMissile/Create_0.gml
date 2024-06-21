/// @description Insert description here

event_inherited()

hp = 6
hp_max = hp

move_dir = 0.
move_spd = 2.5

target = noone
active = 0
timer = 60 *20
mask_index = sEntitySmall

vox = 0
damage_hit = function(){
	audio_play_sfx(aSfxTrashCanHit, aSfxTrashCanHit, 0.1)
}